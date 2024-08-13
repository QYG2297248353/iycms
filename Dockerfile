FROM alpine:latest
WORKDIR /opt/iycms

RUN apk add --no-cache \
    wget \
    unzip \
    && rm -rf /var/cache/apk/*

RUN wget --no-check-certificate "https://www.iycms.com/api/v1/download/cms/latest?os=1&kind=x86_64" -O iycms.zip \
    && unzip -o -q iycms.zip -d /opt/iycms \
    && chmod +x /opt/iycms/cms

#COPY iycms.zip /opt/iycms/iycms.zip
#RUN unzip -o -q /opt/iycms/iycms.zip -d /opt/iycms && rm -f /opt/iycms/iycms.zip && ls -al /opt/iycms && chmod +x /opt/iycms/cms

EXPOSE 80
EXPOSE 21007

CMD ["./cms"]
