import 'dart:convert';

class Finalizar {
  Finalizar(
      {required this.estado,
      required this.imgCliente,
      required this.imgGuia,
      required this.imgLugar,
      this.justificacion});

  String estado = '638d0c4d9a3096d13d7e2c1e';
  String? justificacion;
  String imgCliente;
  String imgGuia;
  String imgLugar;

  factory Finalizar.fromJson(String str) => Finalizar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Finalizar.fromMap(Map<String, dynamic> json) => Finalizar(
        estado: json["estado"],
        justificacion: json["justificacion"],
        imgCliente: json["imgCliente"],
        imgGuia: json["imgGuia"],
        imgLugar: json["imgLugar"],
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "justificacion": justificacion,
        "imgCliente": imgCliente,
        "imgGuia": imgGuia,
        "imgLugar": imgLugar,
      };

  Finalizar copy() => Finalizar(
        estado: estado,
        justificacion: justificacion,
        imgCliente: imgCliente,
        imgGuia: imgGuia,
        imgLugar: imgLugar,
      );
}
