#!/usr/bin/env python3

import socket
import shutil
import subprocess


def get_hostname():
    return socket.gethostname()


def get_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
        return ip
    except Exception:
        return "Brak"


def get_disk():
    total, used, free = shutil.disk_usage("/")
    return {
        "used": round(used / (1024**3), 1),
        "total": round(total / (1024**3), 1),
        "free": round(free / (1024**3), 1),
    }


def get_ram():
    with open("/proc/meminfo") as f:
        data = {}
        for line in f:
            key, value = line.split(":")
            data[key] = int(value.split()[0])

    total = data["MemTotal"] / 1024 / 1024
    free = data["MemAvailable"] / 1024 / 1024
    used = total - free

    return {
        "used": round(used, 1),
        "total": round(total, 1),
    }


def get_cpu():
    return subprocess.check_output(
        "cut -d ' ' -f1 /proc/loadavg",
        shell=True,
        text=True
    ).strip()


def get_temperature():
    try:
        output = subprocess.check_output(
            ["sensors"],
            text=True
        )

        for line in output.splitlines():
            if line.startswith("temp1:") or "temp1:" in line:
                return line.split()[1]

        return "--"

    except Exception:
        return "--"
