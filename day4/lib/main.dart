import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileDashboard(),
    );
  }
}

class ProfileDashboard extends StatefulWidget {
  const ProfileDashboard({super.key});

  @override
  State<ProfileDashboard> createState() => _ProfileDashboardState();
}

class _ProfileDashboardState extends State<ProfileDashboard> {
  bool isFollowing = false;
  int likes = 0;
  String name = "Prabin Sah";

  final TextEditingController controller = TextEditingController();

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  void addLike() {
    setState(() {
      likes++;
    });
  }

  void updateName() {
    setState(() {
      if (controller.text.isNotEmpty) {
        name = controller.text;
        controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text("Profile Dashboard"), centerTitle: true),
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=5',
                ),
              ),
              const SizedBox(height: 12),

              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Enter new name",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: updateName,
                child: const Text("Update Name"),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: toggleFollow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFollowing ? Colors.grey : Colors.blue,
                ),
                child: Text(isFollowing ? "Following" : "Follow"),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: addLike,
                    icon: const Icon(Icons.favorite, color: Colors.red),
                  ),
                  Text("Likes: $likes"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
