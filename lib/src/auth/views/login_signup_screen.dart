import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/auth/auth_controller.dart';
import 'package:property_app/src/auth/views/forgot_password_screen.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/utils/input_decoration.dart';
import 'package:property_app/widgets/loading_widget.dart';

class LogInSignUpScreen extends StatefulWidget {
  static const String routeName = '/login-signup';

  const LogInSignUpScreen({Key? key}) : super(key: key);

  @override
  _LogInSignUpScreenState createState() => _LogInSignUpScreenState();
}

class _LogInSignUpScreenState extends State<LogInSignUpScreen> {
  final AuthController _authController = Get.find<AuthController>();

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> _signUpKeyLogin = GlobalKey<FormState>();

  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/login_background.jpg"), fit: BoxFit.fill)),
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                color: const Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: !isSignupScreen ? "Welcome" : "Welcome to",
                          style: TextStyle(
                            fontSize: 22.0,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? " Softo Property," : " Back,",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen ? "Sign Up to Continue" : "Sign In to Continue",
                      style: const TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            // curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              // curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3), blurRadius: 15, spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? AppTheme.activeColor
                                        : AppTheme.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? AppTheme.activeColor
                                        : AppTheme.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),

          buildBottomHalfContainer(false),
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Form(
        key: _formKeyLogin,
        child: Column(
          children: [
            _buildEmailTextField(),
            const SizedBox(height: 12.0),
            _buildPasswordTextField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isRememberMe,
                      activeColor: AppTheme.textColor2,
                      onChanged: (value) {
                        setState(() {
                          isRememberMe = !isRememberMe;
                        });
                      },
                    ),
                    const Text("Remember me",
                        style: TextStyle(fontSize: 12, color: AppTheme.textColor1))
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(ForgotPasswordScreen.routeName);
                  },
                  child: const Text("Forgot Password?",
                      style: TextStyle(fontSize: 12, color: AppTheme.textColor1)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Form(
        key: _signUpKeyLogin,
        child: Column(
          children: [
            _buildNameTextField(),
            const SizedBox(height: 12.0),
            _buildEmailTextField(),
            const SizedBox(height: 12.0),
            _buildPasswordTextField(),
            Container(
              width: 200,
              margin: const EdgeInsets.only(top: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: "By pressing 'Submit' you agree to our ",
                    style: TextStyle(color: AppTheme.textColor2),
                    children: [
                      TextSpan(
                        //recognizer: ,
                        text: "term & conditions",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      // curve: Curves.bounceInOut,
      top: isSignupScreen ? 535 : 430,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? GetBuilder<AuthController>(
                  builder: (_) => _authController.isLoading
                      ? const LoadingWidget()
                      : Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.orange.shade300,
                                Colors.red.shade400,
                              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0, 1))
                              ]),
                          child: InkWell(
                            onTap: () async {
                              if (isSignupScreen) {
                                if (_signUpKeyLogin.currentState!.validate()) {
                                  _signUpKeyLogin.currentState!.save();
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  _authController.isLoading = true;
                                  await _authController.handleSignUp().catchError((_) {
                                    _authController.isLoading = false;
                                    _authController.update();
                                  });
                                  _authController.isLoading = false;
                                  _authController.update();
                                }
                              } else {
                                if (_formKeyLogin.currentState!.validate()) {
                                  _formKeyLogin.currentState!.save();
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  _authController.isLoading = true;
                                  await _authController.handleLogIn().catchError((_) {
                                    _authController.isLoading = false;
                                    _authController.update();
                                  });
                                  _authController.isLoading = false;
                                  _authController.update();
                                }
                              }
                            },
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                )
              : const Center(),
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return TextFormField(
      autofocus: true,
      onChanged: (value) {
        _authController.userFormModel.name = value.replaceAll(RegExp(r"\s+\b|\b\s"), " ").trim();
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required';
        }
      },
      keyboardType: TextInputType.text,
      decoration: buildTextFieldInputDecoration(context,
          preffixIcon: Icons.person_outline_outlined, hintTxt: 'Name'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      onChanged: (value) {
        _authController.userFormModel.email = value;
      },
      validator: (value) {
        bool isValidEmail =
            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch('$value');
        if (value!.isEmpty) {
          return 'Required';
        } else if (!isValidEmail) {
          return 'Invalid Email';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: buildTextFieldInputDecoration(context,
          preffixIcon: Icons.email_outlined, hintTxt: 'Email'),
    );
  }

  Widget _buildPasswordTextField() {
    return GetBuilder<AuthController>(
      builder: (_) => TextFormField(
        onChanged: (value) {
          _authController.userFormModel.password = value;
        },
        obscureText: _authController.obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Required';
          } else if (_authController.userFormModel.password.length < 6) {
            return 'Too short';
          }
          return null;
        },
        keyboardType: TextInputType.visiblePassword,
        decoration: buildPasswordInputDecoration(
          context,
          suffixIcon: GestureDetector(
            onTap: () {
              _authController.obscureText = !_authController.obscureText;
            },
            child: Icon(
              _authController.obscureText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          hintTxt: 'Password',
          preffixIcon: Icons.lock_open_outlined,
        ),
      ),
    );
  }
}
