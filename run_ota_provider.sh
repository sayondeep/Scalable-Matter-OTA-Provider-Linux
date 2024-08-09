CID=$(cat /proc/self/mountinfo | grep -m1 -oE '/([a-f0-9]+)/hostname /etc/hostname' | cut -d ' ' -f 1 | xargs dirname | xargs basename)

DOCKERINFO=$(curl -s --unix-socket /run/docker.sock http:/v1.46/containers/$CID/json)

ID=$(python3 -c "import sys, json; print(json.loads(sys.argv[1])[\"Name\"].split(\"_\")[-1])" "$DOCKERINFO")

echo "This is node $ID"

INSTANCE_ID=$(echo "$ID" | grep -oE '[0-9]+$')

echo $INSTANCE_ID

export INSTANCE_ID=$INSTANCE_ID

# /app/chip-ota-provider-app --discriminator 23 --passcode 20202023 --filepath /app/ota-firmware.bin
python3 /app/ota_provider.py