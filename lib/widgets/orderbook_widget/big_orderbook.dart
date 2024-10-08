import 'package:flutter/material.dart';
import 'package:srafi1/constant/color.dart';
import 'package:srafi1/constant/decoration.dart';
import 'package:srafi1/constant/screen_size.dart';
import 'package:srafi1/constant/size.dart';
import 'package:srafi1/model/order_model.dart';
import 'package:srafi1/widgets/items/orderbook/orderbook_item.dart';


class BigOrderBook extends StatefulWidget {

BigOrderBook(){


}

@override
State<BigOrderBook> createState() => _BigOrderBookState();
}

class _BigOrderBookState extends State<BigOrderBook> {
  List<Widget> buy_orders =[];

  List<Widget> sell_orders =[];


  IO.Socket? socket;


  var flag = 0;
  var flag_buy = 0;

  void initilizeSocket(){


    socket = IO.io("https://api.wallex.ir",
        <String,dynamic>{

          "transports": ["websocket"],
        });



    socket?.onConnect((data) {

      print("Connected to socket.io");
      socket?.emit("subscribe",{"channel": "USDTTMN@sellDepth"});
      socket?.emit("subscribe",{"channel": "USDTTMN@buyDepth"});
    });


    socket?.on("Broadcaster", (data) {
      // print("Received data: $data");
      debugPrint("Received data: ${data[0]}");
      flag = 0;
      flag_buy = 0;

      /*
      sell data stream
       */
      if(data!=null && data[0].toString()=="USDTTMN@sellDepth"){


        sell_orders.clear();
        data[1].forEach((key,value){

          if(value!=null){

            if(flag<5){
              setState(() {
                sell_orders.add(OrderBookItem(orderModel: OrderModel.fromJson(value),));
                flag++;
              });
            }
          }
        });
      }

      /*
      buy data stream
       */
      if(data!=null && data[0].toString()=="USDTTMN@buyDepth"){


        buy_orders.clear();
        data[1].forEach((key,value){

          if(value!=null){

            if(flag_buy<5){
              setState(() {
                buy_orders.add(OrderBookItem(orderModel:
                OrderModel.fromJson(value)
                  ..isSell=false
                  ,));
                flag_buy++;
              });
            }
          }
        });
      }
    });

  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initilizeSocket();
    buy_orders.add(OrderBookItem(orderModel: OrderModel(price: "72,127",amount: "127",volume: "1,872,214",isSell: false),));
    buy_orders.add(OrderBookItem(orderModel: OrderModel(price: "72,047",amount: "32",volume: "35,488,158",isSell: false),));
    buy_orders.add(OrderBookItem(orderModel: OrderModel(price: "71,520",amount: "1,842",volume: "82,841",isSell: false),));
    buy_orders.add(OrderBookItem(orderModel: OrderModel(price: "73,852",amount: "12",volume: "14,821",isSell: false),));
    buy_orders.add(OrderBookItem(orderModel: OrderModel(price: "70,412",amount: "982",volume: "42,841",isSell: false),));
    buy_orders.add(OrderBookItem(orderModel: OrderModel(price: "69,412",amount: "825",volume: "11,646",isSell: false),));
    buy_orders.add(OrderBookItem(orderModel: OrderModel(price: "72,047",amount: "32",volume: "35,488,158",isSell: false),));


    sell_orders.add(OrderBookItem(orderModel: OrderModel(price: "72,127",amount: "127",volume: "1,872,214",isSell: true),));
    sell_orders.add(OrderBookItem(orderModel: OrderModel(price: "72,047",amount: "32",volume: "35,488,158",isSell: true),));
    sell_orders.add(OrderBookItem(orderModel: OrderModel(price: "71,520",amount: "1,842",volume: "82,841",isSell: true),));
    sell_orders.add(OrderBookItem(orderModel: OrderModel(price: "73,852",amount: "12",volume: "14,821",isSell: true),));
    sell_orders.add(OrderBookItem(orderModel: OrderModel(price: "72,432",amount: "1,842",volume: "25,774",isSell: true),));
    sell_orders.add(OrderBookItem(orderModel: OrderModel(price: "74,980",amount: "134",volume: "75,366",isSell: true),));
    sell_orders.add(OrderBookItem(orderModel: OrderModel(price: "72,047",amount: "32",volume: "35,488,158",isSell: true),));

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConstSize.market_height+ConstSize.chart_height+10,
      //height: ScreenSize.height*0.4+270,
      // width: ScreenSize.width*0.37,
      decoration: DCR.panel_decoration,
      child: Column(
        children: [
          /*
          header
           */
          Container(
            alignment: Alignment.centerLeft,
            padding: ConstSize.panel_header_padding,
            width: ScreenSize.width*0.57,
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
                    Text("Order books",style: Theme.of(context).textTheme.displayLarge!.copyWith(

                        color: CLR.gold_color
                    ),),
                    Container(height: 2,width: 50,color: CLR.gold_color,)
                  ],
                ),
                SizedBox(width: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent trades",style: Theme.of(context).textTheme.displayLarge,),
                    Container(height: 2,width: 25,color: Colors.transparent,)
                  ],
                )
              ],
            ),
          ),

          /*
          list title
           */

          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text("Price(USDT)",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white.withOpacity(0.8)),)),
                Expanded(child: Text("Amount",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white.withOpacity(0.8)),)),
                Expanded(child: Text("Volume",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white.withOpacity(0.8)),)),
              ],
            ),
          ),

          ...buy_orders,
          SizedBox(height: 15,),
          ...sell_orders


        ],
      ),
    );
  }
}