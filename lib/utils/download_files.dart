import 'dart:html' as html; // Import the HTML package for web

void downloadFileFromGoogleDrive(String googleDriveUrl, String fileName) {
  // Create an anchor element (link)
  final anchor = html.AnchorElement(href: googleDriveUrl)
    ..setAttribute("download", fileName) // Suggests the filename for download
    ..target = "blank"; // Optional: opens in a new tab

  // Trigger the download
  anchor.click();
}
