import 'package:get/get.dart';
import 'package:property_app/src/auth/views/auth_screen.dart';
import 'package:property_app/src/auth/views/forgot_password_screen.dart';
import 'package:property_app/src/auth/views/login_signup_screen.dart';
import 'package:property_app/src/chat/chat_message_screen.dart';
import 'package:property_app/src/complaint/views/complaint_screen.dart';
import 'package:property_app/src/event/event_screen.dart';
import 'package:property_app/src/home/home_screen.dart';
import 'package:property_app/src/invoice/invoice_screen.dart';
import 'package:property_app/src/map/google_map_screen.dart';
import 'package:property_app/src/profile/user_profile_screen.dart';
import 'package:property_app/src/property/views/property_detail_screen.dart';
import 'package:property_app/src/property/views/property_filter_screen.dart';
import 'package:property_app/src/property/views/property_screen.dart';
import 'package:property_app/src/property/views/user_property_screen.dart';
import 'package:property_app/src/upcoming_projects/views/upcoming_project_detail_screen.dart';
import 'package:property_app/src/upcoming_projects/views/upcoming_project_screen.dart';
import 'package:property_app/src/verify_doc/verify_doc_screen.dart';

final List<GetPage<dynamic>> customRoutes = [
  GetPage(
    name: AuthScreen.routeName,
    page: () => const AuthScreen(),
  ),
  GetPage(
    name: LogInSignUpScreen.routeName,
    page: () => const LogInSignUpScreen(),
  ),
  GetPage(
    name: ForgotPasswordScreen.routeName,
    page: () => ForgotPasswordScreen(),
  ),
  GetPage(
    name: HomeScreen.routeName,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AllPropertyScreen.routeName,
    page: () => const AllPropertyScreen(),
  ),
  GetPage(
    name: PropertyFilterScreen.routeName,
    page: () => const PropertyFilterScreen(),
  ),
  GetPage(
    name: PropertyDetailScreen.routeName,
    page: () => const PropertyDetailScreen(),
  ),
  GetPage(
    name: ChatMsgScreen.routeName,
    page: () => const ChatMsgScreen(),
  ),
  GetPage(
    name: UserPropertyScreen.routeName,
    page: () => const UserPropertyScreen(),
  ),
  GetPage(
    name: InvoiceScreen.routeName,
    page: () => const InvoiceScreen(),
  ),
  GetPage(
    name: EventScreen.routeName,
    page: () => const EventScreen(),
  ),
  GetPage(
    name: ComplaintScreen.routeName,
    page: () => const ComplaintScreen(),
  ),
  GetPage(
    name: UpcomingProjectScreen.routeName,
    page: () => const UpcomingProjectScreen(),
  ),
  GetPage(
    name: UpcomingProjectDetailScreen.routeName,
    page: () => const UpcomingProjectDetailScreen(),
  ),
  GetPage(
    name: UserProfileScreen.routeName,
    page: () => UserProfileScreen(),
  ),
  GetPage(
    name: VerifyDocScreen.routeName,
    page: () => const VerifyDocScreen(),
  ),
  GetPage(
    name: GoogleMapScreen.routeName,
    page: () => const GoogleMapScreen(),
  ),
];
