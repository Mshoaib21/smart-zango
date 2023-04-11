import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  void login(String email, String password) async{
    try{
      Response response =await post(Uri.parse('https://reqres.in/api/login'),
          body:{
          'email' :email,
          'password':password
      });
      if(response.statusCode == 200){
        var data= jsonDecode(response.body.toString());
        print(data['token']);
      print('Login  Successfully');
      }
      else{
        print('Failed');
      }

    }
    catch(e){
      print(e.toString());

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',

              )

            ),
            SizedBox(height: 20,),
            TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',

                )

            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(),passwordController.text.toString());
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                 child: Text("Login "),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
