
import 'package:flutter/material.dart';

import 'TextFieldCustom.dart';

class SignIn extends StatefulWidget {
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  TextEditingController _emailIdController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool indicator = false;
  bool failed = false;
  bool passwordVisible = false;

  static const Color textFieldbgColor = const Color(0xFFF9F9F9);

  static const Color dateIconColor = const Color(0xFFAAAAAA);
  static const Color textFieldhintColor = const Color(0xFF6A6A6A);
  static const Color mainColor = const Color(0xFF00249F);
  static const Color secondColor = const Color(0xFF4197ED);

  static const Color signIntxtColor = const Color(0xFF5F5F5F);
  static const Color forgotPwdtxtColor = const Color(0xFF909090);
  static const Color signuptxtColor = const Color(0xFF0228A2);
  static const Color titleColor = const Color(0xFF000000);


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    AssetImage assetsImage =  AssetImage(
        'assets/images/logo.png'); //<- Creates an object that fetches an image.

    var image = new Image(
        image: assetsImage,
        fit: BoxFit.fill,
        width: 122,
        height: 122); //<- Creates a widget that displays an image.

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              //decoration: new BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height / 9,
                    left: MediaQuery
                        .of(context)
                        .size
                        .width / 4,
                    right: MediaQuery
                        .of(context)
                        .size
                        .width / 4,
                    child: image,
                  ),
                  Positioned(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    top: MediaQuery
                        .of(context)
                        .size
                        .height / 3.4,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery
                            .of(context)
                            .size
                            .width / 9,
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 24,
                            color: titleColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    top: MediaQuery
                        .of(context)
                        .size
                        .height / 2.7,
                    child: Column(
                      children: [
                        Container(
                            child: TextFieldCus(
                              text: "",
                              hintText: 'Email',
                              editingController: _emailIdController,
                            )),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.8,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.09,
                            decoration: BoxDecoration(
                              color: textFieldbgColor,
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 5.0),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: !passwordVisible,
                                //This will obscure text dynamically
                                decoration: InputDecoration(
                                  // Here is key idea
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: dateIconColor,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),

                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: textFieldhintColor,
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 16.0,
                        ),
                        Visibility(
                          visible: failed,
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.8,

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text("Invalid credentials",
                                  style: TextStyle(
                                      color: Colors.red
                                  ),),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !indicator,
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.8,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.08,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  15.0) //                 <--- border radius here
                              ),
                              gradient: new LinearGradient(
                                begin: Alignment(-1.0, 0.0),
                                end: Alignment(1.0, 0.0),

                                //stops: [-0.0 , 1.0],
                                colors: [
                                  secondColor,
                                  mainColor
                                ],
                              ),
                            ),
                            child: FlatButton(
                              child: new Text(
                                'Sign In',
                                style: TextStyle(
                                  fontFamily: "Brandon",
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () {

                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Visibility(visible: indicator,
                            child: CircularProgressIndicator()),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.8,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.08,
                          child: Column(
                            children: [
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: forgotPwdtxtColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    bottom: 0.0,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 14,
                                color: signIntxtColor,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            " Sign Up",
                            style: TextStyle(
                                fontSize: 14,
                                color: signuptxtColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ) //<- place where the image appears
    );

  }
}
