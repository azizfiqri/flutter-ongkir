import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ongkir/app/data/user_model.dart';

class HomeController extends GetxController {
  var ishidden = true.obs;
  var kodeGerbang = 0.obs;
  var kodeGardu = 0.obs;
  var ipPCS = "".obs;
  var namaGerbang = "".obs;
  var nppPetugas = 0.obs;
  final count = 0.obs;

  late TextEditingController nppC;

  void getNamaGerbang() async {
    Uri url = Uri.parse("http://36.92.153.53:88/jm_opsNew/main/login");
    try {
      final response = await http.post(
        url,
        body: {
          "npp_no": "${nppPetugas.value}",
          "password": "${nppPetugas.value}",
        },
      );
      var namagerbang = json.decode(response.body)["data"]["gerbang_nama"];
      namaGerbang.value = namagerbang;
      var kodefikasigerbang = json.decode(response.body)["data"]["gerbang_id"];
      kodeGerbang.value = int.parse(kodefikasigerbang);
      if (kodefikasigerbang != null) {
        ishidden.value = false;
      } else {
        ishidden.value = false;
      }
      print(kodefikasigerbang);
    } catch (err) {
      print(err);
      return print(err);
    }
  }

  void openALB() async {
    print(nppPetugas);
    Uri url = Uri.parse("http://36.92.153.53:88/jm_opsNew/main/req_alb");
    try {
      final response = await http.post(
        url,
        body: {
          "gerbang": "${kodeGerbang.value}",
          "gardu_id": "${kodeGardu.value}",
          "tgl_lap": "2021-03-19",
          "npp_no": "${nppPetugas.value}",
        },
      );
    } catch (err) {
      print(err);
      return print(err);
    }
  }

  @override
  void onInit() {
    nppC = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nppC.dispose();
    super.onClose();
  }
}
