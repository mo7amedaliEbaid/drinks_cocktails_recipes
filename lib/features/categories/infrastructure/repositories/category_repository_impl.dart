import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:recipes/core/network/request_handler.dart';

import '../../../../core/network/error_model.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_data_source.dart';
import '../dto/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.dataSource,
  });

  final CategoryDataSource dataSource;

  @override
  Future<Either<ErrorModel, List<Category>>> categories() async {
    return await dataSource.categories().guard((data) {
      List<Category> categories = (data["drinks"] as List<dynamic>)
          .map((json) => Category.fromJson(json as Map<String, dynamic>))
          .toList();
      return categories;
    });
  }
}