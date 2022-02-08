import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/complaint/views/complaint_screen.dart';
import 'package:property_app/src/event/event_screen.dart';
import 'package:property_app/src/invoice/invoice_screen.dart';
import 'package:property_app/src/map/google_map_screen.dart';
import 'package:property_app/src/property/views/property_screen.dart';
import 'package:property_app/src/upcoming_projects/views/upcoming_project_screen.dart';
import 'package:property_app/src/verify_doc/verify_doc_screen.dart';
import 'package:property_app/utils/custom_app_bar.dart';
import 'package:property_app/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: customAppBar(context, 'Softo Property'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildFindPropertyView(context),
              const SizedBox(height: 12.0),
              _buildGridView(context),
            ],
          ),
        ),
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
                onPressed: () => Get.toNamed(AllPropertyScreen.routeName),
              ),
              CustomButton(
                height: 36.0,
                btnTxt: 'Rent',
                onPressed: () => Get.toNamed(AllPropertyScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.3,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: [
          Card(
            elevation: 3.0,
            child: InkWell(
              onTap: () => Get.toNamed(AllPropertyScreen.routeName),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/property.png', width: 70.0),
                  const SizedBox(height: 12.0),
                  Text(
                    'My Properties',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 3.0,
            child: InkWell(
              onTap: () => Get.toNamed(InvoiceScreen.routeName),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/invoice.png', width: 70.0),
                  const SizedBox(height: 12.0),
                  Text(
                    'My Invoices',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          // Card(
          //   elevation: 3.0,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Image.asset('assets/icons/investment.png', width: 70.0),
          //       const SizedBox(height: 12.0),
          //       Text(
          //         'Future \nInvestment',
          //         textAlign: TextAlign.center,
          //         style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16.0),
          //       ),
          //     ],
          //   ),
          // ),
          Card(
            elevation: 3.0,
            child: InkWell(
              onTap: () => Get.toNamed(EventScreen.routeName),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/event.png', width: 70.0),
                  const SizedBox(height: 12.0),
                  Text(
                    'Property Event',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 3.0,
            child: InkWell(
              onTap: () => Get.toNamed(UpcomingProjectScreen.routeName),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/blueprint.png', width: 70.0),
                  const SizedBox(height: 12.0),
                  Text(
                    'Upcoming \nProjects',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 3.0,
            child: InkWell(
              onTap: () => Get.toNamed(ComplaintScreen.routeName),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/complain.png', width: 70.0),
                  const SizedBox(height: 12.0),
                  Text(
                    'Complaints',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          // Card(
          //   elevation: 3.0,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Image.asset('assets/icons/application.png', width: 70.0),
          //       const SizedBox(height: 12.0),
          //       Text(
          //         'Applications',
          //         style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16.0),
          //       ),
          //     ],
          //   ),
          // ),
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/how.png', width: 70.0),
                const SizedBox(height: 12.0),
                Text(
                  'How do it',
                  style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16.0),
                ),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            child: InkWell(
              onTap: () => Get.toNamed(VerifyDocScreen.routeName),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/verified.png', width: 70.0),
                  const SizedBox(height: 12.0),
                  Text(
                    'Verify Docs',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 3.0,
            child: InkWell(
              onTap: () => Get.toNamed(GoogleMapScreen.routeName),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/map.png', width: 70.0),
                  const SizedBox(height: 12.0),
                  Text(
                    'MLC on Map',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 2.0)
        ],
      ),
    );
  }
}
