abstract class IAppError {
  String get message;
  String? get tracking;
}

class AppError implements IAppError {
  @override
  final String message;

  @override
  final String? tracking;

  AppError(this.message, [this.tracking]);
}

class DomainError extends AppError {
  DomainError(super.message, [super.tracking]);
}

class MainRepositoryError extends AppError {
  MainRepositoryError(super.message, [super.tracking]);
}

class MainDatasourceError extends AppError {
  MainDatasourceError(super.message, [super.tracking]);
}

class DecodeError extends AppError {
  DecodeError(super.message, [super.tracking]);
}

class SignInError extends AppError {
  SignInError(super.message, [super.tracking]);
}

class SignUpError extends AppError {
  SignUpError(super.message, [super.tracking]);
}

class TaskError extends AppError {
  TaskError(super.message, [super.tracking]);
}

