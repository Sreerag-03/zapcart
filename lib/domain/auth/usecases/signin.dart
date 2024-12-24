import 'package:dartz/dartz.dart';
import 'package:zapcart/core/usecase/usecase.dart';
import 'package:zapcart/data/auth/models/user_signin_req.dart';
import 'package:zapcart/domain/auth/repository/auth.dart';
import 'package:zapcart/service_locator.dart';

class SigninUseCase implements UseCase<Either,UserSigninReq>{
  @override
  Future<Either> call({UserSigninReq ? params}) async{
    return sl<AuthRepository>().signin(params!);
  }
  
  
}