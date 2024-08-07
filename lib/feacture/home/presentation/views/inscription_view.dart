import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InscriptionView extends StatelessWidget {
  final String? title;
  final String description;
  const InscriptionView({super.key, this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final titleStile = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            if (title != null)
              Center(
                child: Text(
                  title!,
                  maxLines: 1,
                  style: titleStile,
                ),
              ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                description,
                maxLines: 4,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            _InputEmail(),
            //* politiques
            const _TermAndCondicion()
          ],
        ),
      ),
    );
  }
}

class _InputEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Email:',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w200),
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    // hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    print("regristrar");
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TermAndCondicion extends StatelessWidget {
  const _TermAndCondicion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: 'By registering you agree with our ',
          style: const TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: 'Terms & Conditions',
              style: const  TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Terms & Conditions tapped');
                },
            ),
          ],
        ),
      ),
    );
  }
}
