import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ongkir/app/data/listgardu_model.dart';
import 'package:ongkir/app/data/listgerbang_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sikong'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            gerbangWidget(),
            Obx(
              () => controller.ishidden.isTrue
                  ? SizedBox()
                  : garduWidget(gerbangId: controller.kodeGerbang.value),
            ),
          ],
        ),
      ),
    );
  }
}

class gerbangWidget extends GetView<HomeController> {
  const gerbangWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownSearch<ListGerbang>(
        mode: Mode.DIALOG,
        showClearButton: true,
        label: "Nama Gerbang",
        onFind: (String filter) async {
          Uri url =
              Uri.parse("http://36.92.153.53:88/jm_opsNew/main/gerbang_all");
          var response = await http.post(
            url,
            body: {
              "npp_no": "151700",
              "gerbang": "32",
            },
          );
          var data = json.decode(response.body) as Map<String, dynamic>;

          var listAllGerbang = data['data']['gerbang'] as List<dynamic>;

          var models = ListGerbang.fromJsonList(listAllGerbang);
          return models;
        },
        onChanged: (gerbang) {
          if (gerbang != null) {
            controller.ishidden.value = false;
            controller.kodeGerbang.value = int.parse(gerbang.gerbangId!);
            print(gerbang.gerbangId);
          } else {
            controller.ishidden.value = true;
            controller.kodeGerbang.value = 0;
          }
        },
        showSearchBox: true,
        searchBoxDecoration: InputDecoration(
          hintText: "cari gerbang . . .",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        popupItemBuilder: (context, item, isSelected) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Text(
              "${item.gerbangNama}",
              style: TextStyle(fontSize: 18),
            ),
          );
        },
        itemAsString: (item) => item.gerbangNama!,
      ),
    );
  }
}

class garduWidget extends GetView<HomeController> {
  const garduWidget({
    Key? key,
    required this.gerbangId,
  }) : super(key: key);

  final int gerbangId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownSearch<ListGardu>(
        mode: Mode.DIALOG,
        showClearButton: true,
        label: "Nomor Gardu",
        onFind: (String filter) async {
          Uri url =
              Uri.parse("http://36.92.153.53:88/jm_opsNew/main/monitoring");
          var response = await http.post(
            url,
            body: {
              "gerbang": "${controller.kodeGerbang.value}",
              "npp_no": "151700",
              "tgl": "2021-03-19",
            },
          );
          var data = json.decode(response.body) as Map<String, dynamic>;

          var listAllGerbang = data['data'] as List<dynamic>;

          var models = ListGardu.fromJsonList(listAllGerbang);
          return models;
        },
        onChanged: (gardu) {
          if (gardu != null) {
            print(controller.ishidden.value);
            print(gardu.garduId);
          } else {
            print('Tidak memilih data');
          }
        },
        showSearchBox: true,
        searchBoxDecoration: InputDecoration(
          hintText: "cari gardu . . .",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        popupItemBuilder: (context, item, isSelected) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Text(
              "${item.garduNama}",
              style: TextStyle(fontSize: 18),
            ),
          );
        },
        itemAsString: (item) => item.garduNama!,
      ),
    );
  }
}
