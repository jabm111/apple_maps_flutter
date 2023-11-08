// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of apple_maps_flutter;

/// Marks a geographical location on the map that contains multiple annotations clustered together
///
/// A annotation icon is drawn oriented against the device's screen rather than
/// the map's surface; that is, it will not necessarily change orientation
/// due to map rotations, tilting, or zooming.
class Cluster {
  Cluster({
    this.title,
    this.subtitle,
    required this.clusteringIdentifier,
    required this.position,
    required this.bounds,
    required this.annotationIds,
  });

  final String? title;
  final String? subtitle;
  final String clusteringIdentifier;
  final LatLng position;
  final LatLngBounds bounds;
  final List<AnnotationId> annotationIds;

  int get count => annotationIds.length;

  @override
  String toString() {
    return '$runtimeType($title, $subtitle)';
  }

  static Cluster? _fromJson(dynamic json) {
    if (json == null) {
      return null;
    }

    List<AnnotationId> annotationIds = [];
    for (final annotationId in json["annotationIds"] as List) {
      annotationIds.add(AnnotationId(annotationId));
    }

    return Cluster(
      title: json['title'],
      subtitle: json['subtitle'],
      clusteringIdentifier: json['clusteringIdentifier'],
      position: LatLng._fromJson(json['position'])!,
      bounds: LatLngBounds.fromList(json['bounds'])!,
      annotationIds: annotationIds,
    );
  }
}
