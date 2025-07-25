/// Consistent sizing system for spacing, dimensions, and responsive design
///
// import 'package:flutter/material.dart';

// class AppSizes {
//   AppSizes._();

//   // Spacing values following 4px grid system
//   static const double xs = 4.0;
//   static const double sm = 8.0;
//   static const double md = 16.0;
//   static const double lg = 24.0;
//   static const double xl = 32.0;
//   static const double xxl = 48.0;
//   static const double xxxl = 64.0;

//   // Border radius values
//   static const double radiusXs = 4.0;
//   static const double radiusSm = 8.0;
//   static const double radiusMd = 12.0;
//   static const double radiusLg = 16.0;
//   static const double radiusXl = 24.0;
//   static const double radiusFull = 9999.0;

//   // Component dimensions
//   static const double buttonHeight = 48.0;
//   static const double buttonHeightSm = 40.0;
//   static const double buttonHeightLg = 56.0;
//   static const double inputHeight = 56.0;
//   static const double appBarHeight = 64.0;
//   static const double cardElevation = 2.0;
//   static const double modalElevation = 8.0;

//   // Icon sizes
//   static const double iconXs = 16.0;
//   static const double iconSm = 20.0;
//   static const double iconMd = 24.0;
//   static const double iconLg = 32.0;
//   static const double iconXl = 48.0;

//   // Responsive breakpoints
//   static const double mobileBreakpoint = 768.0;
//   static const double tabletBreakpoint = 1024.0;
//   static const double desktopBreakpoint = 1440.0;

//   /// Check if device is mobile
//   static bool isMobile(BuildContext context) {
//     return MediaQuery.of(context).size.width < mobileBreakpoint;
//   }

//   /// Check if device is tablet
//   static bool isTablet(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     return width >= mobileBreakpoint && width < tabletBreakpoint;
//   }

//   /// Check if device is desktop
//   static bool isDesktop(BuildContext context) {
//     return MediaQuery.of(context).size.width >= tabletBreakpoint;
//   }

//   /// Responsive padding based on screen size
//   static EdgeInsets responsivePadding(BuildContext context) {
//     if (isMobile(context)) {
//       return const EdgeInsets.all(md);
//     } else if (isTablet(context)) {
//       return const EdgeInsets.all(lg);
//     } else {
//       return const EdgeInsets.all(xl);
//     }
//   }
// }

import 'package:flutter/material.dart';

/// A utility class for consistent sizing, spacing, and responsive design across devices.
/// Supports Android, iOS, tablets, iPads, foldables, and desktops.
class AppSizes {
  AppSizes._();

  // Spacing values following an 8px grid system (aligned with Material Design)
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;

  // Border radius values
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusXxl = 32.0;
  static const double radiusFull = 9999.0;

  // Typography sizes (scaled with TextScaler for accessibility)
  static const double textXs = 12.0;
  static const double textSm = 14.0;
  static const double textMd = 16.0;
  static const double textLg = 18.0;
  static const double textXl = 20.0;
  static const double textXxl = 24.0;
  static const double textHeadline = 32.0;

  // Component dimensions
  static const double buttonHeightXs = 36.0;
  static const double buttonHeightSm = 40.0;
  static const double buttonHeightMd = 48.0;
  static const double buttonHeightLg = 56.0;
  static const double inputHeight = 56.0;
  static const double appBarHeightSm = 56.0;
  static const double appBarHeightMd = 64.0;
  static const double appBarHeightLg = 72.0;
  static const double cardElevation = 2.0;
  static const double modalElevation = 8.0;
  static const double avatarSizeSm = 32.0;
  static const double avatarSizeMd = 48.0;
  static const double avatarSizeLg = 64.0;
  static const double dividerThickness = 1.0;
  static const double fabSize = 56.0;

  // Icon sizes
  static const double iconXs = 16.0;
  static const double iconSm = 20.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;

  // Responsive breakpoints (refined for more device types)
  static const double smallPhoneBreakpoint =
      360.0; // Small phones (e.g., iPhone SE)
  static const double phoneBreakpoint = 600.0; // Standard phones
  static const double largePhoneBreakpoint = 768.0; // Large phones, foldables
  static const double tabletBreakpoint = 1024.0; // Tablets, iPads
  static const double desktopBreakpoint = 1440.0; // Desktops, large tablets

  /// Scaling factor based on screen density and size
  static double getScaleFactor(BuildContext context) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final width = MediaQuery.of(context).size.width;
    return (pixelRatio.clamp(1.0, 3.0) * (width / phoneBreakpoint))
        .clamp(0.8, 1.5);
  }

  /// Responsive font size with accessibility support
  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    final scaleFactor = getScaleFactor(context);
    final textScaler = MediaQuery.textScalerOf(context);
    return textScaler.scale(baseSize * scaleFactor);
  }

  /// Device type checks
  static bool isSmallPhone(BuildContext context) {
    return MediaQuery.of(context).size.width < smallPhoneBreakpoint;
  }

  static bool isPhone(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= smallPhoneBreakpoint && width < largePhoneBreakpoint;
  }

  static bool isLargePhone(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= largePhoneBreakpoint && width < tabletBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= tabletBreakpoint && width < desktopBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  /// Check if the device is in landscape orientation
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Responsive padding based on device type and orientation
  static EdgeInsets responsivePadding(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (isSmallPhone(context)) {
      return EdgeInsets.symmetric(
          horizontal: sm, vertical: isLandscape ? xs : sm);
    } else if (isPhone(context)) {
      return EdgeInsets.symmetric(
          horizontal: md, vertical: isLandscape ? sm : md);
    } else if (isLargePhone(context)) {
      return EdgeInsets.symmetric(
          horizontal: lg, vertical: isLandscape ? md : lg);
    } else if (isTablet(context)) {
      return EdgeInsets.symmetric(
          horizontal: xl, vertical: isLandscape ? lg : xl);
    } else {
      return EdgeInsets.symmetric(
          horizontal: xxl, vertical: isLandscape ? xl : xxl);
    }
  }

  /// Responsive margin for content
  static EdgeInsets responsiveMargin(BuildContext context) {
    return responsivePadding(context); // Can be customized separately if needed
  }

  /// Responsive button height
  static double getButtonHeight(BuildContext context) {
    if (isSmallPhone(context)) return buttonHeightSm;
    if (isTablet(context) || isDesktop(context)) return buttonHeightLg;
    return buttonHeightMd;
  }

  /// Responsive app bar height
  static double getAppBarHeight(BuildContext context) {
    if (isSmallPhone(context)) return appBarHeightSm;
    if (isTablet(context) || isDesktop(context)) return appBarHeightLg;
    return appBarHeightMd;
  }

  /// Responsive icon size
  static double getIconSize(BuildContext context, {double baseSize = iconMd}) {
    final scaleFactor = getScaleFactor(context);
    return baseSize * scaleFactor;
  }

  /// Safe area insets for notched devices
  static EdgeInsets safeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  /// Maximum content width for large screens
  static double getMaxContentWidth(BuildContext context) {
    if (isDesktop(context)) return 1200.0;
    if (isTablet(context)) return 800.0;
    return MediaQuery.of(context).size.width;
  }

  /// Responsive border radius
  static double getBorderRadius(BuildContext context,
      {double baseRadius = radiusMd}) {
    final scaleFactor = getScaleFactor(context);
    return baseRadius * (isTablet(context) || isDesktop(context) ? 1.2 : 1.0);
  }
}
