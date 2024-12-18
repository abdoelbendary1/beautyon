import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/widgets/ServiceListSection.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final List<String> networkImages = [
    AppImages.ad1,
    AppImages.ad2,
    AppImages.ad3,
  ];
  final List<ServiceItem> services = [
    ServiceItem(imageUrl: AppImages.onboarding1, title: "Hair Care"),
    ServiceItem(imageUrl: AppImages.onboarding2, title: "Facial"),
    ServiceItem(imageUrl: AppImages.onboarding3, title: "Nail Spa"),
    ServiceItem(imageUrl: AppImages.onboarding1, title: "Hair Care"),
    ServiceItem(imageUrl: AppImages.onboarding2, title: "Facial"),
    ServiceItem(imageUrl: AppImages.onboarding1, title: "Nail Spa"),
    ServiceItem(imageUrl: AppImages.onboarding2, title: "Hair Care"),
    ServiceItem(imageUrl: AppImages.onboarding1, title: "Facial"),
    ServiceItem(imageUrl: AppImages.onboarding3, title: "Nail Spa"),
  ];
}
