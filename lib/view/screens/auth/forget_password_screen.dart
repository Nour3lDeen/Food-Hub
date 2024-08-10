
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/view_model/cubits/auth_cubit/auth_cubit.dart';
import 'package:restaurant/view_model/utils/app_assets/app_assets.dart';
import 'package:restaurant/view_model/utils/app_colors/app_colors.dart';
import 'package:restaurant/view_model/utils/snackbar/snackbar_helper.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            key: AuthCubit.get(context).forgetPasswordFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password Reset",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "Enter your email address and we will send you a link to reset your password",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  controller:
                      AuthCubit.get(context).forgetPasswordEmailController,
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
                        borderSide: const BorderSide(color: AppColors.orange)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide:
                            BorderSide(color: AppColors.black.withOpacity(.5))),
                    hintText: 'Email',
                    focusColor: AppColors.orange,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is ForgetPasswordErrorState) {
                        SnackBarHelper.showError(context, state.msg);
                      }
                       else if (state is ForgetPasswordSuccessState) {
                        SnackBarHelper.showMessage(context, 'Check your email');
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      if (state is ForgetPasswordLoadingState) {
                        return const CircularProgressIndicator.adaptive();
                      }
                      return InkWell(
                        borderRadius: BorderRadius.circular(20.r),
                        onTap: () {
                          if (AuthCubit.get(context)
                              .forgetPasswordFormKey
                              .currentState!
                              .validate()) {
                            AuthCubit.get(context).forgetPasswordFirebase();
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
                              'Send Link',
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 18.sp),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
