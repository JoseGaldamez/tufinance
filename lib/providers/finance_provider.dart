import 'package:flutter/material.dart';
import 'package:tufinance/models/move_model.dart';

double getTotal(List<MoveModel> moves) {
  double total = 0;

  for (var move in moves) {
    double valueMove = double.parse(move.amount);
    total += valueMove;
  }

  return total;
}

double getTotalByCategory(List<MoveModel> moves, String category) {
  double total = 0;

  for (var move in moves) {
    if (category == move.category) {
      double valueMove = double.parse(move.amount);
      total += valueMove;
    }
  }

  return total;
}

class FinanceProvider with ChangeNotifier {
  List<MoveModel> _activos = [];
  List<MoveModel> get activos => _activos;

  List<MoveModel> _pasivos = [];
  List<MoveModel> get pasivos => _pasivos;

  double get totalActivos => getTotal(_activos);
  double get totalPasivos => getTotal(_pasivos);

  double get totalCompras => getTotalByCategory(_pasivos, "market");
  double get totalComida => getTotalByCategory(_pasivos, "food");
  double get totalCarro => getTotalByCategory(_pasivos, "car");
  double get totalCasa => getTotalByCategory(_pasivos, "house");
  double get totalMascotas => getTotalByCategory(_pasivos, "pets");
  double get totalViajes => getTotalByCategory(_pasivos, "travels");

  void resetValues() {
    _activos = [];
    _pasivos = [];
  }

  void setActivos(List<MoveModel> actives) {
    _activos = actives;
    notifyListeners();
  }

  void setPasivos(List<MoveModel> passives) {
    _pasivos = passives;
    notifyListeners();
  }

  void addPasivos(MoveModel passive) {
    _pasivos.add(passive);
    notifyListeners();
  }

  void addActivo(MoveModel active) {
    _activos.add(active);
    notifyListeners();
  }
}
