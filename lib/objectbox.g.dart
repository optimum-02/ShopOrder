// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'entities.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 6086086150400555725),
      name: 'Customer',
      lastPropertyId: const IdUid(2, 4742555056038534215),
      flags: 2,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2832483759615012191),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4742555056038534215),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'orders', srcEntity: 'ShopOrder', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(2, 8746662029917469597),
      name: 'ShopOrder',
      lastPropertyId: const IdUid(3, 6706117976742351744),
      flags: 2,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3928609492069390035),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5497257857287926867),
            name: 'price',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6706117976742351744),
            name: 'customerId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 1444880191461598726),
            relationTarget: 'Customer')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 8746662029917469597),
      lastIndexId: const IdUid(1, 1444880191461598726),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Customer: EntityDefinition<Customer>(
        model: _entities[0],
        toOneRelations: (Customer object) => [],
        toManyRelations: (Customer object) => {
              RelInfo<ShopOrder>.toOneBacklink(3, object.id,
                  (ShopOrder srcObject) => srcObject.customer): object.orders
            },
        getId: (Customer object) => object.id,
        setId: (Customer object, int id) {
          object.id = id;
        },
        objectToFB: (Customer object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Customer(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''));
          InternalToManyAccess.setRelInfo<Customer>(
              object.orders,
              store,
              RelInfo<ShopOrder>.toOneBacklink(
                  3, object.id, (ShopOrder srcObject) => srcObject.customer));
          return object;
        }),
    ShopOrder: EntityDefinition<ShopOrder>(
        model: _entities[1],
        toOneRelations: (ShopOrder object) => [object.customer],
        toManyRelations: (ShopOrder object) => {},
        getId: (ShopOrder object) => object.id,
        setId: (ShopOrder object, int id) {
          object.id = id;
        },
        objectToFB: (ShopOrder object, fb.Builder fbb) {
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.price);
          fbb.addInt64(2, object.customer.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ShopOrder(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              price:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0));
          object.customer.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.customer.attach(store);
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Customer] entity fields to define ObjectBox queries.
class Customer_ {
  /// see [Customer.id]
  static final id = QueryIntegerProperty<Customer>(_entities[0].properties[0]);

  /// see [Customer.name]
  static final name = QueryStringProperty<Customer>(_entities[0].properties[1]);
}

/// [ShopOrder] entity fields to define ObjectBox queries.
class ShopOrder_ {
  /// see [ShopOrder.id]
  static final id = QueryIntegerProperty<ShopOrder>(_entities[1].properties[0]);

  /// see [ShopOrder.price]
  static final price =
      QueryIntegerProperty<ShopOrder>(_entities[1].properties[1]);

  /// see [ShopOrder.customer]
  static final customer =
      QueryRelationToOne<ShopOrder, Customer>(_entities[1].properties[2]);
}
