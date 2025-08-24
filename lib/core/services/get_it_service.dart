import 'package:fruits_hub/core/repos/order_repo/order_repo.dart';
import 'package:fruits_hub/core/repos/order_repo/order_repo_impl.dart';
import 'package:fruits_hub/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruits_hub/core/services/database_services.dart';
import 'package:fruits_hub/core/services/firebase_auth_services.dart';
import 'package:fruits_hub/core/services/firestore_services.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FireStoreServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthServices>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<OrderRepo>(
    OrderRepoImpl(
      fireStoreServices: getIt<DatabaseService>(),
    ),
  );
}
