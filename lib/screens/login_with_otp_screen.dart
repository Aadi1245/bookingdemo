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
  late final Animation<Offset> _containerOffset;
  late final Animation<double> _containerOpacity;

  bool showContainer = false;
  bool isValidNumber = false;

  @override
  void initState() {
    super.initState();

    _containerController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _containerOffset =
        Tween<Offset>(begin: Offset(0, 2), end: Offset.zero).animate(
      CurvedAnimation(parent: _containerController, curve: Curves.elasticOut),
    );

    _containerOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _containerController, curve: Curves.easeInOut),
    );

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 300));
    setState(() => showContainer = true);
    await _containerController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    super.dispose();
  }

  TextEditingController _phoneController = TextEditingController();

  void _validatePhoneNumber(String value) {
    setState(() {
      isValidNumber = value.length == 10 && RegExp(r'^[0-9]+$').hasMatch(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<AppCustomTheme>()!;
    return Scaffold(
      // Gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: customTheme.gradients.primary, // Use your gradient here
        ),
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.isMobile(context)
                ? customTheme.spacing.md
                : AppSizes.isTablet(context)
                    ? customTheme.spacing.lg
                    : customTheme.spacing.xl), //18
        child: Column(
          children: [
            Spacer(),
            if (showContainer)
              SlideTransition(
                position: _containerOffset,
                child: FadeTransition(
                  opacity: _containerOpacity,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    padding: AppSizes.responsivePadding(context),
                    decoration: BoxDecoration(
                      color: AppColors.lightColorScheme.onPrimary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSizes.radiusXl),
                          topRight: Radius.circular(AppSizes.radiusXl)),
                      boxShadow: [
                        customTheme.shadows.small.first,
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: AppSizes.isMobile(context)
                                  ? AppSizes.sm
                                  : AppSizes.xl),
                          // 1. TEXT
                          Text(
                            "Phone Verification",
                            style:
                                AppTypography.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                              height: AppSizes.isMobile(context)
                                  ? AppSizes.md
                                  : AppSizes.xl),
                          Text(
                            "We'll send you a verification code",
                            style: AppTypography.textTheme.titleSmall!.copyWith(
                                fontSize: 12, color: Colors.grey[600]),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(
                              height: AppSizes.isMobile(context)
                                  ? AppSizes.lg
                                  : AppSizes.xxl),

                          // 3. TEXT FIELD
                          Container(
                            height: AppSizes.buttonHeight,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.black26,
                                  offset: Offset(0, 1),
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
                              decoration: InputDecoration(
                                prefixIcon: Container(
                                  margin: EdgeInsets.only(
                                    right: AppSizes.sm,
                                  ),
                                  width: 65,
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Icon(
                                        Icons.phone_outlined,
                                        color: AppColors.neutral500,
                                        size: AppSizes.md + 2,
                                      ),
                                      Spacer(),
                                      Text(
                                        "+91",
                                        style: AppTypography
                                            .textTheme.labelLarge!
                                            .copyWith(
                                          fontSize: AppSizes.md,
                                          color: AppColors.neutral800,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 1,
                                        height: AppSizes.lg + 21,
                                        color: Colors.grey[600],
                                      ),
                                    ],
                                  ),
                                ),
                                suffixIcon: isValidNumber
                                    ? Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: AppSizes.md + 4,
                                      )
                                    : null,
                                hintText: 'Mobile Number',
                                hintStyle: AppTypography.textTheme.labelLarge,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: BorderSide.none),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 20),
                                filled: true,
                                fillColor: Colors.white,
                                counterText: '', // Hide the counter text
                              ),
                            ),
                          ),
                          SizedBox(height: 24),

                          // 4. BUTTON
                          SizedBox(
                            width: double.infinity,
                            height: AppSizes.buttonHeight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isValidNumber
                                    ? AppColors.primaryBlue
                                    : AppColors.neutral300,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: isValidNumber
                                  ? () {
                                      // Handle register
                                    }
                                  : null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  Icon(Icons.send,
                                      color: isValidNumber
                                          ? AppColors.neutral100
                                          : AppColors.neutral400,
                                      size: AppSizes.md + 2),
                                  SizedBox(width: AppSizes.sm),
                                  Text(
                                    "Send verification code",
                                    style: AppTypography.textTheme.labelLarge!
                                        .copyWith(
                                      fontSize: AppSizes.md,
                                      color: isValidNumber
                                          ? AppColors.neutral100
                                          : AppColors.neutral400,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: AppSizes.md),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: AppTypography.textTheme.labelLarge!
                                    .copyWith(
                                  fontSize: AppSizes.md - 3,
                                  color: AppColors.neutral400,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Handle navigation to register screen
                                },
                                child: Text(
                                  "Sign up",
                                  style: AppTypography.textTheme.labelLarge!
                                      .copyWith(
                                    fontSize: AppSizes.md - 3,
                                    color: AppColors.primaryBlue,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
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
