import 'package:app/features/account/edit_profile/presentation/widgets/edit_profile_avatar.dart';
import 'package:app/features/account/edit_profile/presentation/widgets/edit_profile_form.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarHeader(
              title: 'Edit Profil',
              subtitle: 'Perbarui informasi akun Anda',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      EditProfileAvatar(),
                      SizedBox(height: 32),
                      EditProfileForm(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

