import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'F', 'G', 'H'];
    final List<String> value = <String>['50', '100', '500', '1,000', '5,000', '10,000', '15,000'];
    final List<int> coloeCodes = <int>[600, 400, 200];
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Page'),
      ),

      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ProductTitle(
            item: ProductItem(
              name: 'วัตถุมงคลจากวัด ${entries[index]}', 
              price: '฿ ${value[index]}', 
              colorShade: coloeCodes[index % 3],
            ),
          );
        },
        separatorBuilder: (context, index) =>Divider(),
      ),
    );
  }
}

class ProductItem {
  final String name;
  final String price;
  final int colorShade;

  const ProductItem(
    {Key? key, 
    required this.name,
    required this.price,
    required this.colorShade}
  );
}

class ProductTitle extends StatelessWidget {
  final ProductItem item;

  const ProductTitle({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => ProductDetail(item: item),
          ),
        );
      },
      child: Container(
        height: 100,
        color: Colors.amber[item.colorShade],
        child: Center(
          child: Text('${item.name}'),
        ),
      ),
    );
  }
}

class ProductDetail extends StatefulWidget {
  final ProductItem item;

  const ProductDetail({Key? key, required this.item}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _counter = 0;
    
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Product Name: ${widget.item.name}'),
          Text('Price: ${widget.item.price}'),
          Text('จำนวน'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: _decreaseCounter, 
                child: Icon(Icons.remove, size: 30, color: Colors.white),
              ),
                
              Text('$_counter'),

              ElevatedButton(
                onPressed: _incrementCounter, 
                child: Icon(Icons.add, size: 30, color: Colors.white),
              ),
            ],
          ),

          ElevatedButton(
            onPressed: (){
              Navigator.pop(context, '/Item');
            }, 
            child: Text('สั่งซื้อ'),
          ),
        ],
      ),

    );
  }
}