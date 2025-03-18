import '../entities/task.dart';

abstract class TaskRepository {
  List<Task> getTasks();
}
