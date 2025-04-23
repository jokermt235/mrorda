import 'package:flutter/material.dart';
import 'package:lesson9riverpod/catalog/views/components/catalog_empty.dart';
import 'package:lesson9riverpod/product/data/product.dart';
import 'package:lesson9riverpod/product/providers/product_provider.dart';

class CatalogCard extends StatelessWidget{
  Product? data;
  Function()? onClick;
  CatalogCard({this.data, this.onClick});
  @override
  Widget build(BuildContext context) {
    return data == null ? CatalogEmpty() : GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.only(left: 8 , top: 8, bottom: 8, right: 8),
        decoration: BoxDecoration(
            color: Colors.white70
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: Text(data!.title, style: TextStyle(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
            ),
            data != null ? Container(
              child: data!.image != null  ?
                AspectRatio(
                  aspectRatio: 3,
                  child: Image.network(data!.image!, fit: BoxFit.fitHeight),
                )
                  : Text("No image"),
            ) : Container(
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Text(data!.description, style: TextStyle(color: Colors.black54), overflow: TextOverflow.ellipsis),
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Builder(builder: (context){
                String price = data!.price.toString();
                return Text("$price USD", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis, textAlign: TextAlign.start);
              }),
            ),
          ],
        ),
      ),
    );
  }

}