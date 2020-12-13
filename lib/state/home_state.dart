import 'package:provider/application/classes/category/category.dart';
import 'package:provider/repositories/home_repository.dart';

class HomeState {
  final HomeRepository _homeRepository;
  HomeState(this._homeRepository):assert(_homeRepository != null);
  List<Category> _category = [];
  List<Category> get categories => _category;
      Future<bool> serviceCheck()
      {
        return _homeRepository.serviceCheck();
      }
      Future getCategory() async
      {
        _category =  await _homeRepository.getCategory();
      }
}