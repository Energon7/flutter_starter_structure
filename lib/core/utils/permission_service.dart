import 'package:permission_handler/permission_handler.dart';

class PermissionResult {
  const PermissionResult(this.permission, this.status);

  final Permission permission;
  final PermissionStatus status;

  bool get isGranted => status.isGranted;
  bool get isDenied => status.isDenied;
  bool get isRestricted => status.isRestricted;
  bool get isLimited => status.isLimited;
  bool get isPermanentlyDenied => status.isPermanentlyDenied;
}

class PermissionService {
  Future<PermissionResult> check(Permission permission) async {
    final status = await permission.status;
    return PermissionResult(permission, status);
  }

  Future<PermissionResult> request(Permission permission) async {
    final status = await permission.request();
    return PermissionResult(permission, status);
  }

  Future<Map<Permission, PermissionStatus>> requestMany(
    List<Permission> permissions,
  ) async {
    return permissions.request();
  }

  Future<PermissionResult> requestLocationWhenInUse() {
    return request(Permission.locationWhenInUse);
  }

  Future<PermissionResult> requestLocationAlways() {
    return request(Permission.locationAlways);
  }

  Future<PermissionResult> requestNotifications() {
    return request(Permission.notification);
  }

  Future<PermissionResult> requestCamera() {
    return request(Permission.camera);
  }

  Future<PermissionResult> requestMicrophone() {
    return request(Permission.microphone);
  }

  Future<PermissionResult> requestPhotos() {
    return request(Permission.photos);
  }

  Future<PermissionResult> requestStorage() {
    return request(Permission.storage);
  }

  Future<PermissionResult> requestContacts() {
    return request(Permission.contacts);
  }

  Future<PermissionResult> requestCalendar() {
    return request(Permission.calendar);
  }

  Future<PermissionResult> requestSms() {
    return request(Permission.sms);
  }

  Future<PermissionResult> requestPhone() {
    return request(Permission.phone);
  }

  Future<Map<Permission, PermissionStatus>> requestEssential() {
    return requestMany([
      Permission.locationWhenInUse,
      Permission.notification,
    ]);
  }

  Future<Map<Permission, PermissionStatus>> requestAllCommon() {
    return requestMany([
      Permission.locationWhenInUse,
      Permission.locationAlways,
      Permission.notification,
      Permission.camera,
      Permission.microphone,
      Permission.photos,
      Permission.storage,
      Permission.contacts,
      Permission.phone,
      Permission.sms,
      Permission.calendar,
    ]);
  }

  Future<bool> openSettings() => openAppSettings();
}
