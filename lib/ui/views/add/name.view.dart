import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simulador/ui/shared/utils/background.dart';
import 'package:simulador/ui/views/add/widgets/rounded_input_field.dart';
import 'package:simulador/ui/views/add/widgets/rounded_button.dart';
import 'package:simulador/ui/views/add/form.view.dart';
import 'package:simulador/ui/views/add/name.view.dart';
import 'package:simulador/ui/views/add/widgets/text_field_name.dart';
import 'package:simulador/core/services/simulacion.dart';
import 'package:simulador/core/modelos/modelosimulacion.dart';


class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);


  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {

  void dispose(){
    _user.close();
    super.dispose();
  }

  String ? ValidatorMessage;
  bool validate = false;
  final _user = StreamController<String>();


  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

    return Background(
      child: StreamBuilder<String>(
          initialData:  '',
          stream: _user.stream,
          builder: (context, userSnapshot){
            return  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              SizedBox(height: size.height * 0.1),

              Image.asset('assets/images/grupo2.png', width: size.width*0.3,),

            SizedBox(height: size.height * 0.05),

            Image.asset('assets/images/2723.png', width: size.width*0.75,),

            SizedBox(height: size.height * 0.08),

            TextFieldName(icon: Icons.account_circle_outlined, onChanged: _user.add),

            SizedBox(height: size.height * 0.08),

            RoundedButton(text: 'ENTRAR', press: () async {
              if( userSnapshot.data!.isNotEmpty ) {

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Formu()));

                  setState(() {
                    validate = true;
                  });
              }else{
                setState(() {
                  validate = true;
                });

              }
            // async {
            //   simulacion = await SimulacionService().setSimulacionService(' ', '', '', '', '', '');

            //   print(simulacion.montoFinal);


            }),

            if(userSnapshot.data!.isEmpty && validate ==true)
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Introduce un nombre',
                  style: TextStyle(
                    color:Colors.red
                  )
                ),

              )
              else
                Container()

             ,SizedBox(height: size.height * 0.08),









            ],
            );

          },

      ),
    );
  }
}


// class _NameState extends State<Name> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             backgroundColor: Color(0xff003084),
//             body: Column(
//               children: <Widget>[
//                 Expanded(
//                   flex: 4,
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.end,
//
//                       children: <Widget> [
//
//                         Image.asset('assets/images/grupo.png'),
//                         SizedBox(height: 15),
//
//                         Image.asset('assets/images/ilustracionlogin.png'),
//                         SizedBox(height: 15),
//
//
//                       ]
//                   )
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child:Padding(
//                     padding: const EdgeInsets.only(left:30, right:30,top:10,bottom: 10),
//                     child: Form(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Color(0xff002257),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0xff2ee872),
//                               width: 2.0
//                             )
//                           ),
//
//
//                         ),
//                       )
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child:Scaffold(
//                     backgroundColor: Color(0xff003084),
//
//                     body:Padding(
//                       padding: const EdgeInsets.only(left:120, right:120),
//                         child: RawMaterialButton(
//                             onPressed: (){
//
//                             },
//                             shape: StadiumBorder(),
//                             fillColor: Color(0xff2ee872),
//                             splashColor: Colors.teal,
//                             child: Padding(
//                                 padding: EdgeInsets.all(10),
//                                 child:Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children : [
//                                       Text('ENTRAR', style: TextStyle(color: Color(
//                                           0xff0d2e67), fontSize:17,fontWeight: FontWeight.bold,))
//                                     ]
//                                 )
//                             )
//                         )
//                     ),
//
//                   ),
//                 ),
//
//
//               ],
//
//             ),
//
//         ),
//
//     );
//   }
// }
