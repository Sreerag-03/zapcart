import 'package:dartz/dartz.dart';
import 'package:zapcart/core/usecase/usecase.dart';
import 'package:zapcart/domain/auth/repository/auth.dart';
import 'package:zapcart/service_locator.dart';

class GetAgesUseCase implements UseCase<Either,dynamic>{
  
  @override
  Future<Either> call({dynamic params}) async{
    return await sl<AuthRepository>().getAges();
  }
  
}