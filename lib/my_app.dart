import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/view/screens/splash_screen/splash_screen.dart';
import 'package:restaurant/view_model/cubits/auth_cubit/auth_cubit.dart';
import 'package:restaurant/view_model/cubits/product_cubit/product_cubit.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return SafeArea(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthCubit>(
                create: (context) => AuthCubit(),
              ),
              BlocProvider<ProductCubit>(
                create: (context) => ProductCubit(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: child,
            ),
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
