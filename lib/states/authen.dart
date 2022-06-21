import 'package:armopdc3/utility/my_constant.dart';
import 'package:armopdc3/widgets/show_form.dart';
import 'package:armopdc3/widgets/show_image.dart';
import 'package:armopdc3/widgets/show_text.dart';
import 'package:flutter/material.dart';

class Authen extends StatelessWidget {
  const Authen({Key? key}) : super(key: key);

  get changeFung => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newLogo(boxConstraints),
              newTitle(),
              formUsers(boxConstraints),
              Container(
                width: boxConstraints.maxWidth * 0.6,
                margin: const EdgeInsets.only(top: 16),
                height: 40,
                child: ShowForm(
                  hint: 'รหัสคอมพิวเตอร์ :',
                  iconData: Icons.lock_outline,
                  changeFung: (String string) {},
                ),
              ),
            ],
          ),
        );
      }),
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
        changeFung: (String string) {},
      ),
    );
  }

  ShowText newTitle() {
    return ShowText(
      text: 'LOGIN TO SEPMS',
      textStyle: MyConstant().customStyle(),
    );
  }

  Container newLogo(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: boxConstraints.maxWidth * 0.5,
      child: ShowImage(),
    );
  }
}
