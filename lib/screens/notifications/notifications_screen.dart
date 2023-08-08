import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear_all),
            onPressed: () {
              // TODO: Implement clear all notifications functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // TODO: Replace with actual notifications count
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.notifications), // TODO: Replace with actual notification icon
              title: Text('Notification Title'), // TODO: Replace with actual notification title
              subtitle: Text('Notification Time'), // TODO: Replace with actual notification time
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.done),
                    onPressed: () {
                      // TODO: Implement mark as read functionality
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      // TODO: Implement clear notification functionality
                    },
                  ),
                ],
              ),
              onTap: () {
                // TODO: Implement notification tap functionality
              },
            ),
          );
        },
      ),
    );
  }
}