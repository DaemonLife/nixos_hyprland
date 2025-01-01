#!/usr/bin/env fish

set MOUNT_POINT "/mnt/windows"
set WINDOWS_PARTITION "/dev/nvme0n1p3"
set USER_DIR "Users/user"

function is_mounted
    # Проверяем, смонтирован ли раздел
    set mounted_partitions (mount | grep "$MOUNT_POINT")
    if test -n "$mounted_partitions"
        return 0  # Раздел смонтирован
    else
        return 1  # Раздел не смонтирован
    end
end

function mount_windows
    echo "Mounting Windows filesystem..."
    sudo mount "$WINDOWS_PARTITION" "$MOUNT_POINT" -t ntfs
    if test $status -eq 0
        echo "> Mounting done"
    else
        echo "> Failed to mount Windows filesystem"
        exit 1
    end
end

# Проверяем, смонтирован ли раздел
if not is_mounted
    mount_windows
end

# Переход в директорию пользователя Windows
set target_dir "$MOUNT_POINT/$USER_DIR"
cd "$target_dir"
if test $status -ne 0
    echo "> Failed to change directory to $MOUNT_POINT/$USER_DIR"
    exit 1
end
