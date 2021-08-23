import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ongkir/app/data/listgerbang_model.dart';
import 'package:ongkir/app/modules/home/controllers/home_controller.dart';
import 'package:http/http.dart' as http;

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
          Uri url = Uri.parse(
              "http://${controller.ipPCS.value}/jago_api/main/gerbang_all");
          var response = await http.post(
            url,
            body: {
              "npp_no": "${controller.nppPetugas.value}",
              "gerbang": "${controller.kodeGerbang.value}",
            },
          );
          var data = json.decode(response.body) as Map<String, dynamic>;
          print(data);
          var listAllGerbang = data['data']['gerbang'] as List<dynamic>;

          var models = ListGerbang.fromJsonList(listAllGerbang);
          return models;
        },
        onChanged: (gerbang) {
          if (gerbang != null) {
            controller.ishidden.value = false;
            // controller.ipPCS.value = gerbang.ipPcs!;
            controller.kodeGerbang.value = gerbang.gerbangId!;
            print(gerbang.gerbangId);
          } else {
            controller.ishidden.value = true;
            // controller.kodeGerbang.value = 0;
          }
        },
        showSearchBox: true,
        // selectedItem: "";
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
