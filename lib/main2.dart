import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(ZqApp());
}
// ZqApp类代表Flutter应用，它继承了StatelessWidget类，这也就
// 意味着应用本身也是一个widget。
// 在Flutter中，大多数东西都是widget（后同"组件"或"部件"），包括对齐（Align）、
// 填充（Padding）、手势处理（GestureDetector）等，它们都是以widget的形式提供。
// Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()方法来
// 描述如何构建UI界面（通常是通过组合、拼装其他基础widget）。
class ZqApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // MaterialApp是Material库中提供的Flutter APP框架，通过它可以设置应用的名称、
    // 主题、语言、首页及路由列表等。MaterialApp也是一个widget。
    return MaterialApp(
      title:'Main2 Demo\'s title',
      theme:ThemeData(
        primarySwatch: Colors.orange,
      ),
      //home为Flutter应用的首页，它也是一个widget。
      home: ZqHomePage(title:'Main2 Demo\'s home page'),
    );
  }

}

// ZqHomePage是应用的首页，它继承自StatefulWidget类，表示它是一个有状态的组件（Stateful widget）。
// 1.Stateful widget可以拥有状态，这些状态在widget生命周期中是可以变的，而Stateless widget是不可变的。
// 2.Stateful widget至少由两个类组成：
// （1）一个StatefulWidget类。
// （2）一个State类，StatefulWidget类本身是不变的，但是State类中持有的状态在widget生命周期中可能会
// 发生变化。
class ZqHomePage extends StatefulWidget{
  const ZqHomePage({Key? key,required this.title}):super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => _ZqHomePageState();
}
// _ZqHomePageState类是ZqHomePage类对应的状态类。看到这里，读者可能已经发现：
// 和ZqApp类不同，ZqHomePage类中并没有build方法，取而代之的是，build方法被挪到了
// _ZqHomePageState方法中，至于为什么这么做，之后解答。

//构建UI界面的逻辑在build方法中，当ZqHomePage第一次创建时，_ZqHomePageState类
// 会被创建，当初始化完成后，Flutter框架会调用widget的build方法来构建widget树，最终
// widget树渲染到设备屏幕上。所以，我们看看_ZqHomePageState的build方法中都干了什么事：
class _ZqHomePageState extends State<ZqHomePage>{
  int _counter = 0;
  //当按钮点击时，会调用此函数，该函数的作用是先自增_counter，然后调用setState方法。
  //setState方法的作用是通知Flutter框架，有状态发生了改变，Flutter框架收到通知后，
  //会执行build方法来根据新的状态重新构建界面，Flutter对此方法做了优化，使重新执行
  //变得很快，所以你可以重新构建任何需要更新的东西，而无需分别去修改各个widget。
  void _incrementCounter(){
    //setState会通知Flutter框架状态发生变化，接着，Flutter框架会调用build
    //方法以新的状态重新构建UI，最终显示在设备屏幕上。
    setState(() {
      _counter++;
    });
  }
  //为什么build方法放在State而不是StatefulWidget中，这主要是为了提高开发的灵活性。
  //如果将build方法放在StatefulWidget中则会有两个问题：
  // （1）状态访问不便。
  // 试想一下，如果我们的StatefulWidget有很多状态，而每次状态改变都要调用build方法，
  // 由于状态是保存在 State 中的，如果build方法在StatefulWidget中，那么build方法
  // 和状态分别在两个类中，那么构建时读取状态将会很不方便！试想一下，如果真的将build方
  // 法放在 StatefulWidget 中的话，由于构建用户界面过程需要依赖 State，所以build方
  // 法将必须加一个State参数。这样的话就只能将State的所有状态声明为公开状态，这样才能
  // 在State类外部访问状态。但是，将状态设置公开后，状态不再具有私密性，这就会导致对状态的
  // 修改将会变得不可控。但如果将build方法放在State中，构建过程不仅可以直接访问状态，而且
  // 也无需公开私有状态，这会非常方便。
  // （2）继承StatefulWidget不便。
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material库中提供的页面脚手架，它提供了默认的导航栏、标题和包含主屏幕
    //widget树（后同"组件树"或"部件树"）的body属性，组件树可以很复杂。本书默认示例，
    //路由默认都是通过Scaffold创建。
    return Scaffold(
      appBar: AppBar(title:Text(widget.title),),
      //body的组件树中包含了一个Center组件，Center可以将其子组件树对齐到屏幕中心。
      //此例中，Center子组件是一个Column组件，Column的作用是将其所有子组件沿着屏幕
      //垂直方向依次排列；
      //此例中Column子组件是两个Text，第一个Text显示固定文本"。。。"，
      //第二个Text显示_counter状态的数值。
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      //floatingActionButton是页面右下角带"+"的悬浮按钮，它的onPressed属性
      //接受一个回调函数，代表它被点击后的处理器，本例中直接将_incrementCounter
      //方法作为其处理函数。
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
//

