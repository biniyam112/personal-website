// Helper function to scroll to the section identified by the GlobalKey
import 'package:flutter/material.dart';

void scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
