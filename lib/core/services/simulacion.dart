
import 'package:http/http.dart' as http;

import 'package:simulador/global/enviroments.dart';
import 'package:simulador/core/modelos/modelosimulacion.dart';
import 'dart:convert';

class SimulacionService {
  Future<Simulacion> setSimulacionService(plazocantidad, monto, tasacantidad, fecuenciacantidad,tipoplazo,tipoporcentaje, tipoentrega) async {
    try {
      var data = jsonEncode( {
            "monto": monto,
            "cliente": "TRES",
            "plazo": { "cantidad": plazocantidad, "tipo": tipoplazo },
            "ahorroMensual": 0,
            "frecuencia": { "cantidad": fecuenciacantidad, "tipo": tipoentrega },
            "tasa": { "cantidad": tasacantidad, "tipo": tipoporcentaje }
        });

      final url = Uri.parse('${Enviroments.apiUrl}');
      Map<String, String> headers = {
        "Content-type": 'application/json; charset=UTF-8',

      };
      final resp = await http.post(url, headers: headers, body: data);
      
      final simulacion = simulacionFromJson(resp.body);
      return simulacion;
    } catch (e) {
        throw(e);
    }
  }
}