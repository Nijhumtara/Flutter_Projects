import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibridge/input.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String? error = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Asset/Images/plane1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Text(
                        "UniBridge",
                        style: GoogleFonts.lobster(
                          textStyle: TextStyle(
                            color: const Color(0xFF1D3557),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(
                                  2,
                                  2,
                                ), // x and y offset of the shadow
                                blurRadius: 4, // how soft the shadow is
                                color: const Color.fromARGB(255, 77, 76, 76).withAlpha(
                                  150,
                                ), // shadow color
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "Welcome To Study Abroad",
                        style: GoogleFonts.lobster(
                          textStyle: TextStyle(
                            color: const Color(0xFF1D3557),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(
                                  2,
                                  2,
                                ), // x and y offset of the shadow
                                blurRadius: 4, // how soft the shadow is
                                color: const Color.fromARGB(255, 77, 76, 76).withAlpha(
                                  150,
                                ), // shadow color
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D3557), // card color
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(50), // shadow color
                              blurRadius: 12, // how soft the shadow is
                              spreadRadius: 5, // how wide the shadow spreads
                              offset: Offset(0, 0), // x,y offset 0 = all around
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              // InputBox(
                              //   controller: nameController,
                              //   keyboardType: TextInputType.name,
                              //   hint: "User Name",
                              //   errorText: error,
                              //   icon: Icons.person,
                              // ),
                              // SizedBox(height: 10,),
                              InputBox(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                hint: "Email",
                                errorText: error,
                                icon: Icons.email,
                              ),
                              SizedBox(height: 10),
                              InputBox(
                                controller: passController,
                                keyboardType: TextInputType.visiblePassword,
                                hint: "Password",
                                errorText: error,
                                icon: Icons.password,
                              ),
                              SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.fromLTRB(
                                    20,
                                    15,
                                    20,
                                    15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      80,
                                      168,
                                      250,
                                    ),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Or",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Login With Google/Facebook",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 70),
                        child: Row(
                          children: [
                            Text(
                              "Don't have account?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                color: const Color(0xFFFFAFCC),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
