part of 'tab_cubit.dart';

abstract class TabState extends Equatable {
  const TabState();

  @override
  List<Object?> get props => [];
}

class TabInitial extends TabState {
  final int selectedIndex;

  const TabInitial({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}

class TabUpdated extends TabState {
  final int selectedIndex;

  const TabUpdated({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}
