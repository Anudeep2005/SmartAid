import 'package:flutter/material.dart';
import 'step_details.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String imagePath; 

  DetailsPage({required this.title, required this.imagePath});

  final Map<String, Map<String, dynamic>> firstAidData = {
  'CPR': {
    'image': 'assets/cpr.gif',
    'steps': [
      'Check for responsiveness and breathing',
      'Call emergency services immediately',
      'Start chest compressions',
      'Give rescue breaths',
      'Continue until help arrives',
    ],
  },
  'Bleeding': {
    'image': 'assets/bleeding.gif',
    'steps': [
      'Apply direct pressure to the wound',
      'Elevate the injured area',
      'Wrap with a clean cloth or bandage',
      'Seek medical attention if severe',
    ],
  },
  'Burns': {
    'image': 'assets/burns.gif',
    'steps': [
      'Cool the burn under running water',
      'Do not apply ice or butter',
      'Cover with sterile non-adhesive bandage',
      'Take pain relievers if needed',
      'Get medical help for severe burns',
    ],
  },
  'Allergies': {
    'image': 'assets/allergy.gif',
    'steps': [
      'Identify the allergen',
      'Use antihistamines if mild',
      'Administer epinephrine if available',
      'Call emergency help immediately',
    ],
  },
  'Poisoning': {
    'image': 'assets/poisoning.gif',
    'steps': [
      'Identify the substance, if possible',
      'Call poison control or emergency services',
      'Do not induce vomiting unless told to do so',
      'Keep the person calm and still',
      'Follow instructions from medical professionals',
    ],
  },
  'Bites': {
    'image': 'assets/bites.gif',
    'steps': [
      'Clean the bite area with soap and water',
      'Apply an antiseptic',
      'Cover with a clean bandage',
      'Seek medical help for animal or venomous bites',
      'Watch for signs of infection',
    ],
  },
  'Injuries': {
    'image': 'assets/injuries.gif',
    'steps': [
      'Keep the person calm',
      'Stabilize the injured part',
      'Apply a cold pack to reduce swelling',
      'Wrap with a bandage if necessary',
      'Consult a doctor for evaluation',
    ],
  },
  'Respiratory': {
    'image': 'assets/respiratory.gif',
    'steps': [
      'Help the person sit in a comfortable position',
      'Loosen tight clothing',
      'Assist with medication if available (e.g., inhaler)',
      'Call emergency services if breathing difficulty continues',
      'Monitor until help arrives',
    ],
  },
  'Heart': {
    'image': 'assets/heart.gif',
    'steps': [
      'Call emergency services immediately',
      'Have the person sit down and rest',
      'Loosen tight clothing',
      'Give aspirin if not allergic and conscious',
      'Perform CPR if unresponsive and no pulse',
    ],
  },
  'Fracture': {
    'image': 'assets/fracture.gif',
    'steps': [
      'Immobilize the affected area',
      'Avoid moving the broken bone',
      'Apply a splint if trained',
      'Use ice packs to reduce swelling',
      'Seek emergency medical help',
    ],
  },
};


  @override
  Widget build(BuildContext context) {
    final steps = firstAidData[title]?['steps'] ?? ['Step data unavailable'];
    final image = firstAidData[title]?['image'] ?? imagePath;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FC),
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios, size: 20),
                  ),
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Image Preview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Icon(Icons.play_circle_fill, color: Colors.white, size: 60),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),

            // Video description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Watch demonstration video:",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Text(
                    "Overview of ${title.toLowerCase()} and first aid steps",
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Steps heading
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "First Aid Steps",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(height: 12),

            // List of steps
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: steps.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StepDetailPage(
                            title: steps[index],
                            description: "Detailed explanation for step ${index + 1}.",
                            icon: "${index + 1}",
                          ),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.purple[100],
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.purple[900],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                steps[index],
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
