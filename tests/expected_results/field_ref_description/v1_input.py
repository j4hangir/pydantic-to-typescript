from pydantic.v1 import BaseModel, Field


class Profile(BaseModel):
    username: str


class LoginResponseData(BaseModel):
    profile: Profile = Field(..., description="Test")
