import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simulador/ui/shared/utils/background.dart';
import 'package:simulador/ui/views/add/name.view.dart';
import 'package:simulador/ui/views/add/widgets/long_rounded_button.dart';
import 'package:simulador/ui/views/details/download.view.dart';
import 'package:simulador/ui/views/details/widget/text_field_details.dart';
import 'package:screenshot/screenshot.dart';
import 'package:simulador/core/modelos/modelosimulacion.dart';
import 'package:simulador/ui/views/details/widget/text_field_download.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';




class Details extends StatefulWidget {

  final simulaciones;

  Details({Key? key, required this.simulaciones}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int index = 0;
  final controller = ScreenshotController();
  final controller2 = ScreenshotController();



  Widget descargar(BuildContext context)=> Screenshot(
    controller: controller2,
        child: MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Material(
                child: Container(
                color: Color(0xff003084),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SafeArea(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        bottom:0,
                        right: 0,
                        child: Image.asset(
                            'assets/images/enmascarar.png',
                            width: MediaQuery.of(context).size.width *0.4
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget> [


                          Image.asset('assets/images/grupo2.png', width: MediaQuery.of(context).size.width *0.4,),


                          SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,

                            child: Text('INVERSIÓN:',
                              textScaleFactor : MediaQuery.of(context).textScaleFactor,
                              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 17.6), ),

                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                          SingleChildScrollView(
                            child: Column(
                              children:<Widget> [
                                TextFieldDownload(firstInfo: 'Capital inicial', lastInfo: '${NumberFormat.simpleCurrency().format(double.parse(widget.simulaciones.monto))}', color: Color(0xff2ee872),),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                TextFieldDownload(firstInfo: 'Plazo de tu inversión', lastInfo: '${widget.simulaciones.plazo}', color: Colors.white,),


                              ],



                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,

                            child: Text('RENDIMIENTO:',
                              textScaleFactor : MediaQuery.of(context).textScaleFactor,
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17.6), ),

                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                          SingleChildScrollView(
                            child: Column(
                              children:<Widget> [
                                TextFieldDownload(firstInfo: 'Rendimiento total:', lastInfo: '${NumberFormat.simpleCurrency().format(double.parse(widget.simulaciones.rendimientoTotal))}', color: Color(0xff2ee872),),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                TextFieldDownload(firstInfo: 'De acuerdo a tu plazo tendrás:', lastInfo: '${widget.simulaciones.numEntrega} entregas', color: Colors.white,),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                TextFieldDownload(firstInfo: 'Entrega de rendimiento', lastInfo: widget.simulaciones.frecuencia, color: Colors.white,),

                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                TextFieldDownload(firstInfo: 'La utilidad corresponde a:', lastInfo: '${NumberFormat.simpleCurrency().format(double.parse(widget.simulaciones.rendimiento))}', color: Colors.white,),

                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                TextFieldDownload(firstInfo: 'Tasa de rendimiento', lastInfo: widget.simulaciones.taza, color: Colors.white,),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                TextFieldDownload(firstInfo: 'Fecha de la primera entrega:', lastInfo: widget.simulaciones.fechaPrimerPago, color: Colors.white,),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                TextFieldDownload(firstInfo: 'Fecha de la última entrega:', lastInfo: widget.simulaciones.fechaUltimoPago, color: Colors.white,),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                TextFieldDownload(firstInfo: 'Rendimiento Anual', lastInfo: '${widget.simulaciones.porcentajeAnual}%', color: Colors.white,),
                              ],



                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03),





                        ],

                      )

                    ],
                  ),
                )
                  )
            )
          ),
        ),


  );

  Widget build(BuildContext context){
    print(index);

    Size size = MediaQuery.of(context).size;
    return Screenshot(
      controller: controller,
        child:Background(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget> [
            SizedBox(height: size.height * 0.02,),


            Container(
                height: size.height/2*0.1,

                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.07,),
                          child:GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.keyboard_arrow_left, size:  size.height/2*0.11,color: Colors.white,),
                          ),),
                      ),

                      Expanded(
                          flex:3,
                          child: IndexedStack(
                              index: index,
                              children:<Widget>[
                          Container(
                            alignment: Alignment.center,
                            child:   RichText(
                                textScaleFactor : MediaQuery.of(context).textScaleFactor,

                                text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'RENDIMIENTO',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color:Color(0xff2ee872))
                                      ),

                                    ]
                                )
                            ),

                          ),
                                Container(
                                  alignment: Alignment.center,
                                  child:   RichText(
                                      textScaleFactor : MediaQuery.of(context).textScaleFactor,

                                      text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'INICIA CON:',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color:Color(0xff2ee872))
                                            ),

                                          ]
                                      )
                                  ),

                                )
                          ]
                      )
                      ),


                      Expanded(flex:1,child: Container())

                    ]
                )
            ),

            Text(
              NumberFormat.simpleCurrency().format(double.parse(widget.simulaciones.rendimientoTotal)),
              textScaleFactor : MediaQuery.of(context).textScaleFactor,
              style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w600),),

            SizedBox(height: size.height * 0.03),

            IndexedStack(
                index: index,
                children:<Widget>[
                  Image.asset('assets/images/imagen42.png',width: size.width*0.6,),
                  Image.asset('assets/images/imagen52.png',width: size.width*0.5,),

                ]
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,),
              width: size.width * 0.8,
              height: size.height*0.06,
              decoration: BoxDecoration(
                color: Color(0xff0d2e67),
                borderRadius: BorderRadius.circular(5),

              ),
              child: Row(
                children: <Widget>[

                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text("RENDIMIENTO",

                              textScaleFactor : MediaQuery.of(context).textScaleFactor,

                              style: index == 0 ? TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -5))
                                ],
                                decoration: TextDecoration.underline,
                                decorationColor:Color(0xff2ee872),
                                decorationThickness: 3,

                              color: Colors.transparent,fontSize: 17, fontWeight: FontWeight.w700,
                            ) : TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -5))
                                ],
                                decoration: TextDecoration.underline,
                                decorationColor:Colors.transparent,
                                decorationThickness: 3,

                                color: Colors.transparent,fontSize: 17, fontWeight: FontWeight.w700,
                              )

                              ,
                            ),
                          )
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text('INVERSIÓN', textScaleFactor : MediaQuery.of(context).textScaleFactor,
                              style: index == 1 ? TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -5))
                                ],
                                decoration: TextDecoration.underline,
                                decorationColor:Color(0xff2ee872),
                                decorationThickness: 3,

                                color: Colors.transparent,fontSize: 17, fontWeight: FontWeight.w700,
                              ) : TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -5))
                                ],
                                decoration: TextDecoration.underline,
                                decorationColor:Colors.transparent,
                                decorationThickness: 3,

                                color: Colors.transparent,fontSize: 17, fontWeight: FontWeight.w700,
                              )
                          ),
                        )
                      )
                    ),


                ],
              ),
            ),

            SizedBox(height: size.height * 0.02),

            IndexedStack(
                index: index,
                children:<Widget>[
                  Container(
                    height: size.height*0.4,
                    child: SingleChildScrollView(
                      child: Column(

                        children:<Widget> [
                          TextFieldDetails(firstInfo: 'Rendimiento total:', lastInfo: '${ NumberFormat.simpleCurrency().format(double.parse(widget.simulaciones.rendimientoTotal))}', color: Color(0xff2ee872),),
                          SizedBox(height: size.height * 0.01),

                          TextFieldDetails(firstInfo: 'De acuerdo a tu plazo tendrás:', lastInfo: '${widget.simulaciones.numEntrega} entregas', color: Colors.white,),

                          SizedBox(height: size.height * 0.01),
                          TextFieldDetails(firstInfo: 'Entrega de rendimiento', lastInfo: widget.simulaciones.frecuencia, color: Colors.white,),

                          SizedBox(height: size.height * 0.01),
                          TextFieldDetails(firstInfo: 'La utilidad corresponde a:', lastInfo: '${NumberFormat.simpleCurrency().format(double.parse(widget.simulaciones.rendimiento)) }', color: Colors.white,),

                          SizedBox(height: size.height * 0.01),
                          TextFieldDetails(firstInfo: 'Tasa de rendimiento', lastInfo: widget.simulaciones.taza, color: Colors.white,),

                          SizedBox(height: size.height * 0.01),
                          TextFieldDetails(firstInfo: 'Fecha de la primera entrega:', lastInfo: widget.simulaciones.fechaPrimerPago, color: Colors.white,),

                          SizedBox(height: size.height * 0.01),
                          TextFieldDetails(firstInfo: 'Fecha de la última entrega:', lastInfo: widget.simulaciones.fechaUltimoPago, color: Colors.white,),

                          SizedBox(height: size.height * 0.01),
                          TextFieldDetails(firstInfo: 'Rendimiento Anual', lastInfo: '${widget.simulaciones.porcentajeAnual}%', color: Colors.white),

                        ],



                      ),
                    ),
                  ),

                  SingleChildScrollView(
                    child: Column(
                      children:<Widget> [
                        TextFieldDetails(firstInfo: 'Plazo de tu inversión:', lastInfo: '${widget.simulaciones.plazo}', color: Colors.white,),
                        SizedBox(height: size.height * 0.01),
                        TextFieldDetails(firstInfo: 'Capital inicial', lastInfo: '${NumberFormat.simpleCurrency().format(double.parse(widget.simulaciones.monto)) }', color: Color(0xff2ee872)),



                      ],



                    ),
                  ),

                ]
            ),


            SizedBox(height: size.height * 0.02),
            LongRoundedButton(
                text: 'DESCARGAR',
                press: ()  async {

                  final image = await controller2.captureFromWidget(descargar(context));

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Download(simulacion:widget.simulaciones,)));


                  // final image = await Download(simulacion:widget.simulaciones);
                  if(image==null) return;

                  await saveImage(image);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Descargado")));
                }

            ),





          ],

        )
      )
    );
  }
  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final name = 'simulador';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);

    return result['filePath'];
  }
}



