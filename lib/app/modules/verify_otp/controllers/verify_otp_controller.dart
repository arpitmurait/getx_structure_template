import 'package:getx_structure_template/app/core/base/base.dart';
import 'package:get/get.dart';
import '../../../data/repository/auth/auth_repository.dart';
import '../../../routes/app_pages.dart';
import '../../forgot_password/controllers/forgot_password_controller.dart';

class VerifyOtpController extends BaseController {
  final AuthRepository _repository = Get.find(tag: (AuthRepository).toString());
  String otpValue = "";

  void verifyOtp(){
    ForgotPasswordController controller = Get.find();
    var verifyOtpService = _repository.verifyOtp({
      'email' : controller.emailController.text,
      'otp' : otpValue
    });

    callDataService(
      verifyOtpService,
      onSuccess: (response) {
        Get.toNamed(Routes.MAIN);
      },
    );
  }

}
