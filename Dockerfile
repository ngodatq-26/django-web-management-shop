FROM python:3.9-alpine

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN apk add --no-cache pkgconfig
RUN apk add --no-cache gcc musl-dev
RUN apk add --no-cache mariadb-dev

RUN python -m venv venv
ENV VIRTUAL_ENV /app/venv
ENV PATH "$VIRTUAL_ENV/bin:$PATH"

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

