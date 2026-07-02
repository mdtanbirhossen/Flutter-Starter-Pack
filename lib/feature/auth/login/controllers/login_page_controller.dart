import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../home/home_screen.dart';

class LoginPageController extends GetxController {
  static LoginPageController get instance => Get.find();

  /// Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// Observables
  var isPasswordHidden = true.obs;
  var rememberMe = false.obs;

  /// Validation
  String? validateEmail() {
    if (emailController.text.trim().isEmpty) return "Email is required";
    if (!GetUtils.isEmail(emailController.text.trim())) return "Enter a valid email";
    return null;
  }

  String? validatePassword() {
    if (passwordController.text.trim().isEmpty) return "Password is required";
    if (passwordController.text.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  /// MAIN LOGIN FUNCTION
  Future<void> login() async {
    final emailError = validateEmail();
    final passError = validatePassword();

    if (emailError != null || passError != null) {
      EasyLoading.showError(emailError ?? passError!);
      return;
    }

    try {
      EasyLoading.show(status: 'Logging in...');
      
      // Simulate API response delay
      await Future.delayed(const Duration(seconds: 1));
      
      EasyLoading.showSuccess('Login Successful!');
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      EasyLoading.showError('Login failed. Please try again.');
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
