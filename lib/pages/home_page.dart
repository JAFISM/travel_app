import 'package:flutter/material.dart';
import 'package:travel_app/myapp_colorss/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  
  var images={
    "balloning.png":"Balloning",
    "hiking.png":"Hiking",
    "kayaking.png":"Kayaking",
    "snorkling.png":"Snorkling"
  };
  
  
  
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover")),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: EdgeInsets.only(left:20,right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
               indicatorSize: TabBarIndicatorSize.label,
               // indicatorPadding: EdgeInsets.symmetric(vertical: 10),
                indicator: CircleTabIndicator(color: AppColors.mainColor,radius:4,paddings: 1.0),
                tabs: [Text("Places"), Text("Inspiration"), Text("Emotions")],
              ),
            ),
          ),
          //SizedBox(height: 20,),
          Container(
            height: 300,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.only(left: 20),
            child: TabBarView(
              controller: _tabController,
              children:  [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder:(_,int index){
                  return  Container(
                    width: 200,
                    height: 300,
                    margin: EdgeInsets.only(right: 15,top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      //color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(
                          "img/mountain.jpeg"
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  );},
                ),
                Text("Inspiration"),
                Text("Emotions")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore More",size: 22,),
                AppText(text: "See all",color: AppColors.textColor1,)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
              return Container(
                margin: EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                  Container(
                  width: 80,
                  height: 80,
                  //margin: EdgeInsets.only(right:50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      //color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(
                              "img/"+images.keys.elementAt(index)
                          ),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                    SizedBox(height: 5,),
                    Container(child: AppText(text: images.values.elementAt(index),color: AppColors.textColor2,),)
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  double paddings;
  CircleTabIndicator({required this.color,required this.radius,this.paddings=1.0});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color,radius:radius,paddings: paddings);
  }
}
class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  final double paddings; // add some padding between circle and text

  _CirclePainter({required this.color, required this.radius,required this.paddings});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    double centerX = configuration.size!.width / 2;
    double centerY = configuration.size!.height - radius - paddings; // adjust y position

    Offset circleOffset = Offset(centerX - radius / 2, centerY);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}