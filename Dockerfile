FROM python:3.12

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (match what's used in app.py)
EXPOSE 8000

# Run the app
CMD ["python", "app.py"]