import 'package:demoappfortest/screens/demo.dart';
import 'package:demoappfortest/screens/login_with_otp_widget.dart';
import 'package:demoappfortest/screens/seat_selection_screen.dart';
import 'package:demoappfortest/utils/app_colors.dart';
import 'package:demoappfortest/utils/app_custom_theme.dart';
import 'package:demoappfortest/utils/app_sizes.dart';
import 'package:demoappfortest/utils/app_typography.dart';
import 'package:demoappfortest/utils/app_widget_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_custom_theme.dart';

class LoginWithOtpScreen extends StatefulWidget {
  const LoginWithOtpScreen({super.key});

  @override
  State<LoginWithOtpScreen> createState() => _LoginWithOtpScreenState();
}

class _LoginWithOtpScreenState extends State<LoginWithOtpScreen>
    with TickerProviderStateMixin {
  late final AnimationController _containerController;
  late final AnimationController _logoController;
  late final AnimationController _pulseController;
  late final Animation<Offset> _containerOffset;
  late final Animation<double> _containerOpacity;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoOpacity;
  late final Animation<double> _pulseAnimation;

  bool showContainer = false;
  bool isValidNumber = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _containerController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _logoController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _pulseController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..repeat(reverse: true);

    _containerOffset =
        Tween<Offset>(begin: Offset(0, 2), end: Offset.zero).animate(
      CurvedAnimation(parent: _containerController, curve: Curves.elasticOut),
    );

    _containerOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _containerController, curve: Curves.easeInOut),
    );

    _logoScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 200));
    _logoController.forward();
    await Future.delayed(Duration(milliseconds: 600));
    setState(() => showContainer = true);
    await _containerController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    _logoController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  TextEditingController _phoneController = TextEditingController();

  void _validatePhoneNumber(String value) {
    setState(() {
      isValidNumber = value.length == 10 && RegExp(r'^[0-9]+$').hasMatch(value);
    });
  }

  Future<void> _handleSendOtp() async {
    if (!isValidNumber) return;

    setState(() => isLoading = true);

    // Simulate API call
    await Future.delayed(Duration(milliseconds: 1500));

    setState(() => isLoading = false);

    // Navigate to OTP screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SeatBookingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<AppCustomTheme>()!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: customTheme.gradients.primary,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.isMobile(context)
                ? customTheme.spacing.md
                : AppSizes.isTablet(context)
                    ? customTheme.spacing.lg
                    : customTheme.spacing.xl),
        child: Column(
          children: [
            Spacer(),
            // Enhanced Logo Animation
            AnimatedBuilder(
              animation: _logoController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _logoOpacity,
                  child: ScaleTransition(
                    scale: _logoScale,
                    child: AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _pulseAnimation.value,
                          child: Container(
                            height: AppSizes.isMobile(context) ? 80 : 100,
                            width: AppSizes.isMobile(context) ? 80 : 100,
                            decoration: BoxDecoration(
                              color: AppColors.lightColorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                ...customTheme.shadows.small,
                                BoxShadow(
                                  color: AppColors.lightColorScheme.primary
                                      .withOpacity(0.5),
                                  blurRadius: 20,
                                  spreadRadius: 4,
                                ),
                                BoxShadow(
                                  color: AppColors.lightColorScheme.primary
                                      .withOpacity(0.3),
                                  blurRadius: 35,
                                  spreadRadius: 8,
                                ),
                                BoxShadow(
                                  color: AppColors.lightColorScheme.primary
                                      .withOpacity(0.1),
                                  blurRadius: 50,
                                  spreadRadius: 12,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  AppSizes.isMobile(context) ? 16 : 20),
                              child: Image.asset('assets/images/logo.png'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: AppSizes.xl),
            // Welcome Text Animation
            AnimatedBuilder(
              animation: _logoController,
              builder: (context, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, 1),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _logoController,
                    curve: Interval(0.5, 1.0, curve: Curves.easeOut),
                  )),
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _logoController,
                        curve: Interval(0.5, 1.0, curve: Curves.easeOut),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Welcome Back!",
                          style:
                              AppTypography.textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.lightColorScheme.onPrimary,
                            fontSize: AppSizes.isMobile(context) ? 24 : 28,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppSizes.sm),
                        Text(
                          "Sign in to continue",
                          style: AppTypography.textTheme.bodyMedium!.copyWith(
                            color: AppColors.lightColorScheme.onPrimary
                                .withOpacity(0.8),
                            fontSize: AppSizes.isMobile(context) ? 14 : 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Spacer(),
            // Enhanced Container
            if (showContainer)
              SlideTransition(
                position: _containerOffset,
                child: FadeTransition(
                  opacity: _containerOpacity,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    padding:
                        EdgeInsets.all(AppSizes.isMobile(context) ? 20 : 24),
                    decoration: BoxDecoration(
                      color: AppColors.lightColorScheme.onPrimary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSizes.radiusXl + 8),
                        topRight: Radius.circular(AppSizes.radiusXl + 8),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Handle indicator
                          Center(
                            child: Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          SizedBox(height: AppSizes.lg),

                          // Title
                          Text(
                            "Phone Verification",
                            style:
                                AppTypography.textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                              fontSize: AppSizes.isMobile(context) ? 20 : 24,
                            ),
                          ),
                          SizedBox(height: AppSizes.sm),
                          Text(
                            "We'll send you a verification code to verify your phone number",
                            style: AppTypography.textTheme.bodyMedium!.copyWith(
                              color: Colors.grey[600],
                              fontSize: AppSizes.isMobile(context) ? 14 : 16,
                            ),
                          ),
                          SizedBox(height: AppSizes.xl),

                          // Phone Number Label
                          Text(
                            "Phone Number",
                            style: AppTypography.textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: AppSizes.sm),

                          // Enhanced Text Field
                          AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: AppSizes.buttonHeight,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isValidNumber
                                    ? AppColors.primaryBlue
                                    : Colors.grey[300]!,
                                width: isValidNumber ? 2 : 1,
                              ),
                              boxShadow: isValidNumber
                                  ? [
                                      BoxShadow(
                                        color: AppColors.primaryBlue
                                            .withOpacity(0.1),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ]
                                  : [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Colors.black.withOpacity(0.05),
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                            ),
                            child: TextField(
                              onChanged: _validatePhoneNumber,
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              style:
                                  AppTypography.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Container(
                                  margin: EdgeInsets.only(right: AppSizes.sm),
                                  width: 75,
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.phone_outlined,
                                        color: isValidNumber
                                            ? AppColors.primaryBlue
                                            : AppColors.neutral500,
                                        size: 20,
                                      ),
                                      SizedBox(width: AppSizes.xs),
                                      Text(
                                        "+91",
                                        style: AppTypography
                                            .textTheme.bodyMedium!
                                            .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(width: AppSizes.xs),
                                      Container(
                                        width: 1,
                                        height: 24,
                                        color: Colors.grey[400],
                                      ),
                                    ],
                                  ),
                                ),
                                suffixIcon: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 200),
                                  child: isValidNumber
                                      ? Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 22,
                                          key: ValueKey('check'),
                                        )
                                      : SizedBox.shrink(key: ValueKey('empty')),
                                ),
                                hintText: 'Enter mobile number',
                                hintStyle: AppTypography.textTheme.bodyMedium!
                                    .copyWith(
                                  color: Colors.grey[500],
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                                counterText: '',
                              ),
                            ),
                          ),
                          SizedBox(height: AppSizes.xl),

                          // Enhanced Button
                          AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            width: double.infinity,
                            height: AppSizes.buttonHeight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isValidNumber
                                    ? AppColors.primaryBlue
                                    : Colors.grey[300],
                                foregroundColor: Colors.white,
                                elevation: isValidNumber ? 4 : 1,
                                shadowColor: isValidNumber
                                    ? AppColors.primaryBlue.withOpacity(0.3)
                                    : Colors.grey.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: isValidNumber && !isLoading
                                  ? _handleSendOtp
                                  : null,
                              child: isLoading
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.send_rounded,
                                          color: isValidNumber
                                              ? Colors.white
                                              : Colors.grey[500],
                                          size: 20,
                                        ),
                                        SizedBox(width: AppSizes.sm),
                                        Text(
                                          "Send verification code",
                                          style: AppTypography
                                              .textTheme.labelLarge!
                                              .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: isValidNumber
                                                ? Colors.white
                                                : Colors.grey[500],
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          SizedBox(height: AppSizes.lg),

                          // Sign up link
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: AppTypography.textTheme.bodyMedium!
                                      .copyWith(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Demo()),
                                    );
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: AppTypography.textTheme.bodyMedium!
                                        .copyWith(
                                      color: AppColors.primaryBlue,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
