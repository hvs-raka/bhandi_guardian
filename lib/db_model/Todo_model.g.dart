// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Todo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoModelAdapter extends TypeAdapter<Todo_Model> {
  @override
  final int typeId = 0;

  @override
  Todo_Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo_Model(
      Todo: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Todo_Model obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.Todo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
