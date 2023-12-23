import '../export.dart';
class UpdatePage extends StatefulWidget {
  final Map<String, dynamic> item;

  UpdatePage(this.item);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.item['title']);
    _contentController = TextEditingController(text: widget.item['content']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _titleController,
decoration: InputDecoration(
labelText: 'Title',
border: OutlineInputBorder(),
),
),
),
Padding(
padding: const EdgeInsets.all(16),
child: TextField(
controller: _contentController,
decoration: InputDecoration(
labelText: 'Content',
border: OutlineInputBorder(),
),
),
),
Padding(
padding: const EdgeInsets.all(16),
child: ElevatedButton(
child: Text('Save'),
onPressed: _handleSaveButtonPressed,
),
),
],
),
);
}

void _handleSaveButtonPressed() {
  final newTitle = _titleController.text.trim();
  final newContent = _contentController.text.trim();
  if (newTitle.isNotEmpty || newContent.isNotEmpty) {
    final updatedItem = {
      ...widget.item,
      if (newTitle.isNotEmpty) 'title': newTitle,
      if (newContent.isNotEmpty) 'content': newContent,
    };
    Navigator.pop(context, updatedItem);
  }
}
@override
void dispose() {
_titleController.dispose();
_contentController.dispose();
super.dispose();
}
}