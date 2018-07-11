# Docker scripts to build minimal applications on ESP32

Watch out: you have to update the `CONFIG_ESPTOOLPY_PORT` value according to your ESP32 serial port.
For standard ESP32 chips it's `/dev/ttyUSB0` and for WROVER kits it's `/dev/ttyUSB1`.

## For C or OCaml sample:

* Choose the sample that you want to build: 
  - Minimal C: `docker build -t esp32 c`
  - Minimal OCaml: `docker build -t esp32 ocaml`
* `docker run -t --device=/dev/ttyUSB0 -i esp32 make flash monitor`

## For Mirage sample:

* `docker build -t esp32 mirage`
* `docker run -t --device=/dev/ttyUSB0 -i esp32 opam config exec -- make flash monitor`


