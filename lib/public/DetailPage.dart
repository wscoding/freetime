
import '../export.dart';


class DetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  DetailPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              item['title'] ?? '',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              item['content'] ?? '',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              item['id'],
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              child: Text('Update'),
              onPressed: () => _navigateToUpdatePage(context),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToUpdatePage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdatePage(item)),
    );
    if (result != null) {
      Navigator.pop(context, result);
    }
  }
}