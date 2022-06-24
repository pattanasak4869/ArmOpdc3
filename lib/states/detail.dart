// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:armopdc3/utility/my_constant.dart';
import 'package:armopdc3/utility/my_dialog.dart';
import 'package:armopdc3/widgets/show_icon_button.dart';
import 'package:armopdc3/widgets/show_image.dart';
import 'package:armopdc3/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:armopdc3/models/job_model.dart';
import 'package:image_picker/image_picker.dart';

class Detail extends StatefulWidget {
  final JobModel jobModel;
  const Detail({
    Key? key,
    required this.jobModel,
  }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  JobModel? jobModel;
  File? file;

  @override
  void initState() {
    super.initState();
    jobModel = widget.jobModel;
  }

  Future<void> processTakePhoto({required ImageSource ImageSource}) async {
    var result = await ImagePicker().pickImage(
      source: ImageSource,
      maxWidth: 800,
      maxHeight: 800,
    );

    if (result != null) {
      file = File(result.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: ShowText(
          text: jobModel!.job,
          textStyle: MyConstant().h2Style(),
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: MyConstant.dark,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return ListView(
          children: [
            newImage(boxConstraints),
            newDetail(boxConstraints),
          ],
        );
      }),
    );
  }

  Row newDetail(BoxConstraints boxConstraints) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    width: boxConstraints.maxWidth * 0.6,
                    child: ShowText(
                      text: jobModel!.detail,
                      textStyle: MyConstant().h16Style(),
                    ),
                  ),
      ],
    );
  }

  Row newImage(BoxConstraints boxConstraints) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 36, bottom: 16),
          width: boxConstraints.maxWidth * 0.6,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(24.0),
                child: file == null
                    ? const ShowImage(
                        path: 'images/detail_images.png',
                      )
                    : Image.file(file!),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: ShowIconButton(
                  iconData: Icons.add_a_photo,
                  pressFunc: () {
                    MyDialog(context: context).normalDialog(
                        label: 'Camera',
                        label2: 'Gallert',
                        pressFunc: () {
                          processTakePhoto(ImageSource: ImageSource.camera);
                          Navigator.pop(context);
                        },
                        pressFunc2: () {
                          processTakePhoto(ImageSource: ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        title: 'Source Time',
                        subtitle: 'Please Tab Camera Or Gallery');
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
