import 'package:dartz/dartz.dart';
import 'package:zapcart/data/auth/models/user_creation_req.dart';
import 'package:zapcart/data/auth/models/user_signin_req.dart';
import 'package:zapcart/data/auth/source/auth_firebase_service.dart';
import 'package:zapcart/domain/auth/repository/auth.dart';
import 'package:zapcart/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signUp(UserCreationReq user) async{
    return await sl<AuthFirebaseService>().signup(user);
  }
  
  @override
  Future<Either> getAges() async{
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signin(UserSigninReq user) async{
    return await sl<AuthFirebaseService>().signin(user);
  }
  
}