import 'package:adminapp/controller/auth/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginOptionsBar extends StatelessWidget {
  const LoginOptionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
      child: Row(
        children: [
          GetBuilder<LoginController>(
              builder: (controller) => controller.isRememberMeChecked
                  ? IconButton(
                      onPressed: () {
                        controller.toggleRememberMe();
                      },
                      icon: Icon(Icons.check_box))
                  : IconButton(
                      onPressed: () {
                        controller.toggleRememberMe();
                      },
                      icon: Icon(Icons.check_box_outline_blank))),
          SizedBox(width: 5),
          Text("21".tr),
          Spacer(),
          TextButton(
            child: Text("20".tr),
            onPressed: () {
              controller.goToForgetPassword();
            },
          ),
        ],
      ),
    );
  }
}
