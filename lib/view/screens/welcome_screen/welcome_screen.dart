import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/model/sign_in_model/signin_model.dart';
import 'package:restaurant/view/components/auth_components/sign_in_widget.dart';
import 'package:restaurant/view/screens/auth/login_screen.dart';
import 'package:restaurant/view/screens/auth/sign_up_screen.dart';
import 'package:restaurant/view_model/utils/app_assets/app_assets.dart';
import 'package:restaurant/view_model/utils/navigation/navigation.dart';
import '../../../view_model/utils/app_colors/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  AppColors.black,
                  AppColors.white,
                ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    tileMode: TileMode.mirror)),
            child: Image.asset(
              AppAssets.welcome,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              AppAssets.gradient,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(24.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Text(
                    'Welcome To',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Food Hub',
                    style: TextStyle(
                        color: AppColors.orange,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Your favourite foods delivered\nfast at your door.',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 160.h,
                  ),
                  Center(
                      child: Text(
                          'ـــــــــــــــــــــــــــــ    Sign in with   ـــــــــــــــــــــــــــــ',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ))),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(20.r),
                        child: SignInWidget(
                          signInModel: SignInModel(
                            image: AppAssets.facebook,
                            title: 'Facebook',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(20.r),
                        child: SignInWidget(
                          signInModel: SignInModel(
                            image: AppAssets.google,
                            title: 'Google',
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigation.pushAndRemove(context, const SignUpScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.sp),
                        width: 280.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.white,
                          ),
                          color: AppColors.white.withOpacity(21 / 100),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            'Sign up with email or phone',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style:
                            TextStyle(color: AppColors.white, fontSize: 14.sp),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigation.push(context, const LoginScreen());
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14.sp,
                            ),
                          ))
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
