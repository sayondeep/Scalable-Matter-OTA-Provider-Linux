# Scaleable-Matter-OTA-Provider
Dockerized chip-ota-provider-app to run multiple instances simultaneously.

## Usage

1. Replace ota-firmware.bin with your firmware.
1. Change/Add the onboarding codes and secured-device-port for different instances of ota-provider (Optional).
1. Run multiple instances of ota-provider using:

    `docker compose up --scale chip-ota-provider=5`

