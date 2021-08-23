// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.nppNo,
    this.namaPegawai,
    this.jabatanId,
    this.kodeTugas,
    this.penempatan,
    this.gerbangId,
    this.ruasId,
    this.gerbangNama,
    this.singkatan,
    this.gerbangStatus,
    this.namaJabatan,
    this.jenisGerbang,
  });

  String? nppNo;
  String? namaPegawai;
  String? jabatanId;
  String? kodeTugas;
  String? penempatan;
  String? gerbangId;
  String? ruasId;
  String? gerbangNama;
  String? singkatan;
  String? gerbangStatus;
  String? namaJabatan;
  String? jenisGerbang;

  factory User.fromJson(Map<String, dynamic> json) => User(
        nppNo: json["npp_no"],
        namaPegawai: json["nama_pegawai"],
        jabatanId: json["jabatan_id"],
        kodeTugas: json["kode_tugas"],
        penempatan: json["penempatan"],
        gerbangId: json["gerbang_id"],
        ruasId: json["ruas_id"],
        gerbangNama: json["gerbang_nama"],
        singkatan: json["singkatan"],
        gerbangStatus: json["gerbang_status"],
        namaJabatan: json["nama_jabatan"],
        jenisGerbang: json["jenis_gerbang"],
      );

  Map<String, dynamic> toJson() => {
        "npp_no": nppNo,
        "nama_pegawai": namaPegawai,
        "jabatan_id": jabatanId,
        "kode_tugas": kodeTugas,
        "penempatan": penempatan,
        "gerbang_id": gerbangId,
        "ruas_id": ruasId,
        "gerbang_nama": gerbangNama,
        "singkatan": singkatan,
        "gerbang_status": gerbangStatus,
        "nama_jabatan": namaJabatan,
        "jenis_gerbang": jenisGerbang,
      };
}
