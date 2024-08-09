import os
import csv
import subprocess

# Function to read discriminator and passcode based on instance ID
def get_discriminator_and_passcode(csv_file, instance_id):
    with open(csv_file, newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            if row['instance_id'] == instance_id:  # Match the instance ID directly
                return row['discriminator'], row['passcode'], row['port']
    return None, None, None

# Read the instance ID from the environment variable
instance_id = os.getenv('INSTANCE_ID')

if instance_id is None:
    print("INSTANCE_ID environment variable is not set.")
else:
    # CSV file path
    csv_file = '/app/onb_codes.csv'

    # Get the discriminator and passcode
    discriminator, passcode, port = get_discriminator_and_passcode(csv_file, instance_id)

    if discriminator and passcode:
        # Command to run
        command = f"/app/chip-ota-provider-app --discriminator {discriminator} --passcode {passcode} --secured-device-port {port} --filepath /app/ota-firmware.bin"

        # Execute the command
        subprocess.run(command, shell=True)
    else:
        print(f"No matching data found for instance ID {instance_id}")
