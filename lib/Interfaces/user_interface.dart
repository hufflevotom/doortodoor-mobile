class User {
  String? sId;
  String? contrasena;
  String? nombre;
  String? apellidos;
  String? celular;
  String? idTipoRol;
  String? brevete;
  String? createdAt;
  String? updatedAt;
  String? documento;
  String? dni;
  String? idResponsable;
  IdVehiculo? idVehiculo;
  String? ruta;

  User(
      {this.sId,
      this.contrasena,
      this.nombre,
      this.apellidos,
      this.celular,
      this.idTipoRol,
      this.brevete,
      this.createdAt,
      this.updatedAt,
      this.documento,
      this.dni,
      this.idVehiculo,
      this.idResponsable,
      this.ruta});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    contrasena = json['contrasena'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    celular = json['celular'];
    idTipoRol = json['idTipoRol'];
    brevete = json['brevete'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    documento = json['documento'];
    dni = json['dni'];
    idVehiculo = json['idVehiculo'] != null
        ? IdVehiculo.fromJson(json['idVehiculo'])
        : null;
    idResponsable = json['idResponsable'];
    ruta = json['ruta'];
  }
}

class IdVehiculo {
  String? sId;
  String? placa;
  String? modelo;

  IdVehiculo({this.sId, this.placa, this.modelo});

  IdVehiculo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    placa = json['placa'];
    modelo = json['modelo'];
  }
}
