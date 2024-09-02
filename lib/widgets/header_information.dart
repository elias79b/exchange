import 'package:flutter/material.dart';
import 'package:srafi1/constant/color.dart';
import 'package:srafi1/constant/size.dart';

Widget HeaderInformation(BuildContext context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: ConstSize.info_horizontal_padding,vertical: ConstSize.info_vertical_padding),
    decoration: BoxDecoration(
      color: CLR.header_black,
      borderRadius: BorderRadius.all(Radius.circular(ConstSize.card_radius))
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/bitcoin.png',width: ConstSize.logo_size,height: ConstSize.logo_size,),
        SizedBox(width: 5,),
        Text('BTC/USDT',style: Theme.of(context).textTheme.labelLarge),
        Icon(Icons.keyboard_arrow_down_outlined,color: CLR.grey_text,size: 18,)
      ],
    ),
  );
}