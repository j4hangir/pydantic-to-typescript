from typing import Optional, Tuple

from pydantic.v1 import BaseModel


class Sprite(BaseModel):
    path: Optional[str] = ...
    crop: Tuple[int, int, int, int]
    hotspot: Tuple[int, int]
