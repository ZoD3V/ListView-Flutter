// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tugas_5/pages/dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool? _obsecuretxt;
  TextEditingController? _userController;
  TextEditingController? _passController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _obsecuretxt = true;
    _userController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
        color: Color(0xFFFFFFFF),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('/images/join.png'),
                      height: 200,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'LOGIN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) =>
                      value != null && !EmailValidator.validate(value)
                          ? "Enter valid email"
                          : null, //form valid return null
                  controller: _userController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIconColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 207, 136),
                      prefixIcon: Icon(
                        Icons.people_alt_rounded,
                        size: 20,
                      ),
                      hintText: "Username",
                      hintStyle: TextStyle(fontSize: 15),
                      iconColor: Colors.black),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value != null && value.length < 7) {
                      return "Enter min 7 character";
                    } else {
                      return null; //return valid
                    }
                  },
                  controller: _passController,
                  obscureText: _obsecuretxt!,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIconColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 207, 136),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20,
                      ),
                      suffixIcon: InkWell(
                        child: Icon((_obsecuretxt == false)
                            ? Icons.remove_red_eye
                            : Icons.visibility_off),
                        onTap: () {
                          if (_obsecuretxt == false) {
                            _obsecuretxt = true;
                          } else {
                            _obsecuretxt = false;
                          }
                          setState(() {});
                        },
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(fontSize: 15),
                      iconColor: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      splashColor: Colors.white,
                      color: Colors.orange,
                      child: Text("LOGIN",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      onPressed: () {
                        // _formKey.currentState!.validate();
                        final isValidForm = true;
                        if (isValidForm) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()),
                          );
                        } else {
                          final snackBar = SnackBar(
                            content: Text('Silahkan isi data terlebih dahulu'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
