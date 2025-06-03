// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'othersdb.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetothersdbCollection on Isar {
  IsarCollection<othersdb> get othersdbs => this.collection();
}

const OthersdbSchema = CollectionSchema(
  name: r'othersdb',
  id: -2982148347690323814,
  properties: {
    r'Playlist': PropertySchema(
      id: 0,
      name: r'Playlist',
      type: IsarType.objectList,
      target: r'Playlists',
    ),
    r'SOSsettings': PropertySchema(
      id: 1,
      name: r'SOSsettings',
      type: IsarType.string,
    ),
    r'visitLocation': PropertySchema(
      id: 2,
      name: r'visitLocation',
      type: IsarType.object,
      target: r'VisitLocation',
    )
  },
  estimateSize: _othersdbEstimateSize,
  serialize: _othersdbSerialize,
  deserialize: _othersdbDeserialize,
  deserializeProp: _othersdbDeserializeProp,
  idName: r'others_id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'VisitLocation': VisitLocationSchema,
    r'Playlists': PlaylistsSchema
  },
  getId: _othersdbGetId,
  getLinks: _othersdbGetLinks,
  attach: _othersdbAttach,
  version: '3.1.0+1',
);

int _othersdbEstimateSize(
  othersdb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.Playlist.length * 3;
  {
    final offsets = allOffsets[Playlists]!;
    for (var i = 0; i < object.Playlist.length; i++) {
      final value = object.Playlist[i];
      bytesCount += PlaylistsSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.SOSsettings.length * 3;
  bytesCount += 3 +
      VisitLocationSchema.estimateSize(
          object.visitLocation, allOffsets[VisitLocation]!, allOffsets);
  return bytesCount;
}

void _othersdbSerialize(
  othersdb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Playlists>(
    offsets[0],
    allOffsets,
    PlaylistsSchema.serialize,
    object.Playlist,
  );
  writer.writeString(offsets[1], object.SOSsettings);
  writer.writeObject<VisitLocation>(
    offsets[2],
    allOffsets,
    VisitLocationSchema.serialize,
    object.visitLocation,
  );
}

othersdb _othersdbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = othersdb();
  object.Playlist = reader.readObjectList<Playlists>(
        offsets[0],
        PlaylistsSchema.deserialize,
        allOffsets,
        Playlists(),
      ) ??
      [];
  object.SOSsettings = reader.readString(offsets[1]);
  object.others_id = id;
  object.visitLocation = reader.readObjectOrNull<VisitLocation>(
        offsets[2],
        VisitLocationSchema.deserialize,
        allOffsets,
      ) ??
      VisitLocation();
  return object;
}

P _othersdbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Playlists>(
            offset,
            PlaylistsSchema.deserialize,
            allOffsets,
            Playlists(),
          ) ??
          []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<VisitLocation>(
            offset,
            VisitLocationSchema.deserialize,
            allOffsets,
          ) ??
          VisitLocation()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _othersdbGetId(othersdb object) {
  return object.others_id;
}

List<IsarLinkBase<dynamic>> _othersdbGetLinks(othersdb object) {
  return [];
}

void _othersdbAttach(IsarCollection<dynamic> col, Id id, othersdb object) {
  object.others_id = id;
}

extension othersdbQueryWhereSort on QueryBuilder<othersdb, othersdb, QWhere> {
  QueryBuilder<othersdb, othersdb, QAfterWhere> anyOthers_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension othersdbQueryWhere on QueryBuilder<othersdb, othersdb, QWhereClause> {
  QueryBuilder<othersdb, othersdb, QAfterWhereClause> others_idEqualTo(
      Id others_id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: others_id,
        upper: others_id,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterWhereClause> others_idNotEqualTo(
      Id others_id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: others_id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: others_id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: others_id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: others_id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterWhereClause> others_idGreaterThan(
      Id others_id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: others_id, includeLower: include),
      );
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterWhereClause> others_idLessThan(
      Id others_id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: others_id, includeUpper: include),
      );
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterWhereClause> others_idBetween(
    Id lowerOthers_id,
    Id upperOthers_id, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerOthers_id,
        includeLower: includeLower,
        upper: upperOthers_id,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension othersdbQueryFilter
    on QueryBuilder<othersdb, othersdb, QFilterCondition> {
  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> playlistLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'Playlist',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> playlistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'Playlist',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> playlistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'Playlist',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition>
      playlistLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'Playlist',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition>
      playlistLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'Playlist',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> playlistLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'Playlist',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> sOSsettingsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'SOSsettings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition>
      sOSsettingsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'SOSsettings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> sOSsettingsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'SOSsettings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> sOSsettingsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'SOSsettings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> sOSsettingsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'SOSsettings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> sOSsettingsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'SOSsettings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> sOSsettingsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'SOSsettings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> sOSsettingsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'SOSsettings',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> sOSsettingsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'SOSsettings',
        value: '',
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition>
      sOSsettingsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'SOSsettings',
        value: '',
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> others_idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'others_id',
        value: value,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> others_idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'others_id',
        value: value,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> others_idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'others_id',
        value: value,
      ));
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> others_idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'others_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension othersdbQueryObject
    on QueryBuilder<othersdb, othersdb, QFilterCondition> {
  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> playlistElement(
      FilterQuery<Playlists> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'Playlist');
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterFilterCondition> visitLocation(
      FilterQuery<VisitLocation> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'visitLocation');
    });
  }
}

extension othersdbQueryLinks
    on QueryBuilder<othersdb, othersdb, QFilterCondition> {}

extension othersdbQuerySortBy on QueryBuilder<othersdb, othersdb, QSortBy> {
  QueryBuilder<othersdb, othersdb, QAfterSortBy> sortBySOSsettings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SOSsettings', Sort.asc);
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterSortBy> sortBySOSsettingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SOSsettings', Sort.desc);
    });
  }
}

extension othersdbQuerySortThenBy
    on QueryBuilder<othersdb, othersdb, QSortThenBy> {
  QueryBuilder<othersdb, othersdb, QAfterSortBy> thenBySOSsettings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SOSsettings', Sort.asc);
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterSortBy> thenBySOSsettingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'SOSsettings', Sort.desc);
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterSortBy> thenByOthers_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'others_id', Sort.asc);
    });
  }

  QueryBuilder<othersdb, othersdb, QAfterSortBy> thenByOthers_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'others_id', Sort.desc);
    });
  }
}

extension othersdbQueryWhereDistinct
    on QueryBuilder<othersdb, othersdb, QDistinct> {
  QueryBuilder<othersdb, othersdb, QDistinct> distinctBySOSsettings(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'SOSsettings', caseSensitive: caseSensitive);
    });
  }
}

extension othersdbQueryProperty
    on QueryBuilder<othersdb, othersdb, QQueryProperty> {
  QueryBuilder<othersdb, int, QQueryOperations> others_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'others_id');
    });
  }

  QueryBuilder<othersdb, List<Playlists>, QQueryOperations> PlaylistProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Playlist');
    });
  }

  QueryBuilder<othersdb, String, QQueryOperations> SOSsettingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'SOSsettings');
    });
  }

  QueryBuilder<othersdb, VisitLocation, QQueryOperations>
      visitLocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitLocation');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VisitLocationSchema = Schema(
  name: r'VisitLocation',
  id: -8660197219282631933,
  properties: {
    r'latitude': PropertySchema(
      id: 0,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 1,
      name: r'longitude',
      type: IsarType.double,
    )
  },
  estimateSize: _visitLocationEstimateSize,
  serialize: _visitLocationSerialize,
  deserialize: _visitLocationDeserialize,
  deserializeProp: _visitLocationDeserializeProp,
);

int _visitLocationEstimateSize(
  VisitLocation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _visitLocationSerialize(
  VisitLocation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.latitude);
  writer.writeDouble(offsets[1], object.longitude);
}

VisitLocation _visitLocationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VisitLocation();
  object.latitude = reader.readDouble(offsets[0]);
  object.longitude = reader.readDouble(offsets[1]);
  return object;
}

P _visitLocationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension VisitLocationQueryFilter
    on QueryBuilder<VisitLocation, VisitLocation, QFilterCondition> {
  QueryBuilder<VisitLocation, VisitLocation, QAfterFilterCondition>
      latitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VisitLocation, VisitLocation, QAfterFilterCondition>
      latitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VisitLocation, VisitLocation, QAfterFilterCondition>
      latitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VisitLocation, VisitLocation, QAfterFilterCondition>
      latitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VisitLocation, VisitLocation, QAfterFilterCondition>
      longitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VisitLocation, VisitLocation, QAfterFilterCondition>
      longitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VisitLocation, VisitLocation, QAfterFilterCondition>
      longitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VisitLocation, VisitLocation, QAfterFilterCondition>
      longitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension VisitLocationQueryObject
    on QueryBuilder<VisitLocation, VisitLocation, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PlaylistsSchema = Schema(
  name: r'Playlists',
  id: -6328946205353115065,
  properties: {
    r'link': PropertySchema(
      id: 0,
      name: r'link',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _playlistsEstimateSize,
  serialize: _playlistsSerialize,
  deserialize: _playlistsDeserialize,
  deserializeProp: _playlistsDeserializeProp,
);

int _playlistsEstimateSize(
  Playlists object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.link.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _playlistsSerialize(
  Playlists object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.link);
  writer.writeString(offsets[1], object.name);
}

Playlists _playlistsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Playlists();
  object.link = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _playlistsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PlaylistsQueryFilter
    on QueryBuilder<Playlists, Playlists, QFilterCondition> {
  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> linkEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> linkGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> linkLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> linkBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'link',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> linkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> linkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> linkContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> linkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'link',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> linkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'link',
        value: '',
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> linkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'link',
        value: '',
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Playlists, Playlists, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension PlaylistsQueryObject
    on QueryBuilder<Playlists, Playlists, QFilterCondition> {}
