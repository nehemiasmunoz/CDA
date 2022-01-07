import 'dart:io';

import 'package:centro_actividades/models/models.dart';
import 'package:centro_actividades/screen/auth/components/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ButtonResource extends StatefulWidget {
  const ButtonResource({Key? key}) : super(key: key);

  @override
  State<ButtonResource> createState() => _ButtonResourceState();
}

class _ButtonResourceState extends State<ButtonResource> {
  @override
  Widget build(BuildContext context) {
    bool visible = false;
    final evidenceQuery = Provider.of<EvidenceQuery>(context).evidence;
    if (evidenceQuery == '') return Text('');

    PlatformFile file;
    String fileName = '';
    double fileSize = 0;
    return Container(
      child: RoundedContainer(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload,
                  color: Colors.white,
                  size: 27.0,
                ),
                TextButton(
                    onPressed: () {},
                    // onPressed: () async {
                    //   final result = await FilePicker.platform.pickFiles();
                    //   if (result != null) {
                    //     PlatformFile file = result.files.first;
                    //     //Open single file
                    //     fileName = file.name;
                    //     fileSize = file.size / 1024;
                    //     print(fileName);
                    //     print('file.${file.name}');
                    //     //openFile(file);
                    //     //final newFile = await saveFilePermanently(file);
                    //   }
                    // },
                    child: Text('Subir archivo',
                        style: TextStyle(color: Colors.white, fontSize: 16.0))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}');

    return File(file.path!).copy(newFile.path);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void _buildFilePresentation(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = file.size / 1024;
    final name = file.name;
  }
}
