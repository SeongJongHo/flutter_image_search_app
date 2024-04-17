class Photo {
  final num id;
  final String pageURL;
  final String type;
  final String tags;
  final String previewURL;
  final num previewWidth;
  final num previewHeight;
  final String webformatURL;
  final num webformatWidth;
  final num webformatHeight;
  final String largeImageURL;
  final num imageWidth;
  final num imageHeight;
  final num imageSize;
  final num views;
  final num downloads;
  final num collections;
  final num likes;
  final num comments;
  final num userId;
  final String user;
  final String userImageURL;

  Photo({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageURL,
  });

  @override
  String toString() {
    return 'Photo{id: $id, pageURL: $pageURL, type: $type, tags: $tags, previewURL: $previewURL, previewWidth: $previewWidth, previewHeight: $previewHeight, webformatURL: $webformatURL, webformatWidth: $webformatWidth, webformatHeight: $webformatHeight, largeImageURL: $largeImageURL, imageWidth: $imageWidth, imageHeight: $imageHeight, imageSize: $imageSize, views: $views, downloads: $downloads, collections: $collections, likes: $likes, comments: $comments, userId: $userId, user: $user, userImageURL: $userImageURL}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Photo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          pageURL == other.pageURL &&
          type == other.type &&
          tags == other.tags &&
          previewURL == other.previewURL &&
          previewWidth == other.previewWidth &&
          previewHeight == other.previewHeight &&
          webformatURL == other.webformatURL &&
          webformatWidth == other.webformatWidth &&
          webformatHeight == other.webformatHeight &&
          largeImageURL == other.largeImageURL &&
          imageWidth == other.imageWidth &&
          imageHeight == other.imageHeight &&
          imageSize == other.imageSize &&
          views == other.views &&
          downloads == other.downloads &&
          collections == other.collections &&
          likes == other.likes &&
          comments == other.comments &&
          userId == other.userId &&
          user == other.user &&
          userImageURL == other.userImageURL;

  @override
  int get hashCode =>
      id.hashCode ^
      pageURL.hashCode ^
      type.hashCode ^
      tags.hashCode ^
      previewURL.hashCode ^
      previewWidth.hashCode ^
      previewHeight.hashCode ^
      webformatURL.hashCode ^
      webformatWidth.hashCode ^
      webformatHeight.hashCode ^
      largeImageURL.hashCode ^
      imageWidth.hashCode ^
      imageHeight.hashCode ^
      imageSize.hashCode ^
      views.hashCode ^
      downloads.hashCode ^
      collections.hashCode ^
      likes.hashCode ^
      comments.hashCode ^
      userId.hashCode ^
      user.hashCode ^
      userImageURL.hashCode;

  Photo copyWith({
    num? id,
    String? pageURL,
    String? type,
    String? tags,
    String? previewURL,
    num? previewWidth,
    num? previewHeight,
    String? webformatURL,
    num? webformatWidth,
    num? webformatHeight,
    String? largeImageURL,
    num? imageWidth,
    num? imageHeight,
    num? imageSize,
    num? views,
    num? downloads,
    num? collections,
    num? likes,
    num? comments,
    num? userId,
    String? user,
    String? userImageURL,
  }) {
    return Photo(
      id: id ?? this.id,
      pageURL: pageURL ?? this.pageURL,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      previewURL: previewURL ?? this.previewURL,
      previewWidth: previewWidth ?? this.previewWidth,
      previewHeight: previewHeight ?? this.previewHeight,
      webformatURL: webformatURL ?? this.webformatURL,
      webformatWidth: webformatWidth ?? this.webformatWidth,
      webformatHeight: webformatHeight ?? this.previewHeight,
      largeImageURL: largeImageURL ?? this.largeImageURL,
      imageWidth: imageWidth ?? this.imageWidth,
      imageHeight: imageHeight ?? this.imageHeight,
      imageSize: imageSize ?? this.imageSize,
      views: views ?? this.views,
      downloads: downloads ?? this.downloads,
      collections: collections ?? this.collections,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      userImageURL: userImageURL ?? this.userImageURL,
    );
  }
}
