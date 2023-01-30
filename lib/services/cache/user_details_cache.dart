//! CACHE USER DETAILS
import 'dart:convert';
import 'package:bucc_app/services/model/auth/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class UserDetailsCache {
  //! USER DETAILS CACHE STARTS HERE.
  //! CACHE USER DETAILS SECURELY
  static Future<bool> cacheUserDetails({UserModel? theUserDetails}) async {
    bool areUserDetailsCached = false;

    //! GET / GENERATE SECURE STORAGE
    const FlutterSecureStorage appSecureStorage = FlutterSecureStorage();

    //! FETCH ENCRYPTION KEY
    String? userDetailsEncryptionKey =
        await appSecureStorage.read(key: "userDetailsEncryptionKey");

    //! ENCRYPTION KEY DOESN'T EXIST, CREATE KEY.
    if (userDetailsEncryptionKey == null) {
      List<int> encryptionKey = Hive.generateSecureKey();

      await appSecureStorage.write(
          key: "userDetailsEncryptionKey",
          value: base64UrlEncode(encryptionKey));
    }

    //! ENCRYPTION KEY EXISTS, GET, DECODE AND USE.
    String? encryptionKey =
        await appSecureStorage.read(key: "userDetailsEncryptionKey");
    Uint8List savedUserDetailsEncryptionKey = base64Url.decode(encryptionKey!);

    //! OPEN A DETAILS BOX.
    Box<UserModel> encryptedBox = await Hive.openBox<UserModel>(
        "userDetailsBox",
        encryptionCipher: HiveAesCipher(savedUserDetailsEncryptionKey));

    //! ADD DETAILS OBJECT TO BOX, USING USER EMAIL AS THE KEY
    await encryptedBox.clear();
    encryptedBox.add(theUserDetails!);

    //! CHECK IF DETAILS HAVE BEEN SAVED.
    encryptedBox.values.contains(theUserDetails)
        ? {areUserDetailsCached = true}
        : {areUserDetailsCached = false};

    return areUserDetailsCached;
  }

  //! FETCH USERS DETAILS.
  static Future<UserModel> getUserDetails() async {
    //! GET SECURE STORAGE
    const FlutterSecureStorage appSecureStorage = FlutterSecureStorage();

    //! ENCRYPTION KEY EXISTS, GET, DECODE AND USE.
    String? encryptionKey =
        await appSecureStorage.read(key: "userDetailsEncryptionKey");
    Uint8List savedUserDetailsEncryptionKey = base64Url.decode(encryptionKey!);

    //! OPEN DETAILS BOX.
    Box<UserModel> encryptedBox = await Hive.openBox<UserModel>(
        "userDetailsBox",
        encryptionCipher: HiveAesCipher(savedUserDetailsEncryptionKey));

    return encryptedBox.values.first;
  }
}
