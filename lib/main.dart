import 'package:flutter/material.dart';
import 'package:srafi1/constant/color.dart';
import 'package:srafi1/constant/screen_size.dart';
import 'package:srafi1/constant/size.dart';
import 'package:srafi1/page/home_page/big_home.dart';
import 'package:srafi1/page/home_page/small_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'nunito',
          textTheme: TextTheme(
            labelLarge: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,fontSize: ConstSize.symbol_text_size),
              displaySmall: TextStyle(color: CLR.grey_text,fontWeight: FontWeight.w400,
              fontSize: ConstSize.small_text_size),
              displayMedium: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.w600,
                  fontSize: ConstSize.menu_text_size
              ),
            displayLarge: TextStyle(color: CLR.grey_text,fontWeight: FontWeight.w400,
            fontSize: ConstSize.card_title_size)
          )
      ),
      color: Colors.black,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
        builder: (context,constraints) {
          ScreenSize.width =  constraints.maxWidth;
          ScreenSize.height =  constraints.maxHeight;
          if(ScreenSize.width>ConstSize.min_width_big)
          return  BigHomePage();
          else return SmallHomePage();
            //BigHomePage();
        },
      );

  }
}
