import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';

class RefreshClassicHeader extends StatelessWidget {
  const RefreshClassicHeader(
      {super.key,
      this.textStyle,
      this.failedIcon,
      this.completeIcon,
      this.idleIcon,
      this.releaseIcon});
  final TextStyle? textStyle;
  final Widget? failedIcon;
  final Widget? completeIcon;
  final Widget? idleIcon;
  final Widget? releaseIcon;

  @override
  Widget build(BuildContext context) => ClassicHeader(
        completeText: context.localized.successfullyUpdated,
        releaseText: context.localized.update,
        idleText: context.localized.pullDownToRefresh,
        textStyle: textStyle ?? const TextStyle(color: Colors.grey),
        failedIcon: failedIcon ?? const Icon(Icons.error, color: Colors.grey),
        completeIcon: completeIcon ?? const Icon(Icons.done, color: Colors.grey),
        idleIcon: idleIcon ?? const Icon(Icons.arrow_downward, color: Colors.grey),
        releaseIcon: releaseIcon ?? const Icon(Icons.refresh, color: Colors.grey),
        // failedText: context.localized.unknownError,
        // refreshingText: context.localized.updateDotDotDot,
        // completeText: '',
        // completeIcon: null,
        // completeDuration: Duration.zero,
      );
}

class RefreshClassicFooter extends StatelessWidget {
  const RefreshClassicFooter({super.key});

  @override
  Widget build(BuildContext context) => const ClassicFooter(
        idleText: '',
        failedText: 'context.localized.unknownError',
        loadingText: 'context.localized.uploadingDotDotDot',
        canLoadingText: ' context.localized.pullUpToLoadTheData',
        noDataText: '',
        idleIcon: null,
      );
}

class TextfieldSearchFooter extends StatelessWidget {
  const TextfieldSearchFooter({super.key});

  @override
  Widget build(BuildContext context) => const ClassicFooter(
        idleText: '',
        failedText: 'context.localized.unknownError',
        loadingText: 'context.localized.uploadingDotDotDot',
        canLoadingText: 'context.localized.pullUpToLoadTheData',
        noDataText: '',
        idleIcon: null,
      );
}
