// import 'package:flutter/material.dart';
// import 'package:simulador/ui/views/add/widgets/text_field_container.dart';
//
// class RoundedInputField extends StatelessWidget {
//   final IconData icon;
//   final ValueChanged<String> onChanged;
//   const RoundedInputField({
//     Key ? key,
//     required this.icon ,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFieldContainer(
//       child: TextField(
//         style: TextStyle(color: Colors.white),
//         onChanged: onChanged,
//         cursorColor: Colors.blue,
//         decoration: InputDecoration(
//
//           icon: Icon(
//             icon,
//             color: Colors.white,
//           ),
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }