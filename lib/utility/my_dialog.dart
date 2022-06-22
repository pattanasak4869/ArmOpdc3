// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:armopdc3/utility/my_constant.dart';
import 'package:armopdc3/widgets/show_image.dart';
import 'package:armopdc3/widgets/show_text.dart';
import 'package:armopdc3/widgets/show_text_button.dart';
import 'package:flutter/material.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  Future<void> normalDialog({
    required String title,
    required String subtitle,
    String? label,
    Function()? pressFunc,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: ListTile(
          leading: SizedBox(
            width: 80,
            child: ShowImage(),
          ),
          title: ShowText(
            text: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowText(
            text: subtitle,
            textStyle: MyConstant().h3Style(),
          ),
        ),
        actions: [
          pressFunc == null ? ShowTextButton(
              label: 'OK',
              pressFunc: () {
                Navigator.pop(context);
              }) : ShowTextButton(label: label!, pressFunc: pressFunc),
        ],
      ),
    );
  }
}
