import 'package:flutter/material.dart';
import 'package:property_app/utils/app_theme.dart';

class VerifyDocScreen extends StatelessWidget {
  static const String routeName = '/verify-doc';

  const VerifyDocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Verify Document',
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        children: const [
          Card(
            child: ListTile(
              title: Text('Verify Paid Invoice'),
              subtitle: Text('subtitle 1'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Verify General Challan'),
              subtitle: Text('subtitle 2'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Verify Complaints'),
              subtitle: Text('subtitle 3'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
