import 'package:flutter/material.dart';
import 'package:travel_app/myapp_colorss/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images=[
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_,index){
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "img/"+images[index],
              ),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            margin: EdgeInsets.only(top: 150,left: 30,right: 30),
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   AppLargeText(text: "Trips"),
                    AppText(text: "Mountain",size: 30,),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: AppText(text:"Mountain hikes give you an incredible sense of freedom along with endurance test",
                      color: AppColors.textColor2,
                        size: 14,
                      ),
                    ),
                    SizedBox(height: 40,),
                    ResponsiveButton(width: 120,)
                  ],
                ),
                Column(
                  children:
                    List.generate(3, (indexDots){
                      return Container(
                        margin: EdgeInsets.only(bottom: 8),
                        width: 8,
                        height: index==indexDots? 25:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:index==indexDots? AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                        ),
                      );
                    }),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
