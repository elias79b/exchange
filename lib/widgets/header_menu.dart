import 'package:flutter/material.dart';
import 'package:srafi1/constant/color.dart';
import 'package:srafi1/constant/screen_size.dart';
import 'package:srafi1/constant/size.dart';



class HeaderMenu extends StatelessWidget {
  const HeaderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.width,
      padding: EdgeInsets.symmetric(
        vertical: ScreenSize.height*0.02,
        horizontal: ScreenSize.width*0.02,
      ),
      color: CLR.secondary_black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset("assets/superman.png",
              width: ConstSize.logo_size,
              height: ConstSize.logo_size,),
          )),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text("Market",style: Theme.of(context).textTheme.displayMedium,),
            Text("Market",style: Theme.of(context).textTheme.displayMedium,),
            Text("Market",style: Theme.of(context).textTheme.displayMedium,),
          ],)),
          Expanded(child: Container(
            // width: ConstSize.register_btn_width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: ConstSize.btn_vertical_padding,horizontal: ConstSize.btn_horizontal_padding),
                  decoration: BoxDecoration(
                      color: CLR.header_black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: CLR.btn_border_black,

                      )
                  ),
                  child: Text("Register",style: Theme.of(context).textTheme.displayMedium,),
                ),
              ],
            )
          ))
        ],
      ),
    );
  }
}

