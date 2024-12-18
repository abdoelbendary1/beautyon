import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabInitial(selectedIndex: 0));

  void setTabIndex(int index) {
    emit(TabUpdated(selectedIndex: index));
  }
}
