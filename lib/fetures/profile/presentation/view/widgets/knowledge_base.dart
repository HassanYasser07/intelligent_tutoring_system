import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/routing/routing.dart';

class KnowledgeBaseWidget extends StatefulWidget {
  const KnowledgeBaseWidget({super.key});

  @override
  State<KnowledgeBaseWidget> createState() => _KnowledgeBaseWidgetState();
}

class _KnowledgeBaseWidgetState extends State<KnowledgeBaseWidget> {
  List<String> _topics = [];

  @override
  void initState() {
    super.initState();
    _loadTopics();
  }

  Future<void> _loadTopics() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('saved_strings_list') ?? [];
    setState(() {
      _topics = saved;
    });
  }

  @override
  Widget build(BuildContext context) {
    final showTopics = _topics.length > 6 ? _topics.sublist(0, 5) : _topics;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE2FFCC),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade700,
            offset: const Offset(0, 5),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Your Knowledge Base",
            textAlign: TextAlign.center,

            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Color(0xFF54BA07),
              fontSize: 18,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: showTopics.length + (_topics.length > 8 ? 1 : 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 3,
            ),
            itemBuilder: (context, index) {
              if (_topics.length > 8 && index == 5) {
                return GestureDetector(
                  onTap: () {
                   GoRouter.of(context).push(Routes.kAllTopicsView);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green[50],
                    ),
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("View All", style: TextStyle(color: Colors.green,fontSize: 18, fontWeight: FontWeight.bold)),


                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward, color: Colors.green),
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF58CC02),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      showTopics[index],
                      style: const TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w900),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
