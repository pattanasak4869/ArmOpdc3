import 'package:armopdc3/utility/my_constant.dart';
import 'package:armopdc3/widgets/show_image.dart';
import 'package:armopdc3/widgets/show_text.dart';
import 'package:flutter/material.dart';

class Authen extends StatelessWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newLogo(boxConstraints),
              ShowText (text: 'LOGIN TO SEPMS',textStyle: MyConstant().h2Style(),),
            ],
          ),
        ); 
      }),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.5,
      child: ShowImage(),
    );
  }
}
