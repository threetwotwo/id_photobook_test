import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final int type;
  MemberCard({this.name, this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (memberCardDialog) => SimpleDialog(
            title: Row(
              children: <Widget>[
                Text('Member Card'),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            children: <Widget>[Image.asset('assets/images/card-detail.jpg')],
          ),
        );
      },
      child: CardImage(name: name, type: type),
    );
  }
}

class CardImage extends StatelessWidget {
  final String name;
  final int type;
  CardImage({this.name, this.type});
  @override
  Widget build(BuildContext context) {
    if (type == 1 || type == 2 || type == 3) {
      return Container(
        padding: EdgeInsets.all(30.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            children: <Widget>[
              Image.asset(type == 1
                  ? 'assets/images/member-silver.jpg'
                  : type == 2
                      ? 'assets/images/member-gold.jpg'
                      : 'assets/images/member-diamond.jpg'),
              Positioned(
                right: 30.0,
                bottom: 40.0,
                child: Text(
                  name ?? '',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Card(
        elevation: 5.0,
        color: Colors.grey[300],
        margin: EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            children: <Widget>[
              Text(
                'anda belum bergabung dengan club member IDPhotobook.',
                style: TextStyle(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'klik untuk cari tau caranya',
                style: TextStyle(color: Colors.grey[600], fontSize: 18.0),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
    }
  }
}
