import 'package:app/features/account/edit_profile/presentation/widgets/edit_profile_avatar.dart';
import 'package:app/features/account/edit_profile/presentation/widgets/edit_profile_form.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
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
    );
  }
}
