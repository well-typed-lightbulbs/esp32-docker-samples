FROM ubuntu:16.04
RUN mkdir /esp ; apt-get update && apt-get install -y gcc-multilib git build-essential wget libncurses-dev flex bison gperf python python-serial texinfo opam
RUN cd /tmp && wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && cd /esp && tar -xzf /tmp/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && rm /tmp/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN cd /esp && git clone --recursive https://github.com/TheLortex/esp-idf.git
ENV PATH "$PATH:/esp/xtensa-esp32-elf/bin"
ENV IDF_PATH "/esp/esp-idf"
RUN opam init -a --compiler=4.06.0+32bit
RUN git clone https://github.com/TheLortex/ocaml-esp32.git /esp/ocaml-esp32
WORKDIR /esp/ocaml-esp32
RUN git checkout 4.06-esp32+lto
RUN opam config exec -- ./configure -target xtensa-esp32-elf -lto -flambda -target-bindir /esp/ocaml-esp32/bin -prefix /esp/ocaml-esp32
RUN opam config exec -- make world-cross -j
RUN opam config exec -- make install-cross
COPY ./ /esp/sample/
WORKDIR /esp/sample/
RUN opam config exec -- ocamlrun /esp/ocaml-esp32/bin/ocamlopt hello_caml.ml -output-complete-obj -o main/main.o
RUN make -j
