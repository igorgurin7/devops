#!/bin/bash

LOG_FILE="script.log"

log() {
    echo "$1" | tee -a "$LOG_FILE"
}

if [ "$1" = "-d" ]; then
    BASE_DIR="$2"
else
    read -p "Введите путь: " BASE_DIR
fi

groupadd dev 2>/dev/null

log "Группа dev создана"

echo "%dev ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dev
chmod 440 /etc/sudoers.d/dev

while read line; do
    user=$(echo "$line" | cut -d: -f1)
    uid=$(echo "$line" | cut -d: -f3)

    if [ "$uid" -ge 1000 ] && [ "$user" != "nobody" ]; then

        usermod -aG dev "$user"

        log "Пользователь $user добавлен в группу dev"

        USER_DIR="$BASE_DIR/${user}_workdir"
        mkdir -p "$USER_DIR"

        chown "$user:$user" "$USER_DIR"
        chmod 660 "$USER_DIR"

        setfacl -m g:dev:r "$USER_DIR"

        log "Создано: $USER_DIR"

    fi
done < /etc/passwd