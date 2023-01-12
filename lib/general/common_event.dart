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
    static const ICON_DATA_NEXT = FontAwesomeIcons.chevronRight;
    static const ICON_PRIVIOUS = FontAwesomeIcons.chevronLeft;
}

class CreateEventCommon {
  static const String CREATE_EVENT_TITLE = "Tạo sự kiện";

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
  static const String SELECTION_GROUP = "Chọn nhóm";

  static List<List<dynamic>> SELECTION_FOR_CHOOSE_GROUP_EVENT = [
    [
      CommonEvent.PATH_IMG + "cat_1.png",
      "Hoạt Hình Trung Quốc - Chinese Animation",
      "Có Nguyen van a va nhưng nguoi khac"
    ],
    [
      CommonEvent.PATH_IMG + "cat_2.png",
      "Nhóm thông tin sinh viên NEU",
      "Nơi các bạn sinh viên có quyền chia sẻ tất tần tật mọi thứ."
    ],
    [
      CommonEvent.PATH_IMG + "cat_3.png",
      "Mobile Development Jobs VN",
      "Đăng tin tuyển dụng/tim việc về Mobile Place to post Mobile Development related job-ads"
    ],
    [
      CommonEvent.PATH_IMG + "cat_4.png",
      "Tuyển dụng Flutter tại Việt Nam",
      "Chỉ thành viên mới nhìn thấy mọi người trong nhóm và những gì họ đăng."
    ],
    [
      CommonEvent.PATH_IMG + "cat_1.png",
      "Hoạt Hình Trung Quốc - Chinese Animation",
      "Có Nguyen van a va nhưng nguoi khac"
    ],
    [
      CommonEvent.PATH_IMG + "cat_2.png",
      "Nhóm thông tin sinh viên NEU",
      "Nơi các bạn sinh viên có quyền chia sẻ tất tần tật mọi thứ."
    ],
    [
      CommonEvent.PATH_IMG + "cat_3.png",
      "Mobile Development Jobs VN",
      "Đăng tin tuyển dụng/tim việc về Mobile Place to post Mobile Development related job-ads"
    ],
    [
      CommonEvent.PATH_IMG + "cat_4.png",
      "Tuyển dụng Flutter tại Việt Nam",
      "Chỉ thành viên mới nhìn thấy mọi người trong nhóm và những gì họ đăng."
    ],
  ];
}

class LocationEventCommon{
  static const String LOCATION_EVENT_TITLE = "Vị trí";
  static const String LOCATION_EVENT_SUBTITLE = "Chọn cách tham gia sự kiện online của bạn";

  static const List<dynamic> MEETING_ROOM_COMPONENT = [
    FontAwesomeIcons.video,
    "Phòng họp mặt trên Messenger",
    "Họp mặt qua tính năng chat video. Mọi người có thể tham gia phòng họp mặt ngay tạitrang sự kiện",
  ];
  static const List<dynamic> FACEBOOK_LIVE_COMPONENT = [
    FontAwesomeIcons.video,
    "Facebook Live",
    "Lên lịch phát trực tiếp sự kiện của bạn bằng Facebook Live để mọi người cùng xem",
  ];
  static const String ADD_PRIVATE_LINK = "Thêm liên kết riêng";
}