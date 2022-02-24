import 'package:flutter/material.dart';
import 'package:quikieappps1/customer/update_boutique/updateboutiquedetails.dart';

class ProfileScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F8FC),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffF4F8FC),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.0,
            color: Color.fromRGBO(3, 43, 119, 10),
          ),
        ),
        title: Text(
          'Boutique Name',
          style:
          TextStyle(color: Color.fromRGBO(3, 43, 119, 10), fontSize: 22.0),
        ),
        actions: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/profileimg.png'),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNormalContainer(constraints,context),
              _buildWideContainers(constraints),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNormalContainer(BoxConstraints constraints,context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: constraints.maxHeight * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell( onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateBoutiqueDetails()),
              );
            },
              child: Text(
                'Profile', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: double.infinity,
            height: 1,
            color: Colors.grey,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('About Tezy',),
          ),
          Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: double.infinity,
            height: 1,
            color: Colors.grey,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Give feedback',),
          ),
          Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: double.infinity,
            height: 1,
            color: Colors.grey,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Rate the App',),
          ),
          Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: double.infinity,
            height: 1,
            color: Colors.grey,),

        ],),
    );
  }

  Widget _buildWideContainers(BoxConstraints constraints) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/Logo2.png',
          fit: BoxFit.fitHeight,
          height: 200,
        ),
      ),
    );
  }
}