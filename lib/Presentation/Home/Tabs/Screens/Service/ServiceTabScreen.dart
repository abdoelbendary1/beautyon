import 'package:beautyon/Core/Components/reusable_screen.dart';
import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Data/Model/serviceEntity.dart';
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
              Padding(
                padding: AppPadding.medium,
                child: Text("Customer Type",
                    style: AppTextStyles.normalTextStyle(
                        18, AppColors.blackColor)),
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
              Padding(
                padding:
                    AppPadding.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Text("Choose Service",
                    style: AppTextStyles.normalTextStyle(
                        18, AppColors.blackColor)),
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
          padding: AppPadding.small,
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
