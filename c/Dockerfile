FROM ubuntu:16.04
RUN mkdir /esp ; apt-get update && apt-get install -y git build-essential wget libncurses-dev flex bison gperf python python-serial texinfo opam
RUN cd /tmp && wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && cd /esp && tar -xzf /tmp/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && rm /tmp/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN cd /esp && git clone --recursive https://github.com/well-typed-lightbulbs/esp-idf.git
ENV PATH "$PATH:/esp/xtensa-esp32-elf/bin"
ENV IDF_PATH "/esp/esp-idf"
COPY ./ /esp/sample/
WORKDIR /esp/sample/
RUN make defconfig
RUN make -j
