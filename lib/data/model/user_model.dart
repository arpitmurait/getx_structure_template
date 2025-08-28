class UserResponseModel {
  final UserModel data;
  final String token;

  UserResponseModel({required this.data, required this.token});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      data: UserModel.fromJson((json['data']['user'] is Map) ? json['data']['user'] : {}),
      token: json['data']['token'] ?? '',
    );
  }
}

class UserModel {
  int id = 0;
  final String fullName;
  final String mobile;
  final String phone;
  final String email;
  final String? role;
  final String? language;
  final String? image;
  final String? status;
  final String? mobileVerifiedAt;
  final String? emailVerifiedAt;
  final String? passwordResetToken;
  final String? passwordResetAt;
  final String? lastLoginAt;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    required this.id,
    required this.fullName,
    required this.mobile,
    required this.phone,
    required this.email,
    this.role,
    this.language,
    this.image,
    this.status,
    this.mobileVerifiedAt,
    this.emailVerifiedAt,
    this.passwordResetToken,
    this.passwordResetAt,
    this.lastLoginAt,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      mobile: json['mobile'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      role: json['role'],
      language: json['language'],
      image: json['image'],
      status: json['status'],
      mobileVerifiedAt: json['mobile_verified_at'],
      emailVerifiedAt: json['email_verified_at'],
      passwordResetToken: json['password_reset_token'],
      passwordResetAt: json['password_reset_at'],
      lastLoginAt: json['last_login_at'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'mobile': mobile,
      'phone': phone,
      'email': email,
      'role': role,
      'language': language,
      'image': image,
      'status': status,
      'mobile_verified_at': mobileVerifiedAt,
      'email_verified_at': emailVerifiedAt,
      'password_reset_token': passwordResetToken,
      'password_reset_at': passwordResetAt,
      'last_login_at': lastLoginAt,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
