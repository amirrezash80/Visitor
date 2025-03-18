import '../../domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required String date,
    required String location,
    required String status,
    required String statusColor,
    required bool isButtonVisible,
    String? buttonText,
  }) : super(
    date: date,
    location: location,
    status: status,
    statusColor: statusColor,
    isButtonVisible: isButtonVisible,
    buttonText: buttonText,
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      date: json["date"],
      location: json["location"],
      status: json["status"],
      statusColor: json["statusColor"],
      isButtonVisible: json["isButtonVisible"],
      buttonText: json["buttonText"],
    );
  }
}
