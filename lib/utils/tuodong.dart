 import '../export.dart';
class DraggablePage extends StatelessWidget {
  final Widget child;

  DraggablePage({required this.child});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) async {
        if (event.buttons == kPrimaryButton) {
          print('Left button clicked');
          await windowManager.startDragging();
        } else if (event.buttons == kSecondaryButton) {
          print('Right button clicked');
          Navigator.pop(context);
        }
      },
      child: GestureDetector(
        onLongPress: () async {
          print('Long press detected');
          await windowManager.startDragging();
        },
        child: child,
      ),
    );
  }
}
