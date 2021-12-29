import 'package:flutter/material.dart';
import 'package:property_app/utils/app_theme.dart';

class InvoiceScreen extends StatelessWidget {
  static const String routeName = '/invoice';

  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Invoices',
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
        children: const [
          Card(
            child: ListTile(
              title: Text('Title 1'),
              subtitle: Text('Payment 200'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Title 2'),
              subtitle: Text('Payment 200'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Title 3'),
              subtitle: Text('Payment 500'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Title 4'),
              subtitle: Text('Payment 900'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
