import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class Playlists extends StatefulWidget {
  const Playlists({Key? key}) : super(key: key);

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {



  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final Color baseColor = Color(0xFFf5f6fa);
    final Color textColor = Color(0xFF767676);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurpleAccent,
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: baseColor,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: Text("Tracks",style: TextStyle(fontWeight: FontWeight.bold,color: textColor,fontSize: 30),),centerTitle: true, backgroundColor: baseColor,),*/


      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Container(height: height*0.075,
                width: width,
                color: Colors.deepPurpleAccent,
                //Appbar
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.menu_open,size: 40,color: Colors.white,)),
                    SizedBox(width: width*0.22,),
                    Text("musica",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(width: width*0.1,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded,size: 35,color: Colors.white,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,size: 35,color: Colors.white,)),
                  ],
                )
            ),
            //Track buttons
            SizedBox(
              height: height*0.065,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  children: [
                    SizedBox(width: width*0.04,),
                    InkWell(
                      onTap: (){Navigator.pushNamed(context, "/MusicPlayer");},
                      child: ClayContainer(
                          height: height*0.04,
                          width: width*0.25,
                          color: baseColor,
                          borderRadius: 20,
                          child:  Center(child: Text("Tracks",style: TextStyle(fontSize:22,fontWeight:FontWeight.bold,color: textColor),),)


                      ),
                    ),
                    SizedBox(width: width*0.04,),
                    ClayContainer(
                        height: height*0.04,
                        width: width*0.25,
                        color: baseColor,
                        borderRadius: 20,
                        child:  Center(child: Text("Playlist",style: TextStyle(fontSize:22,fontWeight:FontWeight.bold,color: textColor),),)


                    ),
                    SizedBox(width: width*0.04,),
                    ClayContainer(
                        height: height*0.04,
                        width: width*0.25,
                        color: baseColor,
                        borderRadius: 20,
                        child:  Center(child: Text("Artist",style: TextStyle(fontSize:22,fontWeight:FontWeight.bold,color: textColor),),)


                    ),SizedBox(width: width*0.04,),

                    ClayContainer(
                        height: height*0.04,
                        width: width*0.25,
                        color: baseColor,
                        borderRadius: 20,
                        child:  Center(child: Text("Folder",style: TextStyle(fontSize:22,fontWeight:FontWeight.bold,color: textColor),),)


                    ),

                  ],
                ),
              ),
            ),
            //Listview
            Expanded(
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
      ),
    );
  }
}

