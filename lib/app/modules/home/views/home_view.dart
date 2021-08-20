import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ongkir/app/modules/home/views/widgets/gardu.dart';
import 'package:ongkir/app/modules/home/views/widgets/gerbang.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cssFieldController = TextEditingController();

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
            nppPetugas(cssFieldController: cssFieldController),
            SizedBox(
              height: 5.0,
            ),
            Obx(() => Text("Nama Gerbang : ${controller.nppPetugas.value}")),
            Text("Petugas CSS :"),
            Text("Petugas CS :"),
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

class nppPetugas extends GetView<HomeController> {
  const nppPetugas({
    Key? key,
    required this.cssFieldController,
  }) : super(key: key);

  final TextEditingController cssFieldController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (value != null) {
          controller.nppPetugas.value = int.parse(value);
          print(controller.nppPetugas.value);
        } else {
          print("kosong");
        }
        ;
      },
      maxLength: 40,
      cursorColor: Colors.green,
      controller: cssFieldController,
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
