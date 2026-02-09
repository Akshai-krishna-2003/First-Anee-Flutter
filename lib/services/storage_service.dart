import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageService {
  static const _fileName = "valentine_response.json";

  static Future<File> _file() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }

  // ✅ ONLY called when YES is clicked
  static Future<DateTime> saveYesMoment() async {
    final file = await _file();
    final now = DateTime.now();

    final data = {
      "accepted": true,
      "timestamp": now.toIso8601String(),
    };

    await file.writeAsString(jsonEncode(data));
    return now;
  }

  // ✅ Only READ, never create
  static Future<DateTime?> readYesMoment() async {
    try {
      final file = await _file();
      if (!await file.exists()) return null;

      final json = jsonDecode(await file.readAsString());
      if (json["accepted"] != true) return null;

      return DateTime.parse(json["timestamp"]);
    } catch (_) {
      return null;
    }
  }

  // 🔧 DEV ONLY (optional)
  static Future<void> clearYesMoment() async {
    final file = await _file();
    if (await file.exists()) {
      await file.delete();
    }
  }
}
