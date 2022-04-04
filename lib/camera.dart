import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';




class CameraAccess extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CameraAccessState();
  }
}

class CameraAccessState extends State<CameraAccess> {

  var cf;
  @override
  Widget build(BuildContext context) {
    //display image selected from gallery
    selectFromCamera(ImageSource source) async {
       cf = await ImagePicker().pickImage(source:source);

      setState(() {
      });

    }

    return Scaffold(

      body:  Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Row(children:<Widget>[
               MaterialButton(
                 minWidth: 30,
                 height: 90,
                 onPressed: () {
                   selectFromCamera(ImageSource.camera);
                 },
                 shape: RoundedRectangleBorder(
                     side: BorderSide(
                         color: Colors.black
                     ),

                 ),
                 child: Text("Select From camera", style: TextStyle(
                     fontWeight: FontWeight.w600,
                     fontSize: 18
                 ),),
               ),
                SizedBox(height: 10,width: 10,),
                MaterialButton(
                  minWidth: 30,
                  height: 90,

                  onPressed: () {
                    selectFromCamera(ImageSource.gallery);
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black
                      ),

                  ),
                  child: Text("Select From gallery", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),),
                )
          ]),
                SizedBox(
                  height: 500.0,
                  width: 400.0,
                  child: cf == null
                      ? Center(child:  Text('Sorry nothing selected!!'))
                      : Center(child: Image.file(File(cf.path))),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
