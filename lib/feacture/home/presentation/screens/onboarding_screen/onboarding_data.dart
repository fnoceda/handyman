import 'package:flutter/material.dart';

class SlideInfo {
  final int index;
  final String? title;
  final String? caption;
  final String imageUrl;
  final int? crossAxisCount;
  final Map<String, Icon>? tags;

  SlideInfo(
      {required this.index,
      this.title,
      this.caption,
      this.tags,
      this.crossAxisCount,
      required this.imageUrl});
}

List<SlideInfo> slidesInfo = [
  SlideInfo(
    index: 0,
    title: 'Best Solution For Every House Problems',
    caption:
        'We work to ensure people comfort at their home, and to provide the best and the fastest help at fair prices.',
    imageUrl: 'assets/images/onboarding1.png',
  ),
  SlideInfo(
      index: 1,
      title: '',
      caption: '',
      imageUrl: 'assets/images/onboarding2.png',
      crossAxisCount: 1,
      tags: {
        'Choose your Tasker by reviews, skills, and price':
            const Icon(Icons.check, color: Colors.yellow),
        'Find handyman close to you':
            const Icon(Icons.check, color: Colors.yellow),
        'Chat, pay and review all through one platform':
            const Icon(Icons.check, color: Colors.yellow),
      }),
  SlideInfo(
      index: 2,
      title: 'Our Services',
      caption: 'Actividades Interactivas, ayuda social, clases y cursos ',
      imageUrl: 'assets/images/onboarding3.png',
      crossAxisCount: 2,
      tags: {
        'Plumbing Services': const Icon(Icons.check, color: Colors.yellow),
        'Painting Services': const Icon(Icons.check, color: Colors.yellow),
        'Renovation Services': const Icon(Icons.check, color: Colors.yellow),
        'Electrical Services': const Icon(Icons.check, color: Colors.yellow),
        'Carpentry Services': const Icon(Icons.check, color: Colors.yellow),
        'Roofing Services': const Icon(Icons.check, color: Colors.yellow),
      }),
  SlideInfo(
      index: 2,
      title: 'Secure Payments',
      caption: '',
      imageUrl: 'assets/images/onboarding4.png',
      crossAxisCount: 2,
      tags: {
        'Safe Pay': const Icon(Icons.safety_check_sharp, color: Colors.white),
        'Fingerprint': const Icon(Icons.fingerprint, color: Colors.white),
        'Easy & Fast': const Icon(Icons.check, color: Colors.yellow),
        'Face Recognition': const Icon(Icons.face, color: Colors.white),
      }),
  SlideInfo(
      index: 2,
      title: 'Make Your Own Handyman Account',
      caption: '',
      imageUrl: 'assets/images/onboarding5.png',
      crossAxisCount: 1,
      tags: {
        'Grow Your Business':
            const Icon(Icons.business_sharp, color: Colors.white),
        'Expand Your Network':
            const Icon(Icons.data_thresholding_sharp, color: Colors.white),
        'Become a Market Leader':
            const Icon(Icons.work_history_outlined, color: Colors.white),
      }),
];
