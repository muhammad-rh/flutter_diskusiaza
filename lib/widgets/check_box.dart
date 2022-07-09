// import 'package:flutter/material.dart';

// class CheckBox extends StatefulWidget {
//   @override
//   State<CheckBox> createState() => _CheckBoxState();
// }

// class _CheckBoxState extends State<CheckBox> {
//   bool valuefirst = false;  
//   bool valuesecond = false;
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: new EdgeInsets.all(22.0),
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               width: 10,
//             ),
//             Text(
//               'Checkbox with Header and Subtitle',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             CheckboxListTile(
//               secondary: const Icon(Icons.alarm),
//               title: const Text('Ringing at 4:30 AM every day'),
//               subtitle: Text('Ringing after 12 hours'),
//               value: this.valuefirst,
//               onChanged: (bool value) {
//                 setState(() {
//                   this.valuefirst = value;
//                 });
//               },
//             ),
//             CheckboxListTile(
//               controlAffinity: ListTileControlAffinity.trailing,
//               secondary: const Icon(Icons.alarm),
//               title: const Text('Ringing at 5:00 AM every day'),
//               subtitle: Text('Ringing after 12 hours'),
//               value: this.valuesecond,
//               onChanged: (bool value) {
//                 setState(() {
//                   this.valuesecond = value;
//                 });
//               },
//             ),
//           ],
//       ),
//     );
//   }
// }
