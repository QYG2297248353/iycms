FROM ubuntu:latest

WORKDIR /app/iycms

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate "https://www.iycms.com/api/v1/download/cms/latest?os=1&kind=x86_64" -O iycms.zip \
    && unzip -o -q iycms.zip -d /app/iycms \
    && rm -f iycms.zip \
    && chmod +x /app/iycms/cms

VOLUME ["/app/iycms/data", "/app/iycms/config.conf"]

EXPOSE 80
EXPOSE 21007

CMD ["/app/iycms/cms"]
