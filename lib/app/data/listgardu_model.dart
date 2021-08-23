// To parse this JSON data, do
//
//     final listGardu = listGarduFromJson(jsonString);

import 'dart:convert';

ListGardu listGarduFromJson(String str) => ListGardu.fromJson(json.decode(str));

String listGarduToJson(ListGardu data) => json.encode(data.toJson());

class ListGardu {
  ListGardu({
    this.garduId,
    this.garduNama,
    this.gerbangId,
    this.garduStatus,
    this.host,
    this.status,
    this.totalHistori,
    this.dataHistori,
    this.dataOperasional,
  });

  String? garduId;
  String? garduNama;
  String? gerbangId;
  String? garduStatus;
  String? host;
  String? status;
  String? totalHistori;
  List<dynamic>? dataHistori;
  List<dynamic>? dataOperasional;

  factory ListGardu.fromJson(Map<String, dynamic> json) => ListGardu(
        garduId: json["gardu_id"],
        garduNama: json["gardu_nama"],
        gerbangId: json["gerbang_id"],
        garduStatus: json["gardu_status"],
        host: json["host"],
        status: json["status"],
        totalHistori: json["total_histori"],
        dataHistori: List<dynamic>.from(json["data_histori"].map((x) => x)),
        dataOperasional:
            List<dynamic>.from(json["data_operasional"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "gardu_id": garduId,
        "gardu_nama": garduNama,
        "gerbang_id": gerbangId,
        "gardu_status": garduStatus,
        "host": host,
        "status": status,
        "total_histori": totalHistori,
        "data_histori": List<dynamic>.from(dataHistori!.map((x) => x)),
        "data_operasional": List<dynamic>.from(dataOperasional!.map((x) => x)),
      };
  static List<ListGardu> fromJsonList(List list) {
    if (list.length == 0) return List<ListGardu>.empty();
    return list.map((item) => ListGardu.fromJson(item)).toList();
  }
}
