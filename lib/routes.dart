import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_place/helpers/services/auth_services.dart';
import 'package:stay_place/views/admin/admin_payment_history_screen.dart';
import 'package:stay_place/views/admin/dashboard_screen.dart';
import 'package:stay_place/views/admin/guest/add_guest_screen.dart';
import 'package:stay_place/views/admin/guest/edit_guest_screen.dart';
import 'package:stay_place/views/admin/guest/guest_list_screen.dart';
import 'package:stay_place/views/admin/manage_booking/booking_list_screen.dart';
import 'package:stay_place/views/admin/manage_hotels/add_hotel_screen.dart';
import 'package:stay_place/views/admin/manage_hotels/edit_hotel_screen.dart';
import 'package:stay_place/views/admin/manage_hotels/hotel_detail_screen.dart';
import 'package:stay_place/views/admin/manage_hotels/hotel_list_screen.dart';
import 'package:stay_place/views/admin/manage_room/room_add_screen.dart';
import 'package:stay_place/views/admin/manage_room/room_detail_screen.dart';
import 'package:stay_place/views/admin/manage_room/room_edit_screen.dart';
import 'package:stay_place/views/admin/manage_room/room_list_screen.dart';
import 'package:stay_place/views/auth/forgot_password_screen.dart';
import 'package:stay_place/views/auth/login_screen.dart';
import 'package:stay_place/views/auth/register_account_screen.dart';
import 'package:stay_place/views/auth/reset_password_screen.dart';
import 'package:stay_place/views/client/booking_form_screen.dart';
import 'package:stay_place/views/client/home_screen.dart';
import 'package:stay_place/views/client/location_map_screen.dart';
import 'package:stay_place/views/client/my_booking_screen.dart';
import 'package:stay_place/views/client/payment_history_screen.dart';
import 'package:stay_place/views/client/room_selection_screen.dart';
import 'package:stay_place/views/ui/basic_table_screen.dart';
import 'package:stay_place/views/ui/buttons_screen.dart';
import 'package:stay_place/views/ui/cards_screen.dart';
import 'package:stay_place/views/ui/carousels_screen.dart';
import 'package:stay_place/views/ui/dialogs_screen.dart';
import 'package:stay_place/views/ui/drag_n_drop_screen.dart';
import 'package:stay_place/views/ui/error_pages/coming_soon_screen.dart';
import 'package:stay_place/views/ui/error_pages/error_404_screen.dart';
import 'package:stay_place/views/ui/error_pages/error_500_screen.dart';
import 'package:stay_place/views/ui/extra_pages/faqs_screen.dart';
import 'package:stay_place/views/ui/extra_pages/pricing_screen.dart';
import 'package:stay_place/views/ui/extra_pages/time_line_screen.dart';
import 'package:stay_place/views/ui/forms/basic_input_screen.dart';
import 'package:stay_place/views/ui/forms/custom_option_screen.dart';
import 'package:stay_place/views/ui/forms/editor_screen.dart';
import 'package:stay_place/views/ui/forms/file_upload_screen.dart';
import 'package:stay_place/views/ui/forms/mask_screen.dart';
import 'package:stay_place/views/ui/forms/slider_screen.dart';
import 'package:stay_place/views/ui/forms/validation_screen.dart';
import 'package:stay_place/views/ui/google_map.dart';
import 'package:stay_place/views/ui/loaders_screen.dart';
import 'package:stay_place/views/ui/modal_screen.dart';
import 'package:stay_place/views/ui/notification_screen.dart';
import 'package:stay_place/views/ui/tabs_screen.dart';
import 'package:stay_place/views/ui/toast_message_screen.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthService.isLoggedIn ? null : const RouteSettings(name: '/auth/login');
  }
}

getPageRoute() {
  var routes = [
    // Starter
    GetPage(name: '/home', page: () => const HomeScreen(), middlewares: [AuthMiddleware()]),

    /// Client ///
    GetPage(name: '/room_selection', page: () => RoomSelectionScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/booking_form', page: () => BookingFormScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/my_booking', page: () => MyBookingScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/location_map', page: () => LocationMapScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/payment_history', page: () => PaymentHistoryScreen(), middlewares: [AuthMiddleware()]),

    /// Admin ///

    // Authentication
    GetPage(name: '/auth/login', page: () => const LoginScreen()),
    GetPage(name: '/auth/register_account', page: () => const RegisterAccountScreen()),
    GetPage(name: '/auth/forgot_password', page: () => const ForgotPasswordScreen()),
    GetPage(name: '/auth/reset_password', page: () => const ResetPasswordScreen()),

    // Dashboard
    GetPage(name: '/dashboard', page: () => const DashboardScreen(), middlewares: [AuthMiddleware()]),

    // Dashboard
    GetPage(name: '/admin/guest/list', page: () => GuestListScreen(), middlewares: [AuthMiddleware()]),

    // Manage Hotel
    GetPage(name: '/admin/hotel/list', page: () => HotelListScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/hotel/detail', page: () => HotelDetailScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/hotel/add', page: () => AddHotelScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/hotel/edit', page: () => EditHotelScreen(), middlewares: [AuthMiddleware()]),

    // Manage Room
    GetPage(name: '/admin/room/list', page: () => RoomListScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/room/detail', page: () => RoomDetailScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/room/add', page: () => RoomAddScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/room/edit', page: () => RoomEditScreen(), middlewares: [AuthMiddleware()]),

    // Guest Management
    GetPage(name: '/admin/guest/list', page: () => GuestListScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/guest/add', page: () => AddGuestScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/guest/edit', page: () => EditGuestScreen(), middlewares: [AuthMiddleware()]),

    // Booking
    GetPage(name: '/admin/booking/list', page: () => BookingListScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/payment', page: () => AdminPaymentHistoryScreen(), middlewares: [AuthMiddleware()]),

    // Base UI
    GetPage(name: '/widgets/buttons', page: () => ButtonsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widgets/toast', page: () => ToastMessageScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widgets/modal', page: () => ModalScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widgets/tabs', page: () => TabsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widgets/cards', page: () => CardsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widgets/loader', page: () => LoadersScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widgets/dialog', page: () => DialogsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widgets/carousel', page: () => CarouselsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widgets/drag_n_drop', page: () => DragNDropScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widgets/notification', page: () => NotificationScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/basic_input', page: () => BasicInputScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/custom_option', page: () => CustomOptionScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/editor', page: () => EditorScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/file_upload', page: () => FileUploadScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/slider', page: () => SliderScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/validation', page: () => ValidationScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/mask', page: () => MaskScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/error/coming_soon', page: () => ComingSoonScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/error/500', page: () => Error500Screen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/error/404', page: () => Error404Screen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/extra/time_line', page: () => TimeLineScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/extra/pricing', page: () => PricingScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/extra/faqs', page: () => FaqsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/other/basic_table', page: () => BasicTableScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/other/google_map', page: () => GoogleMapPage(), middlewares: [AuthMiddleware()]),
  ];
  return routes.map((e) => GetPage(name: e.name, page: e.page, middlewares: e.middlewares, transition: Transition.noTransition)).toList();
}
