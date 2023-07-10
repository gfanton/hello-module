import { NativeModulesProxy, EventEmitter, Subscription } from 'expo-modules-core';

// Import the native module. On web, it will be resolved to HelloModule.web.ts
// and on native platforms to HelloModule.ts
import HelloModule from './HelloModule';
import HelloModuleView from './HelloModuleView';
import { ChangeEventPayload, HelloModuleViewProps } from './HelloModule.types';

// Get the native constant value.
export const PI = HelloModule.PI;

export function hello(): string {
  return HelloModule.helloGo();
}

export async function setValueAsync(value: string) {
  return await HelloModule.setValueAsync(value);
}

const emitter = new EventEmitter(HelloModule ?? NativeModulesProxy.HelloModule);

export function addChangeListener(listener: (event: ChangeEventPayload) => void): Subscription {
  return emitter.addListener<ChangeEventPayload>('onChange', listener);
}

export { HelloModuleView, HelloModuleViewProps, ChangeEventPayload };
