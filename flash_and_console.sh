#!/bin/bash

source setenv.sh

python \
/home/matt/workspace/esp32/espressif/esp-idf/components/esptool_py/esptool/esptool.py \
  --chip esp32 --port $1 --baud 115200 --before default_reset \
  --after hard_reset write_flash -z --flash_mode dio --flash_freq 40m \
  --flash_size detect 0x10000 \
  $TARGET_DIR/esp32-hello.bin && \
picocom -b 115200 $1
