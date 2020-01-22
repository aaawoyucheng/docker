FROM alpine:3.8
ENV LANG=C.UTF-8 \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/jre \
    PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin \
    TZ=Asia/Shanghai
RUN  > /etc/apk/repositories \
&& echo "https://mirrors.aliyun.com/alpine/v3.8/main/" >> /etc/apk/repositories \
&& echo "https://mirrors.aliyun.com/alpine/v3.8/community/" >> /etc/apk/repositories \
&& apk update && apk add --no-cache openjdk8-jre ca-certificates tzdata tini \
&& apk add --update procps \
&& rm -rf /var/cache/apk/* \
&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apk add --no-cache ttf-dejavu \
&& rm -rf /var/cache/apk/*
