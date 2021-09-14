import 'package:flutter/material.dart';
import 'package:simulador/ui/shared/utils/background.dart';
import 'package:simulador/ui/views/add/name.view.dart';
import 'package:simulador/ui/views/add/widgets/long_rounded_button.dart';
import 'package:simulador/ui/views/details/widget/text_field_details.dart';
import 'package:simulador/ui/views/details/widget/text_field_download.dart';
import 'package:screenshot/screenshot.dart';


class Download extends StatefulWidget {
  final simulacion;
  const Download({Key? key, required this.simulacion}) : super(key: key);

  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {

  @override
  void initState() {
    // TODO: implement initState



    super.initState();
  }



  @override
  Widget build(BuildContext context){
    final controller = ScreenshotController();
    Size size = MediaQuery.of(context).size;
    return Screenshot(
        controller: controller,

        child:Background(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget> [


                Image.asset('assets/images/grupo.png'),


                SizedBox(height: size.height * 0.03),

                Container(
                  width: size.width * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: 15,),

                  child: Text('INVERSION:', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white), ),

                ),
                SizedBox(height: size.height * 0.01),

                SingleChildScrollView(
                  child: Column(
                    children:<Widget> [
                      TextFieldDownload(firstInfo: 'Capital inicial', lastInfo: '\$${widget.simulacion.monto}', color: Color(0xff2ee872),),
                      SizedBox(height: size.height * 0.01),
                      TextFieldDownload(firstInfo: 'Plazo de tu inversion', lastInfo: '${widget.simulacion.plazo}', color: Colors.white,),


                    ],



                  ),
                ),
                SizedBox(height: size.height * 0.03),

                Container(
                  width: size.width * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: 15,),

                  child: Text('RENDIMIENTO:', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white), ),

                ),
                SizedBox(height: size.height * 0.01),

                SingleChildScrollView(
                  child: Column(
                    children:<Widget> [
                      TextFieldDownload(firstInfo: 'Rendimiento total:', lastInfo: '\$${widget.simulacion.rendimientoTotal}', color: Color(0xff2ee872),),
                      SizedBox(height: size.height * 0.01),
                      TextFieldDownload(firstInfo: 'De acuerdo a tu plazo tendras:', lastInfo: '${widget.simulacion.numEntrega} entregas', color: Colors.white,),
                      SizedBox(height: size.height * 0.01),
                      TextFieldDownload(firstInfo: 'Entrega de rendimiento', lastInfo: widget.simulacion.frecuencia, color: Colors.white,),

                      SizedBox(height: size.height * 0.01),
                      TextFieldDownload(firstInfo: 'La utilidad corresponde a:', lastInfo: '\$${widget.simulacion.rendimiento}', color: Colors.white,),

                      SizedBox(height: size.height * 0.01),
                      TextFieldDownload(firstInfo: 'Tasa de rendimiento', lastInfo: widget.simulacion.taza, color: Colors.white,),
                      SizedBox(height: size.height * 0.01),
                      TextFieldDownload(firstInfo: 'Fecha de la primera entrega:', lastInfo: widget.simulacion.fechaPrimerPago, color: Colors.white,),
                      SizedBox(height: size.height * 0.01),
                      TextFieldDownload(firstInfo: 'Fecha de la ultima entrega:', lastInfo: widget.simulacion.fechaUltimoPago, color: Colors.white,),
                      SizedBox(height: size.height * 0.01),
                      TextFieldDownload(firstInfo: 'Rendimiento Anual', lastInfo: '${widget.simulacion.porcentajeAnual}%', color: Colors.white,),
                    ],



                  ),
                ),
                SizedBox(height: size.height * 0.03),





              ],

            )
        )
    );

  }
}

