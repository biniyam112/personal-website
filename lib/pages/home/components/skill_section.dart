import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/skill.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'dart:html' as html;

List<Skill> skills = [
  Skill(
    skill: "Dart",
    percentage: 96,
  ),
  Skill(
    skill: "React.js",
    percentage: 88,
  ),
  Skill(
    skill: "Python",
    percentage: 83,
  ),
  Skill(
    skill: "Javascript",
    percentage: 82,
  ),
  Skill(
    skill: "Next.js",
    percentage: 85,
  ),
];

class SkillSection extends StatelessWidget {
  SkillSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        key: Key("Skill section"),
        desktop: Padding(
          padding: const EdgeInsets.only(top: 160.0),
          child: _buildUi(kDesktopMaxWidth),
        ),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveConstraints(
            constraint: BoxConstraints(
              maxWidth: width,
              minWidth: width,
            ),
            child: Flex(
              direction: ScreenHelper.isMobile(context) ? Axis.vertical : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Lottie.asset(
                    "assets/lottie/lottie_3.json",
                    width: 300.0,
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SKILLS",
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14.0,
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "The skill ratings displayed are based on technical assessments completed on the WeLoveDevs platform. These assessments measure proficiency in various programming languages and frameworks. You can explore the tests at ",
                              style: TextStyle(
                                color: kCaptionColor,
                              ),
                            ),
                            TextSpan(
                              text: "https://welovedevs.com/app/tests.",
                              mouseCursor: WidgetStateMouseCursor.clickable,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  html.window
                                      .open("https://welovedevs.com/app/tests", "WeLoveDevs");
                                },
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Column(
                        children: skills
                            .map(
                              (skill) => Container(
                                margin: EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: skill.percentage,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10.0),
                                        alignment: Alignment.centerLeft,
                                        height: 38.0,
                                        child: Text(skill.skill),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      // remaining (blank part)
                                      flex: 100 - skill.percentage,
                                      child: Divider(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "${skill.percentage}%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
