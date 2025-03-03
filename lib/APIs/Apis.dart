import 'dart:convert';
import 'dart:io';
import 'dart:developer'; // Use a prefix to disambiguate the import
import 'package:flutter_language_translator_app/Helper/global.dart';
import 'package:http/http.dart';

class APIs {
  //get answer from chat gpt
  static Future<String> getAnswer(String question) async {
    try {
      final res =
          await post(Uri.parse(('https://api.openai.com/v1/chat/completions')),

              //header
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.authorizationHeader: 'Bearer $apikey'
              },

              //body
              body: jsonEncode({
                "model": "gpt-3.5-turbo",
                "max_tokens": 2000,
                "temperature": 0,
                "messages": [
                  {"role": "user", "content": question},
                ]
              }));

      final data = jsonDecode(res.body);

      log('res: $data}');
      return data['choices'][0]['message']['content'];
    } catch (e) {
      log('getAnswerE: $e');
      return 'Something went wrong (Try again in sometime)';
    }
  }
}
