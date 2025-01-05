// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUsuarioCollection on Isar {
  IsarCollection<Usuario> get usuarios => this.collection();
}

const UsuarioSchema = CollectionSchema(
  name: r'Usuario',
  id: 2086545823229412462,
  properties: {
    r'identifier': PropertySchema(
      id: 0,
      name: r'identifier',
      type: IsarType.string,
    ),
    r'password': PropertySchema(
      id: 1,
      name: r'password',
      type: IsarType.string,
    ),
    r'tipoUsuario': PropertySchema(
      id: 2,
      name: r'tipoUsuario',
      type: IsarType.byte,
      enumMap: _UsuariotipoUsuarioEnumValueMap,
    )
  },
  estimateSize: _usuarioEstimateSize,
  serialize: _usuarioSerialize,
  deserialize: _usuarioDeserialize,
  deserializeProp: _usuarioDeserializeProp,
  idName: r'id',
  indexes: {
    r'identifier': IndexSchema(
      id: -1091831983288130400,
      name: r'identifier',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'identifier',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'alumno': LinkSchema(
      id: 231473660127409370,
      name: r'alumno',
      target: r'Alumno',
      single: true,
    ),
    r'profesor': LinkSchema(
      id: -4928366456193026807,
      name: r'profesor',
      target: r'Profesor',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _usuarioGetId,
  getLinks: _usuarioGetLinks,
  attach: _usuarioAttach,
  version: '3.1.0+1',
);

int _usuarioEstimateSize(
  Usuario object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.identifier.length * 3;
  bytesCount += 3 + object.password.length * 3;
  return bytesCount;
}

void _usuarioSerialize(
  Usuario object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.identifier);
  writer.writeString(offsets[1], object.password);
  writer.writeByte(offsets[2], object.tipoUsuario.index);
}

Usuario _usuarioDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Usuario();
  object.id = id;
  object.identifier = reader.readString(offsets[0]);
  object.password = reader.readString(offsets[1]);
  object.tipoUsuario =
      _UsuariotipoUsuarioValueEnumMap[reader.readByteOrNull(offsets[2])] ??
          TipoUsuario.alumno;
  return object;
}

P _usuarioDeserializeProp<P>(
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
    case 2:
      return (_UsuariotipoUsuarioValueEnumMap[reader.readByteOrNull(offset)] ??
          TipoUsuario.alumno) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _UsuariotipoUsuarioEnumValueMap = {
  'alumno': 0,
  'profesor': 1,
};
const _UsuariotipoUsuarioValueEnumMap = {
  0: TipoUsuario.alumno,
  1: TipoUsuario.profesor,
};

Id _usuarioGetId(Usuario object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _usuarioGetLinks(Usuario object) {
  return [object.alumno, object.profesor];
}

void _usuarioAttach(IsarCollection<dynamic> col, Id id, Usuario object) {
  object.id = id;
  object.alumno.attach(col, col.isar.collection<Alumno>(), r'alumno', id);
  object.profesor.attach(col, col.isar.collection<Profesor>(), r'profesor', id);
}

extension UsuarioByIndex on IsarCollection<Usuario> {
  Future<Usuario?> getByIdentifier(String identifier) {
    return getByIndex(r'identifier', [identifier]);
  }

  Usuario? getByIdentifierSync(String identifier) {
    return getByIndexSync(r'identifier', [identifier]);
  }

  Future<bool> deleteByIdentifier(String identifier) {
    return deleteByIndex(r'identifier', [identifier]);
  }

  bool deleteByIdentifierSync(String identifier) {
    return deleteByIndexSync(r'identifier', [identifier]);
  }

  Future<List<Usuario?>> getAllByIdentifier(List<String> identifierValues) {
    final values = identifierValues.map((e) => [e]).toList();
    return getAllByIndex(r'identifier', values);
  }

  List<Usuario?> getAllByIdentifierSync(List<String> identifierValues) {
    final values = identifierValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'identifier', values);
  }

  Future<int> deleteAllByIdentifier(List<String> identifierValues) {
    final values = identifierValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'identifier', values);
  }

  int deleteAllByIdentifierSync(List<String> identifierValues) {
    final values = identifierValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'identifier', values);
  }

  Future<Id> putByIdentifier(Usuario object) {
    return putByIndex(r'identifier', object);
  }

  Id putByIdentifierSync(Usuario object, {bool saveLinks = true}) {
    return putByIndexSync(r'identifier', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdentifier(List<Usuario> objects) {
    return putAllByIndex(r'identifier', objects);
  }

  List<Id> putAllByIdentifierSync(List<Usuario> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'identifier', objects, saveLinks: saveLinks);
  }
}

extension UsuarioQueryWhereSort on QueryBuilder<Usuario, Usuario, QWhere> {
  QueryBuilder<Usuario, Usuario, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UsuarioQueryWhere on QueryBuilder<Usuario, Usuario, QWhereClause> {
  QueryBuilder<Usuario, Usuario, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterWhereClause> identifierEqualTo(
      String identifier) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'identifier',
        value: [identifier],
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterWhereClause> identifierNotEqualTo(
      String identifier) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'identifier',
              lower: [],
              upper: [identifier],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'identifier',
              lower: [identifier],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'identifier',
              lower: [identifier],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'identifier',
              lower: [],
              upper: [identifier],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UsuarioQueryFilter
    on QueryBuilder<Usuario, Usuario, QFilterCondition> {
  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> identifierEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> identifierGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> identifierLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> identifierBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'identifier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> identifierStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> identifierEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> identifierContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> identifierMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'identifier',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> identifierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identifier',
        value: '',
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> identifierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'identifier',
        value: '',
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> passwordEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> passwordGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> passwordLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> passwordBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'password',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> passwordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> passwordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> passwordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> passwordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'password',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> passwordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'password',
        value: '',
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> passwordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'password',
        value: '',
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> tipoUsuarioEqualTo(
      TipoUsuario value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> tipoUsuarioGreaterThan(
    TipoUsuario value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> tipoUsuarioLessThan(
    TipoUsuario value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> tipoUsuarioBetween(
    TipoUsuario lower,
    TipoUsuario upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoUsuario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UsuarioQueryObject
    on QueryBuilder<Usuario, Usuario, QFilterCondition> {}

extension UsuarioQueryLinks
    on QueryBuilder<Usuario, Usuario, QFilterCondition> {
  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> alumno(
      FilterQuery<Alumno> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'alumno');
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> alumnoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alumno', 0, true, 0, true);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> profesor(
      FilterQuery<Profesor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'profesor');
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterFilterCondition> profesorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'profesor', 0, true, 0, true);
    });
  }
}

extension UsuarioQuerySortBy on QueryBuilder<Usuario, Usuario, QSortBy> {
  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPassword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByPasswordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByTipoUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoUsuario', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> sortByTipoUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoUsuario', Sort.desc);
    });
  }
}

extension UsuarioQuerySortThenBy
    on QueryBuilder<Usuario, Usuario, QSortThenBy> {
  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPassword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByPasswordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.desc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByTipoUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoUsuario', Sort.asc);
    });
  }

  QueryBuilder<Usuario, Usuario, QAfterSortBy> thenByTipoUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoUsuario', Sort.desc);
    });
  }
}

extension UsuarioQueryWhereDistinct
    on QueryBuilder<Usuario, Usuario, QDistinct> {
  QueryBuilder<Usuario, Usuario, QDistinct> distinctByIdentifier(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'identifier', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByPassword(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'password', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Usuario, Usuario, QDistinct> distinctByTipoUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoUsuario');
    });
  }
}

extension UsuarioQueryProperty
    on QueryBuilder<Usuario, Usuario, QQueryProperty> {
  QueryBuilder<Usuario, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Usuario, String, QQueryOperations> identifierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'identifier');
    });
  }

  QueryBuilder<Usuario, String, QQueryOperations> passwordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'password');
    });
  }

  QueryBuilder<Usuario, TipoUsuario, QQueryOperations> tipoUsuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoUsuario');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAlumnoCollection on Isar {
  IsarCollection<Alumno> get alumnos => this.collection();
}

const AlumnoSchema = CollectionSchema(
  name: r'Alumno',
  id: -6919629756294187550,
  properties: {
    r'boleta': PropertySchema(
      id: 0,
      name: r'boleta',
      type: IsarType.long,
    ),
    r'carrera': PropertySchema(
      id: 1,
      name: r'carrera',
      type: IsarType.string,
    ),
    r'correo': PropertySchema(
      id: 2,
      name: r'correo',
      type: IsarType.string,
    ),
    r'curp': PropertySchema(
      id: 3,
      name: r'curp',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 4,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'telefono': PropertySchema(
      id: 5,
      name: r'telefono',
      type: IsarType.string,
    )
  },
  estimateSize: _alumnoEstimateSize,
  serialize: _alumnoSerialize,
  deserialize: _alumnoDeserialize,
  deserializeProp: _alumnoDeserializeProp,
  idName: r'id',
  indexes: {
    r'boleta': IndexSchema(
      id: -2769849578680782969,
      name: r'boleta',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'boleta',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'correo': IndexSchema(
      id: -6928770995677321851,
      name: r'correo',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'correo',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'usuario': LinkSchema(
      id: 9063018090304192804,
      name: r'usuario',
      target: r'Usuario',
      single: true,
      linkName: r'alumno',
    )
  },
  embeddedSchemas: {},
  getId: _alumnoGetId,
  getLinks: _alumnoGetLinks,
  attach: _alumnoAttach,
  version: '3.1.0+1',
);

int _alumnoEstimateSize(
  Alumno object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.carrera.length * 3;
  {
    final value = object.correo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.curp.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.telefono;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _alumnoSerialize(
  Alumno object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.boleta);
  writer.writeString(offsets[1], object.carrera);
  writer.writeString(offsets[2], object.correo);
  writer.writeString(offsets[3], object.curp);
  writer.writeString(offsets[4], object.nombre);
  writer.writeString(offsets[5], object.telefono);
}

Alumno _alumnoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Alumno();
  object.boleta = reader.readLong(offsets[0]);
  object.carrera = reader.readString(offsets[1]);
  object.correo = reader.readStringOrNull(offsets[2]);
  object.curp = reader.readString(offsets[3]);
  object.id = id;
  object.nombre = reader.readString(offsets[4]);
  object.telefono = reader.readStringOrNull(offsets[5]);
  return object;
}

P _alumnoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _alumnoGetId(Alumno object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _alumnoGetLinks(Alumno object) {
  return [object.usuario];
}

void _alumnoAttach(IsarCollection<dynamic> col, Id id, Alumno object) {
  object.id = id;
  object.usuario.attach(col, col.isar.collection<Usuario>(), r'usuario', id);
}

extension AlumnoByIndex on IsarCollection<Alumno> {
  Future<Alumno?> getByBoleta(int boleta) {
    return getByIndex(r'boleta', [boleta]);
  }

  Alumno? getByBoletaSync(int boleta) {
    return getByIndexSync(r'boleta', [boleta]);
  }

  Future<bool> deleteByBoleta(int boleta) {
    return deleteByIndex(r'boleta', [boleta]);
  }

  bool deleteByBoletaSync(int boleta) {
    return deleteByIndexSync(r'boleta', [boleta]);
  }

  Future<List<Alumno?>> getAllByBoleta(List<int> boletaValues) {
    final values = boletaValues.map((e) => [e]).toList();
    return getAllByIndex(r'boleta', values);
  }

  List<Alumno?> getAllByBoletaSync(List<int> boletaValues) {
    final values = boletaValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'boleta', values);
  }

  Future<int> deleteAllByBoleta(List<int> boletaValues) {
    final values = boletaValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'boleta', values);
  }

  int deleteAllByBoletaSync(List<int> boletaValues) {
    final values = boletaValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'boleta', values);
  }

  Future<Id> putByBoleta(Alumno object) {
    return putByIndex(r'boleta', object);
  }

  Id putByBoletaSync(Alumno object, {bool saveLinks = true}) {
    return putByIndexSync(r'boleta', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBoleta(List<Alumno> objects) {
    return putAllByIndex(r'boleta', objects);
  }

  List<Id> putAllByBoletaSync(List<Alumno> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'boleta', objects, saveLinks: saveLinks);
  }

  Future<Alumno?> getByCorreo(String? correo) {
    return getByIndex(r'correo', [correo]);
  }

  Alumno? getByCorreoSync(String? correo) {
    return getByIndexSync(r'correo', [correo]);
  }

  Future<bool> deleteByCorreo(String? correo) {
    return deleteByIndex(r'correo', [correo]);
  }

  bool deleteByCorreoSync(String? correo) {
    return deleteByIndexSync(r'correo', [correo]);
  }

  Future<List<Alumno?>> getAllByCorreo(List<String?> correoValues) {
    final values = correoValues.map((e) => [e]).toList();
    return getAllByIndex(r'correo', values);
  }

  List<Alumno?> getAllByCorreoSync(List<String?> correoValues) {
    final values = correoValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'correo', values);
  }

  Future<int> deleteAllByCorreo(List<String?> correoValues) {
    final values = correoValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'correo', values);
  }

  int deleteAllByCorreoSync(List<String?> correoValues) {
    final values = correoValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'correo', values);
  }

  Future<Id> putByCorreo(Alumno object) {
    return putByIndex(r'correo', object);
  }

  Id putByCorreoSync(Alumno object, {bool saveLinks = true}) {
    return putByIndexSync(r'correo', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCorreo(List<Alumno> objects) {
    return putAllByIndex(r'correo', objects);
  }

  List<Id> putAllByCorreoSync(List<Alumno> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'correo', objects, saveLinks: saveLinks);
  }
}

extension AlumnoQueryWhereSort on QueryBuilder<Alumno, Alumno, QWhere> {
  QueryBuilder<Alumno, Alumno, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhere> anyBoleta() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'boleta'),
      );
    });
  }
}

extension AlumnoQueryWhere on QueryBuilder<Alumno, Alumno, QWhereClause> {
  QueryBuilder<Alumno, Alumno, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> boletaEqualTo(int boleta) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'boleta',
        value: [boleta],
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> boletaNotEqualTo(int boleta) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'boleta',
              lower: [],
              upper: [boleta],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'boleta',
              lower: [boleta],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'boleta',
              lower: [boleta],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'boleta',
              lower: [],
              upper: [boleta],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> boletaGreaterThan(
    int boleta, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'boleta',
        lower: [boleta],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> boletaLessThan(
    int boleta, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'boleta',
        lower: [],
        upper: [boleta],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> boletaBetween(
    int lowerBoleta,
    int upperBoleta, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'boleta',
        lower: [lowerBoleta],
        includeLower: includeLower,
        upper: [upperBoleta],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> correoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'correo',
        value: [null],
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> correoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'correo',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> correoEqualTo(
      String? correo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'correo',
        value: [correo],
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterWhereClause> correoNotEqualTo(
      String? correo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'correo',
              lower: [],
              upper: [correo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'correo',
              lower: [correo],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'correo',
              lower: [correo],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'correo',
              lower: [],
              upper: [correo],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AlumnoQueryFilter on QueryBuilder<Alumno, Alumno, QFilterCondition> {
  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> boletaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'boleta',
        value: value,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> boletaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'boleta',
        value: value,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> boletaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'boleta',
        value: value,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> boletaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'boleta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> carreraEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> carreraGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> carreraLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> carreraBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carrera',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> carreraStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> carreraEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> carreraContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> carreraMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'carrera',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> carreraIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carrera',
        value: '',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> carreraIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'carrera',
        value: '',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correo',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correo',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correo',
        value: '',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> correoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correo',
        value: '',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> curpEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> curpGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> curpLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> curpBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'curp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> curpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> curpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> curpContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> curpMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'curp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> curpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'curp',
        value: '',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> curpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'curp',
        value: '',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telefono',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telefono',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefono',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefono',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: '',
      ));
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> telefonoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefono',
        value: '',
      ));
    });
  }
}

extension AlumnoQueryObject on QueryBuilder<Alumno, Alumno, QFilterCondition> {}

extension AlumnoQueryLinks on QueryBuilder<Alumno, Alumno, QFilterCondition> {
  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> usuario(
      FilterQuery<Usuario> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'usuario');
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterFilterCondition> usuarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'usuario', 0, true, 0, true);
    });
  }
}

extension AlumnoQuerySortBy on QueryBuilder<Alumno, Alumno, QSortBy> {
  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByBoleta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boleta', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByBoletaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boleta', Sort.desc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByCarrera() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrera', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByCarreraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrera', Sort.desc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.desc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByCurp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curp', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByCurpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curp', Sort.desc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> sortByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }
}

extension AlumnoQuerySortThenBy on QueryBuilder<Alumno, Alumno, QSortThenBy> {
  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByBoleta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boleta', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByBoletaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boleta', Sort.desc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByCarrera() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrera', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByCarreraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrera', Sort.desc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.desc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByCurp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curp', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByCurpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curp', Sort.desc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<Alumno, Alumno, QAfterSortBy> thenByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }
}

extension AlumnoQueryWhereDistinct on QueryBuilder<Alumno, Alumno, QDistinct> {
  QueryBuilder<Alumno, Alumno, QDistinct> distinctByBoleta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'boleta');
    });
  }

  QueryBuilder<Alumno, Alumno, QDistinct> distinctByCarrera(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carrera', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alumno, Alumno, QDistinct> distinctByCorreo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alumno, Alumno, QDistinct> distinctByCurp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'curp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alumno, Alumno, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alumno, Alumno, QDistinct> distinctByTelefono(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefono', caseSensitive: caseSensitive);
    });
  }
}

extension AlumnoQueryProperty on QueryBuilder<Alumno, Alumno, QQueryProperty> {
  QueryBuilder<Alumno, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Alumno, int, QQueryOperations> boletaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'boleta');
    });
  }

  QueryBuilder<Alumno, String, QQueryOperations> carreraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carrera');
    });
  }

  QueryBuilder<Alumno, String?, QQueryOperations> correoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correo');
    });
  }

  QueryBuilder<Alumno, String, QQueryOperations> curpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'curp');
    });
  }

  QueryBuilder<Alumno, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Alumno, String?, QQueryOperations> telefonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefono');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProfesorCollection on Isar {
  IsarCollection<Profesor> get profesors => this.collection();
}

const ProfesorSchema = CollectionSchema(
  name: r'Profesor',
  id: 606318726701407495,
  properties: {
    r'cargo': PropertySchema(
      id: 0,
      name: r'cargo',
      type: IsarType.string,
    ),
    r'correo': PropertySchema(
      id: 1,
      name: r'correo',
      type: IsarType.string,
    ),
    r'curp': PropertySchema(
      id: 2,
      name: r'curp',
      type: IsarType.string,
    ),
    r'departamento': PropertySchema(
      id: 3,
      name: r'departamento',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 4,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'telefono': PropertySchema(
      id: 5,
      name: r'telefono',
      type: IsarType.string,
    )
  },
  estimateSize: _profesorEstimateSize,
  serialize: _profesorSerialize,
  deserialize: _profesorDeserialize,
  deserializeProp: _profesorDeserializeProp,
  idName: r'id',
  indexes: {
    r'curp': IndexSchema(
      id: 6601291418905802983,
      name: r'curp',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'curp',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'correo': IndexSchema(
      id: -6928770995677321851,
      name: r'correo',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'correo',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'usuario': LinkSchema(
      id: 2261908802799612628,
      name: r'usuario',
      target: r'Usuario',
      single: true,
      linkName: r'profesor',
    )
  },
  embeddedSchemas: {},
  getId: _profesorGetId,
  getLinks: _profesorGetLinks,
  attach: _profesorAttach,
  version: '3.1.0+1',
);

int _profesorEstimateSize(
  Profesor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.cargo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.correo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.curp.length * 3;
  {
    final value = object.departamento;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.telefono;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _profesorSerialize(
  Profesor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cargo);
  writer.writeString(offsets[1], object.correo);
  writer.writeString(offsets[2], object.curp);
  writer.writeString(offsets[3], object.departamento);
  writer.writeString(offsets[4], object.nombre);
  writer.writeString(offsets[5], object.telefono);
}

Profesor _profesorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Profesor();
  object.cargo = reader.readStringOrNull(offsets[0]);
  object.correo = reader.readStringOrNull(offsets[1]);
  object.curp = reader.readString(offsets[2]);
  object.departamento = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.nombre = reader.readString(offsets[4]);
  object.telefono = reader.readStringOrNull(offsets[5]);
  return object;
}

P _profesorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _profesorGetId(Profesor object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _profesorGetLinks(Profesor object) {
  return [object.usuario];
}

void _profesorAttach(IsarCollection<dynamic> col, Id id, Profesor object) {
  object.id = id;
  object.usuario.attach(col, col.isar.collection<Usuario>(), r'usuario', id);
}

extension ProfesorByIndex on IsarCollection<Profesor> {
  Future<Profesor?> getByCurp(String curp) {
    return getByIndex(r'curp', [curp]);
  }

  Profesor? getByCurpSync(String curp) {
    return getByIndexSync(r'curp', [curp]);
  }

  Future<bool> deleteByCurp(String curp) {
    return deleteByIndex(r'curp', [curp]);
  }

  bool deleteByCurpSync(String curp) {
    return deleteByIndexSync(r'curp', [curp]);
  }

  Future<List<Profesor?>> getAllByCurp(List<String> curpValues) {
    final values = curpValues.map((e) => [e]).toList();
    return getAllByIndex(r'curp', values);
  }

  List<Profesor?> getAllByCurpSync(List<String> curpValues) {
    final values = curpValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'curp', values);
  }

  Future<int> deleteAllByCurp(List<String> curpValues) {
    final values = curpValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'curp', values);
  }

  int deleteAllByCurpSync(List<String> curpValues) {
    final values = curpValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'curp', values);
  }

  Future<Id> putByCurp(Profesor object) {
    return putByIndex(r'curp', object);
  }

  Id putByCurpSync(Profesor object, {bool saveLinks = true}) {
    return putByIndexSync(r'curp', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCurp(List<Profesor> objects) {
    return putAllByIndex(r'curp', objects);
  }

  List<Id> putAllByCurpSync(List<Profesor> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'curp', objects, saveLinks: saveLinks);
  }

  Future<Profesor?> getByCorreo(String? correo) {
    return getByIndex(r'correo', [correo]);
  }

  Profesor? getByCorreoSync(String? correo) {
    return getByIndexSync(r'correo', [correo]);
  }

  Future<bool> deleteByCorreo(String? correo) {
    return deleteByIndex(r'correo', [correo]);
  }

  bool deleteByCorreoSync(String? correo) {
    return deleteByIndexSync(r'correo', [correo]);
  }

  Future<List<Profesor?>> getAllByCorreo(List<String?> correoValues) {
    final values = correoValues.map((e) => [e]).toList();
    return getAllByIndex(r'correo', values);
  }

  List<Profesor?> getAllByCorreoSync(List<String?> correoValues) {
    final values = correoValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'correo', values);
  }

  Future<int> deleteAllByCorreo(List<String?> correoValues) {
    final values = correoValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'correo', values);
  }

  int deleteAllByCorreoSync(List<String?> correoValues) {
    final values = correoValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'correo', values);
  }

  Future<Id> putByCorreo(Profesor object) {
    return putByIndex(r'correo', object);
  }

  Id putByCorreoSync(Profesor object, {bool saveLinks = true}) {
    return putByIndexSync(r'correo', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCorreo(List<Profesor> objects) {
    return putAllByIndex(r'correo', objects);
  }

  List<Id> putAllByCorreoSync(List<Profesor> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'correo', objects, saveLinks: saveLinks);
  }
}

extension ProfesorQueryWhereSort on QueryBuilder<Profesor, Profesor, QWhere> {
  QueryBuilder<Profesor, Profesor, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProfesorQueryWhere on QueryBuilder<Profesor, Profesor, QWhereClause> {
  QueryBuilder<Profesor, Profesor, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterWhereClause> curpEqualTo(String curp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'curp',
        value: [curp],
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterWhereClause> curpNotEqualTo(
      String curp) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'curp',
              lower: [],
              upper: [curp],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'curp',
              lower: [curp],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'curp',
              lower: [curp],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'curp',
              lower: [],
              upper: [curp],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterWhereClause> correoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'correo',
        value: [null],
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterWhereClause> correoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'correo',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterWhereClause> correoEqualTo(
      String? correo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'correo',
        value: [correo],
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterWhereClause> correoNotEqualTo(
      String? correo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'correo',
              lower: [],
              upper: [correo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'correo',
              lower: [correo],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'correo',
              lower: [correo],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'correo',
              lower: [],
              upper: [correo],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ProfesorQueryFilter
    on QueryBuilder<Profesor, Profesor, QFilterCondition> {
  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cargo',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cargo',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cargo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cargo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cargo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cargo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cargo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cargo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cargo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cargo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cargo',
        value: '',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> cargoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cargo',
        value: '',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correo',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correo',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correo',
        value: '',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> correoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correo',
        value: '',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> curpEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> curpGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> curpLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> curpBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'curp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> curpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> curpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> curpContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'curp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> curpMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'curp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> curpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'curp',
        value: '',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> curpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'curp',
        value: '',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> departamentoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'departamento',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition>
      departamentoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'departamento',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> departamentoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition>
      departamentoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'departamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> departamentoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'departamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> departamentoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'departamento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition>
      departamentoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'departamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> departamentoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'departamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> departamentoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'departamento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> departamentoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'departamento',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition>
      departamentoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departamento',
        value: '',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition>
      departamentoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'departamento',
        value: '',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telefono',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telefono',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefono',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefono',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: '',
      ));
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> telefonoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefono',
        value: '',
      ));
    });
  }
}

extension ProfesorQueryObject
    on QueryBuilder<Profesor, Profesor, QFilterCondition> {}

extension ProfesorQueryLinks
    on QueryBuilder<Profesor, Profesor, QFilterCondition> {
  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> usuario(
      FilterQuery<Usuario> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'usuario');
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterFilterCondition> usuarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'usuario', 0, true, 0, true);
    });
  }
}

extension ProfesorQuerySortBy on QueryBuilder<Profesor, Profesor, QSortBy> {
  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByCargo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargo', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByCargoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargo', Sort.desc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.desc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByCurp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curp', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByCurpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curp', Sort.desc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByDepartamento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departamento', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByDepartamentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departamento', Sort.desc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> sortByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }
}

extension ProfesorQuerySortThenBy
    on QueryBuilder<Profesor, Profesor, QSortThenBy> {
  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByCargo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargo', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByCargoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargo', Sort.desc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.desc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByCurp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curp', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByCurpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curp', Sort.desc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByDepartamento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departamento', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByDepartamentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departamento', Sort.desc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<Profesor, Profesor, QAfterSortBy> thenByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }
}

extension ProfesorQueryWhereDistinct
    on QueryBuilder<Profesor, Profesor, QDistinct> {
  QueryBuilder<Profesor, Profesor, QDistinct> distinctByCargo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cargo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Profesor, Profesor, QDistinct> distinctByCorreo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Profesor, Profesor, QDistinct> distinctByCurp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'curp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Profesor, Profesor, QDistinct> distinctByDepartamento(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'departamento', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Profesor, Profesor, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Profesor, Profesor, QDistinct> distinctByTelefono(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefono', caseSensitive: caseSensitive);
    });
  }
}

extension ProfesorQueryProperty
    on QueryBuilder<Profesor, Profesor, QQueryProperty> {
  QueryBuilder<Profesor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Profesor, String?, QQueryOperations> cargoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cargo');
    });
  }

  QueryBuilder<Profesor, String?, QQueryOperations> correoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correo');
    });
  }

  QueryBuilder<Profesor, String, QQueryOperations> curpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'curp');
    });
  }

  QueryBuilder<Profesor, String?, QQueryOperations> departamentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'departamento');
    });
  }

  QueryBuilder<Profesor, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Profesor, String?, QQueryOperations> telefonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefono');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHorarioCollection on Isar {
  IsarCollection<Horario> get horarios => this.collection();
}

const HorarioSchema = CollectionSchema(
  name: r'Horario',
  id: -47064652139356415,
  properties: {
    r'boleta': PropertySchema(
      id: 0,
      name: r'boleta',
      type: IsarType.long,
    ),
    r'curpProfesor': PropertySchema(
      id: 1,
      name: r'curpProfesor',
      type: IsarType.string,
    ),
    r'idGrupo': PropertySchema(
      id: 2,
      name: r'idGrupo',
      type: IsarType.long,
    )
  },
  estimateSize: _horarioEstimateSize,
  serialize: _horarioSerialize,
  deserialize: _horarioDeserialize,
  deserializeProp: _horarioDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'grupo': LinkSchema(
      id: 4043128747866493604,
      name: r'grupo',
      target: r'Grupo',
      single: true,
    ),
    r'profesor': LinkSchema(
      id: -6515418707493908898,
      name: r'profesor',
      target: r'Profesor',
      single: true,
    ),
    r'alumno': LinkSchema(
      id: -3104941891403927013,
      name: r'alumno',
      target: r'Alumno',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _horarioGetId,
  getLinks: _horarioGetLinks,
  attach: _horarioAttach,
  version: '3.1.0+1',
);

int _horarioEstimateSize(
  Horario object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.curpProfesor.length * 3;
  return bytesCount;
}

void _horarioSerialize(
  Horario object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.boleta);
  writer.writeString(offsets[1], object.curpProfesor);
  writer.writeLong(offsets[2], object.idGrupo);
}

Horario _horarioDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Horario();
  object.boleta = reader.readLong(offsets[0]);
  object.curpProfesor = reader.readString(offsets[1]);
  object.id = id;
  object.idGrupo = reader.readLong(offsets[2]);
  return object;
}

P _horarioDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _horarioGetId(Horario object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _horarioGetLinks(Horario object) {
  return [object.grupo, object.profesor, object.alumno];
}

void _horarioAttach(IsarCollection<dynamic> col, Id id, Horario object) {
  object.id = id;
  object.grupo.attach(col, col.isar.collection<Grupo>(), r'grupo', id);
  object.profesor.attach(col, col.isar.collection<Profesor>(), r'profesor', id);
  object.alumno.attach(col, col.isar.collection<Alumno>(), r'alumno', id);
}

extension HorarioQueryWhereSort on QueryBuilder<Horario, Horario, QWhere> {
  QueryBuilder<Horario, Horario, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HorarioQueryWhere on QueryBuilder<Horario, Horario, QWhereClause> {
  QueryBuilder<Horario, Horario, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Horario, Horario, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Horario, Horario, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Horario, Horario, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HorarioQueryFilter
    on QueryBuilder<Horario, Horario, QFilterCondition> {
  QueryBuilder<Horario, Horario, QAfterFilterCondition> boletaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'boleta',
        value: value,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> boletaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'boleta',
        value: value,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> boletaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'boleta',
        value: value,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> boletaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'boleta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> curpProfesorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'curpProfesor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> curpProfesorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'curpProfesor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> curpProfesorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'curpProfesor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> curpProfesorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'curpProfesor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> curpProfesorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'curpProfesor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> curpProfesorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'curpProfesor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> curpProfesorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'curpProfesor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> curpProfesorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'curpProfesor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> curpProfesorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'curpProfesor',
        value: '',
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition>
      curpProfesorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'curpProfesor',
        value: '',
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> idGrupoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> idGrupoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> idGrupoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idGrupo',
        value: value,
      ));
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> idGrupoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idGrupo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HorarioQueryObject
    on QueryBuilder<Horario, Horario, QFilterCondition> {}

extension HorarioQueryLinks
    on QueryBuilder<Horario, Horario, QFilterCondition> {
  QueryBuilder<Horario, Horario, QAfterFilterCondition> grupo(
      FilterQuery<Grupo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'grupo');
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> grupoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'grupo', 0, true, 0, true);
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> profesor(
      FilterQuery<Profesor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'profesor');
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> profesorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'profesor', 0, true, 0, true);
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> alumno(
      FilterQuery<Alumno> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'alumno');
    });
  }

  QueryBuilder<Horario, Horario, QAfterFilterCondition> alumnoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alumno', 0, true, 0, true);
    });
  }
}

extension HorarioQuerySortBy on QueryBuilder<Horario, Horario, QSortBy> {
  QueryBuilder<Horario, Horario, QAfterSortBy> sortByBoleta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boleta', Sort.asc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> sortByBoletaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boleta', Sort.desc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> sortByCurpProfesor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curpProfesor', Sort.asc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> sortByCurpProfesorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curpProfesor', Sort.desc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> sortByIdGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.asc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> sortByIdGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.desc);
    });
  }
}

extension HorarioQuerySortThenBy
    on QueryBuilder<Horario, Horario, QSortThenBy> {
  QueryBuilder<Horario, Horario, QAfterSortBy> thenByBoleta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boleta', Sort.asc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> thenByBoletaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boleta', Sort.desc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> thenByCurpProfesor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curpProfesor', Sort.asc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> thenByCurpProfesorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'curpProfesor', Sort.desc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> thenByIdGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.asc);
    });
  }

  QueryBuilder<Horario, Horario, QAfterSortBy> thenByIdGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGrupo', Sort.desc);
    });
  }
}

extension HorarioQueryWhereDistinct
    on QueryBuilder<Horario, Horario, QDistinct> {
  QueryBuilder<Horario, Horario, QDistinct> distinctByBoleta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'boleta');
    });
  }

  QueryBuilder<Horario, Horario, QDistinct> distinctByCurpProfesor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'curpProfesor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Horario, Horario, QDistinct> distinctByIdGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idGrupo');
    });
  }
}

extension HorarioQueryProperty
    on QueryBuilder<Horario, Horario, QQueryProperty> {
  QueryBuilder<Horario, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Horario, int, QQueryOperations> boletaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'boleta');
    });
  }

  QueryBuilder<Horario, String, QQueryOperations> curpProfesorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'curpProfesor');
    });
  }

  QueryBuilder<Horario, int, QQueryOperations> idGrupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idGrupo');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGrupoCollection on Isar {
  IsarCollection<Grupo> get grupos => this.collection();
}

const GrupoSchema = CollectionSchema(
  name: r'Grupo',
  id: -6897321016875927792,
  properties: {
    r'carrera': PropertySchema(
      id: 0,
      name: r'carrera',
      type: IsarType.string,
    ),
    r'dia': PropertySchema(
      id: 1,
      name: r'dia',
      type: IsarType.string,
    ),
    r'grupo': PropertySchema(
      id: 2,
      name: r'grupo',
      type: IsarType.string,
    ),
    r'horaInicio': PropertySchema(
      id: 3,
      name: r'horaInicio',
      type: IsarType.dateTime,
    ),
    r'horaTermino': PropertySchema(
      id: 4,
      name: r'horaTermino',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _grupoEstimateSize,
  serialize: _grupoSerialize,
  deserialize: _grupoDeserialize,
  deserializeProp: _grupoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'horarios': LinkSchema(
      id: 1114281209245422391,
      name: r'horarios',
      target: r'Horario',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _grupoGetId,
  getLinks: _grupoGetLinks,
  attach: _grupoAttach,
  version: '3.1.0+1',
);

int _grupoEstimateSize(
  Grupo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.carrera.length * 3;
  bytesCount += 3 + object.dia.length * 3;
  bytesCount += 3 + object.grupo.length * 3;
  return bytesCount;
}

void _grupoSerialize(
  Grupo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.carrera);
  writer.writeString(offsets[1], object.dia);
  writer.writeString(offsets[2], object.grupo);
  writer.writeDateTime(offsets[3], object.horaInicio);
  writer.writeDateTime(offsets[4], object.horaTermino);
}

Grupo _grupoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Grupo();
  object.carrera = reader.readString(offsets[0]);
  object.dia = reader.readString(offsets[1]);
  object.grupo = reader.readString(offsets[2]);
  object.horaInicio = reader.readDateTime(offsets[3]);
  object.horaTermino = reader.readDateTime(offsets[4]);
  object.id = id;
  return object;
}

P _grupoDeserializeProp<P>(
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
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _grupoGetId(Grupo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _grupoGetLinks(Grupo object) {
  return [object.horarios];
}

void _grupoAttach(IsarCollection<dynamic> col, Id id, Grupo object) {
  object.id = id;
  object.horarios.attach(col, col.isar.collection<Horario>(), r'horarios', id);
}

extension GrupoQueryWhereSort on QueryBuilder<Grupo, Grupo, QWhere> {
  QueryBuilder<Grupo, Grupo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GrupoQueryWhere on QueryBuilder<Grupo, Grupo, QWhereClause> {
  QueryBuilder<Grupo, Grupo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GrupoQueryFilter on QueryBuilder<Grupo, Grupo, QFilterCondition> {
  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> carreraEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> carreraGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> carreraLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> carreraBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carrera',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> carreraStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> carreraEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> carreraContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'carrera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> carreraMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'carrera',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> carreraIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carrera',
        value: '',
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> carreraIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'carrera',
        value: '',
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> diaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> diaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> diaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> diaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> diaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> diaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> diaContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> diaMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> diaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dia',
        value: '',
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> diaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dia',
        value: '',
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> grupoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> grupoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> grupoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> grupoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grupo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> grupoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> grupoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> grupoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> grupoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grupo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> grupoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupo',
        value: '',
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> grupoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grupo',
        value: '',
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horaInicioEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horaInicioGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horaInicioLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horaInicioBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaInicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horaTerminoEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaTermino',
        value: value,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horaTerminoGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaTermino',
        value: value,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horaTerminoLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaTermino',
        value: value,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horaTerminoBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaTermino',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GrupoQueryObject on QueryBuilder<Grupo, Grupo, QFilterCondition> {}

extension GrupoQueryLinks on QueryBuilder<Grupo, Grupo, QFilterCondition> {
  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horarios(
      FilterQuery<Horario> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'horarios');
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horariosLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'horarios', length, true, length, true);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horariosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'horarios', 0, true, 0, true);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horariosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'horarios', 0, false, 999999, true);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horariosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'horarios', 0, true, length, include);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horariosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'horarios', length, include, 999999, true);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterFilterCondition> horariosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'horarios', lower, includeLower, upper, includeUpper);
    });
  }
}

extension GrupoQuerySortBy on QueryBuilder<Grupo, Grupo, QSortBy> {
  QueryBuilder<Grupo, Grupo, QAfterSortBy> sortByCarrera() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrera', Sort.asc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> sortByCarreraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrera', Sort.desc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> sortByDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dia', Sort.asc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> sortByDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dia', Sort.desc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> sortByGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.asc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> sortByGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.desc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> sortByHoraInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaInicio', Sort.asc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> sortByHoraInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaInicio', Sort.desc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> sortByHoraTermino() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaTermino', Sort.asc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> sortByHoraTerminoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaTermino', Sort.desc);
    });
  }
}

extension GrupoQuerySortThenBy on QueryBuilder<Grupo, Grupo, QSortThenBy> {
  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenByCarrera() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrera', Sort.asc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenByCarreraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrera', Sort.desc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenByDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dia', Sort.asc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenByDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dia', Sort.desc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenByGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.asc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenByGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.desc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenByHoraInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaInicio', Sort.asc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenByHoraInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaInicio', Sort.desc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenByHoraTermino() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaTermino', Sort.asc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenByHoraTerminoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaTermino', Sort.desc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Grupo, Grupo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension GrupoQueryWhereDistinct on QueryBuilder<Grupo, Grupo, QDistinct> {
  QueryBuilder<Grupo, Grupo, QDistinct> distinctByCarrera(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carrera', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Grupo, Grupo, QDistinct> distinctByDia(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dia', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Grupo, Grupo, QDistinct> distinctByGrupo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grupo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Grupo, Grupo, QDistinct> distinctByHoraInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaInicio');
    });
  }

  QueryBuilder<Grupo, Grupo, QDistinct> distinctByHoraTermino() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaTermino');
    });
  }
}

extension GrupoQueryProperty on QueryBuilder<Grupo, Grupo, QQueryProperty> {
  QueryBuilder<Grupo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Grupo, String, QQueryOperations> carreraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carrera');
    });
  }

  QueryBuilder<Grupo, String, QQueryOperations> diaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dia');
    });
  }

  QueryBuilder<Grupo, String, QQueryOperations> grupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grupo');
    });
  }

  QueryBuilder<Grupo, DateTime, QQueryOperations> horaInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaInicio');
    });
  }

  QueryBuilder<Grupo, DateTime, QQueryOperations> horaTerminoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaTermino');
    });
  }
}
