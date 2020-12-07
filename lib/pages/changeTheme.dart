import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../model/ThemeModal.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//   void constructor() {
//     print('constructor');
//   }

  void initState() {
    print('initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text('哈哈哈'),
              SizedBox(height: 10),
              Text('You have pushed the button this many times:'),
              SizedBox(height: 10),
              Selector(
                // provider 获取数据02
                builder: (context, data, child) {
                  return Text('$data');
                },
                selector: (BuildContext context, ThemeModal themeModal) {
                  return themeModal.countValue;
                },
                shouldRebuild: (pre, next) {
                  return pre != next;
                },
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                OutlineButton(
                    child: Text("加"),
                    onPressed: () {
                      Provider.of<ThemeModal>(context, listen: false)
                          .addCount();
                    }),
                SizedBox(width: 10),
                OutlineButton(
                    child: Text("减"),
                    onPressed: () {
                      Provider.of<ThemeModal>(context, listen: false)
                          .reduceCount();
                    })
              ]),
              FlatButton(onPressed: () {
                Provider.of<ThemeModal>(context, listen: false).reverse();
              }, child: Consumer<ThemeModal>(// provider 获取数据03
                  builder: (BuildContext context, t, child) {
                String result = '切换成';
                if (t.currentType == ThemeType.dark) {
                  result += '白天模式';
                } else {
                  result += '夜间模式';
                }
                return Text("$result", style: TextStyle(color: Colors.red));
              }))
            ])));
  }
}
