import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_mobx/screens/login_screen.dart';
import 'package:teste_mobx/stores/login_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final color = Colors.deepPurple;

    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      child: MaterialApp(
      title: 'Teste MobX',
      theme: ThemeData(
        primarySwatch: color,
        cursorColor: color,
        scaffoldBackgroundColor: color,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    ),
    );
  }
}

