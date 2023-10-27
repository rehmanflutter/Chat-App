import 'package:chat/Controller/SearchControler/searchcontrol.dart';
import 'package:chat/View/Screen/HomeScreen/chat/chatS.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../counst.dart';

class SearchBox extends StatefulWidget {
  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  SearchController controlersearch = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff111827),
        title: Text('Search People'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: TextField(
                //   autofocus: true,
                controller: controlersearch.searchController,
                onChanged: (value) {
                  setState(() {
                    controlersearch.searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_search_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search',
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: controlersearch.firData,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                final filteredDocs = snapshot.data!.docs.where((doc) {
                  final name = doc['name'];
                  final nicName = doc['NicName'];

                  return controlersearch.searchQuery.isEmpty ||
                      (name.toLowerCase().contains(
                              controlersearch.searchQuery.toLowerCase()) ||
                          nicName.toLowerCase().contains(
                              controlersearch.searchQuery.toLowerCase()));
                }).toList();

                return ListView.builder(
                  itemCount: filteredDocs.length,
                  itemBuilder: (context, index) {
                    final doc = filteredDocs[index];
                    final name = doc['name'];
                    final nicName = doc['NicName'];
                    String userId = snapshot.data!.docs[index]['Id'];
                    String usename = snapshot.data!.docs[index]['name'];
                    return ListTile(
                      onTap: () {
                        Get.to(
                          ChatScreen(ID: userId, name: usename),
                        );
                      },
                      title: Text('$name'),
                      subtitle: Text('$nicName'),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(doc['profilepic']),
                      ),
                      // trailing: Text('23/3'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
