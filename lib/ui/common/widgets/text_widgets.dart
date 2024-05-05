import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:flutter/material.dart';

class _CustomText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? fontSize;
  final double? height;
  final double? letterSpacing;
  final bool? softWrap;
  final TextStyle? style;
  final FontStyle? fontStyle;

  const _CustomText(
    this.text, {
    super.key,
    this.textAlign,
    this.fontWeight,
    this.color = AppColors.white,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.fontSize,
    this.height,
    this.letterSpacing,
    this.softWrap,
    this.fontStyle,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: fontWeight,
                color: color,
                fontSize: fontSize,
                height: height,
                letterSpacing: letterSpacing,
                fontStyle: fontStyle,
              ),
      softWrap: softWrap,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

///
/// Title
///

class Title1 extends _CustomText {
  const Title1(
    super.text, {
    super.fontSize = 22,
    super.fontWeight = FontWeight.w600,
    super.height,
    super.textAlign,
    super.color,
    super.maxLines,
    super.overflow,
    super.letterSpacing,
    super.softWrap,
    super.key,
  });
}

class Title2 extends _CustomText {
  const Title2(
    super.text, {
    super.fontSize = 20,
    super.fontWeight = FontWeight.w600,
    super.height = 28 / 24,
    super.textAlign,
    super.color,
    super.maxLines,
    super.overflow,
    super.letterSpacing = 0.24,
    super.softWrap,
    super.key,
  });
}

class Title3 extends _CustomText {
  const Title3(
    super.text, {
    super.fontSize = 16,
    super.fontWeight = FontWeight.w500,
    super.height = 25 / 22,
    super.textAlign,
    super.color,
    super.maxLines,
    super.overflow,
    super.letterSpacing,
    super.softWrap,
    super.fontStyle,
    super.key,
  });
}

class Title4 extends _CustomText {
  const Title4(
    super.text, {
    super.fontSize = 14,
    super.fontWeight = FontWeight.w400,
    super.height = 25 / 22,
    super.textAlign,
    super.color,
    super.maxLines,
    super.overflow,
    super.letterSpacing,
    super.softWrap,
    super.fontStyle,
    super.key,
  });
}

///
/// Text
///

class Text1 extends _CustomText {
  const Text1(
    super.text, {
    super.fontSize = 16,
    super.fontWeight = FontWeight.w400,
    super.height = 22 / 16,
    super.textAlign,
    super.color,
    super.maxLines,
    super.overflow,
    super.letterSpacing = 0.15,
    super.softWrap,
    super.key,
  });
}

class Text2 extends _CustomText {
  const Text2(
    super.text, {
    super.fontSize = 14,
    super.fontWeight = FontWeight.w500,
    super.height = 20 / 14,
    super.textAlign,
    super.color,
    super.maxLines,
    super.overflow,
    super.letterSpacing = 0.15,
    super.softWrap,
    super.key,
  });
}

///
/// TabText
///

class TabText extends _CustomText {
  const TabText(
    super.text, {
    super.fontSize = 10,
    super.fontWeight = FontWeight.w400,
    super.height = 20 / 16,
    super.textAlign,
    super.color,
    super.maxLines,
    super.overflow,
    super.letterSpacing,
    super.softWrap,
    super.key,
  });
}

///
/// Specific
///

class ButtonText extends _CustomText {
  const ButtonText(
    super.text, {
    super.fontSize = 16,
    super.fontWeight = FontWeight.w400,
    super.height = 24 / 12,
    super.textAlign,
    super.color,
    super.maxLines,
    super.overflow,
    super.letterSpacing,
    super.softWrap,
    super.key,
  });
}
