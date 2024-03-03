import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: ListView(
        children: [
          settingsItem(Icons.notifications_outlined, "Bildirim"),
          settingsItem(Icons.palette, "Tema"),
          settingsItem(Icons.account_circle_outlined, "Hesap"),
          settingsItem(Icons.info, "Uygulama hakkında"),
        ],
      ),
    );
  }

  Widget settingsItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {},
    );
  }
}
