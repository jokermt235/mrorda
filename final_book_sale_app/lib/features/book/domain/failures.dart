abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

// Конкретные реализации Failure (по желанию)
class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  NetworkFailure(String message) : super(message);
}