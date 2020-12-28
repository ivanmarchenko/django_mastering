# FROM python:3
# ENV PYTHONUNBUFFERED 1
# RUN mkdir /code
# WORKDIR /code
# COPY requirements.txt /code/
# RUN pip install -r requirements.txt
# COPY . /code/

# base image slim
FROM python:3.8-slim


# environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set timezone Europe/Moscow for DEBIAN container
# https://serverfault.com/questions/683605/docker-container-time-timezone-will-not-reflect-changes
# ENV TZ=Europe/Moscow
# https://linuxize.com/post/how-to-set-or-change-timezone-on-debian-10/#:~:text=To%20change%20your%20Debian%20system's,if%20you%20have%20any%20questions.
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
# RUN echo $TZ > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata


# work directory
WORKDIR /django_mastering

# install dependences
COPY Pipfile Pipfile.lock /django_mastering/
RUN pip install pipenv && pipenv install --system

# copy project from <root> to /copy/
COPY . /django_mastering/