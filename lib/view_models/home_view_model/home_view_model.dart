import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../../models/events_model.dart';

abstract class HomeViewModel extends ChangeNotifier {
  void searchEvents(String searchText);

  void addToFavorites(String id);

  List<Event>? get events;

  List<String>? get favorites;
}
