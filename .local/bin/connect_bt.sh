#!/bin/sh

. "$HOME/.bash_profile"

#Conectar ao dispositivo
bluetoothctl << EOF
power on
connect $BT_DEVICE_MAC
EOF

#Delay para dar tempo de conectar
sleep 2

#Info do dispositivo
DEVICE_INFO=$(bluetoothctl info "$BT_DEVICE_MAC")

#Extrair nome da info
DEVICE_NAME=$(echo "$DEVICE_INFO" | grep "Name:" | cut -d ' ' -f2-)

#Checar o status da conexão
if echo "$DEVICE_INFO" | grep -q "Connected: yes"; then
	notify-send "Bluetooth" "Connected to $DEVICE_NAME"
else
	notify-send "Bluetooth" "Failed to connect to $DEVICE_NAME"
fi
