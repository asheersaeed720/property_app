import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/complaint/complaint_controller.dart';
import 'package:property_app/src/complaint/models/complaint.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/utils/custom_app_bar.dart';
import 'package:property_app/utils/display_toast_message.dart';
import 'package:property_app/widgets/custom_textfield.dart';
import 'package:property_app/widgets/loading_widget.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ComplaintScreen extends StatefulWidget {
  static const String routeName = '/complaint';

  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  TextEditingController complaintControllerTxt = TextEditingController();
  TextEditingController complaintDescTxt = TextEditingController();
  TextEditingController complaintCategoryId = TextEditingController();

  RoundedLoadingButtonController btnController = RoundedLoadingButtonController();

  final _complaintController = Get.put(ComplaintController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: customAppBar(context, 'Complaint'),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 28.0),
        children: [
          CustomTextField(
            keyboardType: TextInputType.text,
            controller: complaintControllerTxt,
            hintText: "Complaint title",
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: complaintDescTxt,
            keyboardType: TextInputType.multiline,
            maxLines: 6,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(style: BorderStyle.none, width: 0),
              ),
              isDense: true,
              hintText: 'Complaint Description',
              hintStyle:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12, color: Colors.grey),
              filled: true,
              prefixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 20),
            ),
          ),
          const SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Category',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              GetBuilder<ComplaintController>(
                init: ComplaintController(),
                builder: (_) => SizedBox(
                  height: 52.0,
                  child: DropdownSearch<String>(
                    dropdownSearchDecoration: InputDecoration(
                      // contentPadSding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10.0),
                      //   borderSide: const BorderSide(style: BorderStyle.none, width: 0),
                      // ),
                      isDense: true,
                      hintText: 'Complaint Description',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 12, color: Colors.grey),
                      filled: true,
                      // prefixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 20),
                    ),
                    mode: Mode.MENU,
                    items: (_complaintController.complaintCategoryList).map((e) {
                      return e.name ?? '';
                    }).toList(),
                    // popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: (value) {
                      // complaintCategoryId.text = value?.id ?? '';
                    },
                    // selectedItem: _complaintController.complaintCategoryList.first.name,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RoundedLoadingButton(
                  width: MediaQuery.of(context).size.width,
                  color: AppTheme.primary,
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  controller: btnController,
                  onPressed: () async {
                    if (complaintControllerTxt.text.isNotEmpty &&
                        complaintDescTxt.text.isNotEmpty &&
                        complaintCategoryId.text.isNotEmpty) {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      btnController.start();
                      await _complaintController
                          .createComplaint(
                        complaintTitleTxt: complaintControllerTxt.text,
                        complaintDesc: complaintDescTxt.text,
                        complaintCategory: complaintCategoryId.text,
                      )
                          .catchError((_) {
                        btnController.reset();
                      });
                      btnController.success();
                      await Future.delayed(const Duration(seconds: 1));
                      btnController.reset();
                      displayToastMessage('Your complaint successfully created');
                      setState(() {});
                    } else {
                      btnController.reset();
                      displayToastMessage('Fields missing');
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 18.0),
          const Divider(thickness: 1.5),
          const SizedBox(height: 10.0),
          Text('My Complaints', style: Theme.of(context).textTheme.headline1),
          GetBuilder<ComplaintController>(
            init: ComplaintController(),
            builder: (_) => FutureBuilder<List<ComplaintModel>>(
              future: _complaintController.getUserComplaint(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ComplaintModel> complaintsList = snapshot.data ?? [];
                  if (complaintsList.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 52.0),
                      child: Text(
                        'No Complaints',
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: complaintsList.length,
                      itemBuilder: (context, i) {
                        return _buildComplaintsOverview(context, complaintsList[i]);
                      },
                    ),
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
        ],
      ),
    );
  }

  Widget _buildComplaintsOverview(BuildContext context, ComplaintModel complaintItem) {
    return Card(
      child: ListTile(
        title: Text(complaintItem.title ?? ''),
        subtitle: Text(complaintItem.category ?? ''),
        trailing: Text(complaintItem.status ?? ''),
      ),
    );
  }
}
