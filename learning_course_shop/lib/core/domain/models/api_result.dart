sealed class ApiResult<T> {
  const ApiResult({
    this.value,
    this.code,
    this.message,
    this.errors,
    this.stackTrace,
  });

  final T? value;
  final int? code;
  final String? message;
  final Map<String, dynamic>? errors;
  final StackTrace? stackTrace;

  R when<R>({
    required R Function(T? data) data,
    required R Function(ApiError<T> error) error,
  }) {
    if (this is ApiError) {
      return error((this as ApiError<T>));
    }

    return data((this as ApiSuccess).value);
  }

  @override
  String toString() {
    return 'ApiResult{value: $value, code: $code, message: $message, stackTrace: $stackTrace}';
  }
}

class ApiSuccess<T> extends ApiResult<T> {
  ApiSuccess({super.value}) {
    super.toString();
  }
}

class ApiError<T> extends ApiResult<T> {
  ApiError({
    super.code,
    super.message,
    super.errors,
    super.stackTrace,
  }) {
    super.toString();
  }

  String get codeMessage =>
      code != null ? '$code: $message' : message ?? 'Unknown Error';
}
