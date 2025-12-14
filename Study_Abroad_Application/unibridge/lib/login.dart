import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibridge/input.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State {
  //Necessary Variables
  bool isSignup = false;
  bool showPassword = false;
  bool showNewPassword = false;
  bool showConfirmPassword = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
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
                image: AssetImage("Asset/Images/plane.jpg"),
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
                                color: const Color.fromARGB(
                                  255,
                                  77,
                                  76,
                                  76,
                                ).withAlpha(150), // shadow color
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
                                color: const Color.fromARGB(
                                  255,
                                  77,
                                  76,
                                  76,
                                ).withAlpha(150), // shadow color
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
                    //Register and Login Form Section
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
                              if (isSignup)
                                InputBox(
                                  controller: userNameController,
                                  keyboardType: TextInputType.name,
                                  hint: "User Name",
                                  errorText: error,
                                  icon: Icons.person,
                                ),
                              if (isSignup) SizedBox(height: 10),

                              InputBox(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                hint: "Email",
                                errorText: error,
                                icon: Icons.email,
                              ),
                              SizedBox(height: 10),
                              if (!isSignup)
                                InputBox(
                                  controller: passController,
                                  keyboardType: TextInputType.visiblePassword,
                                  hint: "Password",
                                  errorText: error,
                                  icon: Icons.lock,
                                  isPassword: true,
                                  isVisible: showPassword,
                                  onToggle: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                ),
                              if (!isSignup) SizedBox(height: 30),
                              if (isSignup)
                                InputBox(
                                  controller: newPassController,
                                  keyboardType: TextInputType.visiblePassword,
                                  hint: "New Password",
                                  errorText: error,
                                  icon: Icons.lock,
                                  isPassword: true,
                                  isVisible: showNewPassword,
                                  onToggle: () {
                                    setState(() {
                                      showNewPassword = !showNewPassword;
                                    });
                                  },
                                ),
                              SizedBox(height: 10),
                              if (isSignup)
                                InputBox(
                                  controller: confirmPassController,
                                  keyboardType: TextInputType.visiblePassword,
                                  hint: "Confirm Password",
                                  errorText: error,
                                  icon: Icons.lock,
                                  isPassword: true,
                                  isVisible: showConfirmPassword,
                                  onToggle: () {
                                    setState(() {
                                      showConfirmPassword =
                                          !showConfirmPassword;
                                    });
                                  },
                                ),
                              if (isSignup) SizedBox(height: 30),
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
                                  isSignup ? "Create Account" : "Login",
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
                              if (!isSignup) SizedBox(height: 30),
                              if (!isSignup)
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: const Color(0xFFFFAFCC),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (!isSignup) SizedBox(height: 10),
                              if (!isSignup)
                                Text(
                                  "Or",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (!isSignup) SizedBox(height: 10),
                              if (!isSignup)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Login With",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 15,),
                                    GestureDetector(
                                      onTap: () {
                                        // Google login logic later
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: Icon(
                                          FontAwesomeIcons.google,
                                          color: Color(0xFF1877F2),
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Or",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    GestureDetector(
                                      onTap: () {
                                        // Facebook login logic later
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: Icon(
                                          FontAwesomeIcons.facebookF,
                                          color: Color(0xFF1877F2),
                                          size: 15,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 70),
                        child: Row(
                          children: [
                            Text(
                              isSignup
                                  ? "Already have an account?"
                                  : "Don't have an account?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isSignup = !isSignup;
                                });
                              },
                              child: Text(
                                isSignup ? "Login" : "Sign Up",
                                style: TextStyle(
                                  color: const Color(0xFFFFAFCC),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
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
