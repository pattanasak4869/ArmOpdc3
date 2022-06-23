import 'dart:convert';

import 'package:armopdc3/models/user_model.dart';
import 'package:armopdc3/states/my_service.dart';
import 'package:armopdc3/utility/my_constant.dart';
import 'package:armopdc3/utility/my_dialog.dart';
import 'package:armopdc3/widgets/show_button.dart';
import 'package:armopdc3/widgets/show_form.dart';
import 'package:armopdc3/widgets/show_image.dart';
import 'package:armopdc3/widgets/show_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEyeFunc = true;
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusScopeNode());
          },
          child: Container(
            decoration: MyConstant().bgBox(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  newLogo(boxConstraints),
                  newTitle(boxConstraints),
                  formUsers(boxConstraints),
                  formPassword(boxConstraints),
                  ButtonLogin(boxConstraints),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Container ButtonLogin(BoxConstraints boxConstraints) {
    return Container(
      width: boxConstraints.maxWidth * 0.6,
      child: ShowButton(
        label: 'LOGIN',
        pressFunc: () {
          print('user = $user, password = $password');

          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            print('Have space');
            MyDialog(context: context).normalDialog(
              title: 'คำเตือนจากระบบ??',
              subtitle: 'กรุณากรอกข้อมูลให้ครบถ้วน!!!',
            );
          } else {
            print('No space');
            processCheckLogin();
          }
        },
      ),
    );
  }

  Container formPassword(BoxConstraints boxConstraints) {
    return Container(
      width: boxConstraints.maxWidth * 0.6,
      margin: const EdgeInsets.only(top: 16, bottom: 32),
      height: 40,
      child: ShowForm(
        redEyeFunc: () {
          setState(() {
            redEyeFunc = !redEyeFunc;
          });
        },
        hint: 'รหัสคอมพิวเตอร์ :',
        iconData: Icons.lock_outline,
        changeFung: (String string) {
          password = string.trim();
        },
        obsecu: redEyeFunc,
      ),
    );
  }

  Container formUsers(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      width: boxConstraints.maxWidth * 0.6,
      height: 40,
      child: ShowForm(
        hint: 'รหัสพนักงาน :',
        iconData: Icons.account_circle_outlined,
        changeFung: (String string) {
          user = string.trim();
        },
      ),
    );
  }

  SizedBox newTitle(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          ShowText(
            text: 'LOGIN TO SEPMS',
            textStyle: MyConstant().customStyle(),
          ),
        ],
      ),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            width: boxConstraints.maxWidth * 0.5,
            child: ShowImage(),
          ),
        ],
      ),
    );
  }

  Future<void> processCheckLogin() async {
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereUser_armopdc3.php?isAdd=true&user=$user';

    await Dio().get(path).then((value) {
      if (value.toString() == 'null') {
        MyDialog(context: context).normalDialog(
            title: 'User False!!!', subtitle: 'No $user in my database');
      } else {
        var result = json.decode(value.data);
        print('result === $result');
        for (var element in result) {
          UserModel userModel = UserModel.fromMap(element);
          if (password == userModel.password) {
            MyDialog(context: context).normalDialog(
              pressFunc: () async {
                SharedPreferences preferences = 
                  await SharedPreferences.getInstance();

                var data = <String>[];
                data. add(userModel.id);
                data. add(userModel.name);
                data. add(userModel.position);
                data. add(userModel.users);

                preferences.setStringList('data', data).then((value){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyService(),
                    ),
                    (route) => false);
                });
              },
              label: 'Go to Service',
              title: 'Welcome to SEPMS', 
              subtitle: 'LOGIN SUCCESS!!!',
            );
          } else {
            MyDialog(context: context).normalDialog(
                title: 'Password False!!!', subtitle: 'Please Try gain!!!');
          }
        }
      }
    });
  }
}
