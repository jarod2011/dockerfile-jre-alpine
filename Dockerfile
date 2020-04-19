FROM alpine:3.10
LABEL maintainer="xinghen249@gmail.com"

ENV LANG=C.UTF-8 \
    JAVA_HOME=/usr/lib/jvm/java-11-openjdk/jre \
    PATH=$PATH:/usr/lib/jvm/java-11-openjdk/jre/bin:/usr/lib/jvm/java-11-openjdk/bin \
    TZ=Asia/Shanghai
RUN echo "" > /etc/apk/repositories \
&& echo "https://mirrors.aliyun.com/alpine/v3.10/main/" >> /etc/apk/repositories \
&& echo "https://mirrors.aliyun.com/alpine/v3.10/community/" >> /etc/apk/repositories \
&& apk update && apk add --no-cache openjdk11-jre-headless tzdata ttf-dejavu tini \
&& rm -rf /var/cache/apk/* \
&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone