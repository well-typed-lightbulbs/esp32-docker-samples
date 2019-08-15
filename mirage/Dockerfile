FROM ubuntu:16.04
RUN mkdir /esp ; apt-get update && apt-get install -y gcc-multilib git build-essential wget libncurses-dev flex bison gperf python python-serial texinfo opam
RUN opam init -a --compiler=4.06.0+32bit
RUN opam repo add esp https://github.com/well-typed-lightbulbs/opam-cross-esp32.git
RUN opam install mirage.3.0.8a+esp32 ocaml-esp32 -y
RUN git clone https://github.com/well-typed-lightbulbs/mirage-esp32-samples /esp/mirage
WORKDIR /esp/mirage/hello_world
RUN opam update esp
RUN opam config exec -- mirage config -t esp32
RUN apt-get install -y pkg-config
RUN make depends
COPY sdkconfig _build-esp32/sdkconfig
RUN opam config exec -- mirage build
