import '../export.dart';
class MyFormPage extends StatefulWidget {
  final Item updatedItem;

  const MyFormPage({Key? key, required this.updatedItem}) : super(key: key);

  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  late Item _item;

  @override
  void initState() {
    super.initState();
    _item = widget.updatedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              initialValue: _item.title,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              onSaved: (value) {
                _item.title = value!;
              },
            ),
            // 其他表单字段
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text('Success'),
                        content: Text('Form submitted successfully!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Submit'),
            ),
            Text('ID: ${_item.id}'),
            Text('Title: ${_item.title}'),
            Text('Content: ${_item.content}'),
            Text('Type: ${_item.type}'),
            Text('Date: ${_item.date}'),
            Text('Color: ${_item.color}'),
            Text('Value: ${_item.value}'),
            Text('Width: ${_item.width}'),
            Text('Height: ${_item.height}'),
            Text('Random String: ${_item.randomString}'),
            Text('Text Size: ${_item.textsize}'),
            Text('Values: ${_item.values}'),
            Text('Selected Valuezv: ${_item.selectedValuezv}'),
            Text('Tex Theme: ${_item.textheme}'),
          ],
        ),
      ),
    );
  }
}