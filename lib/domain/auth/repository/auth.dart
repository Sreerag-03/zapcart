import 'package:dartz/dartz.dart';
import 'package:zapcart/data/auth/models/user_creation_req.dart';

import '../../../data/auth/models/user_signin_req.dart';

abstract class AuthRepository{
  Future<Either> signUp(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> getAges();
}