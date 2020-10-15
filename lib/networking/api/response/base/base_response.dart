class APIResponse<T> {
  APIStatus status;
  T data;
  String message;

  APIResponse.loading(this.message) : status = APIStatus.LOADING;
  APIResponse.completed(this.data) : status = APIStatus.COMPLETED;
  APIResponse.error(this.message) : status = APIStatus.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum APIStatus { LOADING, COMPLETED, ERROR }