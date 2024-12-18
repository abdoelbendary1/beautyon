import 'package:beautyon/Core/Components/reusable_screen.dart';
import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Data/model/serviceEntity.dart';
import 'package:beautyon/Domain/Entity/customer_type_entity.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/cubit/Customer_type_state.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/cubit/customer_selcetor_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/cubit/service_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/customer_type_selector.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/service_card.dart';
import 'package:beautyon/Presentation/Home/Tabs/cubit/tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceScreen extends StatelessWidget {
  ServiceCubit cubit = getIt<ServiceCubit>();
  CustomerTypeSelectorCubit customerTypeSelectorCubit =
      getIt<CustomerTypeSelectorCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, TabState>(
      builder: (context, state) {
        return ReusableScreen(
          title: "Service",
          prefixIcon: Icons.arrow_back,
          suffixIcon: Icons.search,
          onPrefixTap: () => context.read<TabCubit>().setTabIndex(0),
          onSuffixTap: () => print("Refresh Services"),
          emptyBody: Container(),
          emptyMessage: "",
          imagePath: "",
          isEmpty: false,
          nonEmptyBody: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Customer Type",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              BlocBuilder<CustomerTypeSelectorCubit, CustomerTypeState>(
                bloc: customerTypeSelectorCubit,
                builder: (context, state) {
                  return CustomerTypeSelector(
                    onSelected: (type) => print("Selected Type: //"),
                    /*                       cubit: customerTypeSelectorCubit,
     */
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Choose Service",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              BlocBuilder<ServiceCubit, ServiceState>(
                builder: (context, state) {
                  return buildServicesList(cubit.services);
                },
              ),
              AppSpacing.small
            ],
          ),
        );
      },
    );
  }

  Expanded buildServicesList(List<ServiceEntity> services) {
    return Expanded(
      child: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ServiceCard(
            service: services[index],
            onAddToFavorites: () {},
            onBookNow: () {},
          ),
        ),
      ),
    );
  }
}
