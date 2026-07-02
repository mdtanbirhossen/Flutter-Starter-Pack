import 'package:get/get.dart';
import '../../auth/login/views/login_page.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    _startSplash();
  }

  Future<void> _startSplash() async {
    // Wait for 3 seconds, then go to Login Page
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(() => LoginPage());
  }
}
