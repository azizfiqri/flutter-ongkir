import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ongkir/app/data/listgerbang_model.dart';

void main() async {
  Uri url = Uri.parse("http://192.168.134.253/jago_api/main/gerbang_all");
  try {
    final response = await http.post(
      url,
      body: {
        "npp_no": "151700",
        "gerbang": "07",
      },
    );
    var data = json.decode(response.body) as Map<String, dynamic>;
    // print(data);
    var listAllGerbang = data['data']['gerbang'] as List<dynamic>;

    var models = ListGerbang.fromJsonList(listAllGerbang);
    print(models);
  } catch (err) {
    print(err);
  }
}
