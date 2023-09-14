import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'button.dart';

class Sharedpreference1 extends StatefulWidget {
  const Sharedpreference1({super.key});

  @override
  State<Sharedpreference1> createState() => _Sharedpreference1State();
}

class _Sharedpreference1State extends State<Sharedpreference1> {
  final formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  Future<void>Sharedpreference1()async{
    final num1 = await SharedPreferences.getInstance();
    num1.setString('username', name.text);
    num1.setString('email', email.text);
    num1.setString('password', password.text);

    getfunction();
    getfunction1();
    getfunction2();

  }
  Future<void>getfunction() async {
    final datastore = await SharedPreferences.getInstance();
    var name = datastore.getString('username');
    print(name);
  }
  Future<void>getfunction1() async {
    final datastore = await SharedPreferences.getInstance();
    var email = datastore.getString('email');
    print(email);
  }
  Future<void>getfunction2() async {
    final datastore = await SharedPreferences.getInstance();
    var password = datastore.getString('password');
    print(password);
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:formkey ,
        child: Column(
          children: [
            Text("Login",style: TextStyle(color: Colors.black,fontSize:30),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if(value==null||value.isEmpty){
                    return 'Please enter the username';
                  }
                  return null;
                },
                controller: name,
                decoration: InputDecoration(border: OutlineInputBorder(),
                    labelText: ("Username")),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "The field is required";
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid password ';
                  }
                  return null;
                },
                controller: email,
                decoration: InputDecoration(border: OutlineInputBorder(),
                    labelText: ("Email")),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator:  (value) {
                  RegExp regex =
                  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                if (value==null) {
                      return 'Please enter password';
                    } else {
                     if (!regex.hasMatch(value)) {
                    return 'Enter valid password';
                     } else {
                     return null;
                       }}},

                controller: password,
                decoration: InputDecoration(border: OutlineInputBorder(),
                    labelText: ("Password")),
              ),
            ),

            ElevatedButton(onPressed: () async{
              Sharedpreference1();
              Fluttertoast.showToast(msg: "Sucess");
              if(formkey.currentState!.validate()){
                Navigator.push(context,MaterialPageRoute(builder: (context) {
                  return Spnew();
                },
                ));
              }

            },
                child: Text("login"))

          ],
        ),

      ),
    );
  }
}