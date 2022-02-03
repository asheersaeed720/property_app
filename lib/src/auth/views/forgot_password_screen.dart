import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/auth/auth_controller.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/utils/input_decoration.dart';
import 'package:property_app/widgets/custom_textfield.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgot-pw';

  ForgotPasswordScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _authController = Get.find<AuthController>();

  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Forgot password',
      //     style: TextStyle(
      //       fontFamily: AppTheme.fontName,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 18.0,
      //       color: AppTheme.nearBlack,
      //     ),
      //   ),
      //   elevation: 0,
      //   backgroundColor: Theme.of(context).backgroundColor,
      //   iconTheme: const IconThemeData(color: Colors.black87),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GetBuilder<AuthController>(
                builder: (_) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/forgot_pw.png', width: 182.0),
                    const SizedBox(height: 18.0),
                    Text(
                      'Password reset!',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const Text('This action will send password at your email.'),
                    const SizedBox(height: 18.0),
                    // _buildEmailTextField(context),
                    const CustomTextField(
                      // controller: emailController,
                      autoFocus: true,
                      keyboardType: TextInputType.emailAddress,
                      leadingIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      hintText: "Email",
                    ),
                    const SizedBox(height: 18.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RoundedLoadingButton(
                            width: MediaQuery.of(context).size.width,
                            color: AppTheme.primary,
                            child: const Text("Submit",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            controller: btnController,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              // registerProceed();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField(context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        autofocus: true,
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
        decoration: buildTextFieldInputDecoration(
          context,
          hintTxt: 'Email',
          preffixIcon: Icons.email,
        ),
      ),
    );
  }
}
