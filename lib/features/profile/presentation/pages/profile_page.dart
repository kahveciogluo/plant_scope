import '../../../../app_export.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile', style: context.textTheme.headlineMedium),
      ),
    );
  }
}
