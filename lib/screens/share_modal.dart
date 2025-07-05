import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class ShareModal extends StatelessWidget {
  const ShareModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 323,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Handle
          Container(
            height: 4,
            width: 40,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Copy Link Box
          Container(
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1E),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'http://open.soulsquare.com connect',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    BootstrapIcons.link_45deg,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Social Icons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _SocialIcon(icon: BootstrapIcons.whatsapp),
              _SocialIcon(icon: BootstrapIcons.instagram),
              _SocialIcon(icon: BootstrapIcons.telegram),
              _SocialIcon(icon: BootstrapIcons.snapchat),
              _SocialIcon(icon: BootstrapIcons.facebook),
              _SocialIcon(icon: BootstrapIcons.three_dots),
            ],
          ),

          const SizedBox(height: 30),

          // Cancel Button
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 24,
      child: Icon(
        icon,
        color: Colors.black,
        size: 22,
      ),
    );
  }
}
