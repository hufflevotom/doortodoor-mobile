class Folio {
  String? sId;
  String? numeroFolio;
  String? ruta;
  IdDetalleCliente? idDetalleCliente;
  IdDetalleEntrega? idDetalleEntrega;
  IdDetallePedido? idDetallePedido;
  IdLocalAbastecimiento? idLocalAbastecimiento;
  String? createdAt;
  String? updatedAt;

  Folio(
      {this.sId,
      this.numeroFolio,
      this.ruta,
      this.idDetalleCliente,
      this.idDetalleEntrega,
      this.idDetallePedido,
      this.idLocalAbastecimiento,
      this.createdAt,
      this.updatedAt});

  Folio.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    numeroFolio = json['numeroFolio'];
    ruta = json['ruta'];
    idDetalleCliente = json['idDetalleCliente'] != null
        ? IdDetalleCliente.fromJson(json['idDetalleCliente'])
        : null;
    idDetalleEntrega = json['idDetalleEntrega'] != null
        ? IdDetalleEntrega.fromJson(json['idDetalleEntrega'])
        : null;
    idDetallePedido = json['idDetallePedido'] != null
        ? IdDetallePedido.fromJson(json['idDetallePedido'])
        : null;
    idLocalAbastecimiento = json['idLocalAbastecimiento'] != null
        ? IdLocalAbastecimiento.fromJson(json['idLocalAbastecimiento'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class IdDetalleCliente {
  String? sId;
  String? nombre;
  String? dni;
  String? telefono;
  String? direccion;

  IdDetalleCliente(
      {this.sId, this.nombre, this.dni, this.telefono, this.direccion});

  IdDetalleCliente.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nombre = json['nombre'];
    dni = json['dni'];
    telefono = json['telefono'];
    direccion = json['direccion'];
  }
}

class IdDetalleEntrega {
  String? sId;
  String? fechaEntrega;
  IdUbicacionEntrega? idUbicacionEntrega;
  int? ordenEntrega;
  IdHorarioVisita? idHorarioVisita;

  IdDetalleEntrega(
      {this.sId,
      this.fechaEntrega,
      this.idUbicacionEntrega,
      this.ordenEntrega,
      this.idHorarioVisita});

  IdDetalleEntrega.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fechaEntrega = json['fechaEntrega'];
    idUbicacionEntrega = json['idUbicacionEntrega'] != null
        ? IdUbicacionEntrega.fromJson(json['idUbicacionEntrega'])
        : null;
    ordenEntrega = json['ordenEntrega'];
    idHorarioVisita = json['idHorarioVisita'] != null
        ? IdHorarioVisita.fromJson(json['idHorarioVisita'])
        : null;
  }
}

class IdUbicacionEntrega {
  String? sId;
  String? latitud;
  String? longitud;
  String? distrito;

  IdUbicacionEntrega({this.sId, this.latitud, this.longitud, this.distrito});

  IdUbicacionEntrega.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    latitud = json['latitud'];
    longitud = json['longitud'];
    distrito = json['distrito'];
  }
}

class IdHorarioVisita {
  String? sId;
  int? inicioVisita;
  int? finVisita;

  IdHorarioVisita({this.sId, this.inicioVisita, this.finVisita});

  IdHorarioVisita.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    inicioVisita = json['inicioVisita'];
    finVisita = json['finVisita'];
  }
}

class IdDetallePedido {
  String? sId;
  String? descripcionPedido;

  IdDetallePedido({this.sId, this.descripcionPedido});

  IdDetallePedido.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    descripcionPedido = json['descripcionPedido'];
  }
}

class IdLocalAbastecimiento {
  String? sId;
  String? localAbastecimiento;

  IdLocalAbastecimiento({this.sId, this.localAbastecimiento});

  IdLocalAbastecimiento.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    localAbastecimiento = json['localAbastecimiento'];
  }
}
