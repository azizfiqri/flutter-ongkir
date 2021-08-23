import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ongkir/app/data/listgardu_model.dart';
import 'package:ongkir/app/modules/home/controllers/home_controller.dart';

class garduWidget extends GetView<HomeController> {
  const garduWidget({
    Key? key,
    required this.gerbangId,
  }) : super(key: key);

  final String gerbangId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownSearch<ListGardu>(
        mode: Mode.DIALOG,
        showClearButton: true,
        label: "Nomor Gardu",
        onFind: (String filter) async {
          Uri url = Uri.parse(
              "http://${controller.ipPCS.value}/jago_api/main/monitoring");
          var response = await http.post(
            url,
            body: {
              "gerbang": "${controller.kodeGerbang.value}",
              "npp_no": "${controller.nppPetugas.value}",
              "tgl":
                  "${controller.tahun.value}-${controller.tanggal.value}-${controller.hari.value}",
            },
          );
          var data = json.decode(response.body) as Map<String, dynamic>;
          print(data);
          var listAllGerbang = data['data'] as List<dynamic>;

          var models = ListGardu.fromJsonList(listAllGerbang);
          return models;
        },
        onChanged: (gardu) {
          if (gardu != null) {
            print(controller.ishidden.value);
            controller.kodeGardu.value = gardu.garduId!;
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
