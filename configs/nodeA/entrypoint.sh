#!/bin/sh
ip route add 192.168.12.0/24 via 192.168.11.1
python /app/app.py
