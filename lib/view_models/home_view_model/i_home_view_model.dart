import 'package:digitat14_flutter_task/models/events_model.dart';
import 'package:digitat14_flutter_task/repository/clients/home_repository.dart';
import 'package:digitat14_flutter_task/view_models/home_view_model/home_view_model.dart';

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
        notifyListeners();
      } else {
        _eventList = [];
      }
    });
  }

  @override
  List<Event>? get events => _eventList;
}
