import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ongkir/app/data/user_model.dart';
import 'package:ongkir/app/modules/home/views/widgets/ipPCS.dart';

class HomeController extends GetxController {
  var ishidden = true.obs;
  var ishiddenNPPPetugas = true.obs;
  var kodeGerbang = "".obs;
  var kodeGardu = "".obs;
  var ipPCS = "".obs;
  var namaGerbang = "".obs;
  var nppPetugas = 0.obs;
  var hari = "".obs;
  var tanggal = "".obs;
  var tahun = "".obs;

  late TextEditingController nppC;
  late TextEditingController ipPCSC;
  late TextEditingController hariC;
  late TextEditingController bulanC;
  late TextEditingController tahunC;

  void getNamaGerbang() async {
    Uri url = Uri.parse("http://${ipPCS.value}/jago_api/main/login");
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
      kodeGerbang.value = kodefikasigerbang;
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

  void upabIPPCS() {}

  void openALB() async {
    print(nppPetugas);
    Uri url = Uri.parse("http://${ipPCS.value}/jago_api/main/req_alb");
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
      print(data);
      var statusCode = data["status"];
      print(statusCode);
      if (statusCode != "true") {
        Get.defaultDialog(
          title: "Success",
          middleText: data["data"]["message"],
        );
      } else {
        Get.defaultDialog(
          title: "Gagal",
          middleText: data["status"][1],
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
    Uri url = Uri.parse("http://${ipPCS.value}/jago_api/main/req_eop");
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
    ipPCSC = TextEditingController();
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
    ipPCSC.dispose();
    super.onClose();
  }
}
