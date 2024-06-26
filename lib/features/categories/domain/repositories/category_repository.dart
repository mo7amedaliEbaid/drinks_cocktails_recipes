import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/error_model.dart';
import '../../infrastructure/data_sources/category_data_source.dart';
import '../../infrastructure/dto/category_model.dart';
import '../../infrastructure/repositories/category_repository_impl.dart';


final categoryRepositoryProvider = Provider<CategoryRepository>(
  (ref) => CategoryRepositoryImpl(
    dataSource: ref.watch(categoryDataSourceProvider),
  ),
);

abstract class CategoryRepository {
  Future<Either<ErrorModel, List<Category>>> categories();
}
