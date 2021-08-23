import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ongkir/app/modules/home/controllers/home_controller.dart';
import 'package:ongkir/app/modules/home/views/widgets/petugas.dart';

class NavDrawer extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: AssetImage('assets/images/cover.jpg'),
              // ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Setting IP PCS'),

            // onTap: () => {},
          ),
          nppPetugas(),
        ],
      ),
    );
  }
}
