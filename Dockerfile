# python base image 
FROM python:3-slim

# install django
RUN pip install django==3.2

# copy source dest
COPY . . 

RUN python manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]