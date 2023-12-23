 import '../export.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);


 Future<void> _printItemJson(Item item) async {
    final jsonData = json.encode(item.toMap());
    print(jsonData);
  }                                        
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('其他页面'),
      ),
      body: FutureBuilder<String?>(
        future: SharedPreferences.getInstance().then((prefs) => prefs.getString('items')),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final itemsJson = snapshot.data!;
          final itemsList = (jsonDecode(itemsJson) as List<dynamic>)
              .map((item) => Item.fromMap(item))
              .toList();
          return ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: (context, index) {
              final item = itemsList[index];
               //title: Text(item.id),
              return ListTile(
                           onTap: () => _printItemJson(item),
                  title: Text(json.encode(item.toMap())),
              );
            },
          );
        },
      ),
    );
  }
}