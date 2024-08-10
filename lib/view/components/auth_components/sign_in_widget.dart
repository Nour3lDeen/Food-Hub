import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/model/sign_in_model/signin_model.dart';
import 'package:restaurant/view_model/utils/app_colors/app_colors.dart';

class SignInWidget extends StatelessWidget {
  final SignInModel signInModel;

  const SignInWidget({required this.signInModel, super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 130.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        padding: EdgeInsets.all(12.sp),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(signInModel.image ?? ''),
            SizedBox(
              width: 12.w,
            ),
            Text(
              signInModel.title ?? '',
              style: TextStyle(color: AppColors.black, fontSize: 14.sp),
            ),
          ],
        )
    );

  }
}
