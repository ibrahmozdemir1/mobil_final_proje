import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.title,
    this.price,
    this.size,
    this.color,
    this.image,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Ekmek",
      price: 1,
      size: 12,
      image: "assets/yiyecek/ekmek.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Makarna",
      price: 3,
      size: 12,
      image: "assets/yiyecek/makarna.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 3,
      title: "Peynir",
      price: 5,
      size: 12,
      image: "assets/yiyecek/peynir.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 4,
      title: "Pirinç",
      price: 20,
      size: 12,
      image: "assets/yiyecek/pirinc.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 5,
      title: "Sucuk",
      price: 30,
      size: 12,
      image: "assets/yiyecek/sucuk.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 6,
      title: "Yağ",
      price: 45,
      size: 12,
      image: "assets/yiyecek/yag.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 7,
      title: "Yoğurt",
      price: 8,
      size: 12,
      image: "assets/yiyecek/yogurt.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 8,
      title: "Yumurta",
      price: 25,
      size: 12,
      image: "assets/yiyecek/yumurta.png",
      color: Color(0xFF3D82AE)),
];
