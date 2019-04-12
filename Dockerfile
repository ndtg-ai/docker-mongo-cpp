FROM ntuangiang/cpp:latest

RUN apt-get update \
    && apt-get install -y python libmongoc-1.0-0

RUN git clone https://github.com/mongodb/mongo-c-driver.git

RUN cd mongo-c-driver \
    && python build/calc_release_version.py > VERSION_CURRENT \
    && mkdir cmake-build && cd cmake-build \
    && cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. \
    && make && make install

RUN git clone https://github.com/mongodb/mongo-cxx-driver.git \
        --branch releases/stable --depth 1

RUN cd mongo-cxx-driver/build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local .. \
    && make EP_mnmlstc_core && make && make install