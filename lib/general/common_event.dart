import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:self_facebook_project/general/common_page.dart';

class CommonEvent {
  static String PATH_IMG = "assets/images/";
  static const String NEXT = "Tiếp";
  static const String CANCEL = "Hủy";
  static const String CREATE_EVENT = "Tạo nhóm";
  static const String SKIP = "Bỏ qua";
  static const String CONTINUE_AFTER = "Tiếp tục sau";
}

class CreateEventCommon {
  static const String CREATE_EVENT_TITLE = "Tạo sự kiện";
  static const ICON_DATA_NEXT = FontAwesomeIcons.chevronRight;
  static const List<dynamic> ONLINE_COMPONENT = [
    FontAwesomeIcons.globe,
    "Online",
    "Chat video bằng Phòng họp mặt trên Messenger, phát trực tiếp bằng Facebook Live hoặc thê liên kết ngoài",
  ];
  static const List<dynamic> LIVE_MEETING_COMPONENT = [
    FontAwesomeIcons.userGroup,
    "Gặp mặt trực tiếp",
    "Họp mặt với mọi người ở một nơi cụ thể",
  ];
}

class DetailEventCommon {
  static const ICON_PRIVIOUS = FontAwesomeIcons.chevronLeft;
  static const String DETAIL_EVENT_TITLE = "Chi tiết sự kiện";
  static List<dynamic> USER_EXAMPLE = [
    CommonEvent.PATH_IMG + "cat_1.png",
    "User_Name",
    "Trang cá nhân"
  ];
  static const String EVENT_NAME_PLACEHOLDER = "Tên sự kiện";
  static const String DAY_AND_TIME_BEGIN_TITLE = "Ngày và giờ bắt đầu";
  static const String DAY_AND_TIME_END_TITLE = "Ngày và giờ kết thúc";

  static const List<dynamic> ONLINE_COMPONENT = [
    Icon(FontAwesomeIcons.globe),
    "Online",
    "Chat video bằng Phòng họp mặt trên Messenger, phát trực tiếp bằng Facebook Live hoặc thê liên kết ngoài",
  ];

  static List<dynamic> PRIVATE_RULE_COMPONENT = [
    FontAwesomeIcons.lock,
    "Quyền riêng tư",
    "Chọn quyền riêng tư"
  ];
  static const String PRIVATE_OF_EVENT = "Quyền riêng tư của sự kiện";
  static const String DESCRIPTION_FOR_PRIVATE_OF_EVENT =
      "Chọn xem ai có thể nhìn thấy và tham gia sự kiện này. Bạn có thể mời mợi người";
  static const List<List<dynamic>> SELECTION_FOR_PRIVATE_OF_EVENT = [
    [FontAwesomeIcons.lock, "Riêng tư", "Chỉ những người được mời"],
    [
      FontAwesomeIcons.earthAmericas,
      "Công khai",
      "Bất kỳ ai ở trên hoặc ngoài Facebook"
    ],
    [FontAwesomeIcons.userGroup, "Bạn bè", "Bạn bè trên Facebook"],
    [
      FontAwesomeIcons.peopleGroup,
      "Nhóm",
      "Thành viên nhóm mà bạn đang tham gia"
    ],
  ];
}
