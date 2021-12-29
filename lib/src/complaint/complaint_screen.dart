import 'package:flutter/material.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/widgets/custom_textfield.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ComplaintScreen extends StatelessWidget {
  static const String routeName = '/complaint';

  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            const CustomTextField(
              keyboardType: TextInputType.emailAddress,
              leadingIcon: Icon(
                Icons.email_outlined,
                color: Colors.grey,
              ),
              hintText: "Email",
            ),
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
}
