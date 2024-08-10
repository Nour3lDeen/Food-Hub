import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/model/sign_in_model/signin_model.dart';
import 'package:restaurant/view/components/auth_components/sign_in_widget.dart';
import 'package:restaurant/view/screens/auth/forget_password_screen.dart';
import 'package:restaurant/view/screens/auth/sign_up_screen.dart';
import 'package:restaurant/view/screens/home_screen/home_screen.dart';
import 'package:restaurant/view_model/cubits/auth_cubit/auth_cubit.dart';
import 'package:restaurant/view_model/utils/app_assets/app_assets.dart';
import 'package:restaurant/view_model/utils/app_colors/app_colors.dart';
import 'package:restaurant/view_model/utils/navigation/navigation.dart';
import 'package:restaurant/view_model/utils/snackbar/snackbar_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  SvgPicture.asset(AppAssets.topLeftEclipse),
                  SvgPicture.asset(AppAssets.halfCircle),
                ],
              ),
              SvgPicture.asset(AppAssets.topRightEclipse)
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Form(
              key: AuthCubit.get(context).loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 32.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: AuthCubit.get(context).loginEmailController,
                    keyboardType: TextInputType.emailAddress,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    validator: (value) {
                      if ((value ?? '').trim().isEmpty) {
                        return 'Enter a valid email';
                      }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)){
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    cursorColor: AppColors.orange,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColors.red,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColors.orange,
                        ),
                      ),
                      labelStyle: const TextStyle(color: AppColors.black),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide:
                              const BorderSide(color: AppColors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                              color: AppColors.black.withOpacity(.5))),
                      labelText: 'Email',
                      focusColor: AppColors.orange,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                    buildWhen: (previous, current) {
                      if (current is ChangePasswordVisibilityState) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      return TextFormField(
                        controller:
                            AuthCubit.get(context).loginPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        validator: (value) {
                          if ((value ?? '').trim().isEmpty) {
                            return 'Enter a valid password';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        obscureText: !AuthCubit.get(context).showPassword,
                        cursorColor: AppColors.orange,
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: AppColors.red,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: AppColors.red,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: AppColors.orange,
                            ),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                AuthCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              icon: !AuthCubit.get(context).showPassword
                                  ? Icon(Icons.visibility_outlined,
                                      color: AppColors.black.withOpacity(.5))
                                  : Icon(
                                      Icons.visibility_off_outlined,
                                      color: AppColors.black.withOpacity(.5),
                                    )),
                          labelStyle: const TextStyle(color: AppColors.black),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide:
                                  const BorderSide(color: AppColors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(
                                  color: AppColors.black.withOpacity(.5))),
                          labelText: 'Password',
                          focusColor: AppColors.orange,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigation.push(context, const ForgetPasswordScreen());
                      },
                      child: Text(
                        'Forgot Password?',
                        style:
                            TextStyle(color: AppColors.orange, fontSize: 14.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Center(
                    child: BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if(state is LoginSuccessState) {
                          SnackBarHelper.showMessage(context,'Login Successfully');
                          Navigation.pushAndRemove(context, const HomeScreen());
                        }else if(state is LoginErrorState){
                          SnackBarHelper.showError(context, state.msg);
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return InkWell(
                          borderRadius: BorderRadius.circular(20.r),
                          onTap: () {
                            if (AuthCubit.get(context)
                                .loginFormKey
                                .currentState!
                                .validate()) {
                              AuthCubit.get(context).loginFirebase();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            height: 50.h,
                            width: 150.w,
                            padding: EdgeInsets.all(12.sp),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 18.sp),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                              color: AppColors.black, fontSize: 14.sp),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigation.pushAndRemove(
                                  context, const SignUpScreen());
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  color: AppColors.orange, fontSize: 14.sp),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Column(
                    children: [
                      Center(
                          child: Text(
                              'ـــــــــــــــــــــــــــــ    Sign in with   ـــــــــــــــــــــــــــــ',
                              style: TextStyle(
                                color: AppColors.black.withOpacity(.5),
                                fontSize: 14.sp,
                              ))),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SignInWidget(
                            signInModel: SignInModel(
                              image: AppAssets.facebook,
                              title: 'Facebook',
                            ),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          InkWell(
                            onTap: () {
                              AuthCubit.get(context).googleSignIn();
                            },
                            borderRadius: BorderRadius.circular(20.r),
                            child: SignInWidget(
                              signInModel: SignInModel(
                                image: AppAssets.google,
                                title: 'Google',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
