from fastapi import FastAPI
from src.api.routes.predict_route import router as predict_router

app = FastAPI(
    title="ML API Boilerplate",
    version="1.0.0",
    description="Starter template for ML model serving"
)

app.include_router(predict_router, prefix="/predict", tags=["Prediction"])

@app.get("/")
def root():
    return {"message": "Welcome to your MLOps Boilerplate!"}
