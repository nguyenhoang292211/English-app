import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/utils/utils.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChange;
  final bool isEmailText;
  final double widthSize;
  final TextEditingController? controllerField;
  final bool obscureText;
  final Function? validateInput;
  const InputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChange,
    this.validateInput,
    this.isEmailText = false,
    this.widthSize = 0.7,
    this.controllerField,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isObscure = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // _isObscure = true;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * widget.widthSize,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: kinputTextBack.withOpacity(0.45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardAppearance: Brightness.light,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (widget.validateInput != null) {
            return widget.validateInput!(value);
          } else {
            return null;
          }
        },
        onChanged: widget.onChange,
        decoration: InputDecoration(
            fillColor: Colors.grey[500],
            errorStyle: const TextStyle(fontFamily: 'Poppins', color: kred, fontSize: 14),
            icon: Icon(widget.icon, color: kmainBrown.withOpacity(0.8)),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: klightWhite.withOpacity(0.5), fontFamily: 'Poppins'),
            border: InputBorder.none,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      this.setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                : null),
        controller: widget.controllerField,
        obscureText: _isObscure,
      ),
    );
    ;
  }
}
