import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'teacher_upload_screen.dart';
import 'main_navigation.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final supabase =
      Supabase.instance.client;

  // =====================================
  // CONTROLLERS
  // =====================================

  final emailController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  final nameController =
  TextEditingController();

  // =====================================
  // VARIABLES
  // =====================================

  bool isLogin = true;

  bool isLoading = false;

  String selectedRole = "student";

  // =====================================
  // AUTH FUNCTION
  // =====================================

  Future<void> authenticate() async {

    setState(() {
      isLoading = true;
    });

    try {

      // =================================
      // LOGIN
      // =================================

      if (isLogin) {

        await supabase.auth.signInWithPassword(

          email:
          emailController.text.trim(),

          password:
          passwordController.text.trim(),
        );

        final user =
            supabase.auth.currentUser;

        if (user != null) {

          final data =
          await supabase
              .from('users')
              .select()
              .eq(
            'email',
            user.email!,
          )
              .single();

          final role =
          data['role'];

          // =============================
          // TEACHER LOGIN
          // =============================

          if (role == "teacher") {

            Navigator.pushReplacement(

              context,

              MaterialPageRoute(

                builder: (_) =>
                const TeacherUploadScreen(),
              ),
            );
          }

          // =============================
          // STUDENT LOGIN
          // =============================

          else {

            Navigator.pushReplacement(

              context,

              MaterialPageRoute(

                builder: (_) =>
                const MainNavigation(),
              ),
            );
          }
        }
      }

      // =================================
      // SIGNUP
      // =================================

      else {

        final response =
        await supabase.auth.signUp(

          email:
          emailController.text.trim(),

          password:
          passwordController.text.trim(),

          // =================================
          // SAVE NAME IN AUTH METADATA
          // =================================

          data: {

            'name':
            nameController.text.trim(),

            'role':
            selectedRole,
          },
        );

        final user =
            response.user;

        if (user != null) {

          // =================================
          // SAVE USER IN DATABASE
          // =================================

          await supabase
              .from('users')
              .insert({

            'name':
            nameController.text.trim(),

            'email':
            emailController.text.trim(),

            'role':
            selectedRole,
          });

          ScaffoldMessenger.of(context)
              .showSnackBar(

            const SnackBar(

              content: Text(
                "Account Created Successfully",
              ),
            ),
          );

          setState(() {

            isLogin = true;
          });
        }
      }

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }

    setState(() {

      isLoading = false;
    });
  }

  // =====================================
  // UI
  // =====================================

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF081B33),

      body: Center(

        child: SingleChildScrollView(

          padding:
          const EdgeInsets.all(24),

          child: Column(

            children: [

              const Icon(

                Icons.school,

                size: 90,

                color: Colors.cyanAccent,
              ),

              const SizedBox(height: 20),

              const Text(

                "Smart Education",

                style: TextStyle(

                  color: Colors.white,

                  fontSize: 32,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(

                isLogin
                    ? "Login to continue"
                    : "Create new account",

                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 40),

              // =================================
              // NAME
              // =================================

              if (!isLogin)

                Column(

                  children: [

                    TextField(

                      controller:
                      nameController,

                      style:
                      const TextStyle(
                        color: Colors.white,
                      ),

                      decoration:
                      inputDecoration(
                        "Full Name",
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),

              // =================================
              // EMAIL
              // =================================

              TextField(

                controller:
                emailController,

                style: const TextStyle(
                  color: Colors.white,
                ),

                decoration:
                inputDecoration(
                  "Email",
                ),
              ),

              const SizedBox(height: 20),

              // =================================
              // PASSWORD
              // =================================

              TextField(

                controller:
                passwordController,

                obscureText: true,

                style: const TextStyle(
                  color: Colors.white,
                ),

                decoration:
                inputDecoration(
                  "Password",
                ),
              ),

              const SizedBox(height: 20),

              // =================================
              // ROLE
              // =================================

              if (!isLogin)

                DropdownButtonFormField<String>(

                  value:
                  selectedRole,

                  dropdownColor:
                  const Color(0xFF10284A),

                  decoration:
                  inputDecoration(
                    "Select Role",
                  ),

                  items: const [

                    DropdownMenuItem(

                      value:
                      "student",

                      child: Text(

                        "Student",

                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    DropdownMenuItem(

                      value:
                      "teacher",

                      child: Text(

                        "Teacher",

                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],

                  onChanged: (value) {

                    setState(() {

                      selectedRole =
                      value!;
                    });
                  },
                ),

              const SizedBox(height: 40),

              // =================================
              // BUTTON
              // =================================

              SizedBox(

                width: double.infinity,

                height: 60,

                child: ElevatedButton(

                  style:
                  ElevatedButton.styleFrom(

                    backgroundColor:
                    Colors.cyanAccent,

                    foregroundColor:
                    Colors.black,

                    shape:
                    RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(
                        18,
                      ),
                    ),
                  ),

                  onPressed:

                  isLoading
                      ? null
                      : authenticate,

                  child:

                  isLoading

                      ? const CircularProgressIndicator()

                      : Text(

                    isLogin
                        ? "Login"
                        : "Signup",

                    style: const TextStyle(

                      fontSize: 18,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // =================================
              // SWITCH LOGIN/SIGNUP
              // =================================

              TextButton(

                onPressed: () {

                  setState(() {

                    isLogin =
                    !isLogin;
                  });
                },

                child: Text(

                  isLogin
                      ? "Create New Account"
                      : "Already have account?",

                  style: const TextStyle(
                    color: Colors.cyanAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =====================================
  // INPUT DECORATION
  // =====================================

  InputDecoration inputDecoration(
      String hint,
      ) {

    return InputDecoration(

      hintText: hint,

      hintStyle: const TextStyle(
        color: Colors.white70,
      ),

      filled: true,

      fillColor:
      const Color(0xFF10284A),

      border: OutlineInputBorder(

        borderRadius:
        BorderRadius.circular(18),

        borderSide:
        BorderSide.none,
      ),
    );
  }
}
