import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/chat/chat_message_screen.dart';
import 'package:property_app/src/upcoming_projects/upcoming_project.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/utils/constants.dart';
import 'package:property_app/widgets/cache_img_widget.dart';
import 'package:property_app/widgets/custom_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class UpcomingProjectDetailScreen extends StatefulWidget {
  static const String routeName = '/upcoming-project-detail';

  const UpcomingProjectDetailScreen({Key? key}) : super(key: key);

  @override
  _UpcomingProjectDetailScreenState createState() => _UpcomingProjectDetailScreenState();
}

class _UpcomingProjectDetailScreenState extends State<UpcomingProjectDetailScreen> {
  final args = Get.arguments as Map<String, dynamic>;

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
    List<UpcomingProjectImage> _sliderImgList = (args['images'] as List<UpcomingProjectImage>);
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 8),
        viewportFraction: 1.0,
        aspectRatio: 16 / 10,
        enableInfiniteScroll: false,
      ),
      items: _sliderImgList.isEmpty
          ? [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const CacheImgWidget(
                  "assets/images/no_img_available.jpg",
                  borderRadius: 0.0,
                ),
              ),
            ]
          : _sliderImgList
              .map(
                (e) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CacheImgWidget(
                    "$imgURL/${e.image}",
                    borderRadius: 0.0,
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildFurtherDetailsView() {
    String postedDate = timeago.format(args['createdAt']);
    String description = args['description'];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Text(
            'Posted: $postedDate',
            style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12.0),
          Text(description),
        ],
      ),
    );
  }
}
