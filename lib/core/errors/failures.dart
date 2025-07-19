abstract class Failure {
  final String message;
  const Failure(this.message, {required String message});
}

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message);
}
