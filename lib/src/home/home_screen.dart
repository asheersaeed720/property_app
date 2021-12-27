import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/property/property_screen.dart';
import 'package:property_app/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          _buildFindPropertyView(context),
          const SizedBox(height: 12.0),
          _buildGridView(context),
        ],
      ),
    );
  }

  Widget _buildFindPropertyView(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        leading: Image.asset('assets/icons/search.png'),
        title: Text('Find Property', style: Theme.of(context).textTheme.headline2),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Wrap(
            spacing: 16.0,
            children: [
              CustomButton(
                height: 36.0,
                btnTxt: 'Buy',
                onPressed: () => Get.toNamed(PropertyScreen.routeName),
              ),
              CustomButton(
                height: 36.0,
                btnTxt: 'Rent',
                onPressed: () => Get.toNamed(PropertyScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: [
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/property.png', width: 80.0),
                const SizedBox(height: 12.0),
                Text('Properties', style: Theme.of(context).textTheme.headline2),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/investment.png', width: 80.0),
                const SizedBox(height: 12.0),
                Text('Future Investment',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 17.0)),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/event.png', width: 80.0),
                const SizedBox(height: 12.0),
                Text('Property Event', style: Theme.of(context).textTheme.headline2),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/news.png', width: 80.0),
                const SizedBox(height: 12.0),
                Text('Upcoming Projects',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 17.0)),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/complain.png', width: 80.0),
                const SizedBox(height: 12.0),
                Text('Complaints',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 17.0)),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/application.png', width: 80.0),
                const SizedBox(height: 12.0),
                Text('Applications',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 17.0)),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/how.png', width: 80.0),
                const SizedBox(height: 12.0),
                Text('How do it',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 17.0)),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/verified.png', width: 80.0),
                const SizedBox(height: 12.0),
                Text('Verify Docs',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 17.0)),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/map.png', width: 80.0),
                const SizedBox(height: 12.0),
                Text('MLC on Map',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 17.0)),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/setting.png', width: 80.0),
                const SizedBox(height: 12.0),
                Text('Setting',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 17.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
