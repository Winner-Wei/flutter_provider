import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/changeTheme.dart';
import './model/ThemeModal.dart';

void main() => runApp(
    ChangeNotifierProvider<ThemeModal>(
        create: (_) {
            return ThemeModal(ThemeType.light);
        },
        child: MyApp()
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<ThemeModal>(context).themeData,
        home: MyHomePage(title: 'Flutter Provider'));
  }
}
