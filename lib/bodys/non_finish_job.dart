// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:armopdc3/utility/my_constant.dart';
import 'package:flutter/material.dart';

import 'package:armopdc3/widgets/show_text.dart';

class NonFinishJob extends StatefulWidget {
  final List<String> dataUserLogins;
  const NonFinishJob({
    Key? key,
    required this.dataUserLogins,
  }) : super(key: key);

  @override
  State<NonFinishJob> createState() => _NonFinishJobState();
}

class _NonFinishJobState extends State<NonFinishJob> {
  var dataUserLogin = <String>[];

  @override
  void initState() {
    super.initState();
    dataUserLogin = widget.dataUserLogins;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showTitle(head: 'ชื่อพนักงาน : ', value: dataUserLogin[1]),
        showTitle(head: 'ตำแหน่ง : ', value: dataUserLogin[2]),
      ],
    );
  }

  Card showTitle({required String head,required String value}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ShowText(
              text: head,
              textStyle: MyConstant().h16boldStyle(),
            ),
          ),
          Expanded(
            flex: 2,
            child: ShowText(
              text: value,
              textStyle: MyConstant().h16Style(),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
