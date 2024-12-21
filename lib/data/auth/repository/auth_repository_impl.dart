import 'package:dartz/dartz.dart';
import 'package:zapcart/data/auth/models/user_creation_req.dart';
import 'package:zapcart/data/auth/source/auth_firebase_service.dart';
import 'package:zapcart/domain/auth/repository/auth.dart';
import 'package:zapcart/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signUp(UserCreationReq user) async{
    return sl<AuthFirebaseService>().signup(user);
  }
  
}