import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_app/src/event/event.dart';
import 'package:property_app/src/event/event_controller.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/utils/constants.dart';
import 'package:property_app/widgets/cache_img_widget.dart';
import 'package:property_app/widgets/loading_widget.dart';

class EventScreen extends StatelessWidget {
  static const String routeName = '/event';

  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Upcoming Events',
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
      ),
      body: GetBuilder<EventController>(
        init: EventController(),
        builder: (eventController) => FutureBuilder<List<EventModel>>(
          future: eventController.getAllEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<EventModel> eventList = snapshot.data ?? [];
              return ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: eventList.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CacheImgWidget(
                                '$imgURL/${eventList[i].image}',
                                width: MediaQuery.of(context).size.height / 6.0,
                                height: MediaQuery.of(context).size.height / 6.0,
                              ),
                              Positioned(
                                top: 8.0,
                                right: 8.0,
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(4.0, 6.0, 4.0, 4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                    size: 22.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 14.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  eventList[i].name ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                    color: AppTheme.nearBlack,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                'Date: ${DateFormat.yMMMd().format(DateTime.parse('${eventList[i].date}'))}',
                              ),
                              const SizedBox(height: 8.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  eventList[i].description ?? '',
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     RatingBar.builder(
                              //       initialRating: 0.0,
                              //       itemSize: 18.0,
                              //       minRating: 1,
                              //       direction: Axis.horizontal,
                              //       itemCount: 5,
                              //       ignoreGestures: true,
                              //       itemBuilder: (context, _) => Icon(
                              //         Icons.star,
                              //         color: Colors.amber,
                              //       ),
                              //       onRatingUpdate: (rating) {
                              //         print(rating);
                              //       },
                              //     ),
                              //     const SizedBox(width: Dimensions.SMALL_PADDING),
                              //     Text('(3432 reviews)')
                              //   ],
                              // ),
                            ],
                          )
                        ],
                      ),
                      const Divider(thickness: 1.0),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}
