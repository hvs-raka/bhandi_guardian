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

class VisitListAdapter extends TypeAdapter<Visit_List> {
  @override
  final int typeId = 1;

  @override
  Visit_List read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Visit_List(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
      placeName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Visit_List obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.placeName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlayListAdapter extends TypeAdapter<PlayList> {
  @override
  final int typeId = 2;

  @override
  PlayList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayList(
      playlistName: fields[0] as String,
      playlistLink: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlayList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.playlistName)
      ..writeByte(1)
      ..write(obj.playlistLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GuardianListAdapter extends TypeAdapter<GuardianList> {
  @override
  final int typeId = 3;

  @override
  GuardianList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GuardianList(
      guardianName: fields[0] as String,
      guardianNumber: fields[1] as int,
      button: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, GuardianList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.guardianName)
      ..writeByte(1)
      ..write(obj.guardianNumber)
      ..writeByte(3)
      ..write(obj.button);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuardianListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HomeLocationAdapter extends TypeAdapter<HomeLocation> {
  @override
  final int typeId = 4;

  @override
  HomeLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeLocation(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HomeLocation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SosSettingsModelAdapter extends TypeAdapter<SosSettingsModel> {
  @override
  final int typeId = 5;

  @override
  SosSettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SosSettingsModel(
      guardianEnabled: fields[0] as bool,
      homeLocationEnabled: fields[1] as bool,
      sosMessageEnabled: fields[2] as bool,
      SOSnumber: fields[3] as String,
      SOSmessage: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SosSettingsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.guardianEnabled)
      ..writeByte(1)
      ..write(obj.homeLocationEnabled)
      ..writeByte(2)
      ..write(obj.sosMessageEnabled)
      ..writeByte(3)
      ..write(obj.SOSnumber)
      ..writeByte(4)
      ..write(obj.SOSmessage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SosSettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
