import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? categoryId;
  final String name;
  final String? description;
  final String? status;
  final DateTime? createdAt;

  const CategoryEntity({
    this.categoryId,
    required this.name,
    this.description,
    this.status,
    this.createdAt,
  });

  @override
  List<Object?> get props => [categoryId, name, description, status, createdAt];
}
