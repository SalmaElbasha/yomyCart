import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '/app.dart';
import '/utilis/bloc_observer.dart';
import '/utilis/consetant.dart';
import 'data/local/shared_prefrences.dart';
import 'presentation/resources/routes_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPref.init();
  LocationPermission permission = await Geolocator.requestPermission();
  token = await SharedPref.getData(key: tokenKey) ?? '';
  refreshToken = await SharedPref.getData(key: refreshTokenKey) ?? '';
  log(token);
  String homeRoute = token.isEmpty ? Routes.guideRoute : Routes.home;
  runApp(
    MyApp(homeRoute: homeRoute),
  );
}
