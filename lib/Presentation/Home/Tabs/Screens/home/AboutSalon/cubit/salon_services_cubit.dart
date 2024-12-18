import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Domain/Entity/review_entity.dart';
import 'package:beautyon/Domain/Entity/salon_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'salon_services_state.dart';

class SalonServicesCubit extends Cubit<SalonServicesState> {
  SalonServicesCubit() : super(SalonServicesInitial());
   final List<String> tabs = [
    'About',
    'Service',
    'Specialist',
    'Gallery',
    'Review',
    'Packages'
  ];
  

  final salon = SalonEntity(
    name: "Golden Glow",
    services: "Makeup, Haircuts, Massage, Spa",
    location: "Egypt, 6 October",
    workingHours: "Sun - Thur 10 Am - 1 Am",
    isOpen: true,
    rating: 4,
  );
  final List<ReviewEntity> reviews = [
    ReviewEntity(
      userName: 'Kyle',
      comment: 'The professional was very punctual and respectful',
      imageUrl: AppImages.onboarding1,
      date: '1 Week',
      rating: 4,
    ),
    ReviewEntity(
      userName: 'Jacob Jones',
      comment: 'They listened to my requests and gave great advice',
      imageUrl: AppImages.onboarding1,
      date: '1 Week',
      rating: 5,
    ),
    ReviewEntity(
      userName: 'Jenny Wilson',
      comment:
          'Wasn’t satisfied with the result because it wasn’t what I expected',
      imageUrl: AppImages.onboarding1,
      date: '1 Week',
      rating: 3,
    ),
    ReviewEntity(
      userName: 'Leslie Alexander',
      comment: 'The service was very professional, and the tools were clean',
      imageUrl: AppImages.onboarding1,
      date: '1 Week',
      rating: 5,
    ),
  ];
  void changeTab(int index) {
    emit(SalonTabChanged(index));
  }

  void enterBookingMode() {
    emit(BookingState());
  }

  void enterReviewMode() {
/*     emit(SalonTabChanged(0));
 */
    print('Add Review Pressed');

    emit(ReviewState());
  }
}
