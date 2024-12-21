import 'package:get_it/get_it.dart';
import 'package:zapcart/data/auth/repository/auth_repository_impl.dart';
import 'package:zapcart/data/auth/source/auth_firebase_service.dart';
import 'package:zapcart/domain/auth/repository/auth.dart';
import 'package:zapcart/domain/auth/usecases/signup.dart';

final sl = GetIt.instance;


Future<void> initializeDependencies()async{

  //Services

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  //Repositories

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  //Usecases

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );
}