/*
 * Copyright (C) 2025 Marian Pecqueur && Jan Drobílek
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */
import 'package:flutter/material.dart';
import 'package:strnadi/bottomBar.dart';

class NotificationScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      icon: Icons.mic,
      title: 'Nahrávka analyzována!',
      message: 'Ve vaší nahrávce “na chalupě” byl určen dialekt CB',
      time: '3h',
      unread: true,
    ),
    NotificationItem(
      icon: Icons.camera,
      title: 'Váš snímek byl vybrán jako fotka týdne',
      message: 'U vaší nahrávky “na procházce v Praze” byla vybrána fotka, jako fotka týdne!',
      time: '1d',
      unread: true,
    ),
    NotificationItem(
      icon: Icons.error_outline,
      title: 'Nová aktualizace aplikace',
      message: 'Lorem ipsum dolor sit amet consectetur. Accumsan et hendrerit viverra elit pretium. 👏',
      time: '1m',
      unread: false,
    ),
    NotificationItem(
      icon: Icons.notifications,
      title: 'Notification title',
      message: 'Lorem ipsum dolor sit amet consectetur. Accumsan et hendrerit viverra elit pretium.',
      time: '8m',
      unread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomBar(
      appBarTitle: 'Oznámení',
      content: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: Icon(notification.icon),
            title: Text(
              notification.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(notification.message),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(notification.time, style: TextStyle(color: Colors.grey)),
                if (notification.unread)
                  const Icon(Icons.circle, color: Colors.black, size: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final IconData icon;
  final String title;
  final String message;
  final String time;
  final bool unread;

  NotificationItem({
    required this.icon,
    required this.title,
    required this.message,
    required this.time,
    required this.unread,
  });
}
