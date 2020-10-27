FROM nginx:latest

WORKDIR /cv
COPY cv.pdf .

RUN apt-get update && apt-get install -y \
    poppler-utils \
    lynx

RUN echo "alias brahim='pdftohtml -stdout -i /cv/cv.pdf | lynx -stdin'" >> ~/.bashrc

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
