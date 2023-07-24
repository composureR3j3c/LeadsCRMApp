import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leadsmobile/Views/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: MaterialColor(
        0xFFF2AC1C,
        const <int, Color>{
          50: Color(0xFFF2AC1C),
          100: Color(0xFFF2AC1C),
          200: Color(0xFFF2AC1C),
          300: Color(0xFFF2AC1C),
          400: Color(0xFFF2AC1C),
          500: Color(0xFFF2AC1C),
          600: Color(0xFFF2AC1C),
          700: Color(0xFFF2AC1C),
          800: Color(0xFFF2AC1C),
          900: Color(0xFFF2AC1C),
        },
      )),
      debugShowCheckedModeBanner: false,
      home: const MySplashScreen(),
    );
  }
}
