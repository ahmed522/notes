import 'package:notes/global/constants/images_assets.dart';
import 'package:notes/global/constants/strings.dart';
import 'package:flutter/material.dart';

import '../widgets/error_page.dart';

class CommonFunctions {
  static ErrorPage get internetError => const ErrorPage(
        imageAsset: AppImagesAssets.errorImageAsset,
        message: AppStrings.errorPageText,
      );

  static bool isLightMode(BuildContext context) =>
      (Theme.of(context).brightness == Brightness.light);
}
