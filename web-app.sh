#!/bin/bash

mkdir -p tempdir
mkdir -p tempdir/templates
mkdir -p tempdir/static

cp app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempir/Dockerfile
echo "COPY ./static /webapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /webapp/templates/" >> tempdir/Dockerfile
echo "COPY app.py /webapp/" >> tempdir/Dockerfile
echo "EXPOSE 5000" >> tempdir/Dockerfile
echo "CMD python /webapp/app.py" >> tempdir/Dockerfile


cd tempdir 
docker build -t webapp .
docker run -t -d -p 5000:5000 --name samplerun webapp 
docker ps -a
