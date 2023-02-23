// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/NewsModel.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:flutter_scale/utils/strings.dart';

import '../../themes/text_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: HeadingText(CustomStrings.titles_lastest_new),
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: CallAPI().getAllNews(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("ເກີດຂໍ້ຜິຜາດໃນການໂລດຂໍ້ມູນ"));
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    List<NewsModel> news = snapshot.data;

                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        NewsModel newsModel = news[index];
                        return Card(
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                      image: NetworkImage(newsModel.imageurl),
                                      fit: BoxFit.cover),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: HeadingText(CustomStrings.titles_all_new),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: FutureBuilder(
                    future: CallAPI().getAllNews(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                            child: Text("ເກີດຂໍ້ຜິຜາດໃນການໂລດຂໍ້ມູນ"));
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        List<NewsModel> news = snapshot.data;

                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              NewsModel newsModel = news[index];

                              return ListTile(
                                onTap: () {
                                  Navigator.pushNamed(context, '/detail',
                                      arguments: {'id': newsModel.id});
                                },
                                leading: Image.network(newsModel.imageurl),
                                title: Text(
                                  newsModel.topic,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  newsModel.detail,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            });
                        // return Container(child: Text('test ddd'));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
