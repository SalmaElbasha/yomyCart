import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/presentation/account/cubit/account_cubit.dart';
import 'package:untitled2/presentation/categories/cubit/categories_cubit.dart';
import 'presentation/auth/login/cubit/login_cubit.dart';
import 'presentation/auth/register/cubit/registration_cubit.dart';
import 'presentation/home/cubit/home_cubit.dart';
import 'presentation/resources/strings_manager.dart';
import 'presentation/resources/theme_manager.dart';
import 'presentation/resources/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.homeRoute});
  final String homeRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => HomeCubit()),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => RegistrationCubit()),
        BlocProvider(create: (BuildContext context) => CategoriesCubit()),
        BlocProvider(create: (BuildContext context) => AccountCubit()),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            title: StringsManager.appName,
            theme: getApplicationTheme(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: homeRoute,
          );
        },
      ),
    );
  }
}
