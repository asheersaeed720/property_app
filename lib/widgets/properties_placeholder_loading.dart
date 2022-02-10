import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PropertiesListLoading extends StatefulWidget {
  const PropertiesListLoading({Key? key}) : super(key: key);

  @override
  _PropertiesListLoadingState createState() => _PropertiesListLoadingState();
}

class _PropertiesListLoadingState extends State<PropertiesListLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      Container(
                        width: 200.0,
                        height: 10.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Container(
                //         width: double.infinity,
                //         height: 8.0,
                //         color: Colors.white,
                //       ),
                //       const Padding(
                //         padding: EdgeInsets.symmetric(vertical: 2.0),
                //       ),
                //       Container(
                //         width: double.infinity,
                //         height: 8.0,
                //         color: Colors.white,
                //       ),
                //       const Padding(
                //         padding: EdgeInsets.symmetric(vertical: 2.0),
                //       ),
                //       Container(
                //         width: 40.0,
                //         height: 8.0,
                //         color: Colors.white,
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}
