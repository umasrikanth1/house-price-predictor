FROM python:3.11-slim 
WORKDIR /app 
COPY src/api/ .
# Check if requirements.txt exists in src/api/ (it does now)
COPY src/api/requirements.txt .
RUN pip install -r requirements.txt

# Copy model from project root (context) to container
# Original guide assumed models/trained. We use models/ directly based on observation.
COPY models/ models/

EXPOSE 8000
CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000" ]
