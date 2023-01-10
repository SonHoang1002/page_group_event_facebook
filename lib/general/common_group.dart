import 'package:self_facebook_project/general/common_page.dart';

class CommonGroup {
  static String PATH_IMG = "assets/images/";
  static const String NEXT = "Tiếp";
  static const String CREATE_GROUP = "Tạo nhóm";
  static const String SKIP = "Bỏ qua";
}

class CreateGroupCommon {
  static const String TITLE_APPBAR = "Tạo nhóm";
  static const List<String> TITLE_LIST = [
    "Tên",
    "Quyền riêng tư",
    "Ẩn nhóm",
  ];
  static const List<String> PLACEHOLDER_LIST = [
    "Đặt tên nhóm",
    "Chọn quyền riêng tư",
  ];
  static const List<String> DEFEND_PRIVATE_RULE = [
    "Để bảo vệ quyền riêng tư của thành viên, nhóm riêng tư không thể thành công khai. ",
    "Tìm hiểu thêm"
  ];
}

class RequestFriendsGroupCommon {
  static const String TITLE_APPBAR = "Mời mọi người";
  static const List<String> TITLE = [
    "Chia sẻ",
    "Mời qua email",
    "Gợi ý",
    "Bạn bè"
  ];
  static const List<String> EXAMPLE = [
    "Gợi ý",
    "Vĩnh Yên",
    "Nhóm chung",
    "Bạn bè"
  ];
  static const List<String> SUBTITLE = [
    "Chia sẻ",
    "Mời qua email",
    "Gợi ý",
    "Bạn bè"
  ];
  static const List<String> PLACEHOLDER_LIST = [
    "Tìm kiếm người",
  ];
  static List<String> IMG_PATH_LIST = [
    "${CommonPage.PATH_IMG}cat_1.png",
    "${CommonPage.PATH_IMG}cat_2.png",
    "${CommonPage.PATH_IMG}cat_3.png",
    "${CommonPage.PATH_IMG}cat_4.png",
    "${CommonPage.PATH_IMG}cat_5.png",
    "${CommonPage.PATH_IMG}cat_6.png",
    "${CommonPage.PATH_IMG}cat_7.png",
  ];
}
