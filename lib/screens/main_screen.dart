import 'package:flutter/material.dart';
import 'package:portfolio_admin/screens/pages/add_developer/add_developer.dart';
import 'package:portfolio_admin/screens/pages/add_project/add_project.dart';
import 'package:portfolio_admin/screens/pages/add_project_type/add_project_type.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/MainScreen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Admin Panel'),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AddDeveloper.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Icon(Icons.person_add),
                          const SizedBox(height: 10),
                          Text('Add Developer'),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AddProjectType.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Icon(Icons.merge_type),
                          const SizedBox(height: 10),
                          Text('Add Project Type'),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AddProject.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Icon(Icons.developer_board),
                          const SizedBox(height: 10),
                          Text('Add Project'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
