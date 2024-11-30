#!/usr/bin/env bash

# Define variables
MOUNT_POINT="/mnt/windows"
WINDOWS_PARTITION="/dev/nvme0n1p3"
USER_DIR="Users/user"

# Function to mount Windows filesystem
mount_windows() {
    echo "Mounting Windows filesystem..."
    sudo mount "$WINDOWS_PARTITION" "$MOUNT_POINT" -t ntfs
    if [ $? -eq 0 ]; then
        echo "> Mounting done"
    else
        echo "> Failed to mount Windows filesystem"
        exit 1
    fi
}

# Change to Windows user directory
cd "$MOUNT_POINT/$USER_DIR" 2>/dev/null || {
    mount_windows
    cd "$MOUNT_POINT/$USER_DIR" || {
        echo "> Failed to change directory to $MOUNT_POINT/$USER_DIR"
        exit 1
    }
}
