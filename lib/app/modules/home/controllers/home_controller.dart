import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ongkir/app/data/user_model.dart';

class HomeController extends GetxController {
  var ishidden = true.obs;
  var kodeGerbang = 0.obs;
  var nppPetugas = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
