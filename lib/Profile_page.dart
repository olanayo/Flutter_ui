import 'package:flutter/material.dart';
import 'package:ui_app/main.dart';

void main() => runApp(MaterialApp(
  home: profile(),
  theme: ThemeData(fontFamily: 'Inter'),
));
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(backgroundColor: Color(0xFFFFFFFF),
        leading: BackButton(
        ),
        title: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.center,
              child: Column(
                children: [
                 Container(
                   decoration: BoxDecoration(shape: BoxShape.circle,
                     boxShadow: [
                       BoxShadow(color: Colors.deepPurple, blurRadius: 1)
                     ]
                   ),
                   child:Padding(padding: EdgeInsets.all (5),
                     child:CircleAvatar(
                       backgroundImage: AssetImage('assets/images/smiles.jpg'),
                       radius: 70,
                     ) ,
                   )
                  ),
                  SizedBox(height: 25,),
                  Text('Amanda Cochran', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), SizedBox(height: 10,),
                  Text('online',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17, color: Color(0xFF898989)),),
                ],
              )
            ),
            SizedBox(height: 30,),
            ListTile(contentPadding: EdgeInsets.zero ,
              leading: CircleAvatar(
                child: Icon(Icons.person_add_alt_1_sharp, color: Colors.white,),
                backgroundColor: Colors.deepPurple,
              ),
              title: Text('Edit Profile', style:TextStyle(fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16,),
            ),

            //Notifications
            SizedBox(height: 14,),
            ListTile(contentPadding: EdgeInsets.zero ,
              leading: CircleAvatar(
                child: Icon(Icons.notifications_none_outlined, color: Colors.white,),
                backgroundColor: Colors.deepPurple,
              ),
              title: Text('Notifications', style:TextStyle(fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16,),
            ),

            //Location
            SizedBox(height: 14,),
            ListTile(contentPadding: EdgeInsets.zero ,
              leading: CircleAvatar(
                child: Icon(Icons.location_on_outlined, color: Colors.white,),
                backgroundColor: Colors.deepPurple,
              ),
              title: Text('Edit Location', style:TextStyle(fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16,),
            ),

            //Password
            SizedBox(height: 14,),
            ListTile(contentPadding: EdgeInsets.zero ,
              leading: CircleAvatar(
                child: Icon(Icons.lock_outline_rounded, color: Colors.white,),
                backgroundColor: Colors.deepPurple,
              ),
              title: Text('Change Password', style:TextStyle(fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16,),
            ),

            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              showDialog(context: context,
                  builder: (context)=> Center(child: CircularProgressIndicator(),)
              );
              Future.delayed(Duration(seconds: 1),(){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> authentication()
                    )
                );
              });

            },
                child: Text('Logout',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(double.infinity, 50) ,
                  backgroundColor: Colors.deepPurple
                ),
            )
          ],
        ),
      ),
    );
  }
}
