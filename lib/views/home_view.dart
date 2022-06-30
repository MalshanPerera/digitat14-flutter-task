import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../models/events_model.dart';
import '../view_models/home_view_model/home_view_model.dart';
import '../widgets/no_search_results.dart';
import '../widgets/search_text_field.dart';
import '../widgets/type_head_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                Selector<HomeViewModel, List<Event>?>(
                  selector: (_, vm) => vm.events,
                  builder: (_, events, __) {
                    if (events == null) {
                      return const NoSearchResults();
                    }

                    if (events.isEmpty) {
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
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: TypeHeadTile(
                              event: events[index],
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/details', arguments: events[index]);
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
