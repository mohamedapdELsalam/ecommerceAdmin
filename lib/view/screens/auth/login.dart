import 'package:adminapp/controller/auth/login_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:adminapp/core/functions/alert_exit.dart';
import 'package:adminapp/data/data_source/static/static.dart';
import 'package:adminapp/view/widgets/Auth/auth_button.dart';
import 'package:adminapp/view/widgets/Auth/auth_socialIconsBar.dart';
import 'package:adminapp/view/widgets/Auth/auth_title&subtitle.dart';
import 'package:adminapp/view/widgets/Auth/login_Fields.dart';
import 'package:adminapp/view/widgets/Auth/login_bottomText.dart';
import 'package:adminapp/view/widgets/Auth/login_optionsBar.dart';
import 'package:adminapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("22".tr, style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          alertExit(
            context,
            "warn ",
            " do you want to exit ?",
            "exit",
            "cancel",
          );
        },
        child: ListView(
          children: [
            GetBuilder<LoginController>(
              builder:
                  (controller) => HandlingStatusRequest(
                    controller: controller,
                    statusRequest: controller.statusRequest,
                    widget: Row(
                      children: [
                        if (width >= 1200)
                          Container(
                            height: 700,
                            width: width * 0.35,
                            color: const Color.fromARGB(134, 222, 220, 220),
                            child: Column(
                              children: [
                                Text(
                                  "Imagine as you like",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.08,
                              vertical: hight * 0.01,
                            ),
                            children: [
                              SizedBox(width: double.infinity),
                              LogoApp(bottomMargin: 10, hight: 100, width: 100),
                              TitleAndSubtitleAuth(
                                title: loginTitle,
                                subtitle: loginSubtitle,
                                bottomMargin: 35,
                              ),
                              LoginFields(),
                              LoginOptionsBar(),
                              AuthButton(
                                onPress: () async {
                                  controller.login(context);
                                },
                                title: "22".tr,
                              ),
                              AuthSocialIconsBar(),
                              LoginBottomText(
                                firsText: "38".tr,
                                SecondText: "37".tr,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
