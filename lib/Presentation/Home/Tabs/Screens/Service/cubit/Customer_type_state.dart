import 'package:beautyon/Domain/Entity/customer_type_entity.dart';
import 'package:equatable/equatable.dart';

sealed class CustomerTypeState extends Equatable {
  const CustomerTypeState();

  @override
  List<Object> get props => [];
}

final class CustomerTypeInitial extends CustomerTypeState {
    CustomerType customerType = CustomerType(id: "0", name: "Women");

}

final class CustomerTypeChanged extends CustomerTypeState {
  CustomerType customerType;
  CustomerTypeChanged({required this.customerType});
}
