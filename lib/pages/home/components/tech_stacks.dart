import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<String> techStackIcons = [
  "assets/icons/Android-native.svg",
  "assets/icons/Figma.svg",
  "assets/icons/Firebase.svg",
  "assets/icons/Flutter.svg",
  "assets/icons/Git.svg",
  "assets/icons/Javascript.svg",
  "assets/icons/Next.svg",
  "assets/icons/Python.svg",
  "assets/icons/React.svg",
  "assets/icons/Vite.svg",
];

class TechStacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: ScreenHelper(
        key: Key("tech_stack"),
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: ResponsiveConstraints(
      constraint: BoxConstraints(
        minWidth: width,
        maxWidth: width,
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Wrap(
            alignment: WrapAlignment.center,
            spacing: 50.0,
            runSpacing: 50.0,
            children: techStackIcons
                .map(
                  (techStackIcon) => Container(
                    height: 20.0,
                    child: SvgPicture.asset(techStackIcon),
                    constraints: BoxConstraints(
                      // max of 3 per row when on mobile and 5 per row on bigger screens
                      maxWidth: ScreenHelper.isMobile(context)
                          ? constraints.maxWidth / 3.0 - 50.0
                          : constraints.maxWidth / 5.0 - 50.0,
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    ),
  );
}
