

// class CurrentAddress {
//   static Future<Map<String, dynamic>> getCurrentAddress() async {
//     final Position _position = await CommonRepository.getCurrentLocation();
//     final dataStorage = GetStorage();
//     await dataStorage.write('latitude', _position.latitude);
//     await dataStorage.write('longitude', _position.longitude);
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(_position.latitude, _position.longitude);

//     Map<String, dynamic> addressMap = {
//       'address':
//           '${placemarks[0].street},${placemarks[0].subLocality},${placemarks[0].thoroughfare}',
//       'locality': placemarks[0].locality,
//       'PINcode': placemarks[0].postalCode,
//       'city': placemarks[0].subAdministrativeArea,
//       'state': placemarks[0].administrativeArea,
//       'country': placemarks[0].country,
//     };

//     await dataStorage.write('companyAddress', addressMap);
//     await dataStorage.write('pincode', placemarks[0].postalCode);
//     await dataStorage.write('city', placemarks[0].subAdministrativeArea);
//     await dataStorage.write('state', placemarks[0].administrativeArea);

//     return addressMap;
//   }
// }
