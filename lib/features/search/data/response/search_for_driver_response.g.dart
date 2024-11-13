// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_for_driver_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchForDriverResponse _$SearchForDriverResponseFromJson(
        Map<String, dynamic> json) =>
    SearchForDriverResponse(
      licenseNumber: json['license_number'] as String?,
      idNumber: json['id_number'] as String?,
      expiryDate: json['expiry_date'] as String?,
      licenseLevels: json['license_levels'] as String?,
      releaseDate: json['release_date'] as String?,
      imageDriver: json['image'] as String?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      numberOfViolations: (json['number_of_violations'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchForDriverResponseToJson(
        SearchForDriverResponse instance) =>
    <String, dynamic>{
      'license_number': instance.licenseNumber,
      'expiry_date': instance.expiryDate,
      'release_date': instance.releaseDate,
      'id_number': instance.idNumber,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'license_levels': instance.licenseLevels,
      'image': instance.imageDriver,
      'number_of_violations': instance.numberOfViolations,
    };
