part of 'salon_services_cubit.dart';

abstract class SalonServicesState extends Equatable {
  const SalonServicesState();

  @override
  List<Object> get props => [];
}

class SalonServicesInitial extends SalonServicesState {}

class SalonTabChanged extends SalonServicesState {
  final int selectedIndex;

  const SalonTabChanged(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class BookingState extends SalonServicesState {}

class ReviewState extends SalonServicesState {}
