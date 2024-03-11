import 'package:flutter/material.dart';
import 'package:template/components/UI/Icon.dart';
import 'package:template/components/UI/IconBtn.dart';
import 'package:template/constants/colors.dart';

enum InputType { password, search }

/*
  Input Component ----------------
 */
class Input extends StatefulWidget {
  // Variables ----------------
  final String text;
  final TextEditingController value;
  final TextInputType? textType;
  final InputType? type;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final bool? isPlaceholder;

  // Props ----------------
  const Input(
    this.text,
    this.value, {
    Key? key,
    this.textType = TextInputType.text,
    this.type,
    this.validator,
    this.onChange,
    this.isPlaceholder,
  }) : super(key: key);

  // Builder ----------------
  @override
  InputState createState() => InputState();
}

/*
  State Component ----------------
 */
class InputState extends State<Input> {
  // Variables ----------------
  bool isShowPassword = false;
  late FocusNode isFocus = FocusNode();

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.value,
      keyboardType: widget.textType,
      obscureText: widget.type == InputType.password && !isShowPassword,
      validator: widget.validator,
      onChanged: widget.onChange,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: widget.isPlaceholder == true ? null : widget.text,
        hintText: widget.isPlaceholder == true ? widget.text : null,
        labelStyle: const TextStyle(color: AppColors.blue),
        floatingLabelStyle:
            const TextStyle(color: AppColors.blue, fontSize: 18),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        hintStyle: const TextStyle(fontSize: 16, color: AppColors.blue),
        suffixIcon:
            // Если это пароль
            widget.type == InputType.password
                ? IconButton(
                    // Переключить видимость пароля
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    // Иконка
                    icon: CIcon(isShowPassword ? 'f06e' : 'f070'),
                    color: Theme.of(context).primaryColor)
                :
                // Если это поиск
                widget.type == InputType.search
                    ? IconBtn(
                        'f00d',
                        func: () {
                          // Очистить поле
                          widget.value.clear();
                        },
                      )
                    : null,
        prefixIcon: widget.type == InputType.search
            ? const CIcon('f002', color: AppColors.blue)
            : null,
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.blue,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.blue),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.red),
        ),
      ),
    );
  }
}
