FROM arm32v7/python:3.7.0-slim-stretch

ENV TIME 120

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY src .
COPY output .
#HEALTHCHECK --interval=5m --timeout=3s CMD 

CMD ["python", "src/worker.py"]
