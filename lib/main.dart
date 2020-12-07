import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/changeTheme.dart';
import './model/ThemeModal.dart';


// Provider
// ChangeNotiferProvider
// ListenableProvider
// ValueListenableProvider
// StreamProvider
// FutureProvider

// Provider.of
// Consumer
// Selector

// 更新数据的方式 ChangeNotifer 

void main() => runApp(
    ValueListenableProvider<int>(
        create: (_) => ValueNotifier(0),
        child: ChangeNotifierProvider<ThemeModal>(
            create: (_) {
                return ThemeModal(ThemeType.light);
            },
            child: MyApp()
        )
    )
);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<ThemeModal>(context).themeData, // provider 获取数据01
        home: MyHomePage(title: 'Flutter Provider'));
  }
}
