// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:armopdc3/utility/my_constant.dart';
import 'package:flutter/material.dart';
import 'package:armopdc3/models/job_model.dart';

class Detail extends StatelessWidget {
  final JobModel jobModel;
  const Detail({
    Key? key,
    required this.jobModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: MyConstant.dark,
      ),
    );
  }
}
