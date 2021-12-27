import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/chat/chat_message_screen.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/widgets/custom_button.dart';

class PropertyDetailScreen extends StatefulWidget {
  static const String routeName = '/property-detail';

  const PropertyDetailScreen({Key? key}) : super(key: key);

  @override
  _PropertyDetailScreenState createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Property Details',
          style: TextStyle(
            fontFamily: AppTheme.fontName,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: AppTheme.nearBlack,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 18.0), child: Icon(Icons.share)),
          Padding(padding: EdgeInsets.only(right: 18.0), child: Icon(Icons.favorite_border)),
        ],
      ),
      body: ListView(
        children: [
          buildSliderView(),
          const SizedBox(height: 12.0),
          _buildFurtherDetailsView(),
          const SizedBox(height: 12.0),
          Image.asset('assets/images/divider.jpg'),
          const SizedBox(height: 22.0),
          _buildLocationOnMap(),
          const SizedBox(height: 18.0),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              width: MediaQuery.of(context).size.width / 2.2,
              btnTxt: 'Call',
              onPressed: () {},
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width / 2.2,
              btnTxt: 'Chat',
              onPressed: () {
                Get.toNamed(ChatMsgScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSliderView() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 8),
        viewportFraction: 1.0,
        aspectRatio: 16 / 10,
        enableInfiniteScroll: false,
      ),
      items: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/no_img_available.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/no_img_available.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/no_img_available.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildFurtherDetailsView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              const Text('PKR ', style: TextStyle(fontSize: 13.0)),
              Text(
                '65 Lac',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Text(
            '125 Sqyd Residential Plot for Sale',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 12.0),
          const Text('125 Sqyd Residential Plot for Sale'),
          const SizedBox(height: 12.0),
          Text(
            'About Property',
            style: Theme.of(context).textTheme.headline1,
          ),
          const Text(
            'Posted: Dec 24, 2021',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12.0),
          const Text(
            "Lorem ipsum  is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
          ),
        ],
      ),
    );
  }

  Widget _buildLocationOnMap() {
    return Image.asset('assets/images/map.png');
  }
}
