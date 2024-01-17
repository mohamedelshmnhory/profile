import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/core/enums/gender.dart';
import 'package:profile/core/resources.dart';
import 'package:profile/core/utils/app_validator.dart';

import '../../../../core/dependencies/dependency_init.dart';
import '../../../../core/routes.dart';
import '../../../../core/utils/dateFormat.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_loading_widget.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/date_dialog.dart';
import '../../../../core/widgets/dropdwon_menu.dart';
import '../../../../core/widgets/scaffold_pading.dart';
import '../../../../core/language/widgets/langauge_switcher.dart';
import '../../data/models/user_profile.dart';
import '../bloc/profile/profile_bloc.dart';

class PersonalFormScreen extends StatefulWidget {
  const PersonalFormScreen({super.key, this.user});
  final UserProfile? user;

  @override
  State<PersonalFormScreen> createState() => _PersonalFormScreenState();
}

class _PersonalFormScreenState extends State<PersonalFormScreen> {
  final profileBloc = getIt<ProfileBloc>();
  final formState = GlobalKey<FormState>();
  final validator = AppValidator();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _birthdateController = TextEditingController();
  Gender _gender = Gender.male;
  DateTime? _birthdate;

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.user?.email ?? '';
    _passwordController.text = widget.user?.password ?? '';
    _nameController.text = widget.user?.name ?? '';
    _birthdateController.text = widget.user?.birthdate?.ymd ?? '';
    _gender = widget.user?.gender ?? _gender;
    _birthdate = widget.user?.birthdate;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        AppStrings.personalProfile,
        actions: [const LanguageSwitcher()],
      ),
      body: SingleChildScrollView(
        child: ScaffoldPadding(child: _buildForm()),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          20.heightBox(),
          AppTextField(
            hint: AppStrings.fullName,
            textEditingController: _nameController,
            validator: (value) => validator.validatorRequired(value, message: AppStrings.pleaseEnterYourFullName.tr()),
          ),
          20.heightBox(),
          AppTextField(
            hint: AppStrings.emailAddress,
            textEditingController: _emailController,
            validator: (value) => validator.validatorRequired(value, message: AppStrings.pleaseEnterYourEmailAddress.tr()),
          ),
          20.heightBox(),
          AppTextField(
            hint: AppStrings.password,
            textEditingController: _passwordController,
            isPassword: true,
            validator: (value) => validator.validatorRequired(value, message: AppStrings.enterPassword.tr()),
          ),
          20.heightBox(),
          EnumDropdown<Gender>(
            onChanged: (Gender? value) => setState(() => _gender = value!),
            initialValue: _gender,
            items: genderItems,
          ),
          20.heightBox(),
          GestureDetector(
            onTap: () async {
              DateDialog.instance.showDatePicker(
                  context: context,
                  selected: _birthdate,
                  onDateSelected: (selectedDate) {
                    _birthdateController.text = selectedDate.ymd;
                    setState(() {
                      _birthdate = selectedDate;
                    });
                  });
            },
            child: AppTextField(
              readOnly: true,
              textEditingController: _birthdateController,
              hint: _birthdate == null ? AppStrings.birthdate : _birthdate!.ymd,
              suffix: const Icon(Icons.calendar_today),
              validator: (value) => validator.validatorRequired(value, message: AppStrings.pleaseYourBirthdate.tr()),
            ),
          ),
          40.heightBox(),
          submitButton,
          20.heightBox(),
        ],
      ),
    );
  }

  BlocConsumer<ProfileBloc, ProfileState> get submitButton {
    return BlocConsumer<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      listener: (context, state) {
        if (state is LocationLoaded) {
          final user = UserProfile(
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            gender: _gender,
            birthdate: _birthdate,
            location: state.location,
          );
          profileBloc.add(SaveUserProfileEvent(user));
        } else if (state is ProfileSaved) {
          if (widget.user == null) {
            Navigator.pushReplacementNamed(context, PROFILE_SCREEN);
          } else {
            Navigator.pushNamed(context, PROFILE_SCREEN);
          }
        } else if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return AppLoadingWidget(message: AppStrings.loadingLocation.tr());
        }
        return AppButton(
          onPressed: () {
            if (formState.currentState?.validate() == true) {
              profileBloc.add(GetCurrentLocationEvent());
            }
          },
          text: AppStrings.submit,
        );
      },
    );
  }
}
