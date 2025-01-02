import 'dart:convert';

import 'package:http/http.dart' as http;

import 'fact/fact.resp.dart';

Future<Fact> getFact() async {
  final response = await http
      .get(Uri.parse('https://uselessfacts.jsph.pl/random.json?language=en'));
  final bodyAsJSON = jsonDecode(response.body) as Map<String, dynamic>;
  final data = Fact.fromJson(bodyAsJSON);
  return data;
}
