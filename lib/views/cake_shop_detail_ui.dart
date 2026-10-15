// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_app/models/cake_shop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CakeShopDetailUi extends StatefulWidget {
  //สร้างตัวแปรเก็บค่าที่ส่งมาจากอีกหน้าจอหนึ่ง

  CakeShop? cakeShopShow;
  //เอาตัวแปลที่สร้างมารับค่าที่จะถูกส่งมา

  CakeShopDetailUi({super.key, this.cakeShopShow});

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  // เมธอดโทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  //เมธอดเฟสเปิดลิงค์
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.cakeShopShow!.name!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            top: 50.5,
            bottom: 50.5,
            left: 45.0,
            right: 45.0,
          ),
          child: Center(
            child: Column(
              children: [
                //ส่วนของรูป 1 รูป
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.cakeShopShow!.image1!,
                    width: 120,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //ส่วนของรูป 2 รูป
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.cakeShopShow!.image2!,
                        width: 120,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.cakeShopShow!.image3!,
                        width: 120,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //ส่วนแสดงชื่อร้าน -------

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ชื่อร้าน 🎂 ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShopShow!.name!,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //ส่วนเวลาเปิดปิด -----------
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เวลาเปิดปิด 🕰️ ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShopShow!.openCloseTime!,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //ส่วนของรายละเอียดร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'รายละเอียดร้าน 👌 ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShopShow!.description!,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //ที่อยู่ของร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ที่อยู่ของร้าน 🚩 ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShopShow!.address!,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //ส่วนของโทรไปยังร้าน
                ElevatedButton(
                  onPressed: () {
                    // โค้ดคำสั่งโทรออก
                    _makePhoneCall(widget.cakeShopShow!.phone!);
                  },
                  child: Text(
                    // widget.cakeShopShow!.phone!,
                    '☎️${widget.cakeShopShow!.phone!}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      200,
                      55,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ),
                // ส่วนของเว็บร้าน และเปิดเว็บร้านได้
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    _launchInBrowser(Uri.parse(widget.cakeShopShow!.website!));
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.earthAsia,
                    color: Colors.amber,
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  title: Text(
                    widget.cakeShopShow!.website!,
                  ),
                ),
                // ส่วนของเฟสบุ๊คและเปิดได้
                ListTile(
                  onTap: () {
                    _launchInBrowser(Uri.parse(widget.cakeShopShow!.facebook!));
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  title: Text(
                    widget.cakeShopShow!.facebook!,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //ส่วนของการแสดงแผนที่
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  
                  child: FlutterMap(
                    options: MapOptions(
                      // กำหนดพิกัดเริ่มต้น (ศูนย์กลางแผนที่) และระดับการซูม (Zoom)
                  
                      initialCenter: LatLng(
                        double.parse(widget.cakeShopShow!.latitude!),
                        double.parse(widget.cakeShopShow!.longitude!),
                      ), // กรุงเทพมหานคร
                  
                      initialZoom: 13.0,
                    ),
                    children: [
                      // 1. เลเยอร์แสดงภาพแผนที่ (Tile Layer) จาก OpenStreetMap
                  
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  
                        userAgentPackageName:
                            'com.example.flutter_cake_shop_app', // เปลี่ยนเป็น Package Name ของตัวเอง
                      ),
                  
                      // 2. เลเยอร์สำหรับปักหมุดหรือแสดง Marker บนแผนที่
                  
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              double.parse(widget.cakeShopShow!.latitude!),
                              double.parse(widget.cakeShopShow!.longitude!),
                            ),
                            width: 80.0,
                            height: 80.0,
                            child: GestureDetector(
                              onTap:(){
                                // เปิด Google Map
                                _launchInBrowser(
                                  Uri.parse(
                                    'https://www.google.com/maps/@${widget.cakeShopShow!.latitude!}.${widget.cakeShopShow!.longitude!}',
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
