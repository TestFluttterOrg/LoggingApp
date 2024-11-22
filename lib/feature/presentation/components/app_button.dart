import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final double width;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;
  final bool isDisabled;

  const AppButton({
    required this.onPressed,
    required this.label,
    this.width = double.infinity,
    this.margin,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.isDisabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      height: 40.h,
      child: ElevatedButton(
        onPressed: isDisabled
            ? null
            : isLoading
            ? () {}
            : () {
          FocusScope.of(context).requestFocus(FocusNode()); //Hide keyboard
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Button color
          foregroundColor: textColor, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r), // Rounded corners
          ), // Button height
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isLoading)
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5.h,
                ),
              )
            else
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.h,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
