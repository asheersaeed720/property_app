import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:property_app/src/auth/views/login_signup_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = '/on-boarding';

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'A reader lives a thousand lives',
              body: 'The man who never reads lives only one.',
              image: buildImage('assets/images/ebook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Featured Books',
              body: 'Available right at your fingerprints',
              image: buildImage('assets/images/readingbook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Simple UI',
              body: 'For enhanced reading experience',
              image: buildImage('assets/images/manthumbs.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Today a reader, tomorrow a leader',
              body: 'Start your journey',
              footer: _buildBtnView(
                context,
                text: 'Start Reading',
                onClicked: () {
                  Get.toNamed(LogInSignUpScreen.routeName);
                },
              ),
              image: buildImage('assets/images/learn.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () {
            Get.toNamed(LogInSignUpScreen.routeName);
          },
          showSkipButton: true,
          skip: Text('Skip'),
          onSkip: () {
            Get.toNamed(LogInSignUpScreen.routeName);
          },
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  // void goToHome(context) => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (_) => HomePage()),
  //     );

  Widget buildImage(String path) => Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );

  Widget _buildBtnView(BuildContext context, {text, onClicked}) {
    // ignore: deprecated_member_use
    return RaisedButton(
      onPressed: onClicked,
      color: Theme.of(context).primaryColor,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
