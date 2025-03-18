import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/visitor/presentation/pages/Dashboard.dart';
import 'package:get/get.dart';
import 'core/theme/appColor.dart';
import 'core/theme/appTheme.dart';
import 'features/visitor/presentation/getx/dashboard_controller.dart';
import 'features/visitor/presentation/getx/region_controller.dart';

import 'features/visitor/domain/usecases/get_tasks.dart';
import 'features/visitor/data/repositories/task_repository_impl.dart';

void main() {
  final taskRepository = TaskRepositoryImpl();
  final getTasksUseCase = GetTasks(taskRepository);

  Get.put(DashboardController(getTasksUseCase));  runApp(const MyApp());
  Get.put(RegionController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"),
      ],
      locale: Locale("fa", "IR") ,
      title: 'Sepanta',
      theme: AppTheme.lightTheme,
      home:  HomePage(),
    );
  }
}

