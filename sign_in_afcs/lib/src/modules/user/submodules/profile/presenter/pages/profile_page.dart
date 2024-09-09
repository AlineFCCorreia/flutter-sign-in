import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/stores/authorization_store.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/profile/presenter/stores/profile_store.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileStore profileStore;
  late final AuthorizationStore authorizationStore;

  @override
  void initState() {
    super.initState();
    profileStore = context.read<ProfileStore>();
    authorizationStore = context.read<AuthorizationStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Perfil"),
              Text(authorizationStore.actualUser.name),
              const SizedBox(
                height: 10,
              ),
              Text(profileStore.userTitle)
            ],
          )),
    );
  }
}
