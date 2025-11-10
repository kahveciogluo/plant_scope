import 'dart:developer';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:plant_scope/app_export.dart';
import 'package:plant_scope/features/app_web_view/cubit/app_web_view_cubit.dart';

class AppWebViewPage extends StatelessWidget {
  final String? url;
  final String? pageTitle;

  const AppWebViewPage({super.key, this.url, this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppWebViewCubit(url: url, pageTitle: pageTitle),
      child: BlocBuilder<AppWebViewCubit, AppWebViewState>(
        builder: (context, state) {
          final cubit = context.read<AppWebViewCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back, color: context.colors.primary),
              ),
              centerTitle: true,
              title: Text(
                state.pageTitle ?? 'Web View',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: context.colors.surface,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () => cubit.reload(),
                  icon: Icon(Icons.refresh, color: context.colors.primary),
                ),
              ],
            ),
            body: state.url != null && state.url!.isNotEmpty
                ? Stack(
                    children: [
                      SizedBox.expand(
                        child: InAppWebView(
                          initialUrlRequest: URLRequest(
                            url: WebUri(state.url!),
                          ),
                          initialSettings: InAppWebViewSettings(
                            mediaPlaybackRequiresUserGesture: false,
                            allowsInlineMediaPlayback: true,
                            javaScriptEnabled: true,
                            supportZoom: true,
                            useHybridComposition: true,
                            transparentBackground: false,
                            disallowOverScroll: false,
                          ),
                          shouldOverrideUrlLoading:
                              (controller, navigationAction) async {
                                return NavigationActionPolicy.ALLOW;
                              },
                          onWebViewCreated: (controller) {
                            log('🌐 WebView created');
                            cubit.setWebViewController(controller);
                          },
                          onLoadStart: (controller, url) {
                            log('🌐 Load start: $url');
                            cubit.onLoadStart();
                          },
                          onLoadStop: (controller, url) {
                            log('🌐 Load stop: $url');
                            cubit.onLoadStop();
                          },
                          onProgressChanged: (controller, progress) {
                            log('🌐 Progress: $progress%');
                            cubit.onProgressChanged(progress);
                          },
                          onReceivedError: (controller, request, error) {
                            log('🌐 Load error: $error');
                            cubit.onLoadStop();
                          },
                        ),
                      ),
                      if (state.isLoading)
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: LinearProgressIndicator(
                            value: state.progress,
                            backgroundColor: Colors.transparent,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              context.colors.primary,
                            ),
                          ),
                        ),
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.link_off,
                          size: 64,
                          color: context.colors.secondary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No URL provided',
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: context.colors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
