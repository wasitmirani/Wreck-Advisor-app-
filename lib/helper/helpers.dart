import 'dart:convert';

import 'package:http/http.dart' as http;

const apiurl = "https://dev-wreckadvisor.digiproficeint.com/api/app";

sendPostRequest(url, object) {
  return http.post(
    Uri.parse(apiurl + url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(object),
  );
}
