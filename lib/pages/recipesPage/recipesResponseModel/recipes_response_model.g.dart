// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipesResponseModel _$RecipesResponseModelFromJson(
        Map<String, dynamic> json) =>
    RecipesResponseModel(
      status: json['status'] as bool? ?? false,
      data: json['data'] as List<dynamic>?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RecipesResponseModelToJson(
        RecipesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
