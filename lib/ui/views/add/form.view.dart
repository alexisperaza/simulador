import 'package:flutter/material.dart';
import 'package:simulador/ui/shared/utils/background.dart';
import 'package:simulador/ui/views/add/name.view.dart';
import 'package:simulador/ui/views/add/widgets/long_rounded_button.dart';
import 'package:simulador/ui/views/add/widgets/rounded_button.dart';
import 'package:simulador/ui/views/add/widgets/rounded_input_field.dart';
import 'package:simulador/ui/views/add/widgets/simple_ask_text.dart';
import 'package:simulador/ui/views/add/widgets/text_field_container.dart';
import 'package:simulador/ui/views/details/details.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:simulador/core/services/simulacion.dart';
import 'package:simulador/core/modelos/modelosimulacion.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';




class Formu extends StatefulWidget {
  const Formu({Key? key}) : super(key: key);

  @override
  _FormuState createState() => _FormuState();
}

class _FormuState extends State<Formu> {



  late Simulacion simulacion;


  int plazo = 0;
  double inversion = 0;
  double porcentaje = 0;
  int entrega = 0;
  int tipoplazo = 1;
  int tipoporcentaje = 1;
  int tipoentrega = 1;

  late TextEditingController _plazoController;
  late TextEditingController _inversionController;
  late TextEditingController _porcentajeController;
  late TextEditingController _entregaController;

  initState(){
    _plazoController = new TextEditingController();
    _inversionController = new TextEditingController();
    _porcentajeController = new TextEditingController();
    _entregaController = new TextEditingController();

    super.initState();
  }


  Future <void> _showDialogPlazo(BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    return await showDialog(
      context: context,
      builder: (BuildContext context)  {
        int selected = 1;

        return StatefulBuilder(builder: (context, setState){

          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 20),




              child:Container(
                height: size.height*0.20,

                child: Column(


                  children: [
                    Container(
                      height: size.height*0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),

                        color: Color(0xff2ee872),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex:4,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/icons/mini1.png', height: size.height*0.02,),
                                    SizedBox(width: size.width * 0.02),
                                    Text('Plazo de Inversión', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                  ],
                                )

                              ),
                          ),
                          Expanded(
                            flex:1,
                            child: GestureDetector(

                              onTap: () {
                                Navigator.pop(context);

                              },
                              child: Icon(Icons.close_rounded, size:30, ),
                            ),
                          )
                        ],
                      ),

                    ),
                    Container(
                        height: size.height*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: Color(0xff0d2e67),

                        ),
                        child:Row(
                          children: [
                            Expanded(
                                child:Container(
                                    padding: EdgeInsets.symmetric(horizontal:40,vertical: 25),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,

                                      children: [

                                        Container(
                                          width: size.width * 0.4,
                                          height:30,
                                          decoration: BoxDecoration(
                                            color: Color(0xff0d2e67),
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Color(0xff2ee872),),

                                          ),
                                          child: TextField(
                                            onChanged: (a){
                                              setState((){
                                                this.plazo = int.parse(_plazoController.text);
                                                this.tipoplazo = selected+1;
                                              });
                                            },
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.white),
                                            controller: _plazoController,
                                            keyboardType: TextInputType.number,
                                            textInputAction: TextInputAction.done,
                                            autofocus: true,
                                            onSubmitted:(a){
                                              setState((){
                                                this.plazo = int.parse(_plazoController.text);
                                                this.tipoplazo = selected+1;
                                              });
                                              Navigator.pop(context);},


                                          )
                                        )

                                      ],
                                    )
                                )
                            ),
                            Expanded(
                                child:Row(
                                  children: [
                                    SizedBox(width: size.width*0.1,),
                                    Expanded( child: CupertinoPicker(

                                      scrollController: FixedExtentScrollController (initialItem:1),


                                      itemExtent: 40,
                                      onSelectedItemChanged: (int i) {
                                        setState(() {
                                          selected = i;
                                          this.tipoplazo = selected+1;
                                        });
                                      },
                                      children: <Widget>[

                                        Center(

                                          child: Text(

                                            "Día/s",
                                            textScaleFactor : MediaQuery.of(context).textScaleFactor,
                                            style: TextStyle(
                                                fontSize: 15, fontWeight: FontWeight.w300,
                                                color: selected == 0 ? Colors.white : Colors.blue ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      width: 1, color: Color(0xff2ee872)
                                                  ),
                                                  bottom: BorderSide(
                                                    width: 1, color: Color(0xff2ee872),
                                                  )
                                              )
                                          ),
                                          child: Text(
                                            "Mes/es",
                                            textScaleFactor : MediaQuery.of(context).textScaleFactor,
                                            style: TextStyle(
                                              fontSize: 15, fontWeight: FontWeight.w300,
                                                color: selected == 1 ? Colors.white : Colors.blue),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "Año/s",
                                            textScaleFactor : MediaQuery.of(context).textScaleFactor,
                                            style: TextStyle(
                                                fontSize: 15, fontWeight: FontWeight.w300,
                                                color: selected == 2 ? Colors.white : Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),),
                                    SizedBox(width: size.width*0.1,),

                                  ],

                                )
                            )
                          ],
                        )

                    ),

                  ],
                ),

              )
          );
        });
      },
    );
  }
  Future <void> _showDialogInversion(BuildContext context) async {
    bool isFirst = true;

    Size size = MediaQuery.of(context).size;
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        int selected = 1;
        return StatefulBuilder(builder: (context, setState){
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 20),




              child:Container(
                height: size.height*0.20,

                child: Column(


                  children: [
                    Container(
                      height: size.height*0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),

                        color: Color(0xff2ee872),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex:4,
                            child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/icons/mini2.png', height: size.height*0.02,),
                                    SizedBox(width: size.width * 0.02),
                                    Text('Monto de tu inversión', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                  ],
                                )

                            ),
                          ),
                          Expanded(
                            flex:1,

                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close_rounded, size:30, ),
                            ),                          )
                        ],
                      ),

                    ),
                    Container(
                        height: size.height*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: Color(0xff0d2e67),

                        ),
                        child:Row(
                          children: [
                            Expanded(
                                child:Container(
                                    padding: EdgeInsets.symmetric(horizontal:40,vertical: 25),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,

                                      children: [
                                        Container(
                                            width: size.width * 0.6,
                                            height:30,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color(0xff0d2e67),
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Color(0xff2ee872),),

                                            ),
                                            child: TextField(

                                              textAlign: TextAlign.center,
                                              autofocus: true,
                                              style: TextStyle(color: Colors.white),
                                              controller: _inversionController,
                                              decoration: InputDecoration.collapsed(
                                                  hintText: "0.00",

                                                  hintStyle: TextStyle(
                                                    color: Colors.white,

                                                  )
                                              ),
                                              keyboardType: TextInputType.number,
                                              textInputAction: TextInputAction.done,
                                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],

                                              onChanged: (value){

                                                String newValue = value.replaceAll(',', '').replaceAll('.', '');
                                                if (value.isEmpty || newValue == '00') {
                                                  _inversionController.clear();
                                                  isFirst = true;
                                                  return;
                                                }
                                                double value1 = double.parse(newValue);
                                                if (!isFirst) value1 = value1 * 100;
                                                value = NumberFormat.currency(customPattern: '###,###.##').format(value1 / 100);
                                                _inversionController.value = TextEditingValue(
                                                  text: value,
                                                  selection: TextSelection.collapsed(offset: value.length),
                                                );
                                                setState((){
                                                  this.inversion = double.parse(_inversionController.text.replaceAll(',',''));
                                                });
                                              },
                                              onSubmitted:(value){
                                                setState((){
                                                  this.inversion = double.parse(_inversionController.text.replaceAll(',',''));
                                                });
                                                Navigator.pop(context);},


                                            )
                                        )

                                      ],
                                    )
                                )
                            ),

                          ],
                        )

                    ),

                  ],
                ),

              )
          );
        });
      },
    );
  }
  Future <void> _showDialogPorcentaje(BuildContext context) async {
    bool isFirst = true;

    Size size = MediaQuery.of(context).size;
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        int selected = 1;
        return StatefulBuilder(builder: (context, setState){
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 20),




              child:Container(
                height: size.height*0.20,

                child: Column(


                  children: [
                    Container(
                      height: size.height*0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),

                        color: Color(0xff2ee872),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex:4,
                            child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/icons/mini3.png', height: size.height*0.02,),
                                    SizedBox(width: size.width * 0.02),
                                    Text('Porcentaje de rendimiento', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                  ],
                                )

                            ),
                          ),
                          Expanded(
                            flex:1,

                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close_rounded, size:30, ),
                            ),                          )
                        ],
                      ),

                    ),
                    Container(
                        height: size.height*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: Color(0xff0d2e67),

                        ),
                        child:Row(
                          children: [
                            Expanded(
                                child:Container(
                                    padding: EdgeInsets.symmetric(horizontal:40,vertical: 25),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,

                                      children: [

                                        Container(
                                            width: size.width * 0.4,
                                            height:30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff0d2e67),
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Color(0xff2ee872),),

                                            ),
                                            child: TextField(
                                              autofocus: true,
                                              onChanged: (value){
                                                setState((){
                                                  this.porcentaje = double.parse(_porcentajeController.text);
                                                  this.tipoporcentaje = selected+1;
                                                });
                                              },
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white),
                                              controller: _porcentajeController,
                                              decoration: InputDecoration.collapsed(
                                                  hintText: "%",


                                                  hintStyle: TextStyle(
                                                    color: Colors.white,

                                                  ),
                                              ),
                                              keyboardType: TextInputType.number,
                                              textInputAction: TextInputAction.done,

                                              onSubmitted:(a){
                                                setState((){
                                                  this.porcentaje = double.parse(_porcentajeController.text);
                                                  this.tipoporcentaje = selected+1;
                                                });
                                                Navigator.pop(context);},


                                            )
                                        )

                                      ],
                                    )
                                )
                            ),
                            Expanded(
                                child:Row(
                                  children: [
                                    SizedBox(width: size.width*0.1,),
                                    Expanded( child: CupertinoPicker(

                                      scrollController: FixedExtentScrollController (initialItem:1),


                                      itemExtent: 40,
                                      onSelectedItemChanged: (int i) {
                                        setState(() {
                                          selected = i;
                                          this.tipoporcentaje = selected+1;
                                        });
                                      },
                                      children: <Widget>[

                                        Center(

                                          child: Text(

                                            "Día/s",
                                            textScaleFactor : MediaQuery.of(context).textScaleFactor,
                                            style: TextStyle(
                                                fontSize: 15, fontWeight: FontWeight.w300,
                                                color: selected == 0 ? Colors.white : Colors.blue ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      width: 1, color: Color(0xff2ee872)
                                                  ),
                                                  bottom: BorderSide(
                                                    width: 1, color: Color(0xff2ee872),
                                                  )
                                              )
                                          ),
                                          child: Text(
                                            "Mes/es",
                                            textScaleFactor : MediaQuery.of(context).textScaleFactor,
                                            style: TextStyle(
                                                fontSize: 15, fontWeight: FontWeight.w300,
                                                color: selected == 1 ? Colors.white : Colors.blue),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "Año/s",
                                            textScaleFactor : MediaQuery.of(context).textScaleFactor,
                                            style: TextStyle(
                                                fontSize: 15, fontWeight: FontWeight.w300,
                                                color: selected == 2 ? Colors.white : Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),),
                                    SizedBox(width: size.width*0.1,),

                                  ],

                                )
                            )
                          ],
                        )

                    ),

                  ],
                ),

              )
          );
        });
      },
    );
  }
  Future <void> _showDialogEntrega(BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    return await showDialog(
      context: context,


      builder: (BuildContext context) {
        int selected = 1;
        return StatefulBuilder(builder: (context, setState){
          return Container(
              padding: EdgeInsets.symmetric(vertical: size.height*0.36,),

            child:SingleChildScrollView(



          child: Dialog(

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 20),




              child:Container(
                height: size.height*0.20,

                child: Column(


                  children: [
                    Container(
                      height: size.height*0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),

                        color: Color(0xff2ee872),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex:4,
                            child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/icons/mini2.png', height: size.height*0.02,),
                                    SizedBox(width: size.width * 0.02),
                                    Text('Entrega de rendimiento', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                  ],
                                )

                            ),
                          ),
                          Expanded(
                            flex:1,

                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close_rounded, size:30, ),
                            ),                          )
                        ],
                      ),

                    ),
                    Container(
                        height: size.height*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: Color(0xff0d2e67),

                        ),
                        child:Row(
                          children: [
                            Expanded(
                                child:Container(
                                    padding: EdgeInsets.symmetric(horizontal:40,vertical: 25),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,

                                      children: [

                                        Container(
                                            width: size.width * 0.4,
                                            height:30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff0d2e67),
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Color(0xff2ee872),),

                                            ),
                                            child: TextField(
                                              autofocus: true,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white),
                                              controller: _entregaController,
                                              keyboardType: TextInputType.number,
                                              textInputAction: TextInputAction.done,
                                              onChanged: (value){
                                                setState((){
                                                  this.entrega = int.parse(_entregaController.text);
                                                  this.tipoentrega = selected+1;
                                                });
                                              },
                                              onSubmitted:(a){
                                                setState((){
                                                  this.entrega = int.parse(_entregaController.text);
                                                  this.tipoentrega = selected+1;
                                                });
                                                Navigator.pop(context);},


                                            )
                                        )

                                      ],
                                    )
                                )
                            ),
                            Expanded(
                                child:Row(
                                  children: [
                                    SizedBox(width: size.width*0.1,),
                                    Expanded( child: CupertinoPicker(

                                      scrollController: FixedExtentScrollController (initialItem:1),


                                      itemExtent: 40,
                                      onSelectedItemChanged: (int i) {
                                        setState(() {
                                          selected = i;
                                          this.tipoentrega = selected+1;
                                        });
                                      },
                                      children: <Widget>[

                                        Center(

                                          child: Text(

                                            "Día/s",
                                            textScaleFactor : MediaQuery.of(context).textScaleFactor,
                                            style: TextStyle(
                                                fontSize: 15, fontWeight: FontWeight.w300,
                                                color: selected == 0 ? Colors.white : Colors.blue ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      width: 1, color: Color(0xff2ee872)
                                                  ),
                                                  bottom: BorderSide(
                                                    width: 1, color: Color(0xff2ee872),
                                                  )
                                              )
                                          ),
                                          child: Text(
                                            "Mes/es",
                                            textScaleFactor : MediaQuery.of(context).textScaleFactor,
                                            style: TextStyle(
                                                fontSize: 15, fontWeight: FontWeight.w300,
                                                color: selected == 1 ? Colors.white : Colors.blue),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "Año/s",
                                            textScaleFactor : MediaQuery.of(context).textScaleFactor,
                                            style: TextStyle(
                                                fontSize: 15, fontWeight: FontWeight.w300,
                                                color: selected == 2 ? Colors.white : Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),),
                                    SizedBox(width: size.width*0.1,),

                                  ],

                                )
                            )
                          ],
                        )

                    ),

                  ],
                ),
              )  )  )
          );
        });
      },
    );
  }


  // _dismissDialog() {
  //   Navigator.pop(context);
  // }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child:Column(
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
                        child:Container(
                          alignment: Alignment.center,
                          child: RichText(
                              textScaleFactor : MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'SIMULA TU ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Colors.white)
                                    ),
                                    TextSpan(
                                        text: 'INVERSIÓN',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 18,
                                            color: Color(0xff2ee872))
                                    ),

                                  ]
                              )
                          ),
                        )
),


                      Expanded(flex:1,child: Container())


                    ]
                )
            ),
            SizedBox(height: size.height * 0.02,),


            Image.asset('assets/images/image22.png',width: size.width*0.70,),

            SizedBox(height: size.height * 0.04,),

            Container(
              width: size.width * 0.85,
              padding: EdgeInsets.symmetric(horizontal: 15,),

              child: Text(
                'COMPLETÁ LOS DATOS:',
                textScaleFactor : MediaQuery.of(context).textScaleFactor,
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white), ),

            ),

            SizedBox(height: size.height * 0.03,),

            SimpleAskText(question: '¿Cuál es el plazo de tu inversión?'),

            TextFieldContainer(press: () {_showDialogPlazo(context);}, valor: plazo,image: Image.asset('assets/icons/simula1.png', height: size.height*0.025,),fecha: tipoplazo,
            ),

            SizedBox(height: size.height * 0.01,),

            SimpleAskText(question: '¿Cuánto desea Invertir?'),

            TextFieldContainer(press: () {_showDialogInversion(context);}, valor: _inversionController.text,image: Image.asset('assets/icons/simula2.png',height: size.height*0.025,),fecha: 0,),

            SizedBox(height: size.height * 0.01,),

            SimpleAskText(question: '¿Cuál es el porcentaje de tu rendimiento?'),

            TextFieldContainer(press: () {_showDialogPorcentaje(context);}, valor: porcentaje,image: Image.asset('assets/icons/simula3.png',height: size.height*0.025,),fecha: tipoporcentaje,),

            SizedBox(height: size.height * 0.01,),

            SimpleAskText(question: 'Entrega de rendimiento'),

            TextFieldContainer(press: () {_showDialogEntrega(context);}, valor: entrega,image: Image.asset('assets/icons/simula2.png',height: size.height*0.025,), fecha: tipoentrega,),
            // RoundedInputField(icon: Icons.assignment_turned_in_sharp, onChanged: (value){},press: () {_showDialog(context);} ,),

            //_showDialog(context);

            SizedBox(height: size.height * 0.02),

            LongRoundedButton(
                text: 'SIMULAR',
                press: () async {

                  simulacion = await SimulacionService().setSimulacionService(plazo,inversion, porcentaje,entrega,tipoplazo,tipoporcentaje,tipoentrega);

                  print(simulacion.rendimientoTotal);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => Details(simulaciones: simulacion,))); }),
          ],
        )


    );  }
}


