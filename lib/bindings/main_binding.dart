import 'package:get/get.dart';
import '../network/api_repository_impl.dart';
import '../network/local_repository_impl.dart';
import '../repository/api_repository.dart';
import '../repository/local_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
  }
}
