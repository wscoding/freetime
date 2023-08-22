 import '../export.dart';
class NextPage extends StatelessWidget {
  final Item updatedItem;

  NextPage({Key? key, required this.updatedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: MyFormPage(updatedItem: updatedItem),
    );
  }
}