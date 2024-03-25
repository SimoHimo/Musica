import 'package:clay_containers/clay_containers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class Playlists extends StatefulWidget {
  const Playlists({Key? key}) : super(key: key);

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  /// List of Tab Bar Item
  List<String>items =[
    "Playlist",
    "Track",
    "Folder",
    "Artist",
    "Album"
  ];


  int current = 0;

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

      /// APPBAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "musica",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w900,
            fontSize: 45
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [

            /// CUSTOM TABBAR
            SizedBox(
              width: double.infinity,
              height: height*0.06,
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,),
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/"+items[index]);

                            setState(() {
                              current = index;
                            });

                          },
                          child: ClayContainer(
                              height: height*0.04,
                              width: width*0.25,
                              color: baseColor,
                              borderRadius: 20,
                              child:  Center(child: Text(items[index],style: TextStyle(fontSize:22,fontWeight:FontWeight.bold,color: current==index? Colors.deepPurpleAccent:textColor,),),)


                          ),
                        ),
                      ],
                    );
                  }),
            ),


            /// MAIN BODY
            Container(
              child: Expanded(
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
                                          Text("Wish You Were Here",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: textColor),),
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
            ),
          ],
        ),
      ),
    );
  }
}

