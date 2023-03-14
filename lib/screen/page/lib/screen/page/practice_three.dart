import 'package:flutter/material.dart';
import '../../../const/color.dart';
import '../../const/string.dart';

import '../page/top_page.dart';
import '../page/albumdetail_page.dart';

class Practice3Page extends StatelessWidget {
  //テキストボックス　文字と色
  final List<String> hintTexts = [
    'クラシック',
    'ポップ',
    'ジャズ',
    'カントリー',
    'ロック',
    'ダンス',
    'ギター',
    'BGM',
  ];
  final List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          AppString.appTitle01,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
              ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 検索ボタンが押された時の処理
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      AppString.titleName01,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // アイコンがタップされた時の処理　後で
                    },
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlbumDetailsPage(
                              albumName: AppString.albamName01,
                              artistName: AppString.artistName01,
                              imageUrl:
                                  'https://gogen-yurai.jp/wp-content/uploads/335354449_675.jpg',
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 200,
                        height: 250,
                        child: Container(
                          child: Column(
                            children: [
                              Image.network(
                                'https://gogen-yurai.jp/wp-content/uploads/335354449_675.jpg',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                AppString.albamName01,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                AppString.artistName01,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlbumDetailsPage(
                              imageUrl:
                                  'https://prtimes.jp/i/10908/82/ogp/d10908-82-424720-1.jpg',
                              albumName: AppString.albamName02,
                              artistName: AppString.artistName02,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 200,
                        height: 250,
                        child: Container(
                          child: Column(
                            children: [
                              Image.network(
                                'https://prtimes.jp/i/10908/82/ogp/d10908-82-424720-1.jpg',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                AppString.albamName02,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                AppString.artistName02,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlbumDetailsPage(
                              albumName: AppString.albamName03,
                              artistName: AppString.artistName03,
                              imageUrl:
                                  'https://prtimes.jp/i/10908/82/ogp/d10908-82-424720-1.jpg',
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 200,
                        height: 250,
                        child: Container(
                          child: Column(
                            children: [
                              Image.network(
                                'https://prtimes.jp/i/10908/82/ogp/d10908-82-424720-1.jpg',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                AppString.albamName03,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                AppString.artistName03,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          AppString.titleName02,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        // ignore: prefer_const_constructors
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // アイコンがタップされた時の処理
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 200,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal, //横スクロール
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: colorList[index],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: hintTexts[index],
                                hintStyle: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      //後でcurrentIndexとontapでページが変わるようにしたい
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: AppString.bottomNavName01,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: AppString.bottomNavName02,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.playlist_add_check,
                color: Colors.white,
              ),
              label: AppString.bottomNavName03,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              label: AppString.bottomNavName04,
            ),
          ]),
    );
  }
}
