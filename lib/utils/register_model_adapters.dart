import 'package:bucc_app/services/model/auth/token_model.dart';
import 'package:bucc_app/services/model/auth/user_model.dart';
import 'package:bucc_app/services/model/event_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

//! THIS CLASS IS BUILT TO SOLELY HANDLE ALL HIVE ADAPTER REGISTRATION
//! KINDLY ADD ALL ADAPTERS IN HERE.

class RegisterAdapters {
  static Future<void> initializeBDAndRegisterAdapters() async {
    //! FETCH THE APP DOCUMENT PATH.
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    //! INITIALIZE DB IN DOCUMENT PATH.
    Hive.init(appDocumentDirectory.path);

    //! OPEN STORAGE BOXES, INITIALIZE ADAPTERS & SAVE OBJECTS TO DB FOR SMOOTH RUNNING AND UPDATING.
    Hive.registerAdapter(UserTokenAdapter());
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(EventModelAdapter());
  }
}
