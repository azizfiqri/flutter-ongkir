import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("http://36.92.153.53:88/jm_opsNew/main/login");
  var response = await http.post(
    url,
    body: {
      "npp_no": "151700",
      "password": "151700",
    },
  );
  var data = json.decode(response.body)["data"];
  print(data);
}
