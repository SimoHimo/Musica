import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class Tracks extends StatefulWidget {
  const Tracks({Key? key}) : super(key: key);

  @override
  State<Tracks> createState() => _TracksState();
}

class _TracksState extends State<Tracks> with TickerProviderStateMixin{

  final _tabs = [
    Tab(text: '    Track     ',),
    Tab(text: '    Artist    '),
    Tab(text: '     Album     '),
    Tab(text: '    Folder    '),
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync:this);


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final Color baseColor = Color(0xFFf5f6fa);
    final Color textColor = Color(0xFF767676);


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurpleAccent,
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    ));


    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text(
          "musica",
          style: GoogleFonts.lato(
            color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 45
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),


          TabBar(
            controller: _tabController,
            tabs: _tabs,
            unselectedLabelColor: textColor,
            labelColor: Colors.deepPurpleAccent,
            unselectedLabelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            indicator: BoxDecoration(

              boxShadow: const [

                BoxShadow(
                  color: Color(0xFFBEBEBE),
                  // Shadow for bottom right corner
                  offset: Offset(7, 7),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  // Shadow for top left corner
                  offset: Offset(-5, -5),
                  blurRadius: 5,
                  spreadRadius: 1,
                ), // White Shadow
              ],
              borderRadius: BorderRadius.circular(80.0),
              color: baseColor,
            ),
          ),


          const SizedBox(
            height: 10,
          ),



          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [


                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: height*0.01,),
                            Bounce(
                                duration: Duration(milliseconds: 110),
                                onPressed: () {
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()),);
                                  Navigator.pushNamed(context, "/MusicPlayer");
                                },
                                child: ClayContainer(
                                  borderRadius: 25,
                                  color: baseColor,
                                  height: height * 0.09,
                                  width: width * 0.95,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: width*0.015,),
                                      Container(
                                        height: height * 0.075,
                                        width: height * 0.075,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("assets/images/Albumart.jpg"),
                                                fit: BoxFit.fill
                                            ),

                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                      ),
                                      SizedBox(width: width*0.035,),
                                      Container(
                                        height: height * 0.069,
                                        width: width * 0.6,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Wish You Were Here",style:TextStyle(fontWeight: FontWeight.bold,fontSize:18,color: textColor),),
                                            Text("Pink Floyd",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: textColor),),
                                            Text("3:45",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: textColor),),
                                          ],),),
                                      IconButton(onPressed: (){}, icon:  Icon(Icons.more_vert,size: 30,))
                                    ],
                                  ),
                                )),
                            SizedBox(height: height*0.01,),

                          ],
                        );
                      }),
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: height*0.01,),
                            Bounce(
                                duration: Duration(milliseconds: 110),
                                onPressed: () {
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()),);
                                  Navigator.pushNamed(context, "/MusicPlayer");
                                },
                                child: ClayContainer(
                                  borderRadius: 25,
                                  color: baseColor,
                                  height: height * 0.09,
                                  width: width * 0.95,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: width*0.015,),
                                      Container(
                                        height: height * 0.075,
                                        width: height * 0.075,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("assets/images/Albumart.jpg"),
                                                fit: BoxFit.fill
                                            ),

                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                      ),
                                      SizedBox(width: width*0.035,),
                                      Container(
                                        height: height * 0.069,
                                        width: width * 0.6,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Wish You Were Here",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: textColor),),
                                            Text("Pink Floyd",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: textColor),),
                                            Text("3:45",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: textColor),),
                                          ],),),
                                      IconButton(onPressed: (){}, icon:  Icon(Icons.more_vert,size: 30,))
                                    ],
                                  ),
                                )),
                            SizedBox(height: height*0.01,),

                          ],
                        );
                      }),
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: height*0.01,),
                            Bounce(
                                duration: Duration(milliseconds: 110),
                                onPressed: () {
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()),);
                                  Navigator.pushNamed(context, "/MusicPlayer");
                                },
                                child: ClayContainer(
                                  borderRadius: 25,
                                  color: baseColor,
                                  height: height * 0.09,
                                  width: width * 0.95,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: width*0.015,),
                                      Container(
                                        height: height * 0.075,
                                        width: height * 0.075,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("assets/images/Albumart.jpg"),
                                                fit: BoxFit.fill
                                            ),

                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                      ),
                                      SizedBox(width: width*0.035,),
                                      Container(
                                        height: height * 0.069,
                                        width: width * 0.6,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Wish You Were Here",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: textColor),),
                                            Text("Pink Floyd",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: textColor),),
                                            Text("3:45",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: textColor),),
                                          ],),),
                                      IconButton(onPressed: (){}, icon:  Icon(Icons.more_vert,size: 30,))
                                    ],
                                  ),
                                )),
                            SizedBox(height: height*0.01,),

                          ],
                        );
                      }),
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: height*0.01,),
                            Bounce(
                                duration: Duration(milliseconds: 110),
                                onPressed: () {
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()),);
                                  Navigator.pushNamed(context, "/MusicPlayer");
                                },
                                child: ClayContainer(
                                  borderRadius: 25,
                                  color: baseColor,
                                  height: height * 0.09,
                                  width: width * 0.95,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: width*0.015,),
                                      Container(
                                        height: height * 0.075,
                                        width: height * 0.075,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("assets/images/Albumart.jpg"),
                                                fit: BoxFit.fill
                                            ),

                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                      ),
                                      SizedBox(width: width*0.035,),
                                      Container(
                                        height: height * 0.069,
                                        width: width * 0.6,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Wish You Were Here",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: textColor),),
                                            Text("Pink Floyd",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: textColor),),
                                            Text("3:45",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: textColor),),
                                          ],),),
                                      IconButton(onPressed: (){}, icon:  Icon(Icons.more_vert,size: 30,))
                                    ],
                                  ),
                                )),
                            SizedBox(height: height*0.01,),

                          ],
                        );
                      }),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
