import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/education.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'dart:html' as html;

final List<Education> educationList = [
  Education(
    description:
        "Bachelor of Science in Computer Software Engineering. Focused on mobile development and building scalable, efficient systems. Gained hands-on experience in both the technical and design aspects of software engineering.",
    linkName: "Addis Ababa University (AAU)",
    linkAddress:
        "https://drive.google.com/file/d/15_3t1_K3KdOMQ60ABwjlSTr_zZisgrdi/view?usp=sharing",
    period: "September 2017 - July 2022",
  ),
  Education(
    description:
        "Succeeding in Web Development: Full Stack and Front End - A comprehensive course focused on both front-end and back-end web development techniques.",
    linkName: "Online Certification",
    linkAddress:
        "https://www.linkedin.com/learning/certificates/4969ec918aa80214a034f04adf648d0906cffababb37314b7da158333ba9bb4e?trk=share_certificate&lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_certifications_details%3B0r7na4VYQjyC5tUM8i1P5Q%3D%3D",
    period: "2020",
  ),
  Education(
    description:
        "Mindshift: Break Through Obstacles to Learning and Discover Your Hidden Potential - A course designed to help overcome learning barriers and unlock new ways of thinking.",
    linkName: "Online Certification",
    linkAddress:
        "https://www.coursera.org/account/accomplishments/verify/8MQ5GRPSU63D?utm_source=link&utm_medium=certificate&utm_content=cert_image&utm_campaign=pdf_header_button&utm_product=course",
    period: "2020",
  ),
  Education(
    description:
        "Programming Foundations: Web Security - Gained fundamental knowledge about securing web applications and ensuring safe online interactions.",
    linkName: "Online Certification",
    linkAddress:
        "https://www.linkedin.com/learning/certificates/5d569efd032bb25286e3a387ee308ff2a716c0a75944b2725d6e42bbb01cba93?trk=share_certificate&lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_certifications_details%3B0r7na4VYQjyC5tUM8i1P5Q%3D%3D",
    period: "2019",
  ),
  Education(
    description:
        "Data Structures and Algorithms - Acquired strong foundational skills in data structures and algorithmic problem-solving.",
    linkName: "Online Certification",
    linkAddress:
        "https://drive.google.com/file/d/1SppFhMhGYS-1HS07rJtnzHkuGRlGjf4C/view?usp=sharing",
    period: "2021-2022",
  ),
  Education(
    description:
        "Learning Python - Built a solid understanding of Python, focusing on its practical applications in software development.",
    linkName: "Online Certification",
    linkAddress:
        "https://www.linkedin.com/learning/certificates/4969ec918aa80214a034f04adf648d0906cffababb37314b7da158333ba9bb4e?trk=share_certificate&lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_certifications_details%3B0r7na4VYQjyC5tUM8i1P5Q%3D%3D",
    period: "2020",
  ),
];

class EducationSection extends StatelessWidget {
  EducationSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        key: Key("Education section"),
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
    return Container(
      alignment: Alignment.center,
      child: ResponsiveConstraints(
        constraint: BoxConstraints(
          maxWidth: width,
          minWidth: width,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "EDUCATION",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Wrap(
              children: [
                Container(
                  constraints: BoxConstraints(minWidth: 400),
                  child: Text(
                    "I have a Bachelor's degree in Computer Software Engineering from Addis Ababa University. I have also completed various online courses to further my knowledge in web development, programming, and software engineering.",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: educationList
                        .map(
                          (education) => Container(
                            width: constraints.maxWidth / 2.0 - 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  education.period,
                                  style: GoogleFonts.oswald(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  education.description,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: kCaptionColor,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (education.linkAddress != null) {
                                        html.window.open(
                                          education.linkAddress!,
                                          '_blank',
                                        );
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          education.linkName,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 5.0),
                                        if (education.linkAddress != null)
                                          Icon(
                                            Iconsax.link,
                                            color: Colors.grey[300],
                                            size: 16.0,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.0,
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
