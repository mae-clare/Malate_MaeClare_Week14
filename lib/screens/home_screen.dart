import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('socially', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, letterSpacing: -1)),
        actions: const [
          Icon(Icons.add_box_outlined, size: 26),
          SizedBox(width: 18),
          Icon(Icons.favorite_border, size: 26),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          const Divider(height: 1, color: AppTheme.line),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _stories(),
                const Divider(height: 1, color: AppTheme.line),
                _postHeader(),
                _postImage(),
                _postActions(),
                _caption(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const _BottomBar(selectedIndex: 0),
    );
  }

  Widget _stories() {
    final names = ['Your story', 'alex', 'mika', 'jules'];
    return SizedBox(
      height: 124,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        separatorBuilder: (_, __) => const SizedBox(width: 15),
        itemBuilder: (context, index) => Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.accent, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 29,
                    backgroundImage: AssetImage(index == 0 ? 'assets/images/profile.jpg' : 'assets/images/story1.jpg'),
                  ),
                ),
                if (index == 0)
                  const Positioned(
                    right: -1,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add_circle, color: Colors.blue, size: 19),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 5),
            Text(names[index], style: const TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _postHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(radius: 17, backgroundImage: AssetImage('assets/images/profile.jpg')),
          const SizedBox(width: 9),
          const Expanded(child: Text('mae.clare', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }

  Widget _postImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/post1.jpg', fit: BoxFit.cover),
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(4)),
              child: const Text('FEATURED', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: .6)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _postActions() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(12, 10, 12, 4),
      child: Row(
        children: [
          Icon(Icons.favorite_border, size: 26),
          SizedBox(width: 15),
          Icon(Icons.mode_comment_outlined, size: 25),
          SizedBox(width: 15),
          Icon(Icons.send_outlined, size: 24),
          Spacer(),
          Icon(Icons.bookmark_border, size: 25),
        ],
      ),
    );
  }

  Widget _caption() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('128 likes', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
          SizedBox(height: 4),
          Text('mae.clare  enjoying the little moments ✨', style: TextStyle(fontSize: 12)),
          SizedBox(height: 4),
          Text('View all 12 comments', style: TextStyle(color: AppTheme.muted, fontSize: 12)),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final int selectedIndex;
  const _BottomBar({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    const icons = [
      Icons.home_filled,
      Icons.ondemand_video_outlined,
      Icons.send_outlined,
      Icons.search,
      Icons.person_outline,
    ];
    return SafeArea(
      child: Container(
        height: 54,
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppTheme.line))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            icons.length,
            (index) => Icon(icons[index], size: 25, color: index == selectedIndex ? AppTheme.ink : AppTheme.muted),
          ),
        ),
      ),
    );
  }
}
