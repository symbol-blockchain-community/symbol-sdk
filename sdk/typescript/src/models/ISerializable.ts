export default class ISerializable {
  serialize(): Uint8Array{
    throw new Error('Method not implemented.');
  };
  static deserialize(payload: Uint8Array): object{
    throw new Error('Method not implemented.');
  };
  //size: number = 0;
}
