// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'police_man_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliceManLoginResponse _$PoliceManLoginResponseFromJson(
        Map<String, dynamic> json) =>
    PoliceManLoginResponse(
      id: (json['id'] as num?)?.toInt(),
      firstNameAr: json['first_name_ar'] as String?,
      fatherNameAr: json['father_name_ar'] as String?,
      phoneNumber: json['phone_number'] as String?,
      grandFatherNameAr: json['grand_father_name_ar'] as String?,
      lastNameAr: json['last_name_ar'] as String?,
      image: json['image'] as String?,
      jobNumber: json['job_number'] as String?,
      militaryRank: json['military_rank'] as String?,
    );

Map<String, dynamic> _$PoliceManLoginResponseToJson(
        PoliceManLoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name_ar': instance.firstNameAr,
      'last_name_ar': instance.lastNameAr,
      'father_name_ar': instance.fatherNameAr,
      'grand_father_name_ar': instance.grandFatherNameAr,
      'image': instance.image,
      'job_number': instance.jobNumber,
      'phone_number': instance.phoneNumber,
      'military_rank': instance.militaryRank,
    };
