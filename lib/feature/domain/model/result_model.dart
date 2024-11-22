class ResultModel<T> {
  final bool isSuccess;
  final String message;
  final T? data;

  const ResultModel({
    this.isSuccess = false,
    this.message = "",
    this.data,
  });
}
