FROM google/golang:stable
EXPOSE 8080


WORKDIR /gopath/src/coreos-china.org
ADD . /gopath/src/coreos-china.org/

RUN go get -u github.com/astaxie/beego
RUN go get -u github.com/magiconair/properties
RUN go get -u github.com/russross/blackfriday

RUN mkdir -p /conf/
RUN cp -r /gopath/src/coreos-china.org/conf/* /conf/

RUN go get coreos-china.org


CMD ["/gopath/bin/coreos-china.org"]

#
# build:  docker build -t yuanxiaolong/coreos-china .
# run:    docker run -d -e VIRTUAL_HOST=www.yuanxiaolong.cn yuanxiaolong/coreos-china
#
