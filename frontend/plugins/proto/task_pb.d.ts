// package: 
// file: proto/task.proto

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
  clearTaskList(): void;
  getTaskList(): Array<Task>;
  setTaskList(value: Array<Task>): void;
  addTask(value?: Task, index?: number): Task;

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
    taskList: Array<Task.AsObject>,
  }
}

export class FetchTasksRequest extends jspb.Message {
  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): FetchTasksRequest.AsObject;
  static toObject(includeInstance: boolean, msg: FetchTasksRequest): FetchTasksRequest.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: FetchTasksRequest, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): FetchTasksRequest;
  static deserializeBinaryFromReader(message: FetchTasksRequest, reader: jspb.BinaryReader): FetchTasksRequest;
}

export namespace FetchTasksRequest {
  export type AsObject = {
  }
}

export class FetchTasksResponse extends jspb.Message {
  hasTasks(): boolean;
  clearTasks(): void;
  getTasks(): Tasks | undefined;
  setTasks(value?: Tasks): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): FetchTasksResponse.AsObject;
  static toObject(includeInstance: boolean, msg: FetchTasksResponse): FetchTasksResponse.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: FetchTasksResponse, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): FetchTasksResponse;
  static deserializeBinaryFromReader(message: FetchTasksResponse, reader: jspb.BinaryReader): FetchTasksResponse;
}

export namespace FetchTasksResponse {
  export type AsObject = {
    tasks?: Tasks.AsObject,
  }
}

export class CreateTaskRequest extends jspb.Message {
  getTitle(): string;
  setTitle(value: string): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CreateTaskRequest.AsObject;
  static toObject(includeInstance: boolean, msg: CreateTaskRequest): CreateTaskRequest.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: CreateTaskRequest, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CreateTaskRequest;
  static deserializeBinaryFromReader(message: CreateTaskRequest, reader: jspb.BinaryReader): CreateTaskRequest;
}

export namespace CreateTaskRequest {
  export type AsObject = {
    title: string,
  }
}

export class CreateTaskResponse extends jspb.Message {
  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CreateTaskResponse.AsObject;
  static toObject(includeInstance: boolean, msg: CreateTaskResponse): CreateTaskResponse.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: CreateTaskResponse, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CreateTaskResponse;
  static deserializeBinaryFromReader(message: CreateTaskResponse, reader: jspb.BinaryReader): CreateTaskResponse;
}

export namespace CreateTaskResponse {
  export type AsObject = {
  }
}

