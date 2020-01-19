import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool mine;

  ChatMessage(this.data, this.mine);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: <Widget>[
          !mine
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['senderPhotoUrl']),
                  ),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                data['imgUrl'] != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8, bottom: 4),
                        child: Image.network(
                          data['imgUrl'],
                          height: 200,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 8, bottom: 4),
                        child: Text(
                          data['text'],
                          textAlign: mine ? TextAlign.end : TextAlign.start,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    data['senderName'],
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                ),
              ],
            ),
          ),
          mine
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['senderPhotoUrl']),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
