import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/widgets/input_text_field.dart';
import '../../../../core/constant/widgets/label_text.dart';
import '../../../../core/constant/widgets/primary_button.dart';
import '../controllers/login_page_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginPageController controller = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              /// Title+SubTitle Text
              Center(
                child: Text(
                  "Welcome Back",
                  style: AppTextStyles.title24(context),
                ),
              ),
              SizedBox(height: 12.h),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Sign in to access your account and dashboard.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regular_16(context),
                  ),
                ),
              ),
              SizedBox(height: 40.h),

              /// Input Fields
              LabelText(context: context, text: "Email Address"),
              InputTextField(
                controller: controller.emailController,
                hintText: "Enter your email address",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),

              LabelText(context: context, text: "Password"),
              Obx(
                () => InputTextField(
                  controller: controller.passwordController,
                  hintText: "Enter your password",
                  obscureText: controller.isPasswordHidden.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.boxTextColor,
                    ),
                    onPressed: () {
                      controller.isPasswordHidden.value =
                          !controller.isPasswordHidden.value;
                    },
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // Remember Me Checkbox
              Row(
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.rememberMe.value =
                            !controller.rememberMe.value;
                      },
                      child: Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.textColor,
                            width: 1,
                          ),
                          color: controller.rememberMe.value
                              ? AppColors.primaryColor
                              : Colors.transparent,
                        ),
                        child: controller.rememberMe.value
                            ? Icon(
                                Icons.check,
                                size: 16.sp,
                                color: AppColors.whiteColor,
                              )
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    "Remember Me",
                    style: AppTextStyles.regular_16(context),
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              // Login Button
              PrimaryButton(
                text: "Login",
                onPressed: () => controller.login(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
