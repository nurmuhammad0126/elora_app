import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

extension BuildContextE on BuildContext {
  AppColors get colors => AppColors();
  AppTextStyles get styles => AppTextStyles.defaultStyle;

}
