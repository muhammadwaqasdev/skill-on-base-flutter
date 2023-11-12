import 'package:skill_on_base/src/base/utils/constants.dart';

class UserModel {
  String? sId;
  String? fullName;
  String? email;
  UserTypes? userType;
  bool? verifiedForSeller;
  String? profilePicture;
  String? phone;
  List<String>? yourWorks;
  List<String>? yourGigs;
  List<String>? yourTasks;
  String? fcm;
  String? createdOn;
  List<String>? ratings;
  String? token;
  String? otp;

  UserModel(
      {this.sId,
        this.fullName,
        this.email,
        this.userType,
        this.verifiedForSeller,
        this.profilePicture,
        this.phone,
        this.yourWorks,
        this.yourGigs,
        this.yourTasks,
        this.fcm,
        this.createdOn,
        this.ratings,
        this.otp,
        this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['full_name'];
    email = json['email'];
    userType = UserTypes.values.byName(json['user_type']);
    verifiedForSeller = json['verified_for_seller'];
    profilePicture = json['profile_picture'];
    phone = json['phone'];
    yourWorks = json['your_works'].cast<String>();
    yourGigs = json['your_gigs'].cast<String>();
    yourTasks = json['your_tasks'].cast<String>();
    fcm = json['fcm'];
    createdOn = json['created_on'];
    ratings = json['ratings'].cast<String>();
    token = json['token'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['user_type'] = this.userType?.name;
    data['verified_for_seller'] = this.verifiedForSeller;
    data['profile_picture'] = this.profilePicture;
    data['phone'] = this.phone;
    data['your_works'] = this.yourWorks;
    data['your_gigs'] = this.yourGigs;
    data['your_tasks'] = this.yourTasks;
    data['fcm'] = this.fcm;
    data['created_on'] = this.createdOn;
    data['ratings'] = this.ratings;
    data['token'] = this.token;
    data['otp'] = this.otp;
    return data;
  }
}
