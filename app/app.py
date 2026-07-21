import os
import boto3
import newrelic.agent
from fastapi import FastAPI
from pydantic import BaseModel

# Initialize New Relic
newrelic.agent.initialize()

app = FastAPI()

# Connect to AWS Bedrock using Pod Identity credentials
client = boto3.client('bedrock-runtime', region_name=os.environ.get("AWS_REGION", "us-west-2"))
# Use an AWS Cross-Region Inference Profile
MODEL_ID = "us.amazon.nova-pro-v1:0" 

class PromptRequest(BaseModel):
    prompt: str
    user_id: str

@app.post("/generate")
async def generate_text(request: PromptRequest):
    # The New Relic agent automatically instruments this Bedrock call
    response = client.converse(
        modelId=MODEL_ID,
        messages=[{"role": "user", "content": [{"text": request.prompt}]}]
    )
    
    output_text = response['output']['message']['content'][0]['text']
    return {"response": output_text}