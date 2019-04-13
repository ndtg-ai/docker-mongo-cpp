FROM ntuangiang/cpp:latest

MAINTAINER Nguyen Tuan Giang "https://github.com/ntuangiang"

RUN apt-get update \
    && apt-get install -y python libmongoc-1.0-0

RUN apt-get install -y pkg-config libssl-dev libsasl2-dev

RUN git clone https://github.com/mongodb/mongo-c-driver.git

RUN cd mongo-c-driver \
    && python build/calc_release_version.py > VERSION_CURRENT \
    && mkdir cmake-build && cd cmake-build \
    && cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. \
    && make && make install

RUN git clone https://github.com/mongodb/mongo-cxx-driver.git \
        --branch releases/stable --depth 1

RUN cd mongo-cxx-driver/build \
    && cmake -DCMAKE_BUILD_TYPE=Release \
       -DCMAKE_INSTALL_PREFIX=/usr/local \
       -DCMAKE_CXX_FLAGS=-DMONGOC_HAVE_SSL=1 .. \
    && make EP_mnmlstc_core && make && make install

RUN rm -rf mongo-c-driver mongo-cxx-driver