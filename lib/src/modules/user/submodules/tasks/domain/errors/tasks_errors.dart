abstract class ITaskError {
  String get message;
  String? get tracking;
}

class TaskError implements ITaskError {
  @override
  final String message;

  @override
  final String? tracking;

  TaskError(this.message, [this.tracking]);
}

class DomainError extends TaskError {
  DomainError(super.message, [super.tracking]);
}

class MainRepositoryError extends TaskError {
  MainRepositoryError(super.message, [super.tracking]);
}

class MainDatasourceError extends TaskError {
  MainDatasourceError(super.message, [super.tracking]);
}

class DecodeError extends TaskError {
  DecodeError(super.message, [super.tracking]);
}

class AddTaskError extends TaskError {
  AddTaskError(super.message, [super.tracking]);
}

class GetTaskError extends TaskError {
  GetTaskError(super.message, [super.tracking]);
}


class RemoveTaskError extends TaskError {
  RemoveTaskError(super.message, [super.tracking]);
}

