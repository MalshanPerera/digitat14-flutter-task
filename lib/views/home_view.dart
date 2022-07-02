import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../helpers/app_strings.dart';
import '../view_models/home_view_model/home_view_model.dart';
import '../widgets/no_search_results.dart';
import '../widgets/search_text_field.dart';
import '../widgets/type_head_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: Column(
              children: [
                const SearchTextField(),
                Consumer<HomeViewModel>(
                  builder: (_, vm, __) {
                    if (vm.events == null) {
                      return const NoSearchResults();
                    }

                    if (vm.events!.isEmpty) {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(
                              backgroundColor: PRIMARY_COLOR,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: vm.events!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: TypeHeadTile(
                              event: vm.events![index],
                              favorites: vm.favorites,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, DETAILS_ROUTE,
                                  arguments: vm.events![index]);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Colors.black,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
