abstract class DataState<T> {
  final T? data;
  final Object? exception;

  const DataState({this.data, this.exception});
}

class DataStateSuccess<T> extends DataState<T> {
  const DataStateSuccess(T data) : super(data: data);
}

class DataStateException<T> extends DataState<T> {
  const DataStateException(Object exception) : super(exception: exception);
}