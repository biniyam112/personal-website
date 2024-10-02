import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/header_item.dart';
import '../../../../stateManagement/navigate_to_content.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/scroll_to_section.dart';

class HeaderDrawerMobile extends StatefulWidget {
  const HeaderDrawerMobile({Key? key}) : super(key: key);

  @override
  State<HeaderDrawerMobile> createState() => _HeaderDrawerMobileState();
}

class _HeaderDrawerMobileState extends State<HeaderDrawerMobile> {
  List<HeaderItem> headerItems = [];

  @override
  Widget build(BuildContext context) {
    final navigateToContent = Provider.of<NavigateToContent>(context);
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
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return headerItems[index].isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 28.0),
                        child: TextButton(
                          onPressed: headerItems[index].onTap,
                          child: Text(
                            headerItems[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : ListTile(
                      title: Text(
                        headerItems[index].title,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10.0,
              );
            },
            itemCount: headerItems.length,
          ),
        ),
      ),
    );
  }
}
