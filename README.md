# Install_LoRa

disable_overscan=1
hdmi_force_hotplug=1

auto wlan0
iface lo inet loopback
iface eth0 inet dhcp
allow-hotplug wlan0
iface wlan0 inet static
address 192.168.0.195 # Your IP
netmask 255.255.255.0 # Your netmask
gateway 192.168.0.1 # Your gateway
wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
iface default inet dhcp

#map mini-UART to internal bluetooth an free-up main UART to handle
CookingHacks modules
dtoverlay=pi3-miniuart-bt
#enable uart interface
enable_uart=1
#enable spi interface
dtparam=spi=on
#enable i2c interface
dtparam=i2c_arm=on

