import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../models/header_item.dart';
import '../../../../stateManagement/navigate_to_content.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/scroll_to_section.dart';

class HeaderRowTablet extends StatefulWidget {
  @override
  State<HeaderRowTablet> createState() => _HeaderRowTabletState();
}

class _HeaderRowTabletState extends State<HeaderRowTablet> {
  List<HeaderItem> headerItems = [];

  @override
  Widget build(BuildContext context) {
    final navigateToContent = Provider.of<NavigateToContent>(context);

    // Define actions for header items
    headerItems = [
      HeaderItem(
        title: "ABOUT ME",
        onTap: () {
          navigateToContent.navigateTo(PageContent.about);
          scrollToSection(navigateToContent.currentKey);
        },
      ),
      HeaderItem(
        title: "PROJECTS",
        onTap: () {
          navigateToContent.navigateTo(PageContent.project1);
          scrollToSection(navigateToContent.currentKey);
        },
      ),
      HeaderItem(
        title: "EDUCATION",
        onTap: () {
          navigateToContent.navigateTo(PageContent.education);
          scrollToSection(navigateToContent.currentKey);
        },
      ),
      HeaderItem(
        title: "TESTIMONIALS",
        onTap: () {
          navigateToContent.navigateTo(PageContent.testimonials);
          scrollToSection(navigateToContent.currentKey);
        },
      ),
      HeaderItem(
        title: "CONTACT",
        onTap: () {
          navigateToContent.navigateTo(PageContent.contactMe);
          scrollToSection(navigateToContent.currentKey);
        },
        isButton: true,
      ),
    ];
    return ResponsiveVisibility(
      visible: false,
      visibleConditions: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                        child: TextButton(
                          onPressed: item.onTap,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: item.onTap,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}
