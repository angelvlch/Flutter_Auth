import 'package:auth/features/auth_page/auth_page.dart';
import 'package:auth/features/empty_page/empty_page_screen.dart';
import 'package:auth/features/registration_page/registration_page.dart';

final routes = {
  '/': (context) => AuthPageScreen(),
  '/registration': (context) => RegistrationPageScreen(),
  '/page': (context) => EmptyPageScreen(),
};
