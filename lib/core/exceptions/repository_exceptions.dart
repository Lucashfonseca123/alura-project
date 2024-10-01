import 'package:teste_alura/core/exceptions/api_exceptions.dart';

class RequestFailure implements Exception {
  final String? message;
  final int? code;
  final Exception? exception;
  RequestFailure({this.message, this.exception, this.code});
}

Future<T> repositoryExceptionHandlerScope<T>(Function function) async {
  try {
    return await function();
  } on ClientErrorException catch (e) {
    throw RequestFailure(message: e.message.toString(), exception: e);
  } on ServerErrorException catch (e) {
    throw RequestFailure(
        message: e.message.toString(), exception: e, code: e.code);
  } on ConnectionException catch (e) {
    throw RequestFailure(exception: e);
  } on Exception catch (e) {
    throw RequestFailure(exception: e);
  } catch (e) {
    throw RequestFailure();
  }
}
