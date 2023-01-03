import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>HomePage(),
        '/secondScreen':(context)=>SecondScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: TextButton(
          child: Text("Click on Me"),
          onPressed:(){
            Navigator.pushNamed(context, "/secondScreen");
          }
        )
      )
    );
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: TextButton(
          child:Text("Go Back"),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      )
    );
  }

}



class _HomePage extends State{
  late int counter;

  @override
  void initState() { //inital state which is executed only on initial widget build.
    print("4. Initial state of _HomePage.");
    counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("5. Widget build of _HomePage.");
    return Scaffold(
        appBar: AppBar( //appbar widget inside Scaffold
            title: Text("Stateful Widget")
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            print("----button pressed----");
            setState(() { // setState to update the UI
              print("6. setState() after button press.");
              counter++; //during update to UI, increase counter value
            });
          },
          child: Icon(Icons.add), //add icon on Floating button
        ),

        body: Center(
          child: Text("Counter: $counter"), //display counter value
        )
    );
  }
}