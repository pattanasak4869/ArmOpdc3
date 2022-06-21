// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:armopdc3/utility/my_constant.dart';
import 'package:flutter/material.dart';

class ShowForm extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final Function(String) changeFung;
  final bool? obsecu;
  final Function()? redEyeFunc;
  const ShowForm({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.changeFung,
    this.obsecu,
    this.redEyeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecu ?? false,
      onChanged: changeFung,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.5),
        filled: true,
        suffixIcon: redEyeFunc == null
            ? Icon(iconData)
            : IconButton(
                onPressed: redEyeFunc,
                icon: Icon(Icons.lock_outline),
              ),
        hintText: hint,
        contentPadding: const EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyConstant.dark),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyConstant.colbut),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
