
import 'package:flutter_modular/flutter_modular.dart';
import 'package:permission/permission.dart';

part 'permission_service.g.dart';



@Injectable()
class PermissionService extends Disposable {
  //dispose will be called automatically

  PermissionName permissionName = PermissionName.Internet;
  String message = '';


  getPermissionsStatus(String permission) async {
    List<PermissionName> permissionNames = [];
    switch (permission) {
      case 'Contact':
        permissionNames.add(PermissionName.Contacts);
        break;
      case 'Location':
        permissionNames.add(PermissionName.Location);
        break;
      case 'Storage':
        permissionNames.add(PermissionName.Storage);
        break;
    }
    message = '';
    List<Permissions> permissions =
        await Permission.getPermissionsStatus(permissionNames);
    permissions.forEach((permission) {
      message +=
          '${permission.permissionName}: ${permission.permissionStatus}\n';
    });
    return message;
  }

  getSinglePermissionStatus() async {
    var permissionStatus =
        await Permission.getSinglePermissionStatus(permissionName);
    return message = permissionStatus.toString();
  }

  requestPermissions(String permission) async {
    List<PermissionName> permissionNames = [];
    switch (permission) {
      case 'Contact':
        permissionNames.add(PermissionName.Contacts);
        break;
      case 'Location':
        permissionNames.add(PermissionName.Location);
        break;
      case 'Storage':
        permissionNames.add(PermissionName.Storage);
        break;
    }
    message = '';
    var permissions = await Permission.requestPermissions(permissionNames);
    permissions.forEach((permission) {
      message +=
          '${permission.permissionName}: ${permission.permissionStatus}\n';
    });
  }

  @override
  void dispose() {}
}
