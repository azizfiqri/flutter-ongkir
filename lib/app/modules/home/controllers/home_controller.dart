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
  var hari = "".obs;
  var tanggal = "".obs;
  var tahun = "".obs;

  late TextEditingController nppC;
  late TextEditingController hariC;
  late TextEditingController bulanC;
  late TextEditingController tahunC;

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
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: err.toString(),
      );
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
          "tgl_lap": "${tahun.value}-${tanggal.value}-${hari.value}",
          "npp_no": "${nppPetugas.value}",
        },
      );

      var data = json.decode(response.body) as Map<String, dynamic>;
      var statusCode = data["status"];
      if (statusCode != "true") {
        Get.defaultDialog(
          title: "Error",
          middleText: data["data"],
        );
      }
    } catch (err) {
      print(err);
      Get.defaultDialog(
        title: "Error",
        middleText: err.toString(),
      );
    }
  }

  void reqEOP() async {
    Uri url = Uri.parse("http://36.92.153.53:88/jm_opsNew/main/req_eop");
    try {
      final response = await http.post(
        url,
        body: {
          "gardu_id": "${kodeGardu.value}",
          "tgl_lap": "${tahun.value}-${tanggal.value}-${hari.value}",
          "tgl_sop": "${tahun.value}-${tanggal.value}-${hari.value}",
          "npp_no": "${nppPetugas.value}",
        },
      );

      var data = json.decode(response.body) as Map<String, dynamic>;
      print(data);
      var statusCode = data["status"];
      if (statusCode != "true") {
        Get.defaultDialog(
          title: "Error",
          middleText: data["data"],
        );
      }
    } catch (err) {
      print(err);
      Get.defaultDialog(
        title: "Error",
        middleText: err.toString(),
      );
    }
  }

  @override
  void onInit() {
    nppC = TextEditingController();
    hariC = TextEditingController(text: "01");
    bulanC = TextEditingController(text: "01");
    tahunC = TextEditingController(text: "2020");
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
