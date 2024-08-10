import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/model/category_model/category_model.dart';
import 'package:restaurant/model/drawer_model/drawer_model.dart';
import 'package:restaurant/model/header_model/header.dart';
import 'package:restaurant/model/product_model/burger_model.dart';
import 'package:restaurant/view/components/category_component/category_widget.dart';
import 'package:restaurant/view/components/drawer_components/drawer_component.dart';
import 'package:restaurant/view/components/header_component/header_widget.dart';
import 'package:restaurant/view/components/product_component/product_widget.dart';
import 'package:restaurant/view/screens/auth/login_screen.dart';
import 'package:restaurant/view_model/cubits/auth_cubit/auth_cubit.dart';
import 'package:restaurant/view_model/cubits/product_cubit/product_cubit.dart';
import 'package:restaurant/view_model/utils/app_assets/app_assets.dart';
import 'package:restaurant/view_model/utils/app_colors/app_colors.dart';
import 'package:restaurant/view_model/utils/navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ProductCubit()..getALlProducts(),
      child: Scaffold(
        appBar: AppBar(
          clipBehavior: Clip.none,
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'Deliver to',
                style: TextStyle(
                    fontSize: 12.sp, color: AppColors.black.withOpacity(.5)),
              ),
              Text(
                'Your Location',
                maxLines: 1,
                style: TextStyle(fontSize: 12.sp, color: AppColors.orange),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 16.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(AppAssets.profilePic,
                    height: 40.h, width: 40.w, fit: BoxFit.fill),
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: Image.asset(AppAssets.profilePic).image,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  /* FirebaseFirestore.instance.collection(FirebaseKeys.users).doc(FirebaseAuth.instance.currentUser?.uid).get().then((value) => value.data()![FirebaseKeys.name]).toString()*/
                  FirebaseAuth.instance.currentUser?.displayName.toString() ??
                      'user',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  FirebaseAuth.instance.currentUser?.email.toString() ?? "User",
                  style: TextStyle(
                      fontSize: 14.sp, color: AppColors.black.withOpacity(.5)),
                ),
                SizedBox(
                  height: 36.h,
                ),
                DrawerComponent(
                  onTap: () {},
                  drawerModel: DrawerModel(
                    icon: AppAssets.myOrders,
                    title: 'My Orders',
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                DrawerComponent(
                  onTap: () {},
                  drawerModel: DrawerModel(
                    icon: AppAssets.profile,
                    title: 'My Profile',
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                DrawerComponent(
                  onTap: () {},
                  drawerModel: DrawerModel(
                    icon: AppAssets.location,
                    title: 'Delivery Location',
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                DrawerComponent(
                  onTap: () {},
                  drawerModel: DrawerModel(
                    icon: AppAssets.settings,
                    title: 'Settings',
                  ),
                ),
                SizedBox(
                  height: 210.h,
                ),
                InkWell(
                  onTap: () {
                    AuthCubit.get(context).signOut();
                    Navigation.pushAndRemove(context, const LoginScreen());
                  },
                  borderRadius: BorderRadius.circular(24.sp),
                  child: Container(
                      padding: EdgeInsets.all(12.sp),
                      width: 120.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(24.sp),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppAssets.logout),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            'Log Out',
                            style: TextStyle(
                                color: AppColors.white, fontSize: 16.sp),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
          child: ListView(
            children: [
              Text(
                'What would you like\nto order',
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24.h,
              ),
              /*SearchBar(
              hintText: 'Search for food',
              hintStyle: MaterialStatePropertyAll<TextStyle>(TextStyle(
                color: AppColors.black.withOpacity(.5),
              )),
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_outlined,
                    color: AppColors.black,
                  )),
              backgroundColor:
                  const MaterialStatePropertyAll<Color>(AppColors.white),
              shadowColor:
                  const MaterialStatePropertyAll<Color>(Colors.transparent),
            ),*/
              IntrinsicWidth(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryWidget(
                        categoryModel: CategoryModel(
                          name: 'Burger',
                          image: AppAssets.burger,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      CategoryWidget(
                        categoryModel: CategoryModel(
                          name: 'Pizza',
                          image: AppAssets.pizza,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      CategoryWidget(
                        categoryModel: CategoryModel(
                          name: 'Chicken',
                          image: AppAssets.chicken,
                        ),
                        onTap: () {},
                      ),
                    ]),
              ),
              SizedBox(
                height: 12.h,
              ),
              HeaderWidget(
                header: Header(
                  title: 'Popular Dishes',
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 12.h,
              ),
              /*SizedBox(
               height: 1000.h,
               child: ListView.separated(
                 shrinkWrap: false,
                   clipBehavior: Clip.none,

                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index) {
                 */ /*BlocBuilder<ProductCubit, ProductState>(
                   buildWhen: (previous, current) {
                     if (current is ChangeFavoriteState) {
                       return true;
                     }
                     return false;
                   },
                   builder: (context, state) {
                     return*/ /* ProductWidget(
                         image: AppAssets.beefBurger,
                         color: ProductCubit
                             .get(context)
                             .isFavorite
                             ? AppColors.red
                             : AppColors.white.withOpacity(.8),
                         onWidgetTap: () {},
                         onIconTap: () {
                           ProductCubit.get(context).changeFavorite();
                         },
                         burgerProduct: ProductCubit.get(context).burgerProducts[index],
                     );
               }, separatorBuilder: (context, index) => SizedBox(height: 12.w), itemCount: ProductCubit.get(context).burgerProducts.length),
             )
*/
              BlocBuilder<ProductCubit, ProductState>(
                buildWhen: (previous, current) {
                  if (current is ChangeFavoriteState) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  return ProductWidget(
                    image: AppAssets.beefBurger,
                    color: ProductCubit.get(context).isFavorite
                        ? AppColors.red
                        : AppColors.white.withOpacity(.8),
                    onWidgetTap: () {},
                    onIconTap: () {
                      ProductCubit.get(context).changeFavorite();
                    },
                    burgerProduct: ProductCubit.get(context).burgerProducts[0],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
