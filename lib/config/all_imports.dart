export 'package:get/get.dart';
export 'package:get_it/get_it.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:syncfusion_flutter_charts/charts.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:smooth_page_indicator/smooth_page_indicator.dart';
export 'package:path_provider/path_provider.dart';
export 'package:sqflite/sqflite.dart';
export 'package:path/path.dart';

//routes file
export '/routes/routes.dart';
export '/routes/route_generator.dart';

//config file
export '/config/helper.dart';
export '/config/all_imports.dart';
export '/config/dependency_injection.dart';
export '/config/constants/app_constants.dart';
export '/config/constants/locale_constants.dart';
export '/config/constants/database_constants.dart';

//core file
export '/core/language/ar.dart';
export '/core/language/en.dart';
export '/core/util/size_uitl.dart';
export '/core/widgets/my_loading.dart';
export '/core/widgets/main_button.dart';
export '/core/widgets/main_drawer.dart';
export '/core/widgets/menu_Button.dart';
export '/core/language/translation.dart';
export '/core/extensions/extensions.dart';
export '/core/widgets/driver_drawer.dart';
export '/core/widgets/will_pop_scope.dart';
export '/core/resource/manager_sizes.dart';
export '/core/resource/manager_fonts.dart';
export '/core/resource/manager_assets.dart';
export '/core/resource/manager_colors.dart';
export '/core/widgets/main_text_field.dart';
export '/core/resource/manager_strings.dart';
export '/core/widgets/police_man_drawer.dart';
export '/core/widgets/back_driving_license_card.dart';
export '/core/widgets/front_driving_license_card.dart';
export '/core/widgets/confirm_information_dialog.dart';
export '/core/widgets/created_successfully_dialog.dart';
export '/core/storage/local/database/database_provider.dart';
export '../features/profile/presentation/model/driver_model.dart';
export '/core/storage/local/database/database_operations.dart';
export '../features/violation/presentation/model/violation_model.dart';
export '../features/complaints/presentation/model/complaint_model.dart';
export '../features/search/presentation/model/test_result_model.dart';
export '/core/storage/local/database/controller/driver_database_controller.dart';
export '/core/storage/local/database/controller/complaint_database_controller.dart';
export '/core/storage/local/database/controller/violations_database_controller.dart';
export '/core/storage/local/shared_preferences/app_settings_shared_preferences.dart';
export '/core/storage/local/database/controller/test_result_database_controller.dart';
export '/core/storage/local/database/controller/notifications_database_controller.dart';
export '../features/profile/presentation/model/police_model.dart';
export '/core/storage/local/database/controller/police_database_controller.dart';

//features file
export '/features/splash/presentation/view/screens/splash_screen.dart';
export '/features/splash/presentation/controller/splash_controller.dart';

export '/features/on_boarding/presentation/view/widgets/skip_button.dart';
export '/features/on_boarding/presentation/view/widgets/previous_button.dart';
export '/features/on_boarding/presentation/view/widgets/page_view_content.dart';
export '/features/on_boarding/presentation/view/screens/on_boarding_screen.dart';
export '/features/on_boarding/presentation/controller/on_boarding_controller.dart';

export '/features/login/presentation/view/widgets/richText.dart';
export '/features/login/presentation/view/widgets/check_box.dart';

export '/features/login/presentation/view/screens/login_screen.dart';
export '/features/login/presentation/view/widgets/tab_bar_page.dart';
export '/features/login/presentation/view/screens/welcome_screen.dart';
export '/features/login/presentation/view/widgets/tab_bar_button.dart';
export '/features/login/presentation/controller/login_controller.dart';
export '/features/login/presentation/controller/welcome_controller.dart';

export '/features/home/presentation/model/bar_chart_data.dart';
export '/features/home/presentation/view/widgets/home_app_bar.dart';
export '/features/home/presentation/view/widgets/page_view_item.dart';
export '/features/home/presentation/view/widgets/bar_chart_distribution.dart';
export '/features/home/presentation/view/screens/police_man_home_screen.dart';
export '/features/home/presentation/controller/police_man_home_controller.dart';
export '/features/home/presentation/view/widgets/statistics_box_of_police_man.dart';
export '/features/home/presentation/view/widgets/box_of_number_of_violation_driver.dart';
export '/features/home/presentation/view/widgets/button_for_violation_distribution_pages.dart';

export '../core/widgets/head_of_official_paper.dart';
export '/features/violation/presentation/view/widgets/my_sized_box.dart';
export '/features/violation/presentation/model/data_list_of_violations.dart';
export '/features/violation/presentation/view/screens/create_violation_screen.dart';
export '/features/violation/presentation/controller/create_violation_controller.dart';
export '/features/violation/presentation/view/screens/list_of_violations_screen.dart';
export '/features/violation/presentation/controller/list_of_violations_controller.dart';
export '/features/violation/presentation/view/widgets/item_card_of_list_of_violation.dart';

export '/features/search/presentation/view/widgets/row_of_table.dart';
export '/features/search/presentation/view/widgets/empty_result.dart';
export '/features/search/presentation/view/widgets/result_of_test.dart';
export '/features/search/presentation/view/widgets/result_of_driver.dart';
export '/features/search/presentation/view/widgets/result_of_license.dart';
export '/features/search/presentation/view/widgets/border_side_of_table.dart';
export '/features/search/presentation/view/screens/search_for_driver_screen.dart';
export '/features/search/presentation/controller/search_for_driver_controller.dart';
export '/features/search/presentation/view/screens/search_on_results_tests_of_license_screen.dart';
export '/features/search/presentation/controller/search_on_results_tests_of_license_controller.dart';

export '/features/logout/presentation/view/screens/logout_screen.dart';
export '/features/logout/presentation/controller/logout_controller.dart';

export '/features/driving_license_card/presentation/view/screens/driving_license_card_screen.dart';
export '/features/driving_license_card/presentation/controller/driving_license_card_controller.dart';
export '/features/driving_license_card/presentation/view/widgets/expansion_tile_card.dart';

export '/features/complaints/presentation/view/screens/list_of_complaints_screen.dart';
export '/features/complaints/presentation/controller/list_of_complaints_controller.dart';
export '/features/complaints/presentation/view/widgets/data_column_of_complaints_table.dart';
export '/features/complaints/presentation/view/widgets/dialog_of_create_complaint.dart';
export '/features/complaints/presentation/controller/create_complaints_controller.dart';
export '/features/complaints/presentation/view/widgets/table_of_complaints.dart';

export '/features/forget_password/presentation/view/screens/forgot_password_for_driver_screen.dart';
export '/features/forget_password/presentation/view/screens/forgot_password_for_police_man_screen.dart';
export '/features/forget_password/presentation/controller/forgot_password_for_driver_controller.dart';
export '/features/forget_password/presentation/controller/forgot_password_for_police_man_controller.dart';
export '/features/forget_password/presentation/controller/verification_code_controller.dart';
export '/features/forget_password/presentation/view/screens/verification_code_screen.dart';
export '/features/forget_password/presentation/view/widgets/filed_of_verification_code.dart';

export '/features/change_password/presentation/controller/change_password_controller.dart';
export '/features/change_password/presentation/view/screens/change_password_screen.dart';

export '/features/profile/presentation/controller/driver_profile_controller.dart';
export '/features/profile/presentation/view/screens/driver_profile_screen.dart';

export '/features/payment/presentation/controller/payment_controller.dart';
export '/features/payment/presentation/view/screens/payment_screen.dart';
export '/features/payment/presentation/view/widgets/payment_method.dart';
export '/features/payment/presentation/view/widgets/enter_details_step.dart';
export '/features/payment/presentation/view/widgets/payment_confirmation_step.dart';
export '/features/payment/presentation/view/widgets/payment_selection_step.dart';
export '/features/payment/presentation/view/screens/violation_payment_screen.dart';
export '/features/payment/presentation/controller/violation_payment_controller.dart';
export '/features/payment/presentation/view/widgets/data_column_of_violation_table.dart';
export '/features/payment/presentation/model/data_of_violation.dart';
export '/features/payment/presentation/view/widgets/data_row_of_violation_table.dart';
export '/features/payment/presentation/view/widgets/table_of_violation.dart';
export '/features/payment/presentation/view/widgets/text_of_head_violation_table.dart';
export '/features/payment/presentation/view/widgets/view_violation_details.dart';
export '/features/payment/presentation/view/widgets/state_payment.dart';
export '/features/home/presentation/view/screens/driver_home_screen.dart';
export '/features/home/presentation/controller/driver_home_controller.dart';

export '/features/notifications/presentation/model/notification_model.dart';
export '/features/notifications/presentation/view/widgets/box_of_notification.dart';
export '/features/notifications/presentation/view/screens/notifications_screen.dart';
export '/features/notifications/presentation/controller/notifications_controller.dart';
