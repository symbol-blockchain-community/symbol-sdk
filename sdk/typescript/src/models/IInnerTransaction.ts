import ISerializable from './ISerializable';

export default class IInnerTransaction extends ISerializable {
  sort(): void{
    throw new Error('unimplement sort');
  }
}