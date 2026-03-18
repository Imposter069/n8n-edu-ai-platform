import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {

  static const String apiUrl =
      "http://10.0.2.2:5678/webhook/ai-tutor";

  static Future<String> askAI(String message) async {

    try {

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "message": message,
          "sessionId": "student1"
        }),
      );

      print("STATUS: ${response.statusCode}");
      print("RAW RESPONSE: ${response.body}");

      if (response.statusCode == 200) {

        // 🔴 FIX: handle empty response
        if (response.body.isEmpty) {
          return "AI returned empty response";
        }

        final data = jsonDecode(response.body);

        print("DECODED: $data");

        if (data is Map && data.containsKey("output")) {
          return data["output"].toString();
        }

        return data.toString();

      } else {

        return "Server error: ${response.statusCode}";

      }

    } catch (e) {

      return "Connection error: $e";

    }
  }
}