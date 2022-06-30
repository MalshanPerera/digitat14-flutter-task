import '../../models/events_model.dart';

abstract class HomeRepository {
  Future<Events?> getEvents(String searchText);
}
