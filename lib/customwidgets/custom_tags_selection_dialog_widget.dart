import 'package:flutter/material.dart';
import 'package:liztag/entities/tag_model.dart';
import 'package:liztag/models/filter_tags_model.dart';
import 'package:provider/provider.dart';

class CustomTagsSelectionDialog extends StatefulWidget {
  @override
  _CustomTagsSelectionDialogState createState() => _CustomTagsSelectionDialogState();
}

class _CustomTagsSelectionDialogState extends State<CustomTagsSelectionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    List<TagModel> selectableTags = context.watch<FilterTagsModel>().filterTagsSelectable;

    return Stack(
      children: <Widget>[
        Container(
          height: 350.0,
          padding: EdgeInsets.only(
            top: 20.0,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                'Add Tags',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: Container(
                  color: Colors.amberAccent,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ListView.builder(
                      itemCount: selectableTags.length,
                      itemBuilder: (context, index) {
                        return _createTagForTagList(selectableTags[index], index);
                      }),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }


  Widget _createTagForTagList(TagModel tag, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          Icons.local_offer,
          color: Colors.white,
        ),
      ),
      title: Text(tag.tagName),
      onTap: () {
        setState(() {
          //_showDialog2(tag, index);
        });
      },
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
