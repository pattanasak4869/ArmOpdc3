import 'package:armopdc3/utility/my_constant.dart';
import 'package:armopdc3/utility/my_dialog.dart';
import 'package:armopdc3/widgets/show_button.dart';
import 'package:armopdc3/widgets/show_form.dart';
import 'package:armopdc3/widgets/show_image.dart';
import 'package:armopdc3/widgets/show_text.dart';
import 'package:flutter/material.dart';

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
}
