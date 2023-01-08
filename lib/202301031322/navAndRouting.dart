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
        '/secondScreen':(context)=>SecondScreen(word: 'Hello', val: 4,),
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
          //To pass data to the back page, you need to put Navigator.push() method
          //on "Click on Me" or any back buttons like below:
          //传递参数到上一页时需要这样设置
          onPressed:() async {
            var backdata = await Navigator.push(context, MaterialPageRoute(builder:(context){
              return SecondScreen(word: "Hello", val: 4);
            }));
            print(backdata);
          }
        )
      )
    );
  }
}

class SecondScreen extends StatelessWidget{
  //声明变量为late也就是说明等到真正使用时再初始化
  late String word;
  late int val;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: TextButton(
          //很明显$是引用变量
          child:Text("Word:$word,Value:$val,- Go Back"),//go back button
          onPressed: (){
            //you need to put like widget.word on stateful widgets.
            Navigator.pop(context,"returntext");
          },
        )
      )
    );
  }

  //构造器参数使用{}内的参数在穿参时要声明参数名
  SecondScreen({required this.word,required this.val});

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