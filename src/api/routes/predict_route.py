from fastapi import APIRouter
from pydantic import BaseModel
import joblib
import os

router = APIRouter()

class InputData(BaseModel):
    features: list

@router.post("/")
def predict(data: InputData):
    model_path = os.path.join("src", "models", "model.pkl")
    model = joblib.load(model_path)
    preds = model.predict([data.features])
    return {"prediction": preds.tolist()}
