import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../helpers/app_config.dart';
import '../../helpers/app_enum.dart';
import '../../helpers/app_errors.dart';
import '../../models/error_model.dart';
import '../../models/events_model.dart';
import '../../services/error_service.dart';
import '../../services/network_service.dart';
import '../clients/home_repository.dart';

class HomeDelegate extends HomeRepository {
  final NetworkService networkService;
  final ErrorService errorService;

  HomeDelegate({required this.networkService, required this.errorService});

  @override
  Future<Events?> getEvents(String searchText) async {
    try {
      var response =
          await networkService.performRequest(AppConfig.getEvents(searchText), HttpAction.GET);

      if (response.statusCode == 200) {
        return await compute(eventsFromJson, response.body);
      } else {
        errorService.showError(
          UnknownFailure(
            ErrorModel.fromJson(
              jsonDecode(response.body),
            ).message,
          ),
        );
        return null;
      }
    } catch (e) {
      errorService.showError(
        UnknownFailure(
          e.toString(),
        ),
      );
      return null;
    }
  }
}
