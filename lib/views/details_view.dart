import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';
import '../helpers/app_utils.dart';
import '../models/events_model.dart';
import '../widgets/cache_image.dart';

class DetailsView extends StatelessWidget {
  final Event event;

  const DetailsView({
    required this.event,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Container(
                color: PRIMARY_COLOR,
                padding: EdgeInsets.only(
                  top: Utils.getHeight(Utils.appBarHeight),
                  left: Utils.getWidth(20.0),
                  right: Utils.getWidth(20.0),
                  bottom: Utils.getHeight(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                    Text(
                      "Event Details",
                      style: Theme.of(context).primaryTextTheme.headline1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Utils.getHeight(25.0),
                  left: Utils.getWidth(20.0),
                  right: Utils.getWidth(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: Theme.of(context).primaryTextTheme.headline1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: Utils.getHeight(20.0),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CachedImage(
                        width: Utils.bodyWidth,
                        height: Utils.getHeight(250.0),
                        imageURL: event.performers[0].image,
                      ),
                    ),
                    SizedBox(
                      height: Utils.getHeight(25.0),
                    ),
                    Text(
                      Utils.convertDateTime(event.dateTimeLocal.toString()),
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline1!
                          .copyWith(color: Colors.black, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: Utils.getHeight(10.0),
                    ),
                    Text(
                      event.venue.displayLocation,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
