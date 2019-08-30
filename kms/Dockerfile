from centos:centos6
RUN rm -rf /etc/yum.repos.d/*
RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
RUN curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
RUN sed -i '/aliyuncs/d ' /etc/yum.repos.d/CentOS-Base.repo
RUN sed -i '/aliyuncs/d ' /etc/yum.repos.d/epel.repo
RUN sed -i '/gpgcheck/c gpgcheck=0 ' /etc/yum.repos.d/CentOS-Base.repo
RUN sed -i '/gpgcheck/c gpgcheck=0 ' /etc/yum.repos.d/epel.repo
RUN yum makecache
RUN yum install -y wget
RUN curl -O -L https://github.com/teddysun/across/raw/master/kms.sh && chmod +x kms.sh && ./kms.sh
ADD entrypoint.sh /etc/init.d/
RUN chmod a+x /etc/init.d/entrypoint.sh
ENTRYPOINT /etc/init.d/entrypoint.sh
