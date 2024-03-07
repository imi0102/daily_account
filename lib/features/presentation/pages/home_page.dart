import 'package:daily_account/core/constants/colors_constants.dart';
import 'package:daily_account/core/constants/size_constants.dart';
import 'package:daily_account/core/resources/utility/style_utility.dart';
import 'package:daily_account/core/resources/utility/utils.dart';
import 'package:daily_account/features/domain/entities/dashboard_entity.dart';
import 'package:daily_account/features/presentation/blocs/add_data_bloc/add_data_bloc.dart';
import 'package:daily_account/features/presentation/pages/add_data_page.dart';
import 'package:daily_account/features/presentation/pages/history_list_page.dart';
import 'package:daily_account/features/presentation/widgets/commonAppbarWithCallback.dart';
import 'package:daily_account/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 29/02/24
 */

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DashboardEntity> dashboardList = [];

  @override
  void initState() {
    dashboardList.add(
      DashboardEntity(
        title: Utils.getString('add_record'),
        iconData: Icons.add,
      ),
    );
    dashboardList.add(
      DashboardEntity(
        title: Utils.getString('financial_track'),
        iconData: Icons.history,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.setLocale(context.locale);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstants.greyBG,
        appBar: CommonAppBarWithCallBack(
          context: context,
          appBarTitle: Utils.getString('app_name'),
          showBackButton: false,
          appBarActions: <Widget>[
            // Add your action icon here
            PopupMenuButton<String>(
              icon: const Icon(Icons.language, color: Colors.white),
              onSelected: (value) async {
                // Handle menu item selection here
                if (value == "en") {
                  context.setLocale(const Locale('en'));
                } else {
                  context.setLocale(const Locale('gu'));
                }
                dashboardList.clear();
                await Future.delayed(const Duration(microseconds: 200), () async {

                  dashboardList.add(
                    DashboardEntity(
                      title: Utils.getString('add_record'),
                      iconData: Icons.add,
                    ),
                  );
                  dashboardList.add(
                    DashboardEntity(
                      title: Utils.getString('financial_track'),
                      iconData: Icons.history,
                    ),
                  );
                });

                setState(() {});
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: 'en',
                    child: Text('English'),
                  ),
                  const PopupMenuItem(
                    value: 'gu',
                    child: Text('ગુજરાતી'),
                  ),
                ];
              },
            ),
            // IconButton(
            //   icon: const Icon(
            //     Icons.refresh,
            //     color: ColorsConstants.white,
            //   ),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (_) => const HistoryListPage(),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: SizeConstants.screenSizeTopBottom,
            horizontal: SizeConstants.screenSizeLeftRight,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 25.0, // Spacing between columns
              mainAxisSpacing: 10.0, // Spacing between rows
            ),
            itemCount: dashboardList.length, // Number of items in the grid
            itemBuilder: (BuildContext context, int index) {
              // Generate a card item for each grid item
              return _buildCardItem(index);
            },
          ),
        ),
        bottomNavigationBar: Text(Utils.getString('add_record')),
      ),
    );
  }

  Widget _buildCardItem(int index) {
    return InkWell(
      onTap: () {
        print('Click:: ${dashboardList[index].title}');
        if (dashboardList[index].title == Utils.getString('add_record')) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) {
                  final adsBloc = serviceLocator<AddDataBloc>();
                  return adsBloc;
                },
                child: const AddDataPage(),
              ),
            ),
          );
        } else if (dashboardList[index].title ==
            Utils.getString('financial_track')) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) {
                  final adsBloc = serviceLocator<AddDataBloc>();
                  return adsBloc;
                },
                child: HistoryListPage(),
              ),
            ),
          );
        }
      },
      child: Card(
        elevation: 3,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                dashboardList[index].iconData,
                size: 24,
              ),
              Text(
                dashboardList[index].title ?? "",
                style: StyleUtility.contentTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
