import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> postNITLHttp(
    {String url,
    Map<String, dynamic> body,
    Map<String, dynamic> header}) async {
  var response = await http.post(
    url,
    body: body,
  );

  return jsonDecode(response.body);
}

Future<Map<String, dynamic>> getNITLHttp(
    {String url,
    Map<String, dynamic> body,
    Map<String, dynamic> header}) async {
  var response = await http.get(url, headers: header);

  return jsonDecode(response.body);
}
