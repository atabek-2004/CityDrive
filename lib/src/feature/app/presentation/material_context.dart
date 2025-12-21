import 'package:flutter/material.dart';

import 'package:ikidz/src/core/constant/localization/localization.dart';

import 'package:ikidz/src/core/theme/resources.dart';

import 'package:ikidz/src/feature/app/presentation/widgets/app_router_builder.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';

import 'package:ikidz/src/feature/settings/widget/settings_scope.dart';

/// {@template material_context}
/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
/// {@endtemplate}
class MaterialContext extends StatelessWidget {
  /// {@macro material_context}
  const MaterialContext({super.key});

  // This global key is needed for [MaterialApp]
  // to work properly when Widgets Inspector is enabled.
  static final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final settings = SettingsScope.settingsOf(context);
    final mediaQueryData = MediaQuery.of(context);

    return AppRouterBuilder(
      createRouter: (context) => AppRouter(),
      builder: (context, informationParser, routerDelegate, router) =>
          MaterialApp.router(
        title: 'iProject',
        onGenerateTitle: (context) => 'iProject',
        routerDelegate: routerDelegate,
        routeInformationParser: informationParser,
        theme: AppTheme.light,
        darkTheme: AppTheme.light,
        // theme: theme.lightTheme,
        // darkTheme: theme.darkTheme,
        // themeMode: ThemeMode.light, // theme.mode,
        localizationsDelegates: Localization.localizationDelegates,
        supportedLocales: Localization.supportedLocales,
        locale: settings.locale,
        // home: const HomeScreen(),
        // builder: (context, child) => MediaQuery.withClampedTextScaling(
        //   maxScaleFactor: 1,
        //   minScaleFactor: 1,
        //   child: LoaderOverlay(child: child!),
        // ),
        builder: (context, child) =>
            //  if (kDebugMode) child = _ChildWidget(router: router, child: child!);
            MediaQuery(
          key: _globalKey,
          data: mediaQueryData.copyWith(
            textScaler: TextScaler.linear(
              mediaQueryData.textScaler
                  .scale(settings.textScale ?? 1)
                  .clamp(0.5, 2),
            ),
          ),
          child: child!,
        ),
      ),
    );
  }
}

// class _ChildWidget extends StatefulWidget {
//   const _ChildWidget({required this.child, required this.router});
//   final Widget child;
//   final StackRouter router;

//   @override
//   State<_ChildWidget> createState() => _ChildWidgetState();
// }

// class _ChildWidgetState extends State<_ChildWidget> {
//   final DraggablePanelController controller = DraggablePanelController();

//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DraggablePanel(
//       controller: controller,
//       items: [
//         DraggablePanelItem(
//           enableBadge: false,
//           icon: Icons.developer_board,
//           onTap: (localContext) {
//             widget.router.push(const LoginRoute());
//           },
//         ),
//         DraggablePanelItem(
//           enableBadge: false,
//           icon: Icons.http,
//           onTap: (localContext) {
//             widget.router.push(const TalkerLoggerRoute());
//           },
//         ),
//         DraggablePanelItem(
//           enableBadge: false,
//           icon: Icons.add_reaction_rounded,
//           onTap: (localContext) {
//             // widget.router.push(const IconsDevRoute());
//           },
//         ),
//       ],
//       buttons: [
//         DraggablePanelButtonItem(
//           icon: Icons.copy,
//           onTap: (context) {
//             final cookie = context.repository.authDao.cookie.value;

//             if (cookie != null) {
//               Clipboard.setData(ClipboardData(text: cookie));
//               AppToast.show('Сookie is copied', type: AppToastType.success);
//             } else {
//               AppToast.show('Cookie not found');
//             }
//             // Hide
//             controller.toggle(context);
//           },
//           label: 'Cookie',
//         ),
//         DraggablePanelButtonItem(
//           icon: Icons.token,
//           onTap: (context) {
//             NotAuthLogic().statusSubject.add(NotAuthLogicStatus.unauthorized);

//             // Hide
//             controller.toggle(context);
//           },
//           label: 'Unauthorize',
//         ),
//       ],
//       child: widget.child,
//     );
//   }
// }
