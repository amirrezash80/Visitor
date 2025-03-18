import '../../domain/repositories/task_repository.dart';
import '../../domain/entities/task.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  List<Task> getTasks() {
    return [
      TaskModel(date: "1403/12/13", location: "ولیعصر", status: "در حال ویرایش", statusColor: "orange", isButtonVisible: true, buttonText: "مشاهده"),
      TaskModel(date: "1403/12/13", location: "پاسداران", status: "شروع نشده", statusColor: "red", isButtonVisible: true, buttonText: "شروع"),
      TaskModel(date: "1403/12/13", location: "بنی هاشم", status: "پایان‌یافته", statusColor: "green", isButtonVisible: false),
    ];
  }
}
