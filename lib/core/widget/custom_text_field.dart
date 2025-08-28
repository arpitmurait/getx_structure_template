import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool obscure;
  final bool readOnly;
  final String? Function(String?)? validator;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final String? leadingSvg;
  final VoidCallback? onLeadingTap;
  final TextStyle? textStyle;
  final String? trailingSvg;
  final String? prefixText;
  final VoidCallback? onTrailingTap;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.hint,
    this.contentPadding,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.obscure = false,
    this.readOnly = false,
    this.textStyle,
    this.validator,
    this.backgroundColor,
    this.leadingSvg,
    this.onLeadingTap,
    this.trailingSvg,
    this.onTrailingTap,
    this.prefixText,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscure;
  }

  void toggleObscure() {
    setState(() => _obscure = !_obscure);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      validator: widget.validator,
      obscureText: widget.obscure ? _obscure : false,
      style: widget.textStyle,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        hintText: widget.hint ?? '',
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
        filled: true,
        fillColor: widget.backgroundColor ?? Colors.grey.withAlpha(50),
        contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        prefixIcon: widget.leadingSvg != null
            ? GestureDetector(
          onTap: widget.onLeadingTap,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: SvgPicture.asset(
              widget.leadingSvg!,
              width: 24.w,
              height: 24.w,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.color),
            ),
          ),
        )
            : null,
        suffixIconConstraints: BoxConstraints(maxWidth: 50.w),
        prefixText: widget.prefixText,
        suffixIcon: widget.obscure
            ? IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
            size: 22.w,
          ),
          onPressed: toggleObscure,
        )
            : widget.trailingSvg != null
            ? GestureDetector(
          onTap: widget.onTrailingTap,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: SvgPicture.asset(
              widget.trailingSvg!,
              width: 24.w,
              height: 24.w,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.color),
            ),
          ),
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        isDense: true,
      ),
    );
  }
}
