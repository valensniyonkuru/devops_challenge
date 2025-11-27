#!/usr/bin/env bash

echo "Starting environment setup..."

# --- Create directories with checks ---
for dir in logs configs scripts; do
    if [ -d "$dir" ]; then
        echo "Directory already exists: $dir"
    else
        mkdir -p "$dir"
        echo "Created directory: $dir"
    fi
done

# --- Create files with checks ---
if [ -f logs/system.log ]; then
    echo "File already exists: logs/system.log"
else
    echo "Sample log entry" > logs/system.log
    echo "Created file: logs/system.log"
fi

if [ -f configs/app.conf ]; then
    echo "File already exists: configs/app.conf"
else
    echo "app_name=my_app" > configs/app.conf
    echo "Created file: configs/app.conf"
fi

if [ -f scripts/backup.sh ]; then
    echo "File already exists: scripts/backup.sh"
else
    echo "#!/usr/bin/env bash" > scripts/backup.sh
    echo "echo Backup started..." >> scripts/backup.sh
    echo "Created file: scripts/backup.sh"
fi

# --- Set permissions ---
chmod 644 logs/system.log
chmod 444 configs/app.conf
chmod 755 scripts/backup.sh

echo "Permissions updated!"

# --- Display structure ---
echo
echo "Directory structure:"
tree .

echo
echo "Permissions overview:"
ls -lR .

echo
echo "Setup complete!"

