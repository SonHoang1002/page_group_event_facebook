import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:self_facebook_project/general/common_page.dart';

class CommonGroup {
  static String PATH_IMG = "assets/images/";
  static const String NEXT = "Tiếp";
  static const String CREATE_GROUP = "Tạo nhóm";
  static const String SKIP = "Bỏ qua";
  static const String CONTINUE_AFTER = "Tiếp tục sau";
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
    "${CommonGroup.PATH_IMG}cat_1.png",
    "${CommonGroup.PATH_IMG}cat_2.png",
    "${CommonGroup.PATH_IMG}cat_3.png",
    "${CommonGroup.PATH_IMG}cat_4.png",
    "${CommonGroup.PATH_IMG}cat_5.png",
    "${CommonGroup.PATH_IMG}cat_6.png",
    "${CommonGroup.PATH_IMG}cat_7.png",
  ];
}

class CoverImageGroupCommon {
  static const List<String> TITLE = [
    "Thêm ảnh bìa",
    "Ảnh bìa",
  ];
  static const List<String> SUBTITLE = [
    "Thêm ảnh để mọi người biết qua về nhóm",
  ];
  static const List<String> PLACEHOLDER_LIST = [
    "Tải ảnh bìa lên",
  ];
  static List<String> IMG_PATH_LIST = [
    "${CommonGroup.PATH_IMG}example_cover_img_1.jpg",
    "${CommonGroup.PATH_IMG}example_cover_img_2.jpg",
    "${CommonGroup.PATH_IMG}example_cover_img_3.jpg",
    "${CommonGroup.PATH_IMG}example_cover_img_4.jpg",
    "${CommonGroup.PATH_IMG}example_cover_img_5.jpg",
  ];
}

class DescriptionGroupCommon {
  static const List<String> TITLE = [
    "Thêm phần mô tả",
    "Ảnh bìa",
  ];
  static const List<String> SUBTITLE = [
    "Mô tả về nhóm để mọi người biết nhóm xoay quanh chủ đề gì",
  ];
  static const List<String> PLACEHOLDER_LIST = [
    "Mô tả nhóm của bạn",
  ];
}

class TargetGroupCommon {
  static const List<String> TITLE = [
    "Chọn mục tiêu",
    "Ảnh bìa",
  ];
  static const List<String> SUBTITLE = [
    "Hãy chọn mục tiêu mô tả chính xác nhất những gif mọi người sẽ làm trong nhóm của bạn nehs",
  ];
  static const List<IconData> ICON_DATA_LIST = [
    FontAwesomeIcons.peopleGroup,
    FontAwesomeIcons.peopleGroup,
    FontAwesomeIcons.peopleGroup,
    FontAwesomeIcons.peopleGroup,
    FontAwesomeIcons.peopleGroup,
    FontAwesomeIcons.peopleGroup,
    FontAwesomeIcons.peopleGroup,
    FontAwesomeIcons.peopleGroup,
  ];
  static const List<String> CONTENT_LIST = [
    "Gặp gỡ mọi người",
    "Lên kế hoach và điều phối",
    "Học hỏi hoặc chia sẻ sở thích",
    "Hỗ trợ lẫn nhau",
    "Trợ giúp trong trương hợp khản cấp hoặc khủng hoảng",
    "Mua và bán",
    "Quảng bá doanh nghiệp",
    "Mục tiêu khác",
  ];
}
