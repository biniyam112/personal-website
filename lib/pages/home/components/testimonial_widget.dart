import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/testimonial.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Testimonial> testimonials = [
  Testimonial(
    text:
        "Biniyam has an incredible ability to turn complex ideas into functional, user-friendly mobile applications. His attention to detail and commitment to delivering high-quality results truly set him apart. Working with him on RateEat was a seamless experience, and I look forward to collaborating again in the future.",
    occupation: "Senior Mobile Developer",
    personName: "NIGATU PAULOS",
    profilePhoto: "assets/images/jeno.jpg",
  ),
  Testimonial(
    text:
        "Biniyam's problem-solving skills are second to none. He brings creativity and technical expertise to every project, always finding solutions to difficult challenges. His work on RateEat was outstanding, and I can confidently say he's one of the best developers I've worked with.",
    occupation: "Fullstack Developer/Friend",
    personName: "TIBENU WASSIE",
    profilePhoto: "assets/images/tibebu.jpeg",
  ),
];

class TestimonialWidget extends StatelessWidget {
  TestimonialWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        key: Key("testimonial"),
        desktop: Padding(
          padding: const EdgeInsets.only(top: 160.0),
          child: _buildUi(kDesktopMaxWidth),
        ),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TESTIMONIALS",
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
              Container(
                constraints: BoxConstraints(maxWidth: 600.0),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.plusJakartaSans(
                      height: 1.8,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "Check out reviews from my amazing co-workers and see how I can help with your project.",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: " Get in touch here.",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " Let's collaborate!",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 45.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context) ? Axis.vertical : Axis.horizontal,
                // Lets map
                children: testimonials.map((testimonial) {
                  return Expanded(
                    flex: ScreenHelper.isMobile(context) ? 0 : 1,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(bottom: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/quote.png",
                              width: 50.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            testimonial.text,
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.8,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                  testimonial.profilePhoto,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    testimonial.personName,
                                    style: GoogleFonts.oswald(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    testimonial.occupation,
                                    style: TextStyle(
                                      color: kCaptionColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    ),
  );
}
