import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'extsnsion.dart';
import 'theme.dart';

class MDarkLightSwitch extends StatelessWidget {
  const MDarkLightSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.themeBloc
          .setTheme(context.isDark ? AppTheme.light : AppTheme.dark),
      child: SizedBox(
        width: 40,
        height: 20,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              height: 10,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
            ),
            context.isDark
                ? Container()
                : Align(
                    alignment: Alignment.centerRight,
                    child: FaIcon(
                      FontAwesomeIcons.sun,
                      color: Colors.yellow.shade700,
                    ),
                  ),
            context.isDark
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: FaIcon(
                      FontAwesomeIcons.moon,
                      color: Colors.blue.shade600,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
