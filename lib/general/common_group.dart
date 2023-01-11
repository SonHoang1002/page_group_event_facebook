import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  static const List<String> DEFEND_PUBLIC_RULE = [
    "Thành viên và khách truy cập có thể đăng bài trong nhóm. Quản trị viên có thể xét duyệt người lần đầu tham gia",
  ];

  static List<bool> selectedPrivateRule = [false, false];
  static List<bool> selectedHideGroup = [false, false];
}

class RequestFriendsGroupCommon {
  static const String TITLE_APPBAR = "Mời mọi người";

  static const List<String> PLACEHOLDER_LIST = [
    "Tìm kiếm người",
  ];
  static const String EMAIL_REQUEST_TITLE = "Mời qua email";
  static const String EMAIL_REQUEST_SUBTITLE = "Gửi email mời mợi người";
  
  static List<String> IMG_PATH_LIST = [
    "${CommonGroup.PATH_IMG}cat_1.png",
    "${CommonGroup.PATH_IMG}cat_2.png",
    "${CommonGroup.PATH_IMG}cat_3.png",
    "${CommonGroup.PATH_IMG}cat_4.png",
    "${CommonGroup.PATH_IMG}cat_5.png",
    "${CommonGroup.PATH_IMG}cat_6.png",
    "${CommonGroup.PATH_IMG}cat_7.png",
  ];
  // cong khai
  static const List<String> PUBLIC_TITLE = [
    "Chia sẻ",
    "Mời qua email",
    "Gợi ý",
    "Bạn bè"
  ];
  static const List<String> PUBLIC_EXAMPLE = [
    "Gợi ý",
    "Vĩnh Yên",
    "Nhóm chung",
    "Bạn bè"
  ];
  // ca nhan
  static const List<String> PRIVATE_TITLE = [
    "Mời thành viên",
    "Mời bất kì ai",
  ];
  static const List<String> PRIVATE_SUB_TITLE = [
    "Bạn nên mời 5-10 người để làm đà phát triển cho nhóm",
    "Dùng liên kết để mời mọi người tham gia nhóm này. Liên kết này sẽ hết hạn sau 48 giờ hoặc sau khi có 20 người nhấp vào đó, tùy điều kiện nào đến trước",
  ];
  static const String PRIVATE_LINK_EXAMPLE =
      "https://www.freecodecamp.org/learn/front-end-development-libraries/#redux";
  static const String PRIVATE_DESCRIPTION_FOR_LINK_EXAMPLE =
      "Bất kỳ ai trên Facebook có liên kết này đều có thể xem thông tin Giới thiệu về nhóm cũng như yếu cầu tham gia";
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
    "Hãy chọn mục tiêu mô tả chính xác nhất những gì mọi người sẽ làm trong nhóm của bạn nhé",
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
    "Trợ giúp trong trường hợp khẩn cấp hoặc khủng hoảng",
    "Mua và bán",
    "Quảng bá doanh nghiệp",
    "Mục tiêu khác",
  ];
}

class CreatePostGroupCommon {
  static const List<String> TITLE = [
    "Tạo bài viết",
    "NAME_OF_GROUP",
  ];
  static const List<String> USER_EXAMPLE = ["User_Name", "Thành viên của NHÓM"];
  static const List<String> SUBTITLE = [
    "Viết bài để nêu cao tinh thần của nhóm và chào mừng thành viên mới"
  ];
  static List<String> ICON_PATH_LIST = [
    CommonGroup.PATH_IMG + "img_icon.svg",
    CommonGroup.PATH_IMG + "camera_icon.svg",
    CommonGroup.PATH_IMG + "tag_icon.svg",
    CommonGroup.PATH_IMG + "live_icon.svg",
    CommonGroup.PATH_IMG + "background_color_icon.svg",
    CommonGroup.PATH_IMG + "checkin_icon.svg",
    CommonGroup.PATH_IMG + "gif_file_icon.svg",
    CommonGroup.PATH_IMG + "probe_icon.svg",
    CommonGroup.PATH_IMG + "meeting_icon.svg",
    CommonGroup.PATH_IMG + "tag_icon.svg",
    CommonGroup.PATH_IMG + "event_icon.svg",
    CommonGroup.PATH_IMG + "emotion_icon.svg",
  ];
  static const List<String> CONTENT_LIST = [
    "Ảnh/Video",
    "Camera",
    "Gắn thẻ người khác",
    "Video trực tiếp",
    "Màu nền",
    "Check in",
    "File GIF",
    "Thăm dò ý kiến",
    "Họp mặt",
    "Gắn thẻ sự kiện",
    "Tạo sự kiện",
    "Cảm xúc/Hoạt động",
  ];
  static const List<Color> COLOR_LIST = [
    Colors.green,
    Colors.blue,
    Colors.blue,
    Colors.red,
    Colors.lightBlue,
    Colors.orange,
    Colors.lightBlue,
    Colors.yellowAccent,
    Colors.purpleAccent,
    Colors.red,
    Colors.red,
    Colors.yellow,
  ];
  static const List<String> PLACEHOLDER_LIST = [
    "Hãy viết gì đó",
  ];
}
