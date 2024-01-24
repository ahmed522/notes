import 'package:notes/global/colors/app_colors.dart';
import 'package:notes/global/functions/common_functions.dart';
import 'package:flutter/material.dart';

class SingleChoiceIndicator extends StatelessWidget {
  const SingleChoiceIndicator({
    Key? key,
    required this.index,
    required this.currentChoice,
    required this.size,
    required this.padding,
  }) : super(key: key);

  final int index;
  final int currentChoice;
  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          border: Border.all(
            color: CommonFunctions.isLightMode(context)
                ? AppColors.primaryColor
                : AppColors.lightColor1,
          ),
          shape: BoxShape.circle,
          color: currentChoice == index
              ? CommonFunctions.isLightMode(context)
                  ? AppColors.primaryColor
                  : AppColors.lightColor1
              : Colors.transparent,
        ),
      ),
    );
  }
}
