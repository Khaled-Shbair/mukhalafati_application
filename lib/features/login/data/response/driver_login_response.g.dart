// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverLoginResponse _$DriverLoginResponseFromJson(Map<String, dynamic> json) =>
    DriverLoginResponse(
      phoneNumber: json['phone_number'] as String?,
      id: (json['id'] as num?)?.toInt(),
      numberOfViolationsPaid:
          (json['number_of_violations_paid'] as num?)?.toInt(),
      firstNameAr: json['first_name_ar'] as String?,
      numberOfViolationsUnPaid:
          (json['number_of_violations_un_paid'] as num?)?.toInt(),
      fatherNameEn: json['father_name_en'] as String?,
      fatherNameAr: json['father_name_ar'] as String?,
      firstNameEn: json['first_name_en'] as String?,
      grandFatherNameAr: json['grand_father_name_ar'] as String?,
      grandFatherNameEn: json['grand_father_name_en'] as String?,
      idNumber: json['id_number'] as String?,
      lastNameAr: json['last_name_ar'] as String?,
      image: json['image'] as String?,
      lastNameEn: json['last_name_en'] as String?,
      expiryDate: json['expiry_date'] as String?,
      licenseLevels: json['license_levels'] as String?,
      licenseNumber: json['license_number'] as String?,
      numberOfUnReadNotifications:
          (json['number_of_un_read_notifications'] as num?)?.toInt(),
      releaseDate: json['release_date'] as String?,
    );

Map<String, dynamic> _$DriverLoginResponseToJson(
        DriverLoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'first_name_en': instance.firstNameEn,
      'first_name_ar': instance.firstNameAr,
      'last_name_en': instance.lastNameEn,
      'last_name_ar': instance.lastNameAr,
      'father_name_ar': instance.fatherNameAr,
      'father_name_en': instance.fatherNameEn,
      'grand_father_name_ar': instance.grandFatherNameAr,
      'grand_father_name_en': instance.grandFatherNameEn,
      'phone_number': instance.phoneNumber,
      'license_number': instance.licenseNumber,
      'release_date': instance.releaseDate,
      'expiry_date': instance.expiryDate,
      'license_levels': instance.licenseLevels,
      'id_number': instance.idNumber,
      'number_of_violations_un_paid': instance.numberOfViolationsUnPaid,
      'number_of_violations_paid': instance.numberOfViolationsPaid,
      'number_of_un_read_notifications': instance.numberOfUnReadNotifications,
    };
