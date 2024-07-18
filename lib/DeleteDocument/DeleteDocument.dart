import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DocumentDeletionService {
  final String documentId;
  final Duration duration;

  DocumentDeletionService({required this.documentId, required this.duration});

  Future<void> scheduleDeletion() async {
    final CollectionReference collection = FirebaseFirestore.instance.collection('Reels');
    final DocumentReference document = collection.doc(documentId);

    // Calculate expiry time
    final Timestamp now = Timestamp.now();
    final Timestamp expiryTime = Timestamp.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch + duration.inMilliseconds);

    // Set expiry time in document
    await document.update({'expiryTime': expiryTime});

    // Schedule deletion
    Timer(duration, () async {
      await document.delete();
    });
  }
}