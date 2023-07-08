import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:toctoc/app/modules/perfil/stores/complete_registration_store.dart';
import 'package:flutter/material.dart';
import 'package:toctoc/app/modules/perfil/perfil_controller.dart';
import 'package:toctoc/app/modules/perfil/widgets/select_avatar_widget.dart';
import 'package:toctoc/app/shared/my_colors.dart';
import 'package:toctoc/app/shared/widgets/button_blue_rounded_widget.dart';
import 'package:toctoc/app/shared/widgets/text_field_widget.dart';

class CompleteRegistrationPage extends StatefulWidget {
  final String title;
  const CompleteRegistrationPage({Key? key, this.title = 'CompleteRegistrationPage'}) : super(key: key);
  @override
  CompleteRegistrationPageState createState() => CompleteRegistrationPageState();
}

class CompleteRegistrationPageState extends State<CompleteRegistrationPage> {
  final CompleteRegistrationStore store = Modular.get();
  final controller = Modular.get<CompleteRegistrationController>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: (){
                SystemNavigator.pop();
              },
              icon: const Icon(Icons.close_rounded, color: Colors.black, size: 25,)
          ),
          forceMaterialTransparency: true,
          title: Text(
            "Seus dados",
            style: theme.textTheme.titleSmall!.copyWith(color: MyColors.blue),
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: AutoSizeText(
                          'Estes dados são necessários para facilitar a identificação pelos seus amigos!',
                          style: theme.textTheme.titleSmall!.copyWith(fontSize: 18),
                          maxFontSize: 6.sw.roundToDouble(),
                          minFontSize: 3.sw.roundToDouble(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 35,),
                      const Center(
                        child: SelectAvatarWidget(),
                      ),
                      const SizedBox(height: 30,),
                      TextFieldWidget(
                        hint: 'Nome de usuário',
                        enable: true,
                        icon: const Icon(Icons.person_outline, color: MyColors.textColor),
                        keyboardType: TextInputType.text
                      ),
                    ],
                  ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ButtonBlueRoundedWidget(title: 'Salvar', onPressed: () => controller.toSelectSoundPage()),
                    ),
                  ],
                ) ,
              ),
            ),
          ],
        )
    );
  }
}