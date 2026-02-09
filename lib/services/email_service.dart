import 'package:http/http.dart' as http;

class EmailService {
  static Future<void> sendAnniversaryEmail() async {
    final url = Uri.parse(
      "https://first-anee.onrender.com/send-anniversary-email",
    );

    final response = await http.post(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to send email");
    }
  }
}
