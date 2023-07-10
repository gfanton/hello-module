import * as React from 'react';

import { HelloModuleViewProps } from './HelloModule.types';

export default function HelloModuleView(props: HelloModuleViewProps) {
  return (
    <div>
      <span>{props.name}</span>
    </div>
  );
}
