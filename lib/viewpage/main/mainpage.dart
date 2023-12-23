 import '../../export.dart';

class SubPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SubPage> {
  int _currentIndex = 0;
  final _pageOptions = [
     MySubPageons(), 
    ItemListPage(),
swSubPage(), 
   // Text('布局3'),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 600)
            NavigationRail(
              selectedIndex: _currentIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              destinations:const [
                NavigationRailDestination(
        icon: Row(
          
    children: [
      Icon(Icons.favorite_border),
      SizedBox(width: 5), // 添加一个5像素的空间
      Text('Line'),
    ],
  ),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text('按钮1'),
                ),
                NavigationRailDestination(
            icon: Row(
    children: [
      Icon(Icons.bookmark_border),
      SizedBox(width: 5), // 添加一个5像素的空间
      Text('Add'),
    ],
  ),
                  selectedIcon: Icon(Icons.book),
                  label: Text('按钮2'),
                ),
                NavigationRailDestination(
              icon: Row(
    children: [
      Icon(Icons.person_2_outlined),
      SizedBox(width: 5), // 添加一个5像素的空间
      Text('Mine'),
      
    ],
  ),
                  selectedIcon: Icon(Icons.person_2),
                  label: Text('按钮3'),
                  
                ),
              ],
            ),
          Expanded(child: _pageOptions[_currentIndex]),
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width <= 600
          ? BottomNavigationBar(
              currentIndex: _currentIndex,
              items:const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '灵动挂件'),
                BottomNavigationBarItem(icon: Icon(Icons.add_box), label: '添加挂件'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: '个人'),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
            
                });
              },
            )
          : null,
    );
  }
}
