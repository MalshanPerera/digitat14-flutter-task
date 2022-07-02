// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test("Load all data from the api", () async {
    Future<String> getData(Client http) async {
      Uri numberAPIURL = Uri.parse(
          'https://api.seatgeek.com/2/events?client_id=Mjc2NjI1Njd8MTY1NjU4NjU0MS45NTAyNjcz');
      final response = await http.get(numberAPIURL);
      if (response.statusCode == 200) {
        final Map triviaJSON = jsonDecode(response.body);
        return triviaJSON['events'][0]['type'];
      } else {
        return 'Failed to fetch';
      }
    }

    final mockHTTPClient = MockClient((request) async {
      final response = {
        "events": [
          {
            "type": "comedy",
            "id": 5732105,
            "datetime_utc": "2022-07-02T04:45:00",
            "venue": {
              "state": "CA",
              "name_v2": "Punch Line Sacramento",
              "postal_code": "95825",
              "name": "Punch Line Sacramento",
              "links": [],
              "timezone": "America/Los_Angeles",
              "url": "https://seatgeek.com/venues/punch-line-sacramento/tickets",
              "score": 0.45,
              "location": {"lat": 38.595, "lon": -121.417},
              "address": "2100 Arden Way",
              "country": "US",
              "has_upcoming_events": true,
              "num_upcoming_events": 54,
              "city": "Sacramento",
              "slug": "punch-line-sacramento",
              "extended_address": "Sacramento, CA 95825",
              "id": 3513,
              "popularity": 0,
              "access_method": null,
              "metro_code": 862,
              "capacity": 270,
              "display_location": "Sacramento, CA"
            },
            "datetime_tbd": false,
            "performers": [
              {
                "type": "theater_comedy",
                "name": "Mike E. Winfield",
                "image":
                    "https://seatgeek.com/images/performers-landscape/mike-e-winfield-4772d1/13588/huge.jpg",
                "id": 13588,
                "images": {
                  "huge":
                      "https://seatgeek.com/images/performers-landscape/mike-e-winfield-4772d1/13588/huge.jpg"
                },
                "divisions": null,
                "has_upcoming_events": true,
                "primary": true,
                "stats": {"event_count": 4},
                "taxonomies": [
                  {
                    "id": 3000000,
                    "name": "theater",
                    "parent_id": null,
                    "document_source": {"source_type": "ELASTIC", "generation_type": "FULL"},
                    "rank": 4
                  },
                  {
                    "id": 3040000,
                    "name": "comedy",
                    "parent_id": 3000000,
                    "document_source": {"source_type": "ELASTIC", "generation_type": "FULL"},
                    "rank": 5
                  }
                ],
                "image_attribution": "Bobby Bank / WireImage / Getty Images",
                "url": "https://seatgeek.com/mike-e-winfield-tickets",
                "score": 0.23,
                "slug": "mike-e-winfield",
                "home_venue_id": null,
                "short_name": "Mike E. Winfield",
                "num_upcoming_events": 4,
                "colors": null,
                "image_license": "rightsmanaged",
                "popularity": 0,
                "location": null,
                "image_rights_message": "(c) Bobby Bank / WireImage / Getty Images"
              }
            ],
            "is_open": false,
            "links": [],
            "datetime_local": "2022-07-01T21:45:00",
            "time_tbd": false,
            "short_title": "Mike E. Winfield",
            "visible_until_utc": "2022-07-02T08:45:00",
            "stats": {
              "listing_count": null,
              "average_price": null,
              "lowest_price_good_deals": null,
              "lowest_price": null,
              "highest_price": null,
              "visible_listing_count": null,
              "dq_bucket_counts": null,
              "median_price": null,
              "lowest_sg_base_price": null,
              "lowest_sg_base_price_good_deals": null
            },
            "taxonomies": [
              {"id": 3000000, "name": "theater", "parent_id": null, "rank": 4},
              {"id": 3040000, "name": "comedy", "parent_id": 3000000, "rank": 5}
            ],
            "url": "https://seatgeek.com/mike-e-winfield-tickets/comedy/2022-07-01-9-45-pm/5732105",
            "score": 0.374,
            "announce_date": "2022-06-19T00:00:00",
            "created_at": "2022-06-19T16:05:16",
            "date_tbd": false,
            "title": "Mike E. Winfield",
            "popularity": 0.765,
            "description": "",
            "status": "normal",
            "access_method": null,
            "event_promotion": null,
            "announcements": {},
            "conditional": false,
            "enddatetime_utc": null,
            "themes": [],
            "domain_information": []
          }
        ]
      };

      return Response(jsonEncode(response), 200);
    });
    expect(await getData(mockHTTPClient), isA<String>());
  });
}
