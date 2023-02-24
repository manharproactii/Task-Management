import 'package:get/get.dart';
import 'package:task_management/pages/home/home_binding.dart';
import 'package:task_management/pages/login/login_screen.dart';
import 'package:task_management/pages/menu/department/department_screen.dart';
import 'package:task_management/pages/menu/employee/add_employee_screen.dart';
import 'package:task_management/pages/menu/employee/employee_screen.dart';
import 'package:task_management/pages/menu/reports/reports_screen.dart';
import 'package:task_management/pages/notes/add_notes_screen.dart';
import 'package:task_management/pages/notes/notes_details_screen.dart';
import 'package:task_management/pages/notes/notes_screen.dart';
import 'package:task_management/pages/notes/notes_view_screen.dart';
import 'package:task_management/pages/profile/reset_password_screen.dart';
import 'package:task_management/pages/splash/on_boarding.dart';
import 'package:task_management/pages/splash/welcome_screen.dart';
import 'package:task_management/pages/subscribe/subsciption_list_screen.dart';
import 'package:task_management/pages/task/add_task_screen.dart';

import '../pages/home_loading/home_loading_screen.dart';
import '../pages/menu/department/add_department_screen.dart';
import '../pages/menu/department/view_department_screen.dart';
import '../pages/profile/edit_profile_screen.dart';
import '../pages/splash/splash_screen.dart';
import '../pages/task/view_task_screen.dart';

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String welcome = '/welcome';
  static const String onBoarding = '/onBoarding';
  static const String homeLoading = '/homeLoading';
  static const String editProfile = '/editProfile';
  static const String resetPassword = '/resetPassword';
  static const String notes = '/notes';
  static const String notesDetails = '/notesDetails';
  static const String notesView = '/notesView';
  static const String addNotes = '/addNotes';
  static const String department = '/department';
  static const String addDepartment = '/addDepartment';
  static const String viewDepartment = '/viewDepartment';
  static const String employee = '/employee';
  static const String addEmployee = '/addEmployee';
  static const String subscriptionList = '/subscriptionList';
  static const String addTask = '/addTask';
  static const String viewTask = '/viewTask';
  static const String reports = '/reports';
}

class Pages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      // binding: SplashBinding()
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      // binding: SplashBinding()
    ),
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomeScreen(),
      // binding: SplashBinding()
    ),
    GetPage(
      name: Routes.onBoarding,
      page: () => const OnBoardingScreen(),
      // binding: SplashBinding()
    ),
    GetPage(
        name: Routes.homeLoading,
        page: () => const HomeLoadingScreen(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.editProfile,
        page: () => const EditProfileScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.resetPassword,
        page: () => const ResetPasswordScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.notes,
        page: () => const NotesScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.notesDetails,
        page: () => const NotesDetailsScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.notesView,
        page: () => const NotesViewScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.addNotes,
        page: () => const AddNotesScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.department,
        page: () => const DepartmentScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.addDepartment,
        page: () => const AddDepartmentScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.viewDepartment,
        page: () => const ViewDepartmentScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.employee,
        page: () => const EmployeeScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.addEmployee,
        page: () => const AddEmployeeScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.addTask,
        page: () => const AddTaskScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.viewTask,
        page: () => const ViewTaskScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.subscriptionList,
        page: () => const SubscriptionList(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.reports,
        page: () => const ReportScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}
