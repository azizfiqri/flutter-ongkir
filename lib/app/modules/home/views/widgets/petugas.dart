import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ongkir/app/modules/home/controllers/home_controller.dart';

class nppPetugas extends GetView<HomeController> {
  const nppPetugas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: () => controller.getNamaGerbang(),
      onChanged: (value) {
        if (value != null) {
          controller.nppPetugas.value = int.parse(value);
          print(controller.nppPetugas.value);
        } else {
          print("kosong");
        }
        ;
      },
      maxLength: 6,
      cursorColor: Colors.green,
      controller: controller.nppC,
      decoration: InputDecoration(
        // hintText: "Tulis Pesan",
        labelText: "NPP Petugas ...",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.green,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
