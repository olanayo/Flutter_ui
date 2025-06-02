import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_app/Profile_page.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(fontFamily: 'OpenSans'),
  home: homePage(),
));
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Map<String, dynamic>>  allContent= [
    {
      'image': 'assets/images/breast.jpg',
      'profile pic': 'assets/images/beauty.jpg',
      'profile name': 'Sophie Williams',
      'comments': '250',
      'isLiked' : false,
      'likeCount': 2,
    },
    {
      'image': 'assets/images/pantgirl.jpg',
      'profile pic': 'assets/images/whiteProfile.jpg',
      'profile name': 'Maria',
      'comments': '500' ,
      'likeCount' : 200,
      'isLiked': true,

    },
    {
      'image': 'assets/images/fitness.jpg',
      'profile pic': 'assets/images/boy.jpg',
      'profile name': 'Brandon Weeks',
      'comments': '400',
      'likeCount' : 3,
      'isLiked': false,
    },
    {
      'image': 'assets/images/sweetgirl.jpg',
      'profile pic': 'assets/images/lovelygirl.jpg',
      'profile name': 'Amanda',
      'comments': '400',
      'likeCount' : 10,
      'isLiked': true,
    }
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(backgroundColor: Colors.transparent, scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> profile())
            );
          },
          child:  Padding(padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: CircleAvatar(radius: 50,
              backgroundImage: AssetImage('assets/images/smiles.jpg'),
            ),
          ),
        ),
        title: Text('MeeXplore',style: TextStyle(fontFamily: 'AlexBrush', fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 25),),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(onPressed: (){},
                  icon: Icon(Icons.notifications,size: 25,)
              ),
              Positioned(top: 12, right: 16,
                  child: Icon(Icons.circle, color: Colors.red,size: 10,))
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Expanded(
               child:  ListView.builder(
                   itemCount: allContent.length,
                   itemBuilder: (context, index){
                     final content = allContent[index];
                     return ListTile(contentPadding: EdgeInsets.zero,
                       leading: CircleAvatar(backgroundImage: AssetImage(content['profile pic']),),
                       title: Row(
                         children: [
                           Text(content['profile name'],style: TextStyle(fontWeight: FontWeight.w600),),
                           SizedBox(width: 5,),
                           Icon(Icons.verified, color: Colors.blue, size: 16,)
                         ],
                       ),
                       subtitle: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           ClipRRect(
                             child: Image.asset(content['image'], fit: BoxFit.cover, width: 500, height: 400,),
                             borderRadius: BorderRadius.circular(12),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               IconButton(onPressed: (){
                                 setState(() {
                                   content['isLiked'] =!content['isLiked'];
                                   content['likeCount'] += content['isLiked'] ? 1 : -1;
                                 });
                               },
                                   icon: Icon(content['isLiked']? Icons.favorite : Icons.favorite_border,
                                     color:  content['isLiked']? Colors.red : Colors.black
                                   )
                               ),
                               Text('${content['likeCount']}' ,style: TextStyle(fontWeight: FontWeight.bold),),
                               SizedBox(width: 3,),
                               IconButton(onPressed: () {},
                                   icon: Icon(Icons.mode_comment_outlined, size: 20,), 
                               ),
                               Text(content['comments'], style:TextStyle(fontWeight: FontWeight.bold),),
                             ],
                           )
                           
                         ],
                       ),
                     );
                   }
               )
           )
          ],
        ),
      ),
    );
  }
}
