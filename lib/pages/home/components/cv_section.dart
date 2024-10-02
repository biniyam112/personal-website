import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/experience.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

import '../../../utils/download_files.dart';

final List<Experience> experience = [
  Experience(
    title: "PROMOTE",
    imagePath: "assets/plan.png",
    subtitle:
        "Focus on creating strategies that get your product noticed, helping it connect with the right audience and grow organically.",
  ),
  Experience(
    title: "DESIGN",
    imagePath: "assets/design.png",
    subtitle:
        "Design intuitive and visually appealing user experiences, making sure every interface feels seamless and easy to use.",
  ),
  Experience(
    title: "DEVELOP",
    imagePath: "assets/develop.png",
    subtitle:
        "Build reliable, efficient apps, paying attention to scalability and performance to ensure smooth functionality for users.",
  ),
  Experience(
    title: "SOLVE",
    imagePath: "assets/write.png",
    subtitle:
        "Enjoy tackling complex challenges, finding clear, effective solutions through careful analysis and thoughtful execution.",
  ),
];

class CvSection extends StatelessWidget {
  CvSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        key: Key("CV section"),
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return ResponsiveConstraints(
      constraint: BoxConstraints(
        maxWidth: width,
        minWidth: width,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BETTER DESIGN,\nBETTER EXPERIENCES",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.8,
                  fontSize: 18.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  String googleDriveLink =
                      "https://drive.google.com/file/d/1tLtS7B9JOE4Dfs0qfF-L_F87nWwKrrJk/view?usp=sharing";
                  String fileName = "Biniyam_Demissew_Resume.pdf";

                  downloadFileFromGoogleDrive(googleDriveLink, fileName);
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "DOWNLOAD CV",
                    style: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            child: LayoutBuilder(
              builder: (_context, constraints) {
                return ResponsiveGridView.builder(
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: ScreenHelper.isDesktop(context) ? 80 : 20,
                    maxCrossAxisExtent:
                        ScreenHelper.isTablet(context) || ScreenHelper.isMobile(context)
                            ? constraints.maxWidth / 1.2
                            : 250.0,
                    // adjust child height
                    childAspectRatio: ScreenHelper.isDesktop(context)
                        ? 1.5
                        : MediaQuery.of(context).size.aspectRatio * 1.2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                experience[index].imagePath,
                                width: 40.0,
                              ),
                              SizedBox(width: 15.0),
                              Text(
                                experience[index].title,
                                style: GoogleFonts.oswald(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            experience[index].subtitle,
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: experience.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
