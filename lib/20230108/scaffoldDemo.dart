import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/secondScreen': (context) => SecondScreen(
              word: 'Hello',
              val: 4,
            ),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AppBar"), // title of appbar
          backgroundColor: Colors.redAccent, // background color of appbar
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          //Floating action button on Scaffold
          //To pass data to the back page, you need to put Navigator.push() method
          //on "Click on Me" or any back buttons like below:
          //传递参数到上一页时需要这样设置
          onPressed: () async {
            var backdata = await Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return SecondScreen(word: "Hello", val: 4);
            }));
            print(backdata);
          },
          child: Icon(Icons.send), // icon inside button
        ),
        //This property is used to set location of Floating action button on the screen.
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //drawer on scaffold,open with left menu icon
        drawer: Drawer(
          //drawer navigation on scaffold
          child: SafeArea(
            child: Column(
              //column widget
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home Page"),
                  subtitle: Text("Subtitle menu 1"),
                  onTap: () {
                    //fixme not work
                    (context) => HomePage();
                  },
                ),
                ListTile(
                    leading: Icon(Icons.search),
                    title: Text("Search Page"),
                    subtitle: Text("Subtitle menu 1"),
                    onTap: () {
                      //fixme not work
                      (context) => SecondScreen(word: "searchWord", val: 5);
                    }),

                //put more menu items here
              ],
            ),
          ),
        ),
        //drawer on scaffold,open with left menu icon
        endDrawer: Drawer(),
        bottomNavigationBar: BottomAppBar(//bottom navigation bar on scaffold
          shape: CircularNotchedRectangle(), //shape of notch
          notchMargin: 10, //notche margin between floating button and bottom appbar
          //bottom navigation bar on scaffold
          child: Row( //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
                IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              ]
          ),

          color: Colors.blue,
          // items: [ //items inside navigation bar
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.add),
          //     label: "Button 1",
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.search),
          //     label: "Button 2",
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.camera),
          //     label: "Button 3",
          //   ),
          //
          //   //put more items here
          // ],
        ),
        body: Center(
            child: TextButton(
          onPressed: () {
            print("scaffold widget text button clicked");
          },
          child: Text("Scaffold Widget"),
        )));
  }
}

class SecondScreen extends StatelessWidget {
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
          child: Text("Word:$word,Value:$val,- Go Back"), //go back button
          onPressed: () {
            //you need to put like widget.word on stateful widgets.
            //这条returntext会在返回时由"backdata"打印
            Navigator.pop(context, "returntext");
          },
        )));
  }

  //构造器参数使用{}内的参数在穿参时要声明参数名
  SecondScreen({required this.word, required this.val});
}
