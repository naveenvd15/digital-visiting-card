import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

import 'widgets/contact_row.dart';
import 'widgets/social_icon.dart';

class VisitingCardScreen extends StatelessWidget {
  const VisitingCardScreen({super.key});

  Future<void> _saveContact() async {
    const String name = 'Naveen Vinayak Desai';
    const String phone = '+91 79814 34815';
    const String email = 'naveenvd1505@gmail.com';

    final String contact = [
      'BEGIN:VCARD',
      'VERSION:3.0',
      'FN:$name',
      'TEL;TYPE=CELL:$phone',
      'EMAIL:$email',
      'END:VCARD',
    ].join('\r\n');

    await SharePlus.instance.share(
      ShareParams(
        files: [
          XFile.fromData(
            Uint8List.fromList(contact.codeUnits),
            mimeType: 'text/vcard',
            name: 'Naveen_Desai_Contact.vcf',
          ),
        ],
        fileNameOverrides: ['Naveen_Desai_Contact.vcf'],
        subject: 'Naveen Desai - Digital Visiting Card',
      ),
    );
  }

  Widget _profileSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 112,
          height: 112,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF14213D), Color(0xFF647BA8)],
            ),
            border: Border.all(color: const Color(0xFFDCE5F5), width: 5),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF14213D).withValues(alpha: 0.15),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(
            Icons.person_rounded,
            color: Colors.white,
            size: 66,
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'Naveen Vinayak Desai',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Color(0xFF28213D),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFE8EDF7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Computer Science Student',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF405579),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Passionate student interested in Flutter '
          'development, creative UI design, and building '
          'useful mobile applications.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF777184), fontSize: 13, height: 1.7),
        ),
      ],
    );
  }

  Widget _contactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CONTACT DETAILS',
          style: TextStyle(
            fontSize: 13,
            letterSpacing: 1.8,
            fontWeight: FontWeight.bold,
            color: Color(0xFF405579),
          ),
        ),
        const SizedBox(height: 18),
        const ContactRow(icon: Icons.phone_rounded, text: '+91 79814 34815'),
        const SizedBox(height: 18),
        const ContactRow(
          icon: Icons.email_rounded,
          text: 'naveenvd1505@gmail.com',
        ),
        const SizedBox(height: 18),
        const ContactRow(
          icon: Icons.location_on_rounded,
          text: 'Hyderabad, Telangana',
        ),
        const SizedBox(height: 25),
        const Divider(color: Color(0xFFE5EAF2)),
        const SizedBox(height: 20),
        const Text(
          'CONNECT WITH ME',
          style: TextStyle(
            fontSize: 12,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
            color: Color(0xFF777184),
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            SocialIcon(
              icon: FontAwesomeIcons.facebookF,
              url: 'https://www.facebook.com/',
            ),
            SocialIcon(
              icon: FontAwesomeIcons.instagram,
              url: 'https://www.instagram.com/',
            ),
            SocialIcon(
              icon: FontAwesomeIcons.linkedinIn,
              url: 'https://www.linkedin.com/',
            ),
            SocialIcon(
              icon: FontAwesomeIcons.github,
              url: 'https://github.com/',
            ),
          ],
        ),
        const SizedBox(height: 25),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _saveContact,
            icon: const Icon(Icons.download_rounded),
            label: const Text(
              'SAVE CONTACT',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF14213D),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _visitingCard(bool horizontal) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      padding: EdgeInsets.all(horizontal ? 32 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withValues(alpha: 0.8)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF101B33).withValues(alpha: 0.22),
            blurRadius: 30,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: horizontal
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 20,
                    ),
                    child: _profileSection(),
                  ),
                ),
                Container(
                  width: 1,
                  height: 360,
                  margin: const EdgeInsets.symmetric(horizontal: 26),
                  color: const Color(0xFFE5EAF2),
                ),
                Expanded(flex: 6, child: _contactSection()),
              ],
            )
          : Column(
              children: [
                _profileSection(),
                const SizedBox(height: 28),
                const Divider(color: Color(0xFFE5EAF2)),
                const SizedBox(height: 24),
                _contactSection(),
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF14213D), Color(0xFF405579), Color(0xFF647BA8)],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bool horizontal = constraints.maxWidth >= 760;

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontal ? 35 : 20,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.badge_rounded,
                      color: Colors.white,
                      size: 42,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'DIGITAL VISITING CARD',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Simple  •  Professional  •  Connected',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _visitingCard(horizontal),
                    const SizedBox(height: 24),
                    const Text(
                      'Simple • Professional • Connected',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
