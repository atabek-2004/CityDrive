import 'package:flutter/foundation.dart';
import 'package:ikidz/src/feature/search/model/road_problem_dto.dart';

class RoadProblemsProvider extends ChangeNotifier {
  List<RoadProblemDTO> _problems = [];

  List<RoadProblemDTO> get problems => _problems;

  void initializeWithMockData() {
    _problems = RoadProblemDTO.getMockData();
    notifyListeners();
  }

  void addProblem(RoadProblemDTO problem) {
    _problems.add(problem);
    notifyListeners();
    debugPrint(
        'Добавлена новая проблема: ${problem.title} на ${problem.address}');
  }

  void removeProblem(int id) {
    _problems.removeWhere((problem) => problem.id == id);
    notifyListeners();
  }

  void updateProblem(RoadProblemDTO updatedProblem) {
    final index = _problems.indexWhere((p) => p.id == updatedProblem.id);
    if (index != -1) {
      _problems[index] = updatedProblem;
      notifyListeners();
      debugPrint('Проблема обновлена: ${updatedProblem.title}');
    }
  }

  RoadProblemDTO? getProblemById(int id) {
    try {
      return _problems.firstWhere((problem) => problem.id == id);
    } catch (e) {
      return null;
    }
  }
}
