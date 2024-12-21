import 'package:dartz/dartz.dart';
import 'package:zapcart/core/usecase/usecase.dart';
import 'package:zapcart/data/auth/models/user_creation_req.dart';
import 'package:zapcart/domain/auth/repository/auth.dart';
import 'package:zapcart/service_locator.dart';

class SignupUseCase implements UseCase<Either,UserCreationReq>{
  @override
  Future<Either> call({UserCreationReq ? params}) async{
    return await sl<AuthRepository>().signUp(params!);
  }
  
}