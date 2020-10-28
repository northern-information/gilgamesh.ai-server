FROM python:3

ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY src/requirements.txt ./

RUN pip install -r requirements.txt

COPY src /app

EXPOSE 5000

CMD [ "python", "app.py" ]
