FROM python:2.7
ENV PYTHONUNBUFFERED 1

RUN mkdir /code

ADD . /code/
RUN chmod +x /code/manage.py

WORKDIR /code
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD python manage.py runserver 0.0.0.0:8000
