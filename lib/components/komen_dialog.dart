import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lapor_book/components/styles.dart';
import 'package:lapor_book/models/laporan.dart';

class KomenDialog extends StatefulWidget {
  final Laporan laporan;
  const KomenDialog({super.key, required this.laporan});

  @override
  State<KomenDialog> createState() => _KomenDialogState();
}

class _KomenDialogState extends State<KomenDialog> {
  late String komentar;
  final _firestore = FirebaseFirestore.instance;

  void addKomen() async {
    CollectionReference transaksiCollection = _firestore.collection('laporan');
    try {
      await transaksiCollection.doc(widget.laporan.docId).update({
        'komentar': komentar,
      });
      Navigator.popAndPushNamed(context, '/dashboard');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
