// lib/core/theme/app_typography.dart
/// Typography system with consistent font sizes and weights
/// Supports responsive scaling and accessibility
///
///
///
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  /// Base font family - using Google Fonts for better typography
  static String get fontFamily => GoogleFonts.inter().fontFamily!;

  /// Font weights for consistent typography
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  /// Custom text theme with responsive font sizes
  static TextTheme get textTheme {
    return TextTheme(
      // Display styles - largest text on screen
      displayLarge: GoogleFonts.inter(
        fontSize: 57.0,
        fontWeight: regular,
        letterSpacing: -0.25,
        height: 1.12,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 45.0,
        fontWeight: regular,
        letterSpacing: 0.0,
        height: 1.16,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 36.0,
        fontWeight: regular,
        letterSpacing: 0.0,
        height: 1.22,
      ),

      // Headline styles - high-emphasis text
      headlineLarge: GoogleFonts.inter(
        fontSize: 32.0,
        fontWeight: regular,
        letterSpacing: 0.0,
        height: 1.25,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28.0,
        fontWeight: regular,
        letterSpacing: 0.0,
        height: 1.29,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24.0,
        fontWeight: regular,
        letterSpacing: 0.0,
        height: 1.33,
      ),

      // Title styles - medium-emphasis text
      titleLarge: GoogleFonts.inter(
        fontSize: 22.0,
        fontWeight: regular,
        letterSpacing: 0.0,
        height: 1.27,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16.0,
        fontWeight: medium,
        letterSpacing: 0.1,
        height: 1.50,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14.0,
        fontWeight: medium,
        letterSpacing: 0.1,
        height: 1.43,
      ),

      // Body styles - readable text
      bodyLarge: GoogleFonts.inter(
        fontSize: 16.0,
        fontWeight: regular,
        letterSpacing: 0.15,
        height: 1.50,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14.0,
        fontWeight: regular,
        letterSpacing: 0.25,
        height: 1.43,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12.0,
        fontWeight: regular,
        letterSpacing: 0.4,
        height: 1.33,
      ),

      // Label styles - UI elements
      labelLarge: GoogleFonts.inter(
        fontSize: 14.0,
        fontWeight: medium,
        letterSpacing: 0.1,
        height: 1.43,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12.0,
        fontWeight: medium,
        letterSpacing: 0.5,
        height: 1.33,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11.0,
        fontWeight: medium,
        letterSpacing: 0.5,
        height: 1.45,
      ),
    );
  }

  /// Responsive font size helper
  static double responsiveFontSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaleFactor = screenWidth / 375.0; // Base width (iPhone 8)
    return baseSize * scaleFactor.clamp(0.8, 1.2);
  }
}
