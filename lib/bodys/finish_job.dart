// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:armopdc3/utility/my_constant.dart';
import 'package:armopdc3/widgets/show_progress.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:armopdc3/models/job_model.dart';
import 'package:armopdc3/widgets/show_text.dart';

class FinishJob extends StatefulWidget {
  final String idOffice;
  const FinishJob({
    Key? key,
    required this.idOffice,
  }) : super(key: key);

  @override
  State<FinishJob> createState() => _FinishJobState();
}

class _FinishJobState extends State<FinishJob> {
  var jobModels = <JobModel>[];
  bool load = true;
  bool? haveData;

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereIdOfficeSuccess_armopdc3.php?isAdd=true&idOffice=${widget.idOffice}';
    await Dio().get(path).then((value) {
      print('value readData ==> $value');

      if (value.toString() == 'null') {
        haveData = false;
      } else {
        haveData = true;
        for (var element in json.decode(value.data)) {
          JobModel jobModel = JobModel.fromMap(element);
          jobModels.add(jobModel);
        }
      }

      load = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (load) {
      return const ShowProgress();
    } else {
      return haveData!
          ? GridView.builder(
              itemCount: jobModels.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) => Card(
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        jobModels[index].pathImages,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ShowText(text: jobModels[index].job),
                  ],
                ),
              ),
            )
          : const Center(
              child: ShowText(text: ' No have data'),
            );
    }
  }
}
