import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Data/model/serviceEntity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());

  final List<ServiceEntity> services = [
    ServiceEntity(
      title: 'Facial Treatment',
      imageUrls: [
        AppImages.onboarding1,
        AppImages.onboarding2,
        AppImages.onboarding3,
      ],
      date: "11:00 AM",
      location: "Zamalek",
      imageUrl: AppImages.onboarding1,
      price: 1200,
      discountedPrice: 950,
      rating: 4.8,
      reviewsCount: 150,
      description:
          'A comprehensive facial treatment that includes deep cleansing, exfoliation, and moisturizing to rejuvenate your skin.',
      keyTopics: [
        'Deep pore cleansing',
        'Facial massage techniques',
        'Hydration and exfoliation',
        'Anti-aging treatments',
      ],
    ),
    ServiceEntity(
      title: 'Hair Styling',
      imageUrls: [
        AppImages.onboarding1,
        AppImages.onboarding2,
        AppImages.onboarding3,
      ],
      date: "02:00 PM",
      location: "6 October",
      imageUrl: AppImages.onboarding2,
      price: 800,
      discountedPrice: 600,
      rating: 4.6,
      reviewsCount: 120,
      description:
          'Get the trendiest hairstyles and haircuts to suit your personality and look your best.',
      keyTopics: [
        'Haircuts for all styles',
        'Hair straightening and curling',
        'Custom styling for events',
        'Hair care tips',
      ],
    ),
    ServiceEntity(
      title: 'Massage Therapy',
      imageUrls: [
        AppImages.onboarding1,
        AppImages.onboarding2,
        AppImages.onboarding3,
      ],
      date: "05:00 PM",
      location: "Nasr City",
      imageUrl: AppImages.onboarding3,
      price: 1500,
      discountedPrice: 1200,
      rating: 4.9,
      reviewsCount: 200,
      description:
          'A relaxing full-body massage to reduce stress, improve circulation, and promote overall wellness.',
      keyTopics: [
        'Swedish and deep tissue massage',
        'Reflexology and relaxation techniques',
        'Improving blood circulation',
        'Stress and pain relief methods',
      ],
    ),
    ServiceEntity(
      title: 'Manicure & Pedicure',
      imageUrls: [
        AppImages.onboarding1,
        AppImages.onboarding2,
        AppImages.onboarding3,
      ],
      date: "01:00 PM",
      location: "Downtown Cairo",
      imageUrl: AppImages.onboarding1,
      price: 600,
      discountedPrice: 400,
      rating: 4.4,
      reviewsCount: 90,
      description:
          'Pamper yourself with a luxurious manicure and pedicure session for clean, healthy, and polished nails.',
      keyTopics: [
        'Nail shaping and cleaning',
        'Cuticle care and hydration',
        'Hand and foot massage',
        'Polish application techniques',
      ],
    ),
    ServiceEntity(
      title: 'Bridal Makeup',
      imageUrls: [
        AppImages.onboarding1,
        AppImages.onboarding2,
        AppImages.onboarding3,
      ],
      date: "09:00 AM",
      location: "Giza",
      imageUrl: AppImages.onboarding2,
      price: 3000,
      discountedPrice: 2500,
      rating: 4.7,
      reviewsCount: 180,
      description:
          'Perfect your bridal look with expert makeup application tailored to your wedding day vision.',
      keyTopics: [
        'Skin preparation for makeup',
        'Bridal makeup styles (natural, bold, traditional)',
        'Long-lasting makeup techniques',
        'Highlighting and contouring tips',
      ],
    ),
    ServiceEntity(
      title: 'Body Scrub & Polish',
      imageUrls: [
        AppImages.onboarding1,
        AppImages.onboarding2,
        AppImages.onboarding3,
      ],
      date: "04:00 PM",
      location: "Maadi",
      imageUrl: AppImages.onboarding3,
      price: 1100,
      discountedPrice: 850,
      rating: 4.5,
      reviewsCount: 140,
      description:
          'Exfoliate and refresh your skin with a luxurious body scrub and polish treatment.',
      keyTopics: [
        'Body exfoliation techniques',
        'Improving skin texture and glow',
        'Benefits of natural scrubs',
        'Post-treatment hydration',
      ],
    ),
  ];
}
