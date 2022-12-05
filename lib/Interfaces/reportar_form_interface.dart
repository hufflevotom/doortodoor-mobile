import 'dart:convert';

class Reportar {
  Reportar({required this.available, required this.justificacion});

  bool available;
  String justificacion;

  factory Reportar.fromJson(String str) => Reportar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reportar.fromMap(Map<String, dynamic> json) => Reportar(
      available: json["available"], justificacion: json["justificacion"]);

  Map<String, dynamic> toMap() =>
      {"available": available, "justificacion": justificacion};

  Reportar copy() =>
      Reportar(available: available, justificacion: justificacion);
}
