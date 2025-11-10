import '../../../../app_export.dart';

class MyGardenPage extends StatelessWidget {
  const MyGardenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My Garden', style: context.textTheme.headlineMedium),
      ),
    );
  }
}
