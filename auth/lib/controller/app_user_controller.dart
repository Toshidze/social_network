import 'package:auth/utils/app_response.dart';
import 'package:conduit/conduit.dart';

class AppUserController extends ResourceController {
  final ManagedContext managedContext;

  AppUserController(this.managedContext);

  @Operation.get()
  Future<Response> getProfil() async {
    try {
      return AppResponse.ok(message: 'getProfil done');
    } catch (error) {
      return AppResponse.serverError(error);
    }
  }

  @Operation.post()
  Future<Response> updateProfil() async {
    try {
      return AppResponse.ok(message: 'updateProfil done');
    } catch (error) {
      return AppResponse.serverError(error);
    }
  }

  @Operation.put()
  Future<Response> updatePassword() async {
    try {
      return AppResponse.ok(message: 'updatePassword done');
    } catch (error) {
      return AppResponse.serverError(error);
    }
  }
}
