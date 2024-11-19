import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Portfolio(),
    theme: ThemeData.dark(), // Enables dark mode feel
  ));
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black, // Black background for a coder feel
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // Added gap at the top

            // Profile Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text at the top of the profile picture
              children: [
                CircleAvatar(
                  radius: screenWidth < 400 ? 40 : 60, // Smaller photo for smaller screens
                  backgroundImage: AssetImage('images/profilePic.jpeg'), // Profile picture
                ),
                SizedBox(width: 20), // Space between image and text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Subham Paul",
                        style: TextStyle(
                          fontSize: screenWidth < 400 ? 22 : 28, // Adjust font size for smaller screens
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent, // Green color for name (like code comments)
                          fontFamily: "Courier New", // Monospace font
                        ),
                      ),
                      Text(
                        "Software Developer",
                        style: TextStyle(
                          fontSize: screenWidth < 400 ? 16 : 18, // Adjust font size for smaller screens
                          color: Colors.blueAccent, // Blue color for title (like keywords in code)
                          fontFamily: "Courier New",
                        ),
                      ),
                      Text(
                        "4+ years experience",
                        style: TextStyle(
                          fontSize: screenWidth < 400 ? 12 : 14, // Adjust font size for smaller screens
                          color: Colors.yellowAccent, // Yellow color for subtle info (like variables)
                          fontFamily: "Courier New",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // About Me Section
            Text(
              "About Me",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text for headers
                fontFamily: "Courier New",
              ),
            ),
            SizedBox(height: 10),
            Text(
              "I am a passionate software developer specializing in frontend technologies like Angular, React, JavaScript, and Flutter. I love building web applications and providing solutions that make a difference.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400], // Lighter text for content
                fontFamily: "Courier New",
              ),
            ),
            SizedBox(height: 30),

            // Skills Section
            Text(
              "Skills",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Courier New",
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                skillChip("Angular"),
                skillChip("React"),
                skillChip("JavaScript"),
                skillChip("Flutter"),
                skillChip("HTML & CSS"),
                skillChip("TypeScript"),
              ],
            ),
            SizedBox(height: 30),

            // Experience Section with Popup
            Text(
              "Experience",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Courier New",
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => showExperienceDialog(context, "Maxbridge Solution", "Application Developer", "March 2023 - Present", "Developed hospital management systems, worked on GIS projects, and built applications for NTPC."),
              child: experienceTile("Maxbridge Solution", "Application Developer", "March 2023 - Present"),
            ),
            GestureDetector(
              onTap: () => showExperienceDialog(context, "Rolling Arrays", "Associate Consultant", "June 2022 - March 2023", "Worked on various consulting projects including web application development."),
              child: experienceTile("Rolling Arrays", "Associate Consultant", "June 2022 - March 2023"),
            ),
            GestureDetector(
              onTap: () => showExperienceDialog(context, "Ayant Software Pvt Ltd", "Team Lead", "2018 - 2020", "Led a team of developers to build enterprise-level software solutions."),
              child: experienceTile("Ayant Software Pvt Ltd", "Team Lead", "2018 - 2020"),
            ),
            SizedBox(height: 30),

            // Projects Section with Popup
            Text(
              "Projects",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Courier New",
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => showProjectDialog(context, "NTPC Sanjeevani 2.0", "Built a complete system for NTPC to manage employee records and hospital admissions, including authentication via fingerprint and face verification."),
              child: projectTile("NTPC Sanjeevani 2.0", "Built a system for NTPC to manage employee records and hospital admissions."),
            ),
            GestureDetector(
              onTap: () => showProjectDialog(context, "GIS Project for Arunachal Pradesh", "Created a GIS-based project to map land records and hospital data, with advanced features like data visualization."),
              child: projectTile("GIS Project for Arunachal Pradesh", "Created a GIS-based project to map land records and hospital data."),
            ),
            GestureDetector(
              onTap: () => showProjectDialog(context, "Hotel Sonajhuri", "Developed a hotel management system using Angular and PHP, streamlining booking and guest management."),
              child: projectTile("Hotel Sonajhuri", "Developed a hotel management system using Angular and PHP."),
            ),
            SizedBox(height: 30),

            // Contact Section
            Text(
              "Contact",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Courier New",
              ),
            ),
            SizedBox(height: 10),
            Text("Email: subhampaul011@gmail.com", style: TextStyle(fontSize: 16, color: Colors.grey[400], fontFamily: "Courier New")),
            Text("Phone: +91-8768427379", style: TextStyle(fontSize: 16, color: Colors.grey[400], fontFamily: "Courier New")),
          ],
        ),
      ),
    );
  }

  // Helper widget for Skills
  Widget skillChip(String label) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontFamily: "Courier New"), // Monospace font for skills
      ),
      backgroundColor: Colors.blueAccent.withOpacity(0.2),
    );
  }

  // Helper widget for Experience
  Widget experienceTile(String company, String position, String duration) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        position,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.greenAccent, // Green for position titles
          fontFamily: "Courier New",
        ),
      ),
      subtitle: Text(
        "$company • $duration",
        style: TextStyle(
          color: Colors.grey[400], // Grey for company and duration info
          fontFamily: "Courier New",
        ),
      ),
      leading: Icon(Icons.work, color: Colors.blueAccent),
    );
  }

  // Helper widget for Projects
  Widget projectTile(String projectName, String description) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        projectName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.greenAccent, // Green for project names
          fontFamily: "Courier New",
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          color: Colors.grey[400], // Grey for project descriptions
          fontFamily: "Courier New",
        ),
      ),
      leading: Icon(Icons.code, color: Colors.blueAccent),
    );
  }

  // Show Experience Dialog
  void showExperienceDialog(BuildContext context, String company, String position, String duration, String details) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("$position at $company", style: TextStyle(fontFamily: "Courier New")),
        content: Text("Duration: $duration\n\nDetails: $details", style: TextStyle(fontFamily: "Courier New")),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  // Show Project Dialog
  void showProjectDialog(BuildContext context, String projectName, String details) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(projectName, style: TextStyle(fontFamily: "Courier New")),
        content: Text("Details: $details", style: TextStyle(fontFamily: "Courier New")),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }
}

