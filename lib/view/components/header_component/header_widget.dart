
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/model/header_model/header.dart';
import 'package:restaurant/view_model/utils/app_assets/app_assets.dart';
import 'package:restaurant/view_model/utils/app_colors/app_colors.dart';


class HeaderWidget extends StatelessWidget {
  final Header header;
final Function() onTap;
  const HeaderWidget({required this.header, super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Expanded(
            child: Text(
              header.title ?? '',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
InkWell(

  borderRadius: BorderRadius.circular(12.r),
  onTap: onTap,
  child: Row(
    children: [
      Text('View All', style: TextStyle(fontSize: 14.sp, color: AppColors.orange),),
      SizedBox(width: 6.w,),
      SvgPicture.asset(AppAssets.arrow)
    ],
  ),
)

        ],

    );
  }
}
