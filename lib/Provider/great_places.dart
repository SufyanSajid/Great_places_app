import 'package:flutter/foundation.dart';
import 'package:greate_place_app/Models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}
