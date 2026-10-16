import 'package:flutter/foundation.dart';
import 'adventurer.dart';

class PartyModel extends ChangeNotifier {
  final List<Adventurer> _party = [];

  List<Adventurer> get party => List.unmodifiable(_party);

  int get partyCount => _party.length;

  int get totalCost {
    int total = 0;
    for (var adventurer in _party) {
      total += adventurer.goldCost;
    }
    return total;
  }

  void addAdventurer(Adventurer adventurer) {
    _party.add(adventurer);
    notifyListeners();
  }

  void removeAdventurer(Adventurer adventurer) {
    _party.remove(adventurer);
    notifyListeners();
  }
}