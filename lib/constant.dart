import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseStore = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;
