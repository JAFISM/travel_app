import 'package:flutter/material.dart';
import 'package:travel_app/myapp_colorss/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 70, left: 20),
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
            height: 30,
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
                indicator: CircleTabIndicator(color: AppColors.mainColor,radius: 4),
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
                    margin: EdgeInsets.only(right: 10,top: 10),
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
        ],
      ),
    );
  }
}
class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color,required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color,radius:radius);
  }
}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color,required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color=color;
    paint.isAntiAlias=true;
     Offset circleOffset=Offset(
         configuration.size!.width/2 -radius/2,
         configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, paint);
  }
}
