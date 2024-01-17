import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/core/widgets/app_button.dart';

import '../../../../core/dependencies/dependency_init.dart';
import '../../../../core/resources.dart';
import '../../../../core/routes.dart';
import '../../../../core/utils/launch_url.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_loading_widget.dart';
import '../../../../core/widgets/scaffold_pading.dart';
import '../../../../core/utils/dateFormat.dart';
import '../../../../core/language/widgets/langauge_switcher.dart';
import '../bloc/profile/profile_bloc.dart';
import '../widgets/info_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileBloc = getIt<ProfileBloc>();

  @override
  void initState() {
    super.initState();
    profileBloc.add(FetchUserProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        AppStrings.profile,
        actions: [const LanguageSwitcher()],
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: profileBloc,
        listener: (BuildContext context, ProfileState state) {},
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const AppLoadingWidget();
          } else if (state is ProfileLoaded) {
            return _buildProfileContent(state);
          } else if (state is ProfileError) {
            return _buildErrorState(state.message);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildProfileContent(ProfileLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InfoTile(title: AppStrings.fullName, value: state.user.name ?? ''),
        InfoTile(title: AppStrings.emailAddress, value: state.user.email ?? ''),
        InfoTile(title: AppStrings.gender, value: state.user.gender?.name ?? ''),
        InfoTile(title: AppStrings.birthdate, value: state.user.birthdate?.ymd ?? ''),
        if (state.user.location != null)
          Padding(
            padding: symmetricPadding(50, 20),
            child: ElevatedButton.icon(
              onPressed: () {
                LaunchUrl.openMap(state.user.location!);
              },
              icon: const Icon(Icons.map, color: Colors.white),
              label: AppText(text: AppStrings.viewOnMap, style: meduim18.copyWith(color: white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
              ),
            ),
          ),
        if (!Navigator.of(context).canPop())
          Padding(
            padding: symmetricPadding(0, 20),
            child: AppButton(
              text: AppStrings.editProfile,
              onPressed: () {
                Navigator.pushNamed(context, FORM_SCREEN, arguments: state.user);
              },
            ),
          ),
      ],
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: AppText(text: error),
    );
  }
}
