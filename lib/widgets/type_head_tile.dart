import 'package:flutter/material.dart';

import '../helpers/app_utils.dart';
import '../models/events_model.dart';
import 'cache_image.dart';

class TypeHeadTile extends StatelessWidget {
  final Event event;
  final List<String>? favorites;

  const TypeHeadTile({
    Key? key,
    required this.event,
    required this.favorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedImage(
                  width: Utils.getHeight(100.0),
                  height: Utils.getHeight(100.0),
                  imageURL: event.performers[0].image,
                ),
              ),
              _checkIfFavorite()
                  ? Positioned(
                      top: 5.0,
                      left: 5.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.all(
                          Utils.getHeight(5.0),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          size: 20.0,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          SizedBox(
            width: Utils.getWidth(20.0),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        event.title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Utils.getHeight(10.0),
                ),
                Text(
                  event.venue.displayLocation,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
                SizedBox(
                  height: Utils.getHeight(10.0),
                ),
                Text(
                  Utils.convertDateTime(event.dateTimeLocal.toString()),
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _checkIfFavorite() {
    if (favorites == null) return false;
    return favorites?.contains("${event.id}") ?? false;
  }
}
