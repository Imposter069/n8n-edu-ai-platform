import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {

  final supabase =
      Supabase.instance.client;

  // =====================================
  // FETCH EDUCATION TYPES
  // =====================================
  Future<List<dynamic>>
  fetchEducationTypes() async {

    final response = await supabase

        .from('education_types')

        .select()

        .order('id');

    return response;
  }

  // =====================================
  // FETCH CLASSES
  // =====================================
  Future<List<dynamic>>
  fetchClasses(
      int educationTypeId,
      ) async {

    final response = await supabase

        .from('classes')

        .select()

        .eq(
      'education_type_id',
      educationTypeId,
    )

        .order('id');

    return response;
  }

  // =====================================
  // FETCH SUBJECTS
  // =====================================
  Future<List<dynamic>>
  fetchSubjects(
      int classId,
      ) async {

    final response = await supabase

        .from('subjects')

        .select()

        .eq(
      'class_id',
      classId,
    )

        .order('id');

    return response;
  }

  // =====================================
  // FETCH RESOURCES
  // =====================================
  Future<List<dynamic>>
  fetchResources(
      int subjectId,
      ) async {

    final response = await supabase

        .from('resources')

        .select()

        .eq(
      'subject_id',
      subjectId,
    )

        .order('id');

    return response;
  }

  // =====================================
  // SEARCH RESOURCES
  // =====================================
  Future<List<dynamic>>
  searchResources(
      String query,
      ) async {

    final response = await supabase

        .from('resources')

        .select()

        .ilike(
      'title',
      '%$query%',
    );

    return response;
  }

  // =====================================
  // UPLOAD RESOURCE
  // =====================================
  Future<void> uploadResource({

    required int subjectId,

    required String title,

    required String description,

    required String resourceType,

    String? videoUrl,

    String? pdfUrl,

  }) async {

    await supabase

        .from('resources')

        .insert({

      'subject_id':
      subjectId,

      'title':
      title,

      'description':
      description,

      'resource_type':
      resourceType,

      'video_url':
      videoUrl,

      'pdf_url':
      pdfUrl,
    });
  }
}