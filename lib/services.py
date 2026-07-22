import subprocess


def is_active(service):
    try:
        subprocess.check_output(
            ["systemctl", "is-active", "--quiet", service]
        )
        return "🟢"
    except subprocess.CalledProcessError:
        return "🔴"


def internet():
    try:
        subprocess.check_output(
            ["ping", "-c", "1", "-W", "1", "8.8.8.8"]
        )
        return "🟢"
    except:
        return "🔴"
