import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';

import { HelloModuleViewProps } from './HelloModule.types';

const NativeView: React.ComponentType<HelloModuleViewProps> =
  requireNativeViewManager('HelloModule');

export default function HelloModuleView(props: HelloModuleViewProps) {
  return <NativeView {...props} />;
}
