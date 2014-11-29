FROM google/golang
EXPOSE 8080

yum -y install git


WORKDIR /gopath/src/coreos-china.org
ADD . /gopath/src/coreos-china.org/

RUN go get -u github.com/astaxie/beego
RUN go get -u github.com/gpmgo/gopm


WORKDIR /gopath/src/coreos-china.org/

RUN cd /gopath/src/coreos-china.org/
RUN git clone git@github.com:CoreOS-China/coreos-china.org.git

RUN gopm build


CMD ["./coreos-china.org"]

#
# build:  docker build -t yuanxiaolong/coreos-china .
# run:    docker run -d -e VIRTUAL_HOST=www.yuanxiaolong.cn yuanxiaolong/coreos-china
#
