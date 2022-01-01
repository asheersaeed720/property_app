import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/utils/custom_app_bar.dart';
import 'package:property_app/widgets/custom_textfield.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ComplaintScreen extends StatelessWidget {
  static const String routeName = '/complaint';

  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: customAppBar(context, 'Complaint'),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 28.0),
        children: [
          const CustomTextField(
            keyboardType: TextInputType.text,
            // leadingIcon: Icon(
            //   Icons.comme,
            //   color: Colors.grey,
            // ),
            hintText: "Complaint title",
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            onChanged: (value) {},
            // controller: controller,
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
              SizedBox(
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
                  items: const ["Category 1", "Category 2", 'Category 3'],
                  // popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: "Category 1",
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
                  controller: RoundedLoadingButtonController(),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    // Get.toNamed(TabScreen.routeName);

                    // var res = await service.signInWithEmailPassword(
                    //     emailController.text, passwordController.text);
                    // if (res["status"] == false) {
                    //   btnController.reset();
                    //   showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return CustomDialogBox(
                    //           title: "Login",
                    //           descriptions: res["message"],
                    //         );
                    //       });
                    // } else {
                    //   btnController.success();
                    //   Navigator.of(context).pushAndRemoveUntil(
                    //       MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                    // }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 18.0),
          const Divider(thickness: 1.5),
          const SizedBox(height: 10.0),
          _buildComplaintsOverview(context),
        ],
      ),
    );
  }

  Widget _buildComplaintsOverview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Complaints', style: Theme.of(context).textTheme.headline1),
        const Card(
          child: ListTile(
            title: Text('Title 1'),
            subtitle: Text('subtitle 1'),
            trailing: Icon(Icons.arrow_forward),
          ),
        ),
        const Card(
          child: ListTile(
            title: Text('Title 2'),
            subtitle: Text('subtitle 2'),
            trailing: Icon(Icons.arrow_forward),
          ),
        ),
        const Card(
          child: ListTile(
            title: Text('Title 3'),
            subtitle: Text('subtitle 3'),
            trailing: Icon(Icons.arrow_forward),
          ),
        ),
      ],
    );
  }
}
