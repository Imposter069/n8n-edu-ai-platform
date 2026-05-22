import 'package:flutter/material.dart';

import 'supabase_service.dart';

class SearchResourceScreen
    extends StatefulWidget {

  const SearchResourceScreen({
    super.key,
  });

  @override
  State<SearchResourceScreen>
  createState() =>
      _SearchResourceScreenState();
}

class _SearchResourceScreenState
    extends State<SearchResourceScreen> {

  final service = SupabaseService();

  final searchController =
  TextEditingController();

  List<dynamic> resources = [];

  bool isLoading = false;

  Future<void> search() async {

    setState(() {
      isLoading = true;
    });

    final data =
    await service.searchResources(
      searchController.text,
    );

    setState(() {

      resources = data;

      isLoading = false;
    });
  }

  IconData getIcon(String type) {

    switch(type) {

      case "video":
        return Icons.play_circle_fill;

      case "ebook":
        return Icons.book;

      case "notes":
        return Icons.note;

      case "sample_paper":
        return Icons.description;

      default:
        return Icons.folder;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Search"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            // ====================
            // SEARCH FIELD
            // ====================
            TextField(

              controller:
              searchController,

              decoration:
              InputDecoration(

                hintText:
                "Search Resources",

                suffixIcon: IconButton(

                  onPressed: search,

                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ),

              onSubmitted: (_) => search(),
            ),

            const SizedBox(height: 20),

            // ====================
            // LOADING
            // ====================
            if (isLoading)

              const CircularProgressIndicator(),

            const SizedBox(height: 20),

            // ====================
            // RESULTS
            // ====================
            Expanded(

              child: ListView.builder(

                itemCount:
                resources.length,

                itemBuilder:
                    (context, index) {

                  final item =
                  resources[index];

                  return Card(

                    child: ListTile(

                      leading: Icon(
                        getIcon(
                          item['resource_type'],
                        ),
                      ),

                      title: Text(
                        item['title'],
                      ),

                      subtitle: Text(
                        item['description']
                            ?? '',
                      ),

                      trailing:
                      const Icon(
                        Icons.arrow_forward_ios,
                      ),

                      onTap: () {

                        print(item);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}