
import 'package:firebase_storage/firebase_storage.dart';

Future<String> fetchImageUrl(String imagePath) async {
  Reference ref = FirebaseStorage.instance.ref(imagePath);
  return await ref.getDownloadURL();
}
