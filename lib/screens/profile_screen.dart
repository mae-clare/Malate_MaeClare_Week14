import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('mae.clare', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Icon(Icons.keyboard_arrow_down, size: 20),
          ],
        ),
        actions: const [
          Icon(Icons.add_box_outlined, size: 25),
          SizedBox(width: 18),
          Icon(Icons.menu, size: 25),
          SizedBox(width: 14),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                _profileSummary(),
                const SizedBox(height: 15),
                _bio(),
                const SizedBox(height: 14),
                _profileButtons(),
                const SizedBox(height: 18),
                _highlights(),
                const SizedBox(height: 18),
                const Divider(height: 1, color: AppTheme.line),
                _postTabs(),
                _photoGrid(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const _ProfileBottomBar(),
    );
  }

  Widget _profileSummary() {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(radius: 42, backgroundImage: AssetImage('assets/images/profile.jpg')),
            Positioned(
              bottom: -1,
              right: -1,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const CircleAvatar(radius: 10, backgroundColor: Colors.blue, child: Icon(Icons.add, size: 14, color: Colors.white)),
              ),
            ),
          ],
        ),
        const SizedBox(width: 22),
        const Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Stat(value: '12', label: 'Posts'),
              _Stat(value: '1.2K', label: 'Followers'),
              _Stat(value: '350', label: 'Following'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bio() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mae Clare', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        SizedBox(height: 3),
        Text('IT Student | Creating memories ✨', style: TextStyle(fontSize: 12)),
        Text('📍 Philippines', style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _profileButtons() {
    return Row(
      children: [
        Expanded(child: _button('Edit profile')),
        const SizedBox(width: 7),
        Expanded(child: _button('Share profile')),
        const SizedBox(width: 7),
        Container(
          height: 32,
          width: 38,
          decoration: BoxDecoration(color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(6)),
          child: const Icon(Icons.person_add_alt_1, size: 18),
        ),
      ],
    );
  }

  Widget _button(String label) {
    return Container(
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(6)),
      child: Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }

  Widget _highlights() {
    return Row(
      children: [
        _highlight('assets/images/story1.jpg', 'Life'),
        const SizedBox(width: 17),
        _highlight('assets/images/post1.jpg', 'Moments'),
        const SizedBox(width: 17),
        _highlight('assets/images/post2.jpg', 'Friends'),
      ],
    );
  }

  Widget _highlight(String asset, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black26)),
          child: CircleAvatar(radius: 27, backgroundImage: AssetImage(asset)),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _postTabs() {
    return const SizedBox(
      height: 43,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.grid_on, size: 22),
          Icon(Icons.video_library_outlined, size: 22, color: AppTheme.muted),
          Icon(Icons.person_pin_outlined, size: 22, color: AppTheme.muted),
        ],
      ),
    );
  }

  Widget _photoGrid() {
    const photos = ['assets/images/post1.jpg', 'assets/images/post2.jpg', 'assets/images/story1.jpg'];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) => Image.asset(photos[index % photos.length], fit: BoxFit.cover),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 3),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}

class _ProfileBottomBar extends StatelessWidget {
  const _ProfileBottomBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 54,
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppTheme.line))),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home_outlined, size: 25),
            Icon(Icons.ondemand_video_outlined, size: 25),
            Icon(Icons.send_outlined, size: 25),
            Icon(Icons.search, size: 25),
            Icon(Icons.person, size: 25),
          ],
        ),
      ),
    );
  }
}
