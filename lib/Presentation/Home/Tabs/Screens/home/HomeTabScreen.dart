import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/cubit/home_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/helpers/homeTabWidgetsHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final HomeCubit cubit = getIt<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            // Fixed Header Section
            HomeTabHelper().buildSliverAppBar(),
            // Main Body Content
            HomeTabHelper().buildHomeBody(context, cubit: cubit),
          ],
        ),
      ),
    );
  }
}
