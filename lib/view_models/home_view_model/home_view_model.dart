import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../../models/events_model.dart';

abstract class HomeViewModel extends ChangeNotifier {
  void searchEvents(String searchText);

  List<Event>? get events;
}
