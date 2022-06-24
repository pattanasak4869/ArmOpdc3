// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:armopdc3/models/job_model.dart';
import 'package:armopdc3/states/detail.dart';
import 'package:armopdc3/utility/my_calculate.dart';
import 'package:armopdc3/utility/my_constant.dart';
import 'package:armopdc3/widgets/show_progress.dart';
import 'package:dio/dio.dart';
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
  var jobModels = <JobModel>[];

  @override
  void initState() {
    super.initState();
    dataUserLogin = widget.dataUserLogins;
    readDataJob();
  }

  Future<void> readDataJob() async {

    if (jobModels.isNotEmpty) {
      jobModels.clear();  
    }
    String idOffice = dataUserLogin[0];
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereIdOfficer_amopdc3.php?isAdd=true&idOffice=$idOffice';

    await Dio().get(path).then((value) {
      var result = json.decode(value.data);
      for (var element in result) {
        JobModel jobModel = JobModel.fromMap(element);
        print('job ===> ${jobModel.job}');

        if (jobModel.status == 'start') {
          jobModels.add(jobModel);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          showTitle(head: 'ชื่อพนักงาน : ', value: dataUserLogin[1]),
          showTitle(head: 'ตำแหน่ง : ', value: dataUserLogin[2]),
          jobModels.isEmpty
              ? const ShowProgress()
              : ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: jobModels.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Detail(jobModel: jobModels[index]),
                          )).then((value) {
                            readDataJob();
                          });
                    },
                    child: showTitle(
                      head: 'Job : ',
                      value: jobModels[index].job,
                      detail:
                          MyCalculate().cutword(word: jobModels[index].detail),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Card showTitle(
      {required String head, required String value, String? detail}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            detail == null
                ? const SizedBox()
                : Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShowText(
                        text: detail,
                        textStyle: MyConstant().h13Style(),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
