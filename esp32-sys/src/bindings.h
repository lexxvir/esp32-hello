#include "driver/uart.h"
#include "driver/gpio.h"
#include "esp_log.h"


/* Manual defines because the macros are too complex to be processed */

/*
 * Original was
 * #define portTICK_PERIOD_MS ( ( TickType_t ) 1000 / configTICK_RATE_HZ )
 */
#undef portTICK_PERIOD_MS
#define portTICK_PERIOD_MS 1000 / configTICK_RATE_HZ
