import '../../models/events_model.dart';
import '../../repository/clients/home_repository.dart';
import 'home_view_model.dart';

class IHomeViewModel extends HomeViewModel {
  final HomeRepository homeRepository;
  List<Event>? _eventList;

  IHomeViewModel({required this.homeRepository});

  @override
  void searchEvents(String searchText) async {
    _eventList = List.empty();
    notifyListeners();

    homeRepository.getEvents(searchText.replaceAll(" ", "+")).then((events) {
      if (events != null) {
        _eventList = events.events.toList();
      } else {
        _eventList = null;
      }
      notifyListeners();
    });
  }

  @override
  List<Event>? get events => _eventList;
}
