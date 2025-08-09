import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/products_pages/API_provider.dart';
import 'package:flutter_application_1/login/create_moder.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  bool isPasswordVisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  late UserModel userModel;
  bool isLoading = true;

  getuser() async {
    userModel = await ApiProvider().getuserData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu),
            SizedBox(width: 10),
            Text('Create User'),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              spacing: 10,
              children: [
                Center(child: Text("Create User")),
                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: addressController,

                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Text("User Details"),
                Text("Name: ${userModel.name}"),
                Text("Age: ${userModel.age}"),
                Text("Address: ${userModel.address}"),

                MaterialButton(
                  onPressed: () async {
                    final DocUser = FirebaseFirestore.instance
                        .collection('users')
                        .doc('zahraa');

                    final Map<String, dynamic> userData = {
                      'name': nameController.text,
                      'age':
                          ageController.text, // Assuming age is in this field
                      'address': addressController
                          .text, // Assuming address is in this field
                    };
                    await DocUser.set(userData);
                  },
                  height: 50,
                  minWidth: 300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Create User", style: TextStyle(fontSize: 20)),
                ),
                MaterialButton(
                  onPressed: () async {
                    final docuser = FirebaseFirestore.instance
                        .collection('users')
                        .doc('zahraa');
                    await docuser.delete();
                    print("User deleted");
                  },
                  height: 50,
                  minWidth: 300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  color: const Color.fromARGB(255, 176, 46, 37),
                  textColor: Colors.white,
                  child: Text("Delete User", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
    );
  }
}
