import 'package:flutter/material.dart';

class NotificationPopup {
  static OverlayEntry? _overlayEntry;

  static void toggle(BuildContext context) {
    if (_overlayEntry != null) {
      close();
    } else {
      _overlayEntry = _createOverlayEntry(context);
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  static void close() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  static OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Tap anywhere outside to close
          GestureDetector(
            onTap: close,
            behavior: HitTestBehavior.translucent,
            child: Container(color: Colors.transparent),
          ),

          // The actual popup
          Positioned(
            top: kToolbarHeight + 30, // just below appbar
            right: 16,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 300,
                constraints: const BoxConstraints(maxHeight: 400),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Notifications",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Divider(),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: const [
                          _NotificationItem(
                            title: "Booking Confirmed",
                            message:
                            "Your bike repair service is confirmed for today at 4 PM",
                            time: "2 mins ago",
                          ),
                          _NotificationItem(
                            title: "Service Completed",
                            message:
                            "Ram Mechanics has completed your service. Please rate your experience.",
                            time: "1 hour ago",
                          ),
                          _NotificationItem(
                            title: "New Provider Available",
                            message:
                            "A new mechanic provider is now available in your area.",
                            time: "2 hours ago",
                          ),
                          _NotificationItem(
                            title: "New Provider Available",
                            message:
                            "A new mechanic provider is now available in your area.",
                            time: "2 hours ago",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final String title, message, time;
  const _NotificationItem({
    required this.title,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.notifications_none, color: Colors.blue),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(message,
                    style:
                    const TextStyle(fontSize: 14, color: Colors.black54)),
                const SizedBox(height: 4),
                Text(time,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
