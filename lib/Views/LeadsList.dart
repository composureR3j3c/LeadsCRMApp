import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LeadsList extends StatefulWidget {
  const LeadsList({super.key});

  @override
  State<LeadsList> createState() => _LeadsListState();
}

class _LeadsListState extends State<LeadsList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
