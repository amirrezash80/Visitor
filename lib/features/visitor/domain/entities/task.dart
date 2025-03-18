class Task {
  final String date;
  final String location;
  final String status;
  final String statusColor;
  final bool isButtonVisible;
  final String? buttonText;

  Task({
    required this.date,
    required this.location,
    required this.status,
    required this.statusColor,
    required this.isButtonVisible,
    this.buttonText,
  });
}
