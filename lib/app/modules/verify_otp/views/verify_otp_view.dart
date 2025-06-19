import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getx_structure_template/app/core/base/base.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/widget/custom_app_bar.dart';
import '../controllers/verify_otp_controller.dart';

class VerifyOtpView extends BaseView<VerifyOtpController> {
  VerifyOtpView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: "Verify OTP");
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            "Enter Verification Code",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text("We’ve sent a code to your email"),
          SizedBox(height: 20),
          PinCodeTextField(
            appContext: context,
            length: 6,
            keyboardType: TextInputType.number,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              selectedFillColor: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 45,
              fieldWidth: 45,
              inactiveColor: Colors.black12,
              activeColor: Color(0xffb54c4c).withValues(alpha: 0.5),
              selectedColor: Colors.black,
            ),
            onChanged: (value) {},
            onCompleted: (value) {},
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                controller.verifyOtp();
              },
              child: Text(
                "VERIFY",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: "Didn’t receive the code? ",
              style: TextStyle(color: Colors.black87),
              children: [
                TextSpan(
                  text: "RESEND",
                  style: TextStyle(
                    color: Color(0xffb54c4c),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
