from fastapi import FastAPI
from pydantic import BaseModel
from langchain_ollama import OllamaLLM 

app = FastAPI()

class QueryRequest(BaseModel):
    query: str

llm = OllamaLLM(model="mistral")

# FastAPI route to accept POST requests with a query
@app.post("/chat")
def chat(req: QueryRequest):
    response = llm.invoke(req.query)
    return {"response": response}
