import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/property/property_controller.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/widgets/custom_async_btn.dart';

class PropertyFilterScreen extends StatefulWidget {
  static const String routeName = '/property-filter';

  const PropertyFilterScreen({Key? key}) : super(key: key);

  @override
  _PropertyFilterScreenState createState() => _PropertyFilterScreenState();
}

class _PropertyFilterScreenState extends State<PropertyFilterScreen> {
  final _propertyController = Get.put(PropertyController());

  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Filters',
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 19.0, right: 24.0),
            child: InkWell(
              onTap: () {},
              child: const Text(
                'Reset',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<PropertyController>(
        builder: (_) => ListView(
          padding: const EdgeInsets.all(12.0),
          children: <Widget>[
            _buildToggleBtnView(),
            // const SizedBox(height: 28.0),
            // _buildCityDropDownView(),
            const SizedBox(height: 28.0),
            _buildLocationDropDownView(),
            const SizedBox(height: 28.0),
            _buildPropertyTypeDropDownView(),
            const SizedBox(height: 28.0),
            _buildPriceRangeDropDownView(),
            const SizedBox(height: 28.0),
            CustomAsyncBtn(
              btntxt: 'Search Properties',
              onPress: () async {
                // await _propertyController.getSearchableProperties();
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildToggleBtnView() {
    return ToggleButtons(
      borderColor: Colors.grey,
      // fillColor: AppTheme.primary,
      borderWidth: 1,
      borderRadius: BorderRadius.circular(4.0),
      selectedBorderColor: Colors.grey,
      // selectedColor: Colors.white,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2.2,
          padding: const EdgeInsets.all(0.0),
          child: const TextButton(
            onPressed: null,
            child: Text(
              'Buy',
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2.2,
          padding: const EdgeInsets.all(0.0),
          child: const TextButton(
            onPressed: null,
            child: Text(
              'Rent',
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
        });
      },
      isSelected: isSelected,
    );
  }

  // Widget _buildCityDropDownView() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'Country',
  //         style: TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //       const SizedBox(height: 10.0),
  //       DropdownSearch<String>(
  //         mode: Mode.MENU,
  //         showSearchBox: true,
  //         items: const ["Pakistan", "Tunisia", 'Canada'],
  //         // popupItemDisabled: (String s) => s.startsWith('I'),
  //         onChanged: print,
  //         selectedItem: "Pakistan",
  //       ),
  //     ],
  //   );
  // }

  Widget _buildLocationDropDownView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        DropdownSearch<String>(
          mode: Mode.MENU,
          items: (_propertyController.locationList).map((e) {
            return '${e.id}. ' '${e.name}';
          }).toList(),
          onChanged: (value) {
            String id = value?.replaceAll(RegExp(r'[^0-9]'), '') ?? '';
            _propertyController.locationForm.id = id;
          },
          selectedItem: _propertyController.locationList.first.name,
        ),
      ],
    );
  }

  Widget _buildPropertyTypeDropDownView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Property Type',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSearchBox: true,
          items: const ['Residential', 'Commercial Use'],
          onChanged: print,
          selectedItem: "Residential",
        ),
      ],
    );
  }

  Widget _buildPriceRangeDropDownView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Range',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSearchBox: true,
          items: isSelected[0] == true
              ? const [
                  '10 K - 20 K',
                  '20 K - 30 K',
                  '30 K - 40 K',
                  '40 K - 50 K',
                  '50 K - 60 K',
                  '60 K - 70 K',
                  '70 K - 80 K',
                  '80 K - 90 K',
                  '90 K - 100 K',
                ]
              : const [
                  '1 M - 5 M',
                  '5 M - 10 M',
                  '10 M - 15 M',
                  '15 M - 20 M',
                  '20 M - 25 M',
                  '25 M - 30 M',
                  '30 M - 35 M',
                  '35 M - 40 M',
                  '45 M - 50 M',
                ],
          onChanged: print,
          selectedItem: isSelected[0] == true ? '10 K - 20 K' : '1 M - 5 M',
        ),
      ],
    );
  }
}
