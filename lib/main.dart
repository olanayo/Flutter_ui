import 'package:flutter/material.dart';
import 'package:ui_app/first_page.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home: authentication(),
));

class authentication extends StatefulWidget {
  const authentication({super.key});

  @override
  State<authentication> createState() => _authenticationState();
}

class _authenticationState extends State<authentication> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(backgroundColor: Colors.transparent,
        title: Text('Welcome', style:TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 18),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/illustrations/login.jpg', height: 200, width: 200,),
            ),
            SizedBox(height: 20,),

            //Email Box
            Text('Email Address',style: TextStyle(fontFamily: 'Roboto', color: Colors.deepPurple, fontWeight: FontWeight.w600),),
            SizedBox(height: 5,),
            TextField(
              controller: emailController,
              decoration:InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(fontFamily:'Roboto', color: Colors.deepPurple ),
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple,width: 3))
              ) ,
            ),
            SizedBox(height: 20,),

            //Password Box
            Text('Password',style: TextStyle(fontFamily: 'Roboto', color: Colors.deepPurple, fontWeight: FontWeight.w600),),
            SizedBox(height: 5,),
            TextField(obscureText: true,
              controller: passwordController,
              decoration:InputDecoration(
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: Colors.deepPurple),
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple,)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple,width: 2)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple,width: 3))
              ) ,
            ),
            SizedBox(height: 5,),
            
            //Forget Password
            Align(
              alignment: Alignment.centerRight,
              child: Text('Forgot Password?', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple),),
            ),
            SizedBox(height: 30,),

            //Login Button
            ElevatedButton(onPressed: (){
              String email = emailController.text;
              String password = passwordController.text;

              if (email.isEmpty || password.isEmpty || email !='admin@gmail.com' || password !='12345'){
                 ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid details', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),), backgroundColor: Color(0xFFFFFFFF),)
                );
              }else {
                showDialog(context: context,
                    builder: (context)=> Center(
                      child: CircularProgressIndicator(color: Colors.deepPurple,),
                    )
                );
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> mainPage())
                  );
                });
              }
            },
                child: Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                minimumSize: Size(double.infinity, 50),backgroundColor: Colors.deepPurple
              ),
            ),
            SizedBox(height: 15,),

            //Don't have an account
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF898989)),),
                  SizedBox(width: 5,),
                  Text('Register Now', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
