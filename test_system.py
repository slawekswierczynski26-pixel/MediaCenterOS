from lib.system_info import *

print("===== MEDIA CENTER OS =====")
print()

print("Host      :", get_hostname())
print("IP        :", get_ip())

disk = get_disk()
print("Dysk      :", f"{disk['used']} GB / {disk['total']} GB")

ram = get_ram()
print("RAM       :", f"{ram['used']} GB / {ram['total']} GB")

print("CPU Load  :", get_cpu())
