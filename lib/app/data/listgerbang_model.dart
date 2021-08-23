// To parse this JSON data, do
//
//     final listGerbang = listGerbangFromJson(jsonString);

import 'dart:convert';

ListGerbang listGerbangFromJson(String str) =>
    ListGerbang.fromJson(json.decode(str));

String listGerbangToJson(ListGerbang data) => json.encode(data.toJson());

class ListGerbang {
  ListGerbang({
    this.gerbangId,
    this.ruasId,
    this.gerbangNama,
    this.asalGerbang,
    this.jenisGerbang,
    this.ipPcs,
    this.singkatan,
  });

  String? gerbangId;
  String? ruasId;
  String? gerbangNama;
  String? asalGerbang;
  String? jenisGerbang;
  String? ipPcs;
  String? singkatan;

  factory ListGerbang.fromJson(Map<String, dynamic> json) => ListGerbang(
        gerbangId: json["gerbang_id"],
        ruasId: json["ruas_id"],
        gerbangNama: json["gerbang_nama"],
        asalGerbang: json["asal_gerbang"],
        jenisGerbang: json["jenis_gerbang"],
        ipPcs: json["ip_pcs"],
        singkatan: json["singkatan"],
      );

  Map<String, dynamic> toJson() => {
        "gerbang_id": gerbangId,
        "ruas_id": ruasId,
        "gerbang_nama": gerbangNama,
        "asal_gerbang": asalGerbang,
        "jenis_gerbang": jenisGerbang,
        "ip_pcs": ipPcs,
        "singkatan": singkatan,
      };
  static List<ListGerbang> fromJsonList(List list) {
    if (list.length == 0) return List<ListGerbang>.empty();
    return list.map((item) => ListGerbang.fromJson(item)).toList();
  }
}
