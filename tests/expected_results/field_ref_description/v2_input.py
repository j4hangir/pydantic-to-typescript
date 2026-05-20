from pydantic import BaseModel, Field


class Profile(BaseModel):
    username: str


class LoginResponseData(BaseModel):
    profile: Profile = Field(..., description="Test")
