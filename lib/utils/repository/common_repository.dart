import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class CommonRepository {
  // static Future<Position> getCurrentLocation() async {
  //   // ignore: deprecated_member_use
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.always ||
  //       permission == LocationPermission.whileInUse) {
  //     Position position =
  //         // ignore: deprecated_member_use
  //         await Geolocator.getCurrentPosition(
  //             desiredAccuracy: LocationAccuracy.high);
  //     return position;
  //   } else {
  //     // ignore: deprecated_member_use
  //     LocationPermission permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.always ||
  //         permission == LocationPermission.whileInUse) {
  //       Position position =
  //           // ignore: deprecated_member_use
  //           await Geolocator.getCurrentPosition(
  //               desiredAccuracy: LocationAccuracy.high);
  //       return position;
  //     } else {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  // }

  // static Future<Position> getStoragePermission() async {
  //   // ignore: deprecated_member_use
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.always ||
  //       permission == LocationPermission.whileInUse) {
  //     Position position =
  //         // ignore: deprecated_member_use
  //         await Geolocator.getCurrentPosition(
  //             desiredAccuracy: LocationAccuracy.high);
  //     return position;
  //   } else {
  //     // ignore: deprecated_member_use
  //     LocationPermission permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.always ||
  //         permission == LocationPermission.whileInUse) {
  //       Position position =
  //           // ignore: deprecated_member_use
  //           await Geolocator.getCurrentPosition(
  //               desiredAccuracy: LocationAccuracy.high);
  //       return position;
  //     } else {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  // }

  // Future<Uint8List> getBytesFromAsset(String path, int width) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(
  //     data.buffer.asUint8List(),
  //     targetWidth: width,
  //   );
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();
  // }

  // Future getAddressFromLatLong(latitude, longitude) async {
  //   if (latitude != null && longitude != null) {
  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(latitude, longitude);

  //     Placemark place = placemarks[0];
  //     return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  //   } else {
  //     return Future.error("Data Null");
  //   }
  // }
}
