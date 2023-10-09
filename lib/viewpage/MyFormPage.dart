
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




 void _copyToClipboard() {
    String jsonString =
     '[{"id":"${_item.id}","title":"${_item.title}","content":"${_item.content}","type":"${_item.type}","date":"${_item.date}","color":${_item.color.value},"value":${_item.value},"width":${_item.width},"height":${_item.height},"randomString":"${_item.randomString}","textsize":${_item.textsize},"textheme":"${_item.textheme}","values":"${_item.values}","selectedValuezv":"${_item.selectedValuezv}","isapp":${_item.isapp}}]';
    Clipboard.setData(ClipboardData(text: jsonString));
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Content copied to clipboard!'),
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
             Text('apps: ${_item.isapp}'),


         ElevatedButton(
                onPressed: _copyToClipboard, // 添加复制按钮的点击事件
                child: Text('Copy to Clipboard'),
              ),

          ],
        ),
      ),
    );
  }
}