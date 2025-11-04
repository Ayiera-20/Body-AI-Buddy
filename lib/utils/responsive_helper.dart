import 'package:flutter/material.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static EdgeInsets getScreenPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 16);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 32);
    } else {
      return const EdgeInsets.symmetric(horizontal: 64);
    }
  }

  static int getGridCrossAxisCount(BuildContext context, {int? mobileCount, int? tabletCount, int? desktopCount}) {
    if (isMobile(context)) {
      return mobileCount ?? 2;
    } else if (isTablet(context)) {
      return tabletCount ?? 3;
    } else {
      return desktopCount ?? 4;
    }
  }

  static double getCardAspectRatio(BuildContext context) {
    if (isMobile(context)) {
      return 1.1;
    } else if (isTablet(context)) {
      return 1.2;
    } else {
      return 1.3;
    }
  }

  static double getFontSize(BuildContext context, double baseFontSize) {
    if (isMobile(context)) {
      return baseFontSize;
    } else if (isTablet(context)) {
      return baseFontSize * 1.1;
    } else {
      return baseFontSize * 1.2;
    }
  }

  static BoxConstraints getMaxWidthConstraint(BuildContext context) {
    return BoxConstraints(
      maxWidth: isMobile(context) 
          ? double.infinity 
          : isTablet(context)
              ? 800
              : 1200,
    );
  }
}

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, BoxConstraints constraints) mobile;
  final Widget Function(BuildContext context, BoxConstraints constraints)? tablet;
  final Widget Function(BuildContext context, BoxConstraints constraints)? desktop;

  const ResponsiveLayoutBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktop?.call(context, constraints) ?? mobile(context, constraints);
        } else if (constraints.maxWidth >= 768) {
          return tablet?.call(context, constraints) ?? mobile(context, constraints);
        } else {
          return mobile(context, constraints);
        }
      },
    );
  }
}

class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? scaleFactor;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.scaleFactor,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = style ?? Theme.of(context).textTheme.bodyMedium!;
    final responsiveFontSize = ResponsiveHelper.getFontSize(
      context,
      defaultStyle.fontSize ?? 14,
    );

    return Text(
      text,
      style: defaultStyle.copyWith(
        fontSize: responsiveFontSize * (scaleFactor ?? 1.0),
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double? mobileHeight;
  final double? tabletHeight;
  final double? desktopHeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.mobileHeight,
    this.tabletHeight,
    this.desktopHeight,
    this.padding,
    this.margin,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    double? height;
    
    if (ResponsiveHelper.isMobile(context)) {
      height = mobileHeight;
    } else if (ResponsiveHelper.isTablet(context)) {
      height = tabletHeight ?? mobileHeight;
    } else {
      height = desktopHeight ?? tabletHeight ?? mobileHeight;
    }

    return Container(
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: child,
    );
  }
}