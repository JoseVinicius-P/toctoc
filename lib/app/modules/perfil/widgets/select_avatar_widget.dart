import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:toctoc/app/modules/perfil/perfil_controller.dart';
import 'package:toctoc/app/modules/perfil/services/image_picker_service.dart';
import 'package:toctoc/app/modules/perfil/stores/select_avatar_store.dart';
import 'package:toctoc/app/shared/my_colors.dart';

class SelectAvatarWidget extends StatefulWidget {
  final String title;
  const SelectAvatarWidget({Key? key, this.title = "SelectAvatarWidget"}) : super(key: key);

  @override
  State<SelectAvatarWidget> createState() => _SelectAvatarWidgetState();
}

class _SelectAvatarWidgetState extends State<SelectAvatarWidget> {
  final store = Modular.get<SelectAvatarStore>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            SizedBox(
              width: 40.sw.roundToDouble(),
              height: 40.sw.roundToDouble(),
              child: TripleBuilder(
                store: store,
                builder: (context, triple) => CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/perfil.png'),
                  foregroundImage: FileImage(File(triple.state.toString())),
                  radius: 40.sw.roundToDouble(),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: -15,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.blue, // Altera a cor de fundo
                  shape: const CircleBorder(),
                ),
                onPressed: () => store.pickImage(),
                child: const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Icon(Icons.camera_alt_outlined, color: Colors.white70,),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}