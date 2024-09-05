import 'package:flutter/material.dart';
import 'package:srafi1/constant/color.dart';
import 'package:srafi1/constant/screen_size.dart';
import 'package:srafi1/widgets/chart_widget/big_chart.dart';
import 'package:srafi1/widgets/header_information.dart';
import 'package:srafi1/widgets/header_menu.dart';
import 'package:srafi1/widgets/market_widget/big_market.dart';
import 'package:srafi1/widgets/orderbook_widget/big_orderbook.dart';


class BigHomePage extends StatefulWidget {
  const BigHomePage({super.key});

  @override
  State<BigHomePage> createState() => _BigHomePageState();
}

class _BigHomePageState extends State<BigHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CLR.screen_bg,
      body: Column(
        children: [
          HeaderMenu(),
          Expanded(child: Container(
            padding: EdgeInsets.symmetric(vertical: ScreenSize.height*0.01,horizontal: ScreenSize.width*0.02),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderInformation(context),
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          BigChart(),
                          SizedBox(
                            height: 10,
                          ),
                          BigMarket(),
                          SizedBox(height: ScreenSize.width*0.01,),
                          Expanded(child: BigOrderBook()),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
