import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'theme/app_theme.dart';

// ==============================
// AUTH SCREEN
// ==============================
import 'screens/login_screen.dart';

// ==============================
// OPTIONAL TESTING SCREENS
// ==============================
// import 'screens/teacher_upload_screen.dart';
// import 'screens/main_navigation.dart';
// import 'screens/search_resource_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // ==============================
  // SUPABASE INITIALIZATION
  // ==============================

  await Supabase.initialize(

    url:
    'https://zqyfvziqtlmzezmjajkr.supabase.co',

    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpxeWZ2emlxdGxtemV6bWphamtyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkyNDgwMjEsImV4cCI6MjA5NDgyNDAyMX0.s8dflfTH_IX8UPTL-kxgA35-80vQK8yCEcVpE2FY9fI',
  );

  // ==============================
  // STATUS BAR STYLE
  // ==============================

  SystemChrome.setSystemUIOverlayStyle(

    const SystemUiOverlayStyle(

      statusBarColor: Colors.transparent,

      statusBarIconBrightness:
      Brightness.light,
    ),
  );

  runApp(
    const SmartEducationApp(),
  );
}

class SmartEducationApp
    extends StatelessWidget {

  const SmartEducationApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Smart Education App',

      debugShowCheckedModeBanner: false,

      // ==============================
      // APP THEME
      // ==============================

      theme: AppTheme.darkTheme,

      // ==============================
      // APP START SCREEN
      // ==============================

      home: const LoginScreen(),

      // ==============================
      // OPTIONAL TESTING
      // ==============================

      //
      // home: const TeacherUploadScreen(),
      // home: const MainNavigation(),
      // home: const SearchResourceScreen(),
    );
  }
}
