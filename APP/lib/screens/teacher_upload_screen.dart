import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherUploadScreen extends StatefulWidget {
  const TeacherUploadScreen({super.key});

  @override
  State<TeacherUploadScreen> createState() =>
      _TeacherUploadScreenState();
}

class _TeacherUploadScreenState
    extends State<TeacherUploadScreen> {

  final supabase = Supabase.instance.client;

  // =========================================
  // CONTROLLERS
  // =========================================

  final titleController =
  TextEditingController();

  final descriptionController =
  TextEditingController();

  final videoUrlController =
  TextEditingController();

  // =========================================
  // PDF FILE
  // =========================================

  File? selectedFile;

  String? uploadedPdfUrl;

  // =========================================
  // DROPDOWN VALUES
  // =========================================

  List<dynamic> classes = [];

  List<dynamic> subjects = [];

  int? selectedClassId;

  int? selectedSubjectId;

  String resourceType = "video";

  bool isLoading = false;

  // =========================================
  // INIT
  // =========================================

  @override
  void initState() {
    super.initState();

    loadClasses();
  }

  // =========================================
  // LOAD CLASSES
  // =========================================

  Future<void> loadClasses() async {

    final data = await supabase
        .from('classes')
        .select();

    setState(() {
      classes = data;
    });
  }

  // =========================================
  // LOAD SUBJECTS
  // =========================================

  Future<void> loadSubjects(
      int classId,
      ) async {

    final data = await supabase
        .from('subjects')
        .select()
        .eq('class_id', classId);

    setState(() {

      subjects = data;

      selectedSubjectId = null;
    });
  }

  // =========================================
  // PICK PDF
  // =========================================

  Future<void> pickPdf() async {

    final result =
    await FilePicker.platform.pickFiles(

      type: FileType.custom,

      allowedExtensions: ['pdf'],
    );

    if (result != null &&
        result.files.single.path != null) {

      setState(() {

        selectedFile =
            File(result.files.single.path!);
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content: Text(
            "PDF Selected Successfully",
          ),
        ),
      );
    }
  }

  // =========================================
  // UPLOAD PDF TO STORAGE
  // =========================================

  Future<String?> uploadPdfToSupabase() async {

    try {

      if (selectedFile == null) {
        return null;
      }

      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}.pdf';

      final filePath = 'pdfs/$fileName';

      // =====================================
      // UPLOAD FILE
      // =====================================

      await supabase.storage

          .from('resources')

          .upload(
        filePath,
        selectedFile!,
        fileOptions: const FileOptions(
          upsert: true,
        ),
      );

      // =====================================
      // GET PUBLIC URL
      // =====================================

      final fileUrl =
      supabase.storage

          .from('resources')

          .getPublicUrl(filePath);

      return fileUrl;

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(
            'PDF Upload Error: $e',
          ),
        ),
      );

      return null;
    }
  }

  // =========================================
  // UPLOAD RESOURCE
  // =========================================

  Future<void> uploadResource() async {

    if (selectedClassId == null ||
        selectedSubjectId == null ||
        titleController.text.isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content: Text(
            "Please fill all required fields",
          ),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {

      // =====================================
      // UPLOAD PDF
      // =====================================

      uploadedPdfUrl =
      await uploadPdfToSupabase();

      // =====================================
      // INSERT INTO DATABASE
      // =====================================

      await supabase
          .from('resources')
          .insert({

        'subject_id':
        selectedSubjectId,

        'title':
        titleController.text.trim(),

        'description':
        descriptionController.text.trim(),

        'resource_type':
        resourceType,

        'video_url':
        videoUrlController.text.trim(),

        'pdf_url':
        uploadedPdfUrl,
      });

      // =====================================
      // SUCCESS MESSAGE
      // =====================================

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content: Text(
            "Resource Uploaded Successfully",
          ),
        ),
      );

      // =====================================
      // CLEAR FORM
      // =====================================

      titleController.clear();

      descriptionController.clear();

      videoUrlController.clear();

      setState(() {

        selectedClassId = null;

        selectedSubjectId = null;

        subjects = [];

        selectedFile = null;

        uploadedPdfUrl = null;
      });

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(
            "Database Error: $e",
          ),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  // =========================================
  // UI
  // =========================================

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF081B33),

      appBar: AppBar(

        backgroundColor:
        const Color(0xFF081B33),

        elevation: 0,

        title: const Text(

          "Teacher Dashboard",

          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          children: [

            // CLASS

            DropdownButtonFormField<int>(

              value: selectedClassId,

              dropdownColor:
              const Color(0xFF10284A),

              decoration:
              inputDecoration(
                "Select Class",
              ),

              items: classes.map((item) {

                return DropdownMenuItem<int>(

                  value: item['id'],

                  child: Text(

                    item['class_name'],

                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),

              onChanged: (value) {

                setState(() {
                  selectedClassId = value;
                });

                loadSubjects(value!);
              },
            ),

            const SizedBox(height: 20),

            // SUBJECT

            DropdownButtonFormField<int>(

              value: selectedSubjectId,

              dropdownColor:
              const Color(0xFF10284A),

              decoration:
              inputDecoration(
                "Select Subject",
              ),

              items: subjects.map((item) {

                return DropdownMenuItem<int>(

                  value: item['id'],

                  child: Text(

                    item['subject_name'],

                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),

              onChanged: (value) {

                setState(() {
                  selectedSubjectId = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // RESOURCE TYPE

            DropdownButtonFormField<String>(

              value: resourceType,

              dropdownColor:
              const Color(0xFF10284A),

              decoration:
              inputDecoration(
                "Resource Type",
              ),

              items: const [

                DropdownMenuItem(
                  value: "video",
                  child: Text(
                    "Video",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                DropdownMenuItem(
                  value: "notes",
                  child: Text(
                    "Notes",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                DropdownMenuItem(
                  value: "ebook",
                  child: Text(
                    "E-book",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                DropdownMenuItem(
                  value: "sample_paper",
                  child: Text(
                    "Sample Paper",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],

              onChanged: (value) {

                setState(() {
                  resourceType = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // TITLE

            TextField(

              controller:
              titleController,

              style: const TextStyle(
                color: Colors.white,
              ),

              decoration:
              inputDecoration(
                "Title",
              ),
            ),

            const SizedBox(height: 20),

            // DESCRIPTION

            TextField(

              controller:
              descriptionController,

              style: const TextStyle(
                color: Colors.white,
              ),

              maxLines: 3,

              decoration:
              inputDecoration(
                "Description",
              ),
            ),

            const SizedBox(height: 20),

            // VIDEO URL

            TextField(

              controller:
              videoUrlController,

              style: const TextStyle(
                color: Colors.white,
              ),

              decoration:
              inputDecoration(
                "YouTube URL",
              ),
            ),

            const SizedBox(height: 20),

            // PICK PDF BUTTON

            SizedBox(

              width: double.infinity,

              height: 55,

              child: ElevatedButton(

                style:
                ElevatedButton.styleFrom(

                  backgroundColor:
                  Colors.orange,

                  foregroundColor:
                  Colors.white,
                ),

                onPressed: pickPdf,

                child: Text(

                  selectedFile == null
                      ? "Pick PDF"
                      : "PDF Selected Successfully",
                ),
              ),
            ),

            const SizedBox(height: 40),

            // UPLOAD BUTTON

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
                    : uploadResource,

                child:

                isLoading

                    ? const CircularProgressIndicator()

                    : const Text(

                  "Upload Resource",

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================
  // INPUT DECORATION
  // =========================================

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

        borderSide: BorderSide.none,
      ),
    );
  }
}