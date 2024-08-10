import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/model/drawer_model/drawer_model.dart';

class DrawerComponent extends StatelessWidget {
  final DrawerModel drawerModel;
  final Function()? onTap;
  const DrawerComponent({super.key, required this.drawerModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
           SvgPicture.asset(drawerModel.icon, height: 25.h, width: 25.w),
           SizedBox(width: 16.w,),
           Text(drawerModel.title , style: TextStyle(fontSize: 16.sp),)
          ],
        ),
      ),
    );
  }
}
