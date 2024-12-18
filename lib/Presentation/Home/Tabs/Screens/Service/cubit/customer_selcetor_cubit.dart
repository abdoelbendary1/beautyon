import 'package:beautyon/Domain/Entity/customer_type_entity.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/cubit/Customer_type_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerTypeSelectorCubit extends Cubit<CustomerTypeState> {
  CustomerTypeSelectorCubit() : super(CustomerTypeInitial());

/*   void selectType(CustomerType type) => emit(type);
 */

  void selectType(CustomerType customerType) {
    emit(CustomerTypeChanged(customerType: customerType));
  }
}
