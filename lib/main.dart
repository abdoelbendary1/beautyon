import 'package:beautyon/Core/service/my_observer.dart';
import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/beautyonApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  setupServiceLocator();
  runApp(const BeautyAppUserEdition());
}
