import 'package:get/get.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/entities/task.dart';

class DashboardController extends GetxController {
  final GetTasks getTasksUseCase;

  DashboardController(this.getTasksUseCase);

  var tasks = <Task>[].obs;

  @override
  void onInit() {
    tasks.value = getTasksUseCase();
    super.onInit();
  }
}
