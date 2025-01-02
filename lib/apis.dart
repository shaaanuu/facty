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

// {"id":"85f89b61-7e0c-4aa1-944e-dbb03b847d30","text":"China has more English speakers than the United States.","source":"djtech.net","source_url":"http:\/\/www.djtech.net\/humor\/useless_facts.htm","language":"en","permalink":"https:\/\/uselessfacts.jsph.pl\/85f89b61-7e0c-4aa1-944e-dbb03b847d30"}
