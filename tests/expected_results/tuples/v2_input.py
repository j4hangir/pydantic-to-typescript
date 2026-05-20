from pydantic import BaseModel


class Sprite(BaseModel):
    path: str | None
    crop: tuple[int, int, int, int]
    hotspot: tuple[int, int]
