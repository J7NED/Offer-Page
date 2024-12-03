#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp _app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempir/Dockerfile
echo "COPY ./static /webapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /webapp/templates/" >> tempdir/Dockerfile
echo "COPY app.py /webapp/" >> tempdir/Dockerfile
echo "EXPOSE 5000" >> tempdir/Dockerfile
echo "CMD python /webapp.app.py" >> tempdir/Dockerfile

cd tempdir 
sudo docker build -t webapp .
sudo docker run -t -d -p 5000:5000 --name samplerunning webapp 
sudo docker ps -a
