import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/utils/utils.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChange;
  final bool isEmailText;
  const InputField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.onChange,
      this.isEmailText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: kinputTextBack.withOpacity(0.45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardAppearance: Brightness.light,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return isEmailText
              ? value.toString().isValidEmail()
                  ? null
                  : "Check your email format"
              : null;
        },
        onChanged: onChange,
        decoration: InputDecoration(
            fillColor: Colors.grey[500],
            errorStyle: const TextStyle(
                fontFamily: 'Poppins', color: kred, fontSize: 14),
            icon: Icon(icon, color: kmainBrown.withOpacity(0.8)),
            hintText: hintText,
            hintStyle: TextStyle(
                color: klightWhite.withOpacity(0.5), fontFamily: 'Poppins'),
            border: InputBorder.none),
      ),
    );
  }
}
