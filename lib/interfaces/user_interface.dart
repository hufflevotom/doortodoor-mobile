class User {
  String? sId;
  String? dni;
  String? contrasena;
  String? nombre;
  String? apellidos;
  String? celular;
  String? idTipoRol;
  String? brevete;
  String? createdAt;
  String? updatedAt;

  User(
      {this.sId,
      this.dni,
      this.contrasena,
      this.nombre,
      this.apellidos,
      this.celular,
      this.idTipoRol,
      this.brevete,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    dni = json['dni'];
    contrasena = json['contrasena'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    celular = json['celular'];
    idTipoRol = json['idTipoRol'];
    brevete = json['brevete'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
