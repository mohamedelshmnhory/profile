import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/enums/gender.dart';
import 'location.dart';

part 'user_profile.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class UserProfile extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final Gender? gender;
  final DateTime? birthdate;
  final Location? location;

  const UserProfile({this.name, this.email, this.password, this.gender, this.birthdate, this.location});
  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  @override
  List<Object?> get props => [name, email];
}
