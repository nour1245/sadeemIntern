import 'package:json_annotation/json_annotation.dart';

part 'user_login_response_model.g.dart';
@JsonSerializable()
class UserLoginResponseModel {
    @JsonKey(name: "accessToken")
    String accessToken;
    @JsonKey(name: "refreshToken")
    String refreshToken;
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "username")
    String username;
    @JsonKey(name: "email")
    String email;
    @JsonKey(name: "firstName")
    String firstName;
    @JsonKey(name: "lastName")
    String lastName;
    @JsonKey(name: "gender")
    String gender;
    @JsonKey(name: "image")
    String image;

    UserLoginResponseModel({
        required this.accessToken,
        required this.refreshToken,
        required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
    });

    factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) => _$UserLoginResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$UserLoginResponseModelToJson(this);
}
