import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

DatabaseReference ref = FirebaseDatabase.instance.ref("units");

Stream<DatabaseEvent> stream = ref.onValue;
