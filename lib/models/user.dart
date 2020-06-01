import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  final String uid;
  final String displayName;
  final String email;
  final String whatsAppNumber;
  final String phoneNumber;
  final String gender;

  User(
      {this.uid,
      this.displayName,
      this.email,
      this.whatsAppNumber,
      this.phoneNumber,
      this.gender});

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      uid: doc.documentID,
      displayName: doc['display_name'] ?? '',
      email: doc['email'] ?? '',
      whatsAppNumber: doc['whatsapp_number'] ?? '',
      phoneNumber: doc['phone_number'] ?? '',
    );
  }
}
