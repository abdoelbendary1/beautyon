import 'package:flutter/material.dart';

class CustomerTypeSelector extends StatefulWidget {
  final Function(String) onSelected;

  const CustomerTypeSelector({Key? key, required this.onSelected})
      : super(key: key);

  @override
  _CustomerTypeSelectorState createState() => _CustomerTypeSelectorState();
}

class _CustomerTypeSelectorState extends State<CustomerTypeSelector> {
  String _selectedType = "Women";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRadioOption("Women"),
        _buildRadioOption("Child"),
        _buildRadioOption("Men"),
      ],
    );
  }

  Widget _buildRadioOption(String type) {
    return Row(
      children: [
        Radio<String>(
          value: type,
          groupValue: _selectedType,
          activeColor: Colors.purple,
          onChanged: (value) {
            setState(() {
              _selectedType = value!;
              widget.onSelected(value);
            });
          },
        ),
        Text(type, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
/* import 'package:beautyon/Domain/Entity/customer_type_entity.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/cubit/Customer_type_state.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/cubit/customer_selcetor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerTypeSelector extends StatelessWidget {
  final CustomerTypeSelectorCubit cubit;
  final Function(CustomerType) onSelected;

  const CustomerTypeSelector({
    Key? key,
    required this.cubit,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerTypeSelectorCubit, CustomerTypeState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is CustomerTypeChanged) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRadioOption(CustomerType(id: "1", name: "Women"),
                  state.customerType, context),
              _buildRadioOption(CustomerType(id: "2", name: "Child"),
                  state.customerType, context),
              _buildRadioOption(CustomerType(id: "3", name: "Men"),
                  state.customerType, context),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRadioOption(CustomerType(id: "1", name: "Women"),
                  CustomerType(id: "1", name: "Women"), context),
              _buildRadioOption(CustomerType(id: "2", name: "Child"),
                  CustomerType(id: "1", name: "Women"), context),
              _buildRadioOption(CustomerType(id: "3", name: "Men"),
                  CustomerType(id: "3", name: "Men"), context),
            ],
          );
        }
      },
    );
  }

  Widget _buildRadioOption(
      CustomerType type, CustomerType selectedType, BuildContext context) {
    return Row(
      children: [
        Radio<CustomerType>(
          value: type,
          groupValue: selectedType,
          activeColor: Colors.purple,
          onChanged: (value) {
            if (value != null) {
              context.read<CustomerTypeSelectorCubit>().selectType(value);

              /*      cubit.selectType(value); */
              /*  onSelected(value); */
              print(value.name);
            }
          },
        ),
        Text(
          type.name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
 */