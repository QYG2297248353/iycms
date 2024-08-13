FROM ubuntu:latest

WORKDIR /opt/iycms

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate "https://www.iycms.com/api/v1/download/cms/latest?os=1&kind=x86_64" -O iycms.zip \
    && unzip -o -q iycms.zip -d /opt/iycms \
    && rm -f iycms.zip

VOLUME ["/app/iycms"]

EXPOSE 80
EXPOSE 21007

CMD ["/bin/sh", "-c", "\
    if [ ! -f \"/app/iycms/cms\" ]; then \
        cp -r /opt/iycms/* /app/iycms/; \
    fi; \
    chmod +x /app/iycms/cms; \
    /app/iycms/cms"]
