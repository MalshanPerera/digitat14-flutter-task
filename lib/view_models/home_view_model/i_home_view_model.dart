import 'package:shared_preferences/shared_preferences.dart';

import '../../models/events_model.dart';
import '../../repository/clients/home_repository.dart';
import 'home_view_model.dart';

class IHomeViewModel extends HomeViewModel {
  final HomeRepository homeRepository;
  List<Event>? _eventList;
  List<String> _favoriteList = List.empty(growable: true);

  IHomeViewModel({required this.homeRepository});

  @override
  void searchEvents(String searchText) async {
    // Clear the list of events before searching for new ones.
    _eventList = List.empty();

    // Get the favorites to display in the list.
    List<String> favorites = await _getAllFavorites();
    _favoriteList = favorites;
    notifyListeners();

    // Search for events.
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
  void addToFavorites(String id) async {
    final prefs = await SharedPreferences.getInstance();

    // Check if the event is already in the favorites.
    if (_favoriteList.contains(id)) {
      _favoriteList.remove(id);
    } else {
      _favoriteList.add(id);
    }

    // Save the favorites to persistent storage.
    prefs.setStringList('favorites', _favoriteList);
    notifyListeners();
  }

  Future<List<String>> _getAllFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites') ?? [];
  }

  @override
  List<Event>? get events => _eventList;

  @override
  List<String>? get favorites => _favoriteList;
}
