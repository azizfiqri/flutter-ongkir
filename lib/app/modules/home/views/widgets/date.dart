import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ongkir/app/modules/home/controllers/home_controller.dart';

class datePicker extends GetView<HomeController> {
  const datePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 100,
          child: TextField(
            onEditingComplete: () {},
            onChanged: (value) {
              if (value != null) {
                controller.hari.value = value;
                print(controller.hari.value);
              } else {
                print("kosong");
              }
              ;
            },
            maxLength: 2,
            cursorColor: Colors.green,
            controller: controller.hariC,
            decoration: InputDecoration(
              // hintText: "Tulis Pesan",
              labelText: "Tanggal",
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
        ),
        Container(
          width: 100,
          child: TextField(
            onEditingComplete: () {},
            onChanged: (value) {
              if (value != null) {
                controller.tanggal.value = value;
                print(controller.tanggal.value);
              } else {
                print("kosong");
              }
              ;
            },
            maxLength: 2,
            cursorColor: Colors.green,
            controller: controller.bulanC,
            decoration: InputDecoration(
              // hintText: "Tulis Pesan",
              labelText: "Bulan",
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
        ),
        Container(
          width: 100,
          child: TextField(
            onEditingComplete: () {},
            onChanged: (value) {
              if (value != null) {
                controller.tahun.value = value;
                print(controller.tahun.value);
              } else {
                print("kosong");
              }
              ;
            },
            maxLength: 4,
            cursorColor: Colors.green,
            controller: controller.tahunC,
            decoration: InputDecoration(
              // hintText: "Tulis Pesan",
              labelText: "Tahun",
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
        ),
      ],
    );
  }
}
