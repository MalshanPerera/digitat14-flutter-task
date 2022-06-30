import 'dart:convert';

Events eventsFromJson(String str) => Events.fromJson(json.decode(str));

class Events {
  Events({
    required this.events,
    required this.meta,
  });

  final List<Event> events;
  final Meta meta;

  // empty
  factory Events.empty() => Events(events: [], meta: Meta.empty());

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        events: List<Event>.from(
            json["events"] == null ? [] : json["events"].map((x) => Event.fromJson(x))),
        meta: Meta.fromJson(json["meta"] ?? {}),
      );
}

class Event {
  Event({
    required this.type,
    required this.id,
    required this.dateTimeUtc,
    required this.venue,
    required this.dateTimeTbd,
    required this.performers,
    required this.isOpen,
    required this.dateTimeLocal,
    required this.timeTbd,
    required this.shortTitle,
    required this.visibleUntilUtc,
    required this.stats,
    required this.taxonomies,
    required this.url,
    required this.score,
    required this.announceDate,
    required this.createdAt,
    required this.dateTbd,
    required this.title,
    required this.popularity,
    required this.description,
    required this.status,
    required this.accessMethod,
    required this.eventPromotion,
    required this.announcements,
    required this.conditional,
  });

  final String type;
  final int id;
  final DateTime dateTimeUtc;
  final Venue venue;
  final bool dateTimeTbd;
  final List<Performer> performers;
  final bool isOpen;
  final DateTime dateTimeLocal;
  final bool timeTbd;
  final String shortTitle;
  final DateTime visibleUntilUtc;
  final EventStats stats;
  final List<Taxonomy> taxonomies;
  final String url;
  final double score;
  final DateTime announceDate;
  final DateTime createdAt;
  final bool dateTbd;
  final String title;
  final double popularity;
  final String description;
  final String status;
  final AccessMethod accessMethod;
  final EventPromotion eventPromotion;
  final Announcements announcements;
  final bool conditional;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        type: json["type"] ?? "",
        id: json["id"] ?? 0,
        dateTimeUtc:
            json["datetime_utc"] == null ? DateTime.now() : DateTime.parse(json["datetime_utc"]),
        venue: Venue.fromJson(json["venue"] ?? {}),
        dateTimeTbd: json["datetime_tbd"] ?? false,
        performers: List<Performer>.from(
            json["performers"] == null ? [] : json["performers"].map((x) => Performer.fromJson(x))),
        isOpen: json["is_open"] ?? false,
        dateTimeLocal: json["datetime_local"] == null
            ? DateTime.now()
            : DateTime.parse(json["datetime_local"]),
        timeTbd: json["time_tbd"] ?? false,
        shortTitle: json["short_title"] ?? "",
        visibleUntilUtc: json["visible_until_utc"] == null
            ? DateTime.now()
            : DateTime.parse(json["visible_until_utc"]),
        stats: EventStats.fromJson(json["stats"] ?? {}),
        taxonomies: List<Taxonomy>.from(
            json["taxonomies"] == null ? [] : json["taxonomies"].map((x) => Taxonomy.fromJson(x))),
        url: json["url"] ?? "",
        score: json["score"] == null ? 0.0 : json["score"].toDouble(),
        announceDate:
            json["announce_date"] == null ? DateTime.now() : DateTime.parse(json["announce_date"]),
        createdAt: json["created_at"] == null ? DateTime.now() : DateTime.parse(json["created_at"]),
        dateTbd: json["date_tbd"] ?? false,
        title: json["title"] ?? "",
        popularity: json["popularity"] == null ? 0.0 : json["popularity"].toDouble(),
        description: json["description"] ?? "",
        status: json["status"] ?? "",
        accessMethod: AccessMethod.fromJson(json["access_method"] ?? {}),
        eventPromotion: EventPromotion.fromJson(json["event_promotion"] ?? {}),
        announcements: Announcements.fromJson(json["announcements"] ?? {}),
        conditional: json["conditional"] ?? false,
      );
}

class AccessMethod {
  AccessMethod({
    required this.method,
    required this.createdAt,
    required this.employeeOnly,
  });

  final String method;
  final DateTime createdAt;
  final bool employeeOnly;

  factory AccessMethod.fromJson(Map<String, dynamic> json) => AccessMethod(
        method: json["method"] ?? "",
        createdAt: json["created_at"] == null ? DateTime.now() : DateTime.parse(json["created_at"]),
        employeeOnly: json["employee_only"] ?? false,
      );
}

class Announcements {
  Announcements({
    required this.checkoutDisclosures,
  });

  final CheckoutDisclosures checkoutDisclosures;

  factory Announcements.fromJson(Map<String, dynamic> json) => Announcements(
        checkoutDisclosures: CheckoutDisclosures.fromJson(json["checkout_disclosures"] ?? {}),
      );
}

class CheckoutDisclosures {
  CheckoutDisclosures({
    required this.messages,
  });

  final List<Message> messages;

  factory CheckoutDisclosures.fromJson(Map<String, dynamic> json) => CheckoutDisclosures(
        messages: List<Message>.from(
            json["messages"] == null ? [] : json["messages"].map((x) => Message.fromJson(x))),
      );
}

class Message {
  Message({
    required this.text,
  });

  final String text;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        text: json["text"] ?? "",
      );
}

class EventPromotion {
  EventPromotion({
    required this.headline,
    required this.additionalInfo,
    required this.images,
  });

  final String headline;
  final String additionalInfo;
  final EventPromotionImages images;

  factory EventPromotion.fromJson(Map<String, dynamic> json) => EventPromotion(
        headline: json["headline"] ?? "",
        additionalInfo: json["additional_info"] ?? "",
        images: EventPromotionImages.fromJson(json["images"] ?? {}),
      );
}

class EventPromotionImages {
  EventPromotionImages({
    required this.icon,
    required this.png2X,
    required this.png3X,
  });

  final String icon;
  final String png2X;
  final String png3X;

  factory EventPromotionImages.fromJson(Map<String, dynamic> json) => EventPromotionImages(
        icon: json["icon"] ?? "",
        png2X: json["png@2x"] ?? "",
        png3X: json["png@3x"] ?? "",
      );
}

class Performer {
  Performer({
    required this.type,
    required this.name,
    required this.image,
    required this.id,
    required this.images,
    required this.divisions,
    required this.hasUpcomingEvents,
    required this.primary,
    required this.stats,
    required this.taxonomies,
    required this.imageAttribution,
    required this.url,
    required this.score,
    required this.slug,
    required this.homeVenueId,
    required this.shortName,
    required this.numUpcomingEvents,
    required this.imageLicense,
    required this.popularity,
    required this.homeTeam,
    required this.location,
    required this.imageRightsMessage,
    required this.awayTeam,
  });

  final String type;
  final String name;
  final String image;
  final int id;
  final PerformerImages images;
  final List<Division> divisions;
  final bool hasUpcomingEvents;
  final bool primary;
  final PerformerStats stats;
  final List<Taxonomy> taxonomies;
  final String imageAttribution;
  final String url;
  final double score;
  final String slug;
  final int homeVenueId;
  final String shortName;
  final int numUpcomingEvents;
  final String imageLicense;
  final int popularity;
  final bool homeTeam;
  final Location location;
  final String imageRightsMessage;
  final bool awayTeam;

  factory Performer.fromJson(Map<String, dynamic> json) => Performer(
        type: json["type"] ?? "",
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        id: json["id"] ?? 0,
        images: PerformerImages.fromJson(json["images"] ?? {}),
        divisions: List<Division>.from(
            json["divisions"] == null ? [] : json["divisions"].map((x) => Division.fromJson(x))),
        hasUpcomingEvents: json["has_upcoming_events"] ?? false,
        primary: json["primary"] ?? false,
        stats: PerformerStats.fromJson(json["stats"] ?? {}),
        taxonomies: List<Taxonomy>.from(
            json["taxonomies"] == null ? [] : json["taxonomies"].map((x) => Taxonomy.fromJson(x))),
        imageAttribution: json["image_attribution"] ?? "",
        url: json["url"] ?? "",
        score: json["score"] == null ? 0.0 : json["score"].toDouble(),
        slug: json["slug"] ?? "",
        homeVenueId: json["home_venue_id"] ?? 0,
        shortName: json["short_name"] ?? "",
        numUpcomingEvents: json["num_upcoming_events"] ?? 0,
        imageLicense: json["image_license"] ?? "",
        popularity: json["popularity"] ?? 0,
        homeTeam: json["home_team"] ?? false,
        location: Location.fromJson(json["location"] ?? {}),
        imageRightsMessage: json["image_rights_message"] ?? "",
        awayTeam: json["away_team"] ?? false,
      );
}

class Division {
  Division({
    required this.taxonomyId,
    required this.shortName,
    required this.displayName,
    required this.displayType,
    required this.divisionLevel,
    required this.slug,
  });

  final int taxonomyId;
  final String shortName;
  final String displayName;
  final String displayType;
  final int divisionLevel;
  final String slug;

  factory Division.fromJson(Map<String, dynamic> json) => Division(
        taxonomyId: json["taxonomy_id"] ?? 0,
        shortName: json["short_name"] ?? "",
        displayName: json["display_name"] ?? "",
        displayType: json["display_type"] ?? "",
        divisionLevel: json["division_level"] ?? 0,
        slug: json["slug"] ?? "",
      );
}

class PerformerImages {
  PerformerImages({
    required this.huge,
  });

  final String huge;

  factory PerformerImages.fromJson(Map<String, dynamic> json) => PerformerImages(
        huge: json["huge"] ?? "",
      );
}

class Location {
  Location({
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"] == null ? 0.0 : json["lat"].toDouble(),
        lon: json["lon"] == null ? 0.0 : json["lon"].toDouble(),
      );
}

class PerformerStats {
  PerformerStats({
    required this.eventCount,
  });

  final int eventCount;

  factory PerformerStats.fromJson(Map<String, dynamic> json) => PerformerStats(
        eventCount: json["event_count"] ?? 0,
      );
}

class Taxonomy {
  Taxonomy({
    required this.id,
    required this.name,
    required this.parentId,
    required this.documentSource,
    required this.rank,
  });

  final int id;
  final String name;
  final int parentId;
  final DocumentSource documentSource;
  final int rank;

  factory Taxonomy.fromJson(Map<String, dynamic> json) => Taxonomy(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        parentId: json["parent_id"] ?? 0,
        documentSource: DocumentSource.fromJson(json["document_source"] ?? {}),
        rank: json["rank"] ?? 0,
      );
}

class DocumentSource {
  DocumentSource({
    required this.sourceType,
    required this.generationType,
  });

  final String sourceType;
  final String generationType;

  factory DocumentSource.fromJson(Map<String, dynamic> json) => DocumentSource(
        sourceType: json["source_type"] ?? "",
        generationType: json["generation_type"] ?? "",
      );
}

class EventStats {
  EventStats({
    required this.listingCount,
    required this.averagePrice,
    required this.lowestPriceGoodDeals,
    required this.lowestPrice,
    required this.highestPrice,
    required this.visibleListingCount,
    required this.dqBucketCounts,
    required this.medianPrice,
    required this.lowestSgBasePrice,
    required this.lowestSgBasePriceGoodDeals,
  });

  final int listingCount;
  final int averagePrice;
  final int lowestPriceGoodDeals;
  final int lowestPrice;
  final int highestPrice;
  final int visibleListingCount;
  final List<int> dqBucketCounts;
  final int medianPrice;
  final int lowestSgBasePrice;
  final int lowestSgBasePriceGoodDeals;

  factory EventStats.fromJson(Map<String, dynamic> json) => EventStats(
        listingCount: json["listing_count"] ?? 0,
        averagePrice: json["average_price"] ?? 0,
        lowestPriceGoodDeals: json["lowest_price_good_deals"] ?? 0,
        lowestPrice: json["lowest_price"] ?? 0,
        highestPrice: json["highest_price"] ?? 0,
        visibleListingCount: json["visible_listing_count"] ?? 0,
        dqBucketCounts: List<int>.from(
            json["dq_bucket_counts"] == null ? [] : json["dq_bucket_counts"].map((x) => x)),
        medianPrice: json["median_price"] ?? 0,
        lowestSgBasePrice: json["lowest_sg_base_price"] ?? 0,
        lowestSgBasePriceGoodDeals: json["lowest_sg_base_price_good_deals"] ?? 0,
      );
}

class Venue {
  Venue({
    required this.state,
    required this.nameV2,
    required this.postalCode,
    required this.name,
    required this.links,
    required this.timezone,
    required this.url,
    required this.score,
    required this.location,
    required this.address,
    required this.country,
    required this.hasUpcomingEvents,
    required this.numUpcomingEvents,
    required this.city,
    required this.slug,
    required this.extendedAddress,
    required this.id,
    required this.popularity,
    required this.accessMethod,
    required this.metroCode,
    required this.capacity,
    required this.displayLocation,
  });

  final String state;
  final String nameV2;
  final String postalCode;
  final String name;
  final List<dynamic> links;
  final String timezone;
  final String url;
  final double score;
  final Location location;
  final String address;
  final String country;
  final bool hasUpcomingEvents;
  final int numUpcomingEvents;
  final String city;
  final String slug;
  final String extendedAddress;
  final int id;
  final int popularity;
  final AccessMethod accessMethod;
  final int metroCode;
  final int capacity;
  final String displayLocation;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        state: json["state"] ?? "",
        nameV2: json["name_v2"] ?? "",
        postalCode: json["postal_code"] ?? "",
        name: json["name"] ?? "",
        links: List<dynamic>.from(json["links"] == null ? [] : json["links"].map((x) => x)),
        timezone: json["timezone"] ?? "",
        url: json["url"] ?? "",
        score: json["score"] == null ? 0.0 : json["score"].toDouble(),
        location: Location.fromJson(json["location"] ?? {}),
        address: json["address"] ?? "",
        country: json["country"] ?? "",
        hasUpcomingEvents: json["has_upcoming_events"] ?? false,
        numUpcomingEvents: json["num_upcoming_events"] ?? 0,
        city: json["city"] ?? "",
        slug: json["slug"] ?? "",
        extendedAddress: json["extended_address"] ?? "",
        id: json["id"] ?? 0,
        popularity: json["popularity"] ?? 0,
        accessMethod: AccessMethod.fromJson(json["access_method"] ?? {}),
        metroCode: json["metro_code"] ?? 0,
        capacity: json["capacity"] ?? 0,
        displayLocation: json["display_location"] ?? "",
      );
}

class Meta {
  Meta({
    required this.total,
    required this.took,
    required this.page,
    required this.perPage,
  });

  factory Meta.empty() => Meta(
        total: 0,
        took: 0,
        page: 0,
        perPage: 0,
      );

  final int total;
  final int took;
  final int page;
  final int perPage;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"] ?? 0,
        took: json["took"] ?? 0,
        page: json["page"] ?? 0,
        perPage: json["per_page"] ?? 0,
      );
}
