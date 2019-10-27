// package:
// file: proto/task.proto
// command: protoc --plugin=protoc-gen-ts=./frontend/node_modules/.bin/protoc-gen-ts --js_out=import_style=commonjs,binary:./frontend/plugins --ts_out=./frontend/plugins proto/task.proto

import * as jspb from "google-protobuf";

export class Task extends jspb.Message {
  getId(): number;
  setId(value: number): void;

  getTitle(): string;
  setTitle(value: string): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): Task.AsObject;
  static toObject(includeInstance: boolean, msg: Task): Task.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: Task, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): Task;
  static deserializeBinaryFromReader(message: Task, reader: jspb.BinaryReader): Task;
}

export namespace Task {
  export type AsObject = {
    id: number,
    title: string,
  }
}

export class Tasks extends jspb.Message {
  hasTask(): boolean;
  clearTask(): void;
  getTask(): Task | undefined;
  setTask(value?: Task): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): Tasks.AsObject;
  static toObject(includeInstance: boolean, msg: Tasks): Tasks.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: Tasks, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): Tasks;
  static deserializeBinaryFromReader(message: Tasks, reader: jspb.BinaryReader): Tasks;
}

export namespace Tasks {
  export type AsObject = {
    task?: Task.AsObject,
  }
}
