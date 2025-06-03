// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helpsdb.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GethelpsdbCollection on Isar {
  IsarCollection<helpsdb> get helpsdbs => this.collection();
}

const HelpsdbSchema = CollectionSchema(
  name: r'helpsdb',
  id: -656928571082934313,
  properties: {
    r'guardians': PropertySchema(
      id: 0,
      name: r'guardians',
      type: IsarType.objectList,
      target: r'Guardian',
    ),
    r'homeLocation': PropertySchema(
      id: 1,
      name: r'homeLocation',
      type: IsarType.object,
      target: r'HomeLocation',
    )
  },
  estimateSize: _helpsdbEstimateSize,
  serialize: _helpsdbSerialize,
  deserialize: _helpsdbDeserialize,
  deserializeProp: _helpsdbDeserializeProp,
  idName: r'helps_id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Guardian': GuardianSchema,
    r'HomeLocation': HomeLocationSchema
  },
  getId: _helpsdbGetId,
  getLinks: _helpsdbGetLinks,
  attach: _helpsdbAttach,
  version: '3.1.0+1',
);

int _helpsdbEstimateSize(
  helpsdb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.guardians.length * 3;
  {
    final offsets = allOffsets[Guardian]!;
    for (var i = 0; i < object.guardians.length; i++) {
      final value = object.guardians[i];
      bytesCount += GuardianSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 +
      HomeLocationSchema.estimateSize(
          object.homeLocation, allOffsets[HomeLocation]!, allOffsets);
  return bytesCount;
}

void _helpsdbSerialize(
  helpsdb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Guardian>(
    offsets[0],
    allOffsets,
    GuardianSchema.serialize,
    object.guardians,
  );
  writer.writeObject<HomeLocation>(
    offsets[1],
    allOffsets,
    HomeLocationSchema.serialize,
    object.homeLocation,
  );
}

helpsdb _helpsdbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = helpsdb();
  object.guardians = reader.readObjectList<Guardian>(
        offsets[0],
        GuardianSchema.deserialize,
        allOffsets,
        Guardian(),
      ) ??
      [];
  object.helps_id = id;
  object.homeLocation = reader.readObjectOrNull<HomeLocation>(
        offsets[1],
        HomeLocationSchema.deserialize,
        allOffsets,
      ) ??
      HomeLocation();
  return object;
}

P _helpsdbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Guardian>(
            offset,
            GuardianSchema.deserialize,
            allOffsets,
            Guardian(),
          ) ??
          []) as P;
    case 1:
      return (reader.readObjectOrNull<HomeLocation>(
            offset,
            HomeLocationSchema.deserialize,
            allOffsets,
          ) ??
          HomeLocation()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _helpsdbGetId(helpsdb object) {
  return object.helps_id;
}

List<IsarLinkBase<dynamic>> _helpsdbGetLinks(helpsdb object) {
  return [];
}

void _helpsdbAttach(IsarCollection<dynamic> col, Id id, helpsdb object) {
  object.helps_id = id;
}

extension helpsdbQueryWhereSort on QueryBuilder<helpsdb, helpsdb, QWhere> {
  QueryBuilder<helpsdb, helpsdb, QAfterWhere> anyHelps_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension helpsdbQueryWhere on QueryBuilder<helpsdb, helpsdb, QWhereClause> {
  QueryBuilder<helpsdb, helpsdb, QAfterWhereClause> helps_idEqualTo(
      Id helps_id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: helps_id,
        upper: helps_id,
      ));
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterWhereClause> helps_idNotEqualTo(
      Id helps_id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: helps_id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: helps_id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: helps_id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: helps_id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterWhereClause> helps_idGreaterThan(
      Id helps_id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: helps_id, includeLower: include),
      );
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterWhereClause> helps_idLessThan(
      Id helps_id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: helps_id, includeUpper: include),
      );
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterWhereClause> helps_idBetween(
    Id lowerHelps_id,
    Id upperHelps_id, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerHelps_id,
        includeLower: includeLower,
        upper: upperHelps_id,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension helpsdbQueryFilter
    on QueryBuilder<helpsdb, helpsdb, QFilterCondition> {
  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition> guardiansLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guardians',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition> guardiansIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guardians',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition> guardiansIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guardians',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition> guardiansLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guardians',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition>
      guardiansLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guardians',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition> guardiansLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guardians',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition> helps_idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'helps_id',
        value: value,
      ));
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition> helps_idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'helps_id',
        value: value,
      ));
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition> helps_idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'helps_id',
        value: value,
      ));
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition> helps_idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'helps_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension helpsdbQueryObject
    on QueryBuilder<helpsdb, helpsdb, QFilterCondition> {
  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition> guardiansElement(
      FilterQuery<Guardian> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'guardians');
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterFilterCondition> homeLocation(
      FilterQuery<HomeLocation> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'homeLocation');
    });
  }
}

extension helpsdbQueryLinks
    on QueryBuilder<helpsdb, helpsdb, QFilterCondition> {}

extension helpsdbQuerySortBy on QueryBuilder<helpsdb, helpsdb, QSortBy> {}

extension helpsdbQuerySortThenBy
    on QueryBuilder<helpsdb, helpsdb, QSortThenBy> {
  QueryBuilder<helpsdb, helpsdb, QAfterSortBy> thenByHelps_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'helps_id', Sort.asc);
    });
  }

  QueryBuilder<helpsdb, helpsdb, QAfterSortBy> thenByHelps_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'helps_id', Sort.desc);
    });
  }
}

extension helpsdbQueryWhereDistinct
    on QueryBuilder<helpsdb, helpsdb, QDistinct> {}

extension helpsdbQueryProperty
    on QueryBuilder<helpsdb, helpsdb, QQueryProperty> {
  QueryBuilder<helpsdb, int, QQueryOperations> helps_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'helps_id');
    });
  }

  QueryBuilder<helpsdb, List<Guardian>, QQueryOperations> guardiansProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'guardians');
    });
  }

  QueryBuilder<helpsdb, HomeLocation, QQueryOperations> homeLocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'homeLocation');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GuardianSchema = Schema(
  name: r'Guardian',
  id: -1820350986083112178,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'number': PropertySchema(
      id: 1,
      name: r'number',
      type: IsarType.string,
    )
  },
  estimateSize: _guardianEstimateSize,
  serialize: _guardianSerialize,
  deserialize: _guardianDeserialize,
  deserializeProp: _guardianDeserializeProp,
);

int _guardianEstimateSize(
  Guardian object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.number.length * 3;
  return bytesCount;
}

void _guardianSerialize(
  Guardian object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeString(offsets[1], object.number);
}

Guardian _guardianDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Guardian();
  object.name = reader.readString(offsets[0]);
  object.number = reader.readString(offsets[1]);
  return object;
}

P _guardianDeserializeProp<P>(
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

extension GuardianQueryFilter
    on QueryBuilder<Guardian, Guardian, QFilterCondition> {
  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> numberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> numberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> numberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> numberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> numberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> numberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> numberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> numberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'number',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> numberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: '',
      ));
    });
  }

  QueryBuilder<Guardian, Guardian, QAfterFilterCondition> numberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'number',
        value: '',
      ));
    });
  }
}

extension GuardianQueryObject
    on QueryBuilder<Guardian, Guardian, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HomeLocationSchema = Schema(
  name: r'HomeLocation',
  id: 2347295624167027353,
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
  estimateSize: _homeLocationEstimateSize,
  serialize: _homeLocationSerialize,
  deserialize: _homeLocationDeserialize,
  deserializeProp: _homeLocationDeserializeProp,
);

int _homeLocationEstimateSize(
  HomeLocation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _homeLocationSerialize(
  HomeLocation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.latitude);
  writer.writeDouble(offsets[1], object.longitude);
}

HomeLocation _homeLocationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HomeLocation();
  object.latitude = reader.readDouble(offsets[0]);
  object.longitude = reader.readDouble(offsets[1]);
  return object;
}

P _homeLocationDeserializeProp<P>(
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

extension HomeLocationQueryFilter
    on QueryBuilder<HomeLocation, HomeLocation, QFilterCondition> {
  QueryBuilder<HomeLocation, HomeLocation, QAfterFilterCondition>
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

  QueryBuilder<HomeLocation, HomeLocation, QAfterFilterCondition>
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

  QueryBuilder<HomeLocation, HomeLocation, QAfterFilterCondition>
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

  QueryBuilder<HomeLocation, HomeLocation, QAfterFilterCondition>
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

  QueryBuilder<HomeLocation, HomeLocation, QAfterFilterCondition>
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

  QueryBuilder<HomeLocation, HomeLocation, QAfterFilterCondition>
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

  QueryBuilder<HomeLocation, HomeLocation, QAfterFilterCondition>
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

  QueryBuilder<HomeLocation, HomeLocation, QAfterFilterCondition>
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

extension HomeLocationQueryObject
    on QueryBuilder<HomeLocation, HomeLocation, QFilterCondition> {}
