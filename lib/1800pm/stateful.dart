// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget{
//   @override
//   State createState() {
//     return _HomePage();
//   }
// }
//
// class _HomePage extends State{
//   late int counter;
//
//   @override
//   void initState() { //inital state which is executed only on initial widget build.
//     counter = 0;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar( //appbar widget inside Scaffold
//             title: Text("Stateful Widget")
//         ),
//
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){
//             setState(() { // setState to update the UI
//               counter++; //during update to UI, increase counter value
//             });
//           },
//           child: Icon(Icons.add), //add icon on Floating button
//         ),
//
//         body: Center(
//           child: Text("Counter: $counter"), //display counter value
//         )
//     );
//   }
// }