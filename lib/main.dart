
import 'package:flutter/material.dart';
import 'package:task_app/presntation/cubit/AdanCubit/order_cubit.dart';
import 'package:task_app/presntation/cubit/internetState/internet_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/dependency_injection.dart';
import 'core/helper/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceInjection().init();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (BuildContext context, Widget? child) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (BuildContext context) => sl<AdanCubit>()),
                  BlocProvider(
                    create: (BuildContext context) =>
                        InternetCubit()..checkConnection(),
                  ),
                ],
                child: GetMaterialApp(
                  initialRoute: RouteHelper.getInitialRoute(),
                  getPages: RouteHelper.routes,
                  debugShowCheckedModeBanner: false,
                )
         ));
  }
}



