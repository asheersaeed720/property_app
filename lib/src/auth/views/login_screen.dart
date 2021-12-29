import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_app/src/auth/views/forgot_password_screen.dart';
import 'package:property_app/src/auth/views/sign_up_screen.dart';
import 'package:property_app/src/home/home_screen.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/widgets/custom_textfield.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LogInScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isObscureText = true;
  // AuthService service = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: getBody(),
      floatingActionButton: Visibility(visible: !keyboardIsOpen, child: getNavigationButton()),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Image.asset('assets/images/dummy_logo.png'),
            ),
            const SizedBox(height: 68),
            CustomTextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              leadingIcon: const Icon(
                Icons.email_outlined,
                color: Colors.grey,
              ),
              hintText: "Email",
            ),
            const Divider(
              color: Colors.grey,
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: passwordController,
              leadingIcon: const Icon(
                Icons.lock_outline,
                color: Colors.grey,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                    isObscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.grey),
              ),
              obscureText: isObscureText,
              hintText: "Password",
            ),
            const Divider(
              color: Colors.grey,
              height: 10,
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(ForgotPasswordScreen.routeName);
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RoundedLoadingButton(
                    width: MediaQuery.of(context).size.width,
                    color: AppTheme.primary,
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    controller: RoundedLoadingButtonController(),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      // Get.toNamed(TabScreen.routeName);
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                        (route) => false,
                      );

                      // var res = await service.signInWithEmailPassword(
                      //     emailController.text, passwordController.text);
                      // if (res["status"] == false) {
                      //   btnController.reset();
                      //   showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return CustomDialogBox(
                      //           title: "Login",
                      //           descriptions: res["message"],
                      //         );
                      //       });
                      // } else {
                      //   btnController.success();
                      //   Navigator.of(context).pushAndRemoveUntil(
                      //       MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                      // }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getNavigationButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(SignUpScreen.routeName);
          },
          child: Container(
              width: 90,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Text(
                "Register",
                style: TextStyle(color: AppTheme.primary),
              )),
        )
      ],
    );
  }
}
