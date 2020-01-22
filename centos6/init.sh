#配置yum源
rm -rf /etc/yum.repos.d/*
cat << EOF >/etc/yum.repos.d/CentOS-Base.repo
[base]
name=CentOS-$releasever - Base
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/$releasever/os/\$basearch/
        https://mirrors.163.com/centos/$releasever/os/\$basearch/
        https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/os/\$basearch/
        https://mirrors.huaweicloud.com/centos/$releasever/os/\$basearch/
        https://mirrors-tj-internal.unicloudsrv.com/centos/$releasever/os/\$basearch/
gpgcheck=0
 
#released updates 
[updates]
name=CentOS-$releasever - Updates
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/$releasever/updates/\$basearch/
        https://mirrors.163.com/centos/$releasever/updates/\$basearch/
        https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/updates/\$basearch/
        https://mirrors.huaweicloud.com/centos/$releasever/updates/\$basearch/
        https://mirrors-tj-internal.unicloudsrv.com/centos/$releasever/updates/\$basearch/
gpgcheck=0
 
#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/$releasever/extras/\$basearch/
        https://mirrors.163.com/centos/$releasever/extras/\$basearch/
        https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/extras/\$basearch/
        https://mirrors.huaweicloud.com/centos/$releasever/extras/\$basearch/
        https://mirrors-tj-internal.unicloudsrv.com/centos/$releasever/extras/\$basearch/
gpgcheck=0
 
#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/$releasever/centosplus/\$basearch/
        https://mirrors.163.com/centos/$releasever/centosplus/\$basearch/
        https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/centosplus/\$basearch/
        https://mirrors.huaweicloud.com/centos/$releasever/centosplus/\$basearch/
        https://mirrors-tj-internal.unicloudsrv.com/centos/$releasever/centosplus/\$basearch/
gpgcheck=0
enabled=0
 
#contrib - packages by Centos Users
[contrib]
name=CentOS-$releasever - Contrib
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/$releasever/contrib/\$basearch/
        https://mirrors.163.com/centos/$releasever/contrib/\$basearch/
        https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/contrib/\$basearch/
        https://mirrors.huaweicloud.com/centos/$releasever/contrib/\$basearch/
        https://mirrors-tj-internal.unicloudsrv.com/centos/$releasever/contrib/\$basearch/
gpgcheck=0
enabled=0
EOF

cat << EOF >/etc/yum.repos.d/epel.repo
[epel]
name=Extra Packages for Enterprise Linux $releasever - \$basearch
baseurl=https://mirrors.aliyun.com/epel/$releasever/\$basearch
        https://mirrors.huaweicloud.com/epel/$releasever/\$basearch
        https://mirrors-tj-internal.unicloudsrv.com/epel/$releasever/\$basearch
        https://mirrors.tuna.tsinghua.edu.cn/epel/$releasever/\$basearch
failovermethod=priority
enabled=1
gpgcheck=0
EOF
cat /etc/yum.repos.d/*
mkdir -p  ~/.pip/
cat << EOF > ~/.pip/pip.conf 
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
[install]
trusted-host=tuna.tsinghua.edu.cn
EOF
