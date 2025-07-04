FROM python:3.12
COPY . /app
WORKDIR /app
RUN pip install -r requiremets.txt
EXPOSE $PORT
CMD gunicorn --worker=4 --bind 0.0.0.0:$PORT app:app