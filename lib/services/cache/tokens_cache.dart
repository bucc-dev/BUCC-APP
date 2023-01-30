import 'dart:convert';
import 'package:bucc_app/services/model/auth/token_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class TokenCache {
  //! TOKEN CACHE STARTS HERE.
  //! CACHE USER TOKENS SECURELY
  static Future<bool> cacheUserTokens({UserToken? userToken}) async {
    bool areTokensCached = false;

    //! GET / GENERATE SECURE STORAGE
    const FlutterSecureStorage appSecureStorage = FlutterSecureStorage();

    //! FETCH ENCRYPTION KEY
    String? userTokenEncryptionKey =
        await appSecureStorage.read(key: "userTokenEncryptionKey");

    //! ENCRYPTION KEY DOESN'T EXIST, CREATE KEY.
    if (userTokenEncryptionKey == null) {
      List<int> encryptionKey = Hive.generateSecureKey();

      await appSecureStorage.write(
          key: "userTokenEncryptionKey", value: base64UrlEncode(encryptionKey));
    }

    //! ENCRYPTION KEY EXISTS, GET, DECODE AND USE.
    String? encryptionKey =
        await appSecureStorage.read(key: "userTokenEncryptionKey");
    Uint8List savedUserTokenEncryptionKey = base64Url.decode(encryptionKey!);

    //! OPEN A TOKEN BOX.
    Box<UserToken> encryptedBox = await Hive.openBox<UserToken>("userTokenBox",
        encryptionCipher: HiveAesCipher(savedUserTokenEncryptionKey));

    //! ADD TOKEN OBJECT TO BOX, USING USER EMAIL AS THE KEY
    await encryptedBox.clear();
    encryptedBox.add(userToken!);

    //! CHECK IF TOKENS HAVE BEEN SAVED.
    encryptedBox.values.contains(userToken)
        ? {areTokensCached = true}
        : {areTokensCached = false};

    return areTokensCached;
  }

  //! FETCH USERS TOKEN.
  static Future<UserToken> getUserTokens() async {
    //! GET SECURE STORAGE
    const FlutterSecureStorage appSecureStorage = FlutterSecureStorage();

    //! ENCRYPTION KEY EXISTS, GET, DECODE AND USE.
    String? encryptionKey =
        await appSecureStorage.read(key: "userTokenEncryptionKey");
    Uint8List savedUserTokenEncryptionKey = base64Url.decode(encryptionKey!);

    //! OPEN TOKEN BOX.
    Box<UserToken> encryptedBox = await Hive.openBox<UserToken>("userTokenBox",
        encryptionCipher: HiveAesCipher(savedUserTokenEncryptionKey));

    return encryptedBox.values.first;
  }
}
