import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("http://36.92.153.53:88/jm_opsNew/main/req_alb");
  try {
    final response = await http.post(
      url,
      body: {
        "gerbang": "32",
        "gardu_id": "3201",
        "tgl_lap": "2021-03-19",
        "npp_no": "151700",
      },
    );
  } catch (err) {
    print(err);
    Get.defaultDialog(
      title: "Terjadi Kesalahan",
      middleText: err.toString(),
    );
  }
}
