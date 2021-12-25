import 'package:flutter/material.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/widgets/custom_dialog.dart';
import 'package:property_app/widgets/custom_textfield.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign-up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hidedPwd = true;
  bool hidenConPwd = true;
  // AuthService service = AuthService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confrimPasswordController = TextEditingController();
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: getBody(context),
      floatingActionButton: Visibility(visible: !keyboardIsOpen, child: getNavigationButton()),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  getBody(context) {
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
              child: Image.asset('assets/images/register.png', width: 182.0),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
              controller: nameController,
              leadingIcon: const Icon(
                Icons.person_outline,
                color: Colors.grey,
              ),
              hintText: "Name",
            ),
            const Divider(
              color: Colors.grey,
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
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
                    hidedPwd = !hidedPwd;
                  });
                },
                child: Icon(hidedPwd ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.grey),
              ),
              obscureText: hidedPwd,
              hintText: "Password",
            ),
            const Divider(
              color: Colors.grey,
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: confrimPasswordController,
              leadingIcon: const Icon(
                Icons.lock_outline,
                color: Colors.grey,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    hidenConPwd = !hidenConPwd;
                  });
                },
                child: Icon(hidenConPwd ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.grey),
              ),
              obscureText: hidenConPwd,
              hintText: "Confirm Password",
            ),
            const Divider(
              color: Colors.grey,
              height: 10,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RoundedLoadingButton(
                    width: MediaQuery.of(context).size.width,
                    color: AppTheme.primary,
                    child: const Text("Register",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    controller: btnController,
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      registerProceed();
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
              width: 80,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
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
                "Login",
                style: TextStyle(color: AppTheme.primary),
              )),
        )
      ],
    );
  }

  registerProceed() async {
    if (passwordController.text != confrimPasswordController.text) {
      btnController.reset();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CustomDialogBox(
              descriptions: "Password and Confirm Password are not matched.",
            );
          });
      return;
    }

    // var res = await service.registerWithEmailPassword(nameController.text, emailController.text, passwordController.text);
    // if(res["status"] == false){
    //   btnController.reset();
    //   print("Failed");
    //   showDialog(context: context,
    //       builder: (BuildContext context){
    //       return
    //         CustomDialogBox(
    //           title: "Register",
    //           descriptions: res["message"],
    //         );
    //       }
    //     );
    // }else{
    //   btnController.success();
    //   print("Success");
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => HomePage())
    //       ,(route) => false);
    // }
  }
}
