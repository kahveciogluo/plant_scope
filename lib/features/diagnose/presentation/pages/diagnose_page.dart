import '../../../../app_export.dart';

class DiagnosePage extends StatelessWidget {
  const DiagnosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Diagnose', style: context.textTheme.headlineMedium),
      ),
    );
  }
}
