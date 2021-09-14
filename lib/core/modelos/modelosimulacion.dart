// To parse this JSON data, do
//
//     final simulacion = simulacionFromJson(jsonString);

import 'dart:convert';

Simulacion simulacionFromJson(String str) => Simulacion.fromJson(json.decode(str));

String simulacionToJson(Simulacion data) => json.encode(data.toJson());

class Simulacion {
    Simulacion({
        required this.id,
        required this.monto,
        required this.montoFinal,
        required this.rendimientoTotal,
        required this.rendimiento,
        required this.porcentajeAnual,
        required this.numEntrega,
        required this.fechaPrimerPago,
        required this.fechaUltimoPago,
        required this.createdAt,
        required this.updatedAt,
        required this.frecuencia,
        required this.plazo,
        required this.taza,
        required this.cliente,
        required this.detalles,
        required this.utilidadNormalizada,
    });

    int id;
    String monto;
    String montoFinal;
    String rendimientoTotal;
    String rendimiento;
    int porcentajeAnual;
    int numEntrega;
    String fechaPrimerPago;
    String fechaUltimoPago;
    DateTime createdAt;
    DateTime updatedAt;
    String frecuencia;
    String plazo;
    String taza;
    Cliente cliente;
    List<dynamic> detalles;
    String utilidadNormalizada;

    factory Simulacion.fromJson(Map<String, dynamic> json) => Simulacion(
        id: json["id"],
        monto: json["monto"],
        montoFinal: json["montoFinal"],
        rendimientoTotal: json["rendimientoTotal"],
        rendimiento: json["rendimiento"],
        porcentajeAnual: json["porcentajeAnual"],
        numEntrega: json["numEntrega"],
        fechaPrimerPago: json["fechaPrimerPago"],
        fechaUltimoPago: json["fechaUltimoPago"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        frecuencia: json["frecuencia"],
        plazo: json["plazo"],
        taza: json["taza"],
        cliente: Cliente.fromJson(json["cliente"]),
        detalles: List<dynamic>.from(json["detalles"].map((x) => x)),
        utilidadNormalizada: json["utilidadNormalizada"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "monto": monto,
        "montoFinal": montoFinal,
        "rendimientoTotal": rendimientoTotal,
        "rendimiento": rendimiento,
        "porcentajeAnual": porcentajeAnual,
        "numEntrega": numEntrega,
        "fechaPrimerPago": fechaPrimerPago,
        "fechaUltimoPago": fechaUltimoPago,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "frecuencia": frecuencia,
        "plazo": plazo,
        "taza": taza,
        "cliente": cliente.toJson(),
        "detalles": List<dynamic>.from(detalles.map((x) => x)),
        "utilidadNormalizada": utilidadNormalizada,
    };
}

class Cliente {
    Cliente({
        required this.id,
        required this.nombre,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String nombre;
    DateTime createdAt;
    DateTime updatedAt;

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        nombre: json["nombre"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
