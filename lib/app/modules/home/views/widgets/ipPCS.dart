import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ongkir/app/modules/home/controllers/home_controller.dart';

class ipPCS extends GetView<HomeController> {
  const ipPCS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        // onEditingComplete: () => controller.upabIPPCS(),
        onChanged: (value) {
          if (value != null) {
            controller.ipPCS.value = value;
            controller.ishiddenNPPPetugas.value = false;
            print(controller.ipPCS.value);
          } else {
            controller.ishiddenNPPPetugas.value = true;
            print("kosong");
          }
          ;
        },
        // maxLength: 6,
        cursorColor: Colors.green,
        controller: controller.ipPCSC,
        decoration: InputDecoration(
          // hintText: "Tulis Pesan",
          labelText: "IP PCS",
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
      ),
    );
  }
}
