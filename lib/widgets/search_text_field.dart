import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../helpers/app_utils.dart';
import '../view_models/home_view_model/home_view_model.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController _searchTextEditingController;

  @override
  void initState() {
    super.initState();
    _searchTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: EdgeInsets.only(
        top: Utils.getHeight(Utils.appBarHeight),
        left: Utils.getWidth(20.0),
        right: Utils.getWidth(20.0),
        bottom: Utils.getHeight(15.0),
      ),
      child: TextField(
        controller: _searchTextEditingController,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          hintText: "Search",
          prefixIcon: const Icon(
            Icons.search_rounded,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              _searchTextEditingController.clear();
              FocusScope.of(context).unfocus();
            },
            child: const Icon(
              Icons.close_rounded,
            ),
          ),
        ),
        onSubmitted: (text) {
          context.read<HomeViewModel>().searchEvents(text);
        },
      ),
    );
  }
}
