import 'package:supabase_flutter/supabase_flutter.dart';

class WatchHistoryService {

  static final supabase =
      Supabase.instance.client;

  // ===============================
  // SAVE HISTORY
  // ===============================

  static Future<void> saveHistory({

    required String userEmail,

    required String title,

    required String type,

    required String url,
  }) async {

    await supabase
        .from('watch_history')
        .insert({

      'user_email': userEmail,

      'title': title,

      'type': type,

      'url': url,
    });
  }

  // ===============================
  // GET HISTORY
  // ===============================

  static Future<List<Map<String, dynamic>>>
  getHistory(String email) async {

    final response =
    await supabase
        .from('watch_history')
        .select()
        .eq('user_email', email)
        .order(
      'created_at',
      ascending: false,
    );

    return List<Map<String, dynamic>>
        .from(response);
  }
}