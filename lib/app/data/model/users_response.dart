class UsersResponseModel {
  String? status;
  String? message;
  List<UserData>? data;
  int? totalCount;
  int? totalPages;

  UsersResponseModel({
    this.status,
    this.message,
    this.data,
    this.totalCount,
    this.totalPages,
  });

  UsersResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data!.add(new UserData.fromJson(v));
      });
    }
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total_count'] = this.totalCount;
    data['total_pages'] = this.totalPages;
    return data;
  }
}

class UserData {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  UserData({
    this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    isDeleted = json['is_deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['is_deleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
