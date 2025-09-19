FROM python:3.9-alpine

WORKDIR /app

# Copy requirements first (better caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create non-root user
RUN adduser -D -s /bin/sh appuser
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
