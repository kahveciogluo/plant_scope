import 'package:dartz/dartz.dart';
import 'package:plant_scope/features/home/data/models/question_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_datasource.dart';

class QuestionRepositoryImpl implements HomeRepository {
  final HomeDataSource remoteDataSource;

  QuestionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<NetworkException, List<QuestionEntity>>> getQuestions() async {
    try {
      final models = await remoteDataSource.getQuestions();
      if (models == null) return const Right([]);
      final entities = models.map((model) => model.toEntity).toList();

      // Order'a göre küçükten büyüğe sıralar, null olanları en sona atar
      entities.sort((a, b) {
        if (a.order == null && b.order == null) return 0;
        if (a.order == null) return 1;
        if (b.order == null) return -1;
        return a.order!.compareTo(b.order!);
      });

      return Right(entities);
    } on NetworkException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(NetworkException(e.toString()));
    }
  }
}
