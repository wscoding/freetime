import 'package:flutter/material.dart';



class OpenSourceTech {
  final String name;
  final String url;
  final String license;
  final String developer;
  final String organization;
  final IconData icon;
  final bool isImportant;
  final String description; // 添加描述字段

  OpenSourceTech({
    required this.name,
    required this.url,
    required this.license,
    required this.developer,
    required this.organization,
    required this.icon,
    required this.isImportant,
    required this.description, // 初始化描述字段
  });
}

class licensePage extends StatelessWidget {
  final List<OpenSourceTech> openSourceTechs = [
    OpenSourceTech(
      name: 'Flutter',
      url: 'https://flutter.dev/',
      license: 'BSD',
      developer: 'Google',
      organization: 'Google',
      icon: Icons.ac_unit,
      isImportant: true,
      description: 'Flutter is a UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
    ),
    OpenSourceTech(
      name: 'Dart',
      url: 'https://dart.dev/',
      license: 'BSD',
      developer: 'Google',
      organization: 'Google',
      icon: Icons.backup,
      isImportant: true,
      description: 'Dart is a client-optimized programming language for fast apps on multiple platforms.',
    ),
    OpenSourceTech(
      name: 'Firebase',
      url: 'https://firebase.google.com/',
      license: 'Apache 2.0',
      developer: 'Google',
      organization: 'Google',
      icon: Icons.cloud,
      isImportant: false,
      description: 'Firebase is a platform developed by Google for creating mobile and web applications.',
    ),
    OpenSourceTech(
      name: 'SQLite',
      url: 'https://www.sqlite.org/',
      license: 'Public Domain',
      developer: 'D. Richard Hipp',
      organization: 'SQLite Consortium',
      icon: Icons.dashboard,
      isImportant: false,
      description: 'SQLite is a C library that provides a lightweight disk-based database that doesn’t require a separate server process and allows accessing the database using a nonstandard variant of the SQL query language.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Source Technologies'),
      ),
      body: ListView.builder(
        itemCount: openSourceTechs.length,
        itemBuilder: (BuildContext context, int index) {
          final OpenSourceTech tech = openSourceTechs[index];
          return ExpansionTile(
            leading: Icon(tech.icon),
            title: Text(tech.name),
            subtitle: Text(tech.url),
            // trailing: Icon(
            //   tech.isImportant ? Icons.star : Icons.star_border,
            //   color: tech.isImportant ? Colors.yellow : Colors.grey,
            // ),

               trailing: Container(
              width: 200, // 调整宽度，根据实际需求进行修改
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    tech.isImportant ? Icons.star : Icons.star_border,
                    color: tech.isImportant ? Colors.yellow : Colors.grey,
                  ),
               
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  
                      Icon(
                        Icons.business,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        tech.organization,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
               ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(width: 440,child: 
                
                        Column(
                
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              ListTile(
                title: Text('License'),
                trailing: Icon(Icons.stacked_bar_chart),

                subtitle:    Text(
                    tech.license,
                    style: TextStyle(fontSize: 12),
                  ),
              ),
              ListTile(
                 trailing: Icon(  Icons.person,),
        
                title: Text('Developer'),
                subtitle: Text(tech.developer  ,
                style: TextStyle(fontSize: 12),),
              ),
              ListTile(
             trailing: Icon(Icons.business),
                title: Text('Organization'),
                subtitle: Text(tech.organization),
              ),
              ListTile(
                title: Text('Description'),
                subtitle: Text(tech.description),
              ),
            ],
                )
                ,),
        
              ),
            ],
          );
        },
      ),
    );
  }
}