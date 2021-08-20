import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ongkir/app/modules/home/views/widgets/gardu.dart';
import 'package:ongkir/app/modules/home/views/widgets/gerbang.dart';
import 'package:ongkir/app/modules/home/views/widgets/petugas.dart';
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
            Obx(
              () => Text("Nama Gerbang : ${controller.namaGerbang.value}"),
            ),
            Obx(
              () => Text("Kode Gardu : ${controller.kodeGardu.value}"),
            ),
            Obx(
              () => Text("Kode Gardu : ${controller.ipPCS.value}"),
            ),
            SizedBox(
              height: 20,
            ),
            nppPetugas(),
            gerbangWidget(),
            SizedBox(
              height: 5.0,
            ),
            Obx(
              () => controller.ishidden.isTrue
                  ? SizedBox()
                  : garduWidget(gerbangId: controller.kodeGerbang.value),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => controller.openALB(),
                  child: Text('Open ALB'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Req EOP'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
