import 'package:armopdc3/bodys/non_finish_job.dart';
import 'package:armopdc3/utility/my_constant.dart';
import 'package:armopdc3/utility/my_dialog.dart';
import 'package:armopdc3/widgets/show_icon_button.dart';
import 'package:armopdc3/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bodys/finish_job.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  var titles = <String>[
    'Non Finish',
    'Finish',
  ];
  var iconDatas = <IconData>[
    Icons.close,
    Icons.done,
  ];
  var widgets = <Widget>[
    const NonFinishJob(),
    const FinishJob(),
  ];
  var bottonNavigators = <BottomNavigationBarItem>[];
  int indexBodys = 0;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < titles.length; i++) {
      bottonNavigators.add(
        BottomNavigationBarItem(
          label: titles[i],
          icon: Icon(
            iconDatas[i],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: newNavbar(context),
      body: widgets[indexBodys],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBodys,
        items: bottonNavigators,
        onTap: (value) {
          setState(() {
            indexBodys = value;
          });
        },
      ),
    );
  }

  AppBar newNavbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: ShowText(
        text: titles[indexBodys],
        textStyle: MyConstant().h2Style()
      ),
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
    );
  }
}
