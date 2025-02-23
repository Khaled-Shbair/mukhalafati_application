// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_driver_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDriverDataResponse _$HomeDriverDataResponseFromJson(
        Map<String, dynamic> json) =>
    HomeDriverDataResponse(
      phoneNumber: json['phone_number'] as String?,
      id: (json['id'] as num?)?.toInt(),
      numberOfViolationsPaid:
          (json['number_of_violations_paid'] as num?)?.toInt(),
      numberOfViolationsUnPaid:
          (json['number_of_violations_un_paid'] as num?)?.toInt(),
      nameEn: json['name_en'] as String?,
      nameAr: json['name_ar'] as String?,
      idNumber: json['id_number'] as String?,
      image: json['image'] as String?,
      expiryDate: json['expiry_date'] as String?,
      licenseLevels: json['license_levels'] as String?,
      licenseNumber: json['license_number'] as String?,
      numberOfUnReadNotifications:
          (json['number_of_un_read_notifications'] as num?)?.toInt(),
      releaseDate: json['release_date'] as String?,
    );

Map<String, dynamic> _$HomeDriverDataResponseToJson(
        HomeDriverDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
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
