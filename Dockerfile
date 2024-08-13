# 使用 Alpine 作为基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /app/iycms

# 安装必要的工具
RUN apk add --no-cache \
    wget \
    unzip \
    && rm -rf /var/cache/apk/*

# 下载并解压爱影CMS最新版本
RUN wget --no-check-certificate "https://www.iycms.com/api/v1/download/cms/latest?os=1&kind=x86_64" -O iycms.zip \
    && unzip -o -q iycms.zip -d /app/iycms \
    && rm -f iycms.zip \
    && ls -al /app/iycms \
    && chmod +x /app/iycms/cms

# 使用本地文件而不是wget下载
#COPY iycms.zip /app/iycms/iycms.zip
#RUN unzip -o -q /app/iycms/iycms.zip -d /app/iycms && rm -f /app/iycms/iycms.zip && ls -al /app/iycms && chmod +x /app/iycms/cms

# 设置挂载点
VOLUME ["/app/iycms"]

# 暴露必要的端口
EXPOSE 80
EXPOSE 21007

# 启动服务
CMD ["/app/iycms/cms"]
