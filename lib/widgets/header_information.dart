import 'package:flutter/material.dart';
import 'package:srafi1/constant/color.dart';
import 'package:srafi1/constant/decoration.dart';
import 'package:srafi1/constant/size.dart';

Widget HeaderInformation(BuildContext context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: ConstSize.info_horizontal_padding,vertical: ConstSize.info_vertical_padding),
    decoration: DCR.info_decoration,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/bitcoin.png',width: ConstSize.logo_size,height: ConstSize.logo_size,),
        SizedBox(width: 8,),
        Text('BTC/USDT',style: Theme.of(context).textTheme.labelLarge),
        Icon(Icons.keyboard_arrow_down_outlined,color: CLR.grey_text,size: 18,),
        SizedBox(width: 40,),
        Column(
          children: [
            Text('72,120',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: ConstSize.small_text_size),),
            SizedBox(height: 4,),
            Text('+5.2',style: Theme.of(context).textTheme.displaySmall!.copyWith(color: CLR.greenbtn_color,fontWeight: FontWeight.w600),),
          ],
        ),
        SizedBox(width: 40,),
        Column(
          children: [
            Text('24h High',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: ConstSize.small_text_size),),
            SizedBox(height: 4,),
            Text('73,00',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: ConstSize.small_text_size),),
          ],
        ),
        SizedBox(width: 40,),
        Column(
          children: [
            Text('24h Volume',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: ConstSize.small_text_size),),
            SizedBox(height: 4,),
            Text('10,00',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: ConstSize.small_text_size),),
          ],
        ),

      ],
    ),
  );
}