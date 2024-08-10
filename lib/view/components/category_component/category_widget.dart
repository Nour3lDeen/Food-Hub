import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/model/category_model/category_model.dart';
import 'package:restaurant/view_model/utils/app_colors/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
final void Function()? onTap;
  const CategoryWidget({super.key, required this.categoryModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.orange.withOpacity(0.2),
      borderRadius: BorderRadius.circular(40.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(40.r),
        child: Container(
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: AppColors.orange,
          ),
          clipBehavior: Clip.none,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: Image.asset(
                  categoryModel.image??'',
                  fit: BoxFit.fill,
                ).image,
              ),
              SizedBox(height: 10.h),
              Text(categoryModel.name??'',
              style: TextStyle(
                fontSize: 12.sp,
                color:AppColors.white

              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
