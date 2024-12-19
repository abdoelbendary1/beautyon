import 'package:beautyon/Core/Utils/Routing/app_path.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Presentation/Auth/cubit/auth_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/cubit/customer_selcetor_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/cubit/service_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/cubit/salon_services_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/cubit/home_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/cubit/tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:screenutil_module/main.dart';

class BeautyAppUserEdition extends StatelessWidget {
  const BeautyAppUserEdition({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => getIt<AuthCubit>(),
        ),
        BlocProvider<TabCubit>(
          create: (context) => getIt<TabCubit>(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => getIt<HomeCubit>(),
        ),
        BlocProvider<ServiceCubit>(
          create: (context) => getIt<ServiceCubit>(),
        ),
        BlocProvider<SalonServicesCubit>(
          create: (context) => getIt<SalonServicesCubit>(),
        ),
        BlocProvider<CustomerTypeSelectorCubit>(
          create: (context) => getIt<CustomerTypeSelectorCubit>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Multi Cubit App',
        home: ScreenUtilInit(
          designSize: Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppPath.splash,
            onGenerateRoute: AppRoutes.generateRoute,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale('en'),
          ),
        ),
      ),
    );
  }
}
