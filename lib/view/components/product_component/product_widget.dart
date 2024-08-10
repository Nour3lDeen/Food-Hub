import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/model/product_model/burger_model.dart';
import 'package:restaurant/model/product_model/chicken_model.dart';
import 'package:restaurant/model/product_model/pizza_model.dart';
import 'package:restaurant/view_model/utils/app_colors/app_colors.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.color,
    required this.onIconTap,
    required this.onWidgetTap,
    required this.image,
    required this.burgerProduct,
    //required this.chickenProduct,
    //required this.pizzaProduct,
  });
  final BurgerProduct burgerProduct;
  //final ChickenProduct chickenProduct;
  //final PizzaProduct pizzaProduct;
  final Color? color;
  final void Function()? onIconTap;
  final void Function()? onWidgetTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),),
        child: InkWell(
          onTap: onWidgetTap,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Image.asset(
                      image,
                    ),
                    PositionedDirectional(
                      top: 12.h,
                      end: 12.w,
                      child: InkWell(
                        onTap: onIconTap,
                        borderRadius: BorderRadius.circular(40.r),
                        child: Container(
                          padding: EdgeInsets.all(6.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.r),
                              color: AppColors.black.withOpacity(.4)),
                          child: Icon(
                            Icons.favorite,
                            color: color,
                            size: 30.sp,
                          ),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 6.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w,right: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[ Text(
                        burgerProduct.name??'Burger',
                        style: (TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        )),
                      ),
                      Text("100",
                        style: (TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.black.withOpacity(0.8),
                        )),
                      ),
                      ]
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 8.w),
                    child: Text('Small',
                      style: (TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.black,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
