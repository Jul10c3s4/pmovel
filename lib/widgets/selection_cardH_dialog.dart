import 'package:flutter/material.dart';
import 'package:app/widgets/perguntas.dart';
import 'package:app/pages/ygor/jogos_page.dart';
import '../data/bd/bd.dart';

class CustomDialog extends StatefulWidget {
  final List<String> options;
  final int qSelection;
  List<bool> isChecked = []; //createIsChecked(options.length);

  CustomDialog({Key? key, required this.options, required this.qSelection})
      : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool canUpload = false;

  @override
  void initState() {
    super.initState();
    widget.isChecked = createIsChecked(widget.options.length);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirmation'),
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(padding: EdgeInsets.all(8.0), children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.options.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(widget.options[index]),
                      value: widget.isChecked[index],
                      onChanged: (val) {
                        setState(() {
                          widget.isChecked[index] = val ?? false;
                          //canUpload = true;

                          int counter = 0;
                          for (var item in widget.isChecked) {
                            if (item == true) {
                              counter++;
                            }
                          }

                          canUpload =
                              counter == widget.qSelection ? true : false;

                          /*
                              for(int i = 0; i < widget.isChecked.length; i++){
                                if(widget.isChecked[i] == true && i != val){
                                  widget.isChecked[i] = false;
                                }
                              }
                              */
                        });
                      },
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: 300,
          child: ElevatedButton(
            //color: Colors.blue,
            onPressed: canUpload
                ? () {
                    Navigator.pop(context, widget.isChecked);
                  }
                : null,
            child: Text('Submeter'),
          ),
        ),
      ],
    );
  }
}

List<bool> createIsChecked(int q) {
  List<bool> lista = [];
  for (int i = 0; i < q; i++) {
    lista.add(false);
  }
  return lista;
}
