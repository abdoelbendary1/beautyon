import 'package:beautyon/Presentation/Auth/cubit/auth_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/cubit/customer_selcetor_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/cubit/service_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/cubit/salon_services_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/cubit/home_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/cubit/tab_cubit.dart';
import 'package:get_it/get_it.dart';

// Instantiate GetIt
final getIt = GetIt.instance;

// Initialize dependencies
void setupServiceLocator() {
  // Register Repositories
/*   getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
 */
  // Register Cubits
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
  getIt.registerFactory<TabCubit>(() => TabCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<ServiceCubit>(() => ServiceCubit());
  getIt.registerFactory<SalonServicesCubit>(() => SalonServicesCubit());

  getIt.registerFactory<CustomerTypeSelectorCubit>(
      () => CustomerTypeSelectorCubit());
}
