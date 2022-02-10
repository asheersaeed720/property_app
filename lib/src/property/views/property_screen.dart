import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:property_app/src/property/property_controller.dart';
import 'package:property_app/src/property/views/property_detail_screen.dart';
import 'package:property_app/src/property/views/property_filter_screen.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/utils/constants.dart';
import 'package:property_app/widgets/cache_img_widget.dart';
import 'package:property_app/widgets/custom_button.dart';
import 'package:property_app/widgets/loading_widget.dart';
import 'package:property_app/widgets/properties_placeholder_loading.dart';

class AllPropertyScreen extends StatefulWidget {
  static const String routeName = '/all-property';

  const AllPropertyScreen({Key? key}) : super(key: key);

  @override
  State<AllPropertyScreen> createState() => _AllPropertyScreenState();
}

class _AllPropertyScreenState extends State<AllPropertyScreen> {
  final _propertyController = Get.put(PropertyController());

  final Completer<GoogleMapController> _controller = Completer();

  bool isMapView = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PropertyController>(
      builder: (_) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: _propertyController.emptyListLoading
            ? const PropertiesListLoading()
            : isMapView
                ? Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(24.9008, 67.1681),
                          zoom: 10,
                        ),
                        markers: _propertyController.markers,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ],
                  )
                : CustomScrollView(
                    controller: _propertyController.controller,
                    slivers: [
                      SliverAppBar(
                        title: const Text(
                          'Properties',
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: AppTheme.nearBlack,
                          ),
                        ),
                        snap: true,
                        floating: true,
                        elevation: 0,
                        backgroundColor: Colors.white,
                        iconTheme: const IconThemeData(color: Colors.black87),
                        actions: [
                          isMapView
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isMapView = false;
                                        });
                                      },
                                      child: const Icon(Icons.list_alt)),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isMapView = true;
                                        });
                                      },
                                      child: const Icon(Icons.map_outlined)),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: InkWell(
                              onTap: () => Get.toNamed(PropertyFilterScreen.routeName),
                              child: Image.asset('assets/icons/filter.png', width: 28.0),
                            ),
                          ),
                        ],
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int i) {
                            return Card(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      CarouselSlider(
                                        options: CarouselOptions(
                                          autoPlay: true,
                                          autoPlayInterval: const Duration(seconds: 5),
                                          viewportFraction: 1.0,
                                          aspectRatio: 16 / 10,
                                          enableInfiniteScroll: false,
                                        ),
                                        items: _propertyController.propertiesList[i].images!.isEmpty
                                            ? [
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: const CacheImgWidget(
                                                    "assets/images/no_img_available.jpg",
                                                  ),
                                                ),
                                              ]
                                            : _propertyController.propertiesList[i].images!
                                                .map(
                                                  (e) => SizedBox(
                                                    width: MediaQuery.of(context).size.width,
                                                    child: CacheImgWidget(
                                                      "$imgURL/${e.image}",
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                      ),
                                      Positioned(
                                        top: 14.0,
                                        right: 14.0,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(52.0),
                                          ),
                                          child: const Icon(Icons.favorite_border),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _propertyController.propertiesList[i].name ?? '',
                                              style: Theme.of(context).textTheme.headline2,
                                            ),
                                            SizedBox(
                                              width: 100.0,
                                              child: Text(
                                                _propertyController.propertiesList[i].description ??
                                                    '',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              'PKR ${_propertyController.propertiesList[i].price}',
                                              style: Theme.of(context).textTheme.bodyText1,
                                            ),
                                          ],
                                        ),
                                        CustomButton(
                                          height: 42.0,
                                          btnTxt: 'View Details',
                                          iconImg: 'assets/icons/forward_arrow.png',
                                          onPressed: () => Get.toNamed(
                                            PropertyDetailScreen.routeName,
                                            arguments: {
                                              'id': _propertyController.propertiesList[i].id,
                                              'name': _propertyController.propertiesList[i].name,
                                              'description':
                                                  _propertyController.propertiesList[i].description,
                                              'typeId':
                                                  _propertyController.propertiesList[i].typeId,
                                              'locationId':
                                                  _propertyController.propertiesList[i].locationId,
                                              'price': _propertyController.propertiesList[i].price,
                                              'lat': _propertyController.propertiesList[i].lat,
                                              'long': _propertyController.propertiesList[i].long,
                                              'status':
                                                  _propertyController.propertiesList[i].status,
                                              'createdAt':
                                                  _propertyController.propertiesList[i].createdAt,
                                              'type': _propertyController.propertiesList[i].type,
                                              'location':
                                                  _propertyController.propertiesList[i].location,
                                              'images':
                                                  _propertyController.propertiesList[i].images,
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                ],
                              ),
                            );
                          },
                          childCount: _propertyController.propertiesList.length,
                        ),
                      ),
                      if (_propertyController.isLoading)
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 62.0,
                            child: LoadingWidget(),
                          ),
                        ),
                    ],
                  ),
      ),
    );
  }
}
