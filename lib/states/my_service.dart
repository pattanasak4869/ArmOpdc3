import 'package:armopdc3/utility/my_constant.dart';
import 'package:armopdc3/utility/my_dialog.dart';
import 'package:armopdc3/widgets/show_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends StatelessWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: MyConstant.dark,
        backgroundColor: Colors.white,
        actions: [
          ShowIconButton(
            iconData: Icons.exit_to_app_outlined,
            pressFunc: () {
              
              MyDialog(context: context).normalDialog(
                pressFunc: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.clear().then((value) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/authen', (route) => false);
                  });
                },
                label: 'Log out',
                title: 'LOGOUT TO SEPMS?',
                subtitle: 'Please Confirm Logout',
              );
            },
          ),
        ],
      ),
    );
  }
}
