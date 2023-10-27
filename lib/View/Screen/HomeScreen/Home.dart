import 'package:chat/Controller/ChatSevers/chatService.dart';
import 'package:chat/Controller/HomeControler/homecontroler.dart';
import 'package:chat/Controller/ReciveDataFirstore/image.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/Screen/HomeScreen/chat/chatS.dart';
import 'package:chat/View/Screen/HomeScreen/onlineuser.dart';
import 'package:chat/View/Screen/Profile/OtherPeopleProfile/see1P.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  HomeControlers _homecontroler = Get.put(HomeControlers());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _homecontroler.updateUseronliy('Online');
  }

  ChatControler controler = Get.put(ChatControler());

  @override
  Widget build(BuildContext context) {
    ChatControler chatControler = Get.put(ChatControler());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff111827),
        //  elevation: 0,
        title: GetDataFromFirebase(
          textFontSize: 22,
          fieldd: 'name',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/SearchBox');
              },
              icon: Icon(Icons.search)),
          InkWell(
              onTap: () {
                Get.toNamed('/Profile');
              },
              child: GetimageFromFirebase(data: 'profilepic')),
          Text('  '),
        ],
      ),
      //  backgroundColor: Color(0xfff1ede6),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          OnlineUser(),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _homecontroler.firData,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text('An Error');
                }

                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    String userId = snapshot.data!.docs[index]['Id'];
                    String usename = snapshot.data!.docs[index]['name'];
                    String ststas = snapshot.data!.docs[index]['status'];
                    _homecontroler.useridSave =
                        snapshot.data!.docs[index]['Id'];

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatScreen(ID: userId, name: usename),
                              ),
                            );
                          },
                          title: Textcustam(
                            text: '${snapshot.data!.docs[index]['name']}',
                            weight: FontWeight.w500,
                          ),
                          subtitle: StreamBuilder<QuerySnapshot>(
                            stream: chatControler.getMessage(
                                _homecontroler.currentUserId,
                                _homecontroler.useridSave!),
                            builder: (context, chatSnapshot) {
                              if (chatSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text('Loading...');
                              } else if (chatSnapshot.hasData &&
                                  chatSnapshot.data!.docs.isNotEmpty) {
                                final lastMessage =
                                    chatSnapshot.data!.docs.first;

                                return lastMessage['type'] == 'vice'
                                    ? Text('🎤 Send a Vice')
                                    : lastMessage['type'] == 'v'
                                        ? Text('🎬 Send a Video')
                                        : lastMessage['type'] == 't'
                                            ? Text('📸 Send a Photo')
                                            : Text(
                                                lastMessage['message'],
                                                maxLines: 1,
                                                overflow: TextOverflow
                                                    .ellipsis, // Show ellipsis (...) when text overflows
                                              );
                              } else {
                                return Textcustam(
                                    text: 'You are now connected');
                              }
                            },
                          ),
                          leading: InkWell(
                            onTap: () {
                              Get.to(SeeProfilePeople(
                                Id: userId,
                                names: usename,
                                stats: ststas,
                              ));
                            },
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.transparent,
                                  foregroundImage: NetworkImage(
                                      '${snapshot.data!.docs[index]['profilepic']}'),
                                  backgroundImage:
                                      AssetImage('images/bacground.jpg'),
                                ),
                                snapshot.data!.docs[index]['status'] == 'Online'
                                    ? Positioned(
                                        bottom: 1,
                                        right: 0,
                                        child: CircleAvatar(
                                          radius: 9,
                                          backgroundColor: Colors.green,
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                          trailing: StreamBuilder<QuerySnapshot>(
                            stream: chatControler.getMessage(
                                _homecontroler.currentUserId,
                                _homecontroler.useridSave!),
                            builder: (context, chatSnapshot) {
                              if (chatSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text('.');
                              } else if (chatSnapshot.hasData &&
                                  chatSnapshot.data!.docs.isNotEmpty) {
                                final lastMessage =
                                    chatSnapshot.data!.docs.first;
                                if (lastMessage['timestamp'] != null) {
                                  Timestamp timestamp =
                                      lastMessage['timestamp'];
                                  DateTime dateTime = timestamp.toDate();

                                  // Format the timestamp to display only the minute and hour
                                  final formattedTime =
                                      _homecontroler.findtime(timestamp);

                                  return Text(formattedTime,
                                      style: TextStyle(color: Colors.grey));
                                } else {
                                  return Text(
                                      ''); // Empty text when there are no messages
                                }
                              } else {
                                return Text(
                                  '',
                                );
                              }
                            },
                          ),
                        ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
