import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipes_response_model.g.dart';

@JsonSerializable()
class RecipesResponseModel extends Equatable {
  const RecipesResponseModel(
      {this.status = false, this.data, this.message});

  final bool? status;
  final String? message;
  final List? data;

  @override
  List<Object?> get props => [status, message, data];

  factory RecipesResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RecipesResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecipesResponseModelToJson(this);
  }
}
