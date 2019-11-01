#include "esp_log.h"

void app_main() {
    ESP_LOGI("C Main",
             "You should not get here. Eiher the linker is broken,\n"
             "or you flashed the wrong code..");
}
