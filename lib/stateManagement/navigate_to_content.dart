import 'package:flutter/material.dart';

class NavigateToContent extends ChangeNotifier {
  final Map<PageContent, GlobalKey> contentKeys = {
    PageContent.about: GlobalKey(),
    PageContent.project1: GlobalKey(),
    PageContent.project2: GlobalKey(),
    PageContent.education: GlobalKey(),
    PageContent.skills: GlobalKey(),
    PageContent.testimonials: GlobalKey(),
    PageContent.contactMe: GlobalKey(),
  };
  late GlobalKey _currentKey;

  final ScrollController _scrollController = ScrollController();

  get scrollController => _scrollController;

  NavigateToContent() {
    _currentKey = contentKeys[PageContent.about]!;
    _scrollController.addListener(_scrollListener);
  }

  GlobalKey get currentKey => _currentKey;

  void navigateTo(PageContent pageContent) {
    _currentKey = contentKeys[pageContent]!;
    notifyListeners();
  }

  bool _isScrolled = false;

  bool get isScrolled => _isScrolled;

  void _scrollListener() {
    if (_scrollController.position.pixels > 0 && !_isScrolled) {
      _isScrolled = true;
      notifyListeners();
    } else if (_scrollController.position.pixels == 0 && _isScrolled) {
      _isScrolled = false;
      notifyListeners();
    }
  }
}

enum PageContent { about, skills, project1, project2, education, testimonials, contactMe }
