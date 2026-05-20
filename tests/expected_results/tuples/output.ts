/* tslint:disable */
/* eslint-disable */
/**
/* This file was automatically generated from pydantic models by running pydantic2ts.
/* Do not modify it by hand - just update the pydantic models and then re-run the script
*/

export interface Sprite {
  path: string | null;
  /**
   * @minItems 4
   * @maxItems 4
   */
  crop: [number, number, number, number];
  /**
   * @minItems 2
   * @maxItems 2
   */
  hotspot: [number, number];
}
