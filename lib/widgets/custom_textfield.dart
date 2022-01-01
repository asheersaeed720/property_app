import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool validatedField;
  final bool readOnly;
  final bool obscureText;
  final bool autoFocus;
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  const CustomTextField(
      {Key? key,
      this.onTap,
      this.onChanged,
      this.keyboardType,
      this.autoFocus = false,
      this.controller,
      this.hintText,
      this.labelText,
      this.readOnly = false,
      this.validatedField = true,
      this.errorText = 'Cannot be empty',
      this.leadingIcon,
      this.suffixIcon,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      obscureText: obscureText,
      autofocus: autoFocus,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(style: BorderStyle.none, width: 0),
        ),
        isDense: true,
        hintText: hintText,
        // fillColor: widget.fillColor != null
        //     ? widget.fillColor
        //     : Theme.of(context).primaryColor,
        hintStyle:
            Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12, color: Colors.grey),
        filled: true,
        // prefixIcon: isShowPrefixIcon
        //     ? Padding(
        //         padding: const EdgeInsets.only(
        //             left: Dimensions.PADDING_SIZE_LARGE, right: Dimensions.PADDING_SIZE_SMALL),
        //         child: Image.asset(widget.prefixIconUrl!),
        //       )
        //     : const SizedBox.shrink(),
        prefixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 20),
        // suffixIcon: widget.isShowSuffixIcon
        //     ? widget.isPassword
        //         ? IconButton(
        //             icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,
        //                 color: Theme.of(context).hintColor.withOpacity(0.3)),
        //             onPressed: _toggle)
        //         : widget.isIcon
        //             ? IconButton(
        //                 onPressed: widget.onSuffixTap as void Function()?,
        //                 icon: Image.asset(
        //                   widget.suffixIconUrl!,
        //                   width: 15,
        //                   height: 15,
        //                   color: Theme.of(context).textTheme.bodyText1!.color,
        //                 ),
        //               )
        //             : null
        //     : null,
      ),
    );
  }
}
