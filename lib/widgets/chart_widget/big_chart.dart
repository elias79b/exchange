import 'package:flutter/material.dart';
import 'package:srafi1/constant/color.dart';
import 'package:srafi1/constant/decoration.dart';
import 'package:srafi1/constant/screen_size.dart';
import 'package:srafi1/constant/size.dart';


class BigChart extends StatelessWidget {



  var _data = '''
  <!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container" style="height:100%;width:100%">
  <div class="tradingview-widget-container__widget" style="height:calc(100% - 32px);width:100%"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-advanced-chart.js" async>
  {
  "autosize": true,
  "symbol": "BINANCE:BTCUSDT",
  "interval": "D",
  "timezone": "Etc/UTC",
  "theme": "dark",
  "style": "1",
  "locale": "en",
  "enable_publishing": false,
  "hide_side_toolbar": false,
  "save_image": false,
  "calendar": false,
  "support_host": "https://www.tradingview.com"
}
  </script>
</div>
<!-- TradingView Widget END -->
  ''';

  @override
  Widget build(BuildContext context) {
    //  print("Height: ${ScreenSize.height*0.4}");
    return Container(
      height: ConstSize.chart_height,
      // height: ScreenSize.height*0.4,
      width: ScreenSize.width*0.6,
      decoration: DCR.panel_decoration,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: ConstSize.panel_header_padding,
            width: ScreenSize.width*0.6,
            decoration: DCR.panel_header_decoration,
            height: 35,
            child: Row(
              children: [
                /*
                price
                 */
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price",style: Theme.of(context).textTheme.displayLarge!.copyWith(

                        color: CLR.gold_color
                    ),),
                    Container(height: 2,width: 25,color: CLR.gold_color,)
                  ],
                ),
                SizedBox(width: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Depth",style: Theme.of(context).textTheme.displayLarge,),
                    Container(height: 2,width: 25,color: Colors.transparent,)
                  ],
                )
              ],
            ),
          ),
          // Expanded(child: InAppWebView(
          //   onWebViewCreated: (controller) {
          //
          //     controller.loadData(data: _data);
          //   },
          // ))

        ],
      ),
    );
  }
}
