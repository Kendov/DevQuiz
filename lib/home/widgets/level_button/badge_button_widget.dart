import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum BadgeType { Primary, Warning, Success, Danger, Default }

class BadgeButton extends StatelessWidget {
  final String label;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Color? backgroundColor;
  final BadgeType? badgeType;

  const BadgeButton(
      {Key? key,
      required this.label,
      this.textStyle,
      this.borderColor,
      this.backgroundColor,
      this.badgeType = BadgeType.Default})
      : super(key: key);

  get _config => {
        BadgeType.Primary: {
          "backgroundColor": AppColors.levelButtonEasy,
          "borderColor": AppColors.levelButtonBorderEasy,
          "textStyle": GoogleFonts.notoSans(
            color: AppColors.levelButtonTextEasy,
            fontSize: 13,
          ),
        },
        BadgeType.Warning: {
          "backgroundColor": AppColors.levelButtonMedium,
          "borderColor": AppColors.levelButtonBorderMedium,
          "textStyle": GoogleFonts.notoSans(
            color: AppColors.levelButtonTextMedium,
            fontSize: 13,
          ),
        },
        BadgeType.Success: {
          "backgroundColor": AppColors.levelButtonHard,
          "borderColor": AppColors.levelButtonBorderHard,
          "textStyle": GoogleFonts.notoSans(
            color: AppColors.levelButtonTextHard,
            fontSize: 13,
          ),
        },
        BadgeType.Danger: {
          "backgroundColor": AppColors.levelButtonExpert,
          "borderColor": AppColors.levelButtonBorderExpert,
          "textStyle": GoogleFonts.notoSans(
            color: AppColors.levelButtonTextExpert,
            fontSize: 13,
          ),
        },
        BadgeType.Default: {
          "backgroundColor": Colors.grey[100],
          "borderColor": Colors.grey[400],
          "textStyle": GoogleFonts.notoSans(
            color: Colors.grey[700],
            fontSize: 13,
          ),
        }
      };
  get _backgroundColor => _config[badgeType]["backgroundColor"];
  get _borderColor => _config[badgeType]["borderColor"];
  get _textStyle => _config[badgeType]["textStyle"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: this.backgroundColor ?? this._backgroundColor,
          border: Border.all(
            width: 2,
            color: this.borderColor ?? this._borderColor,
          ),
          borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Text(label, style: this.textStyle ?? this._textStyle),
      ),
    );
  }
}
