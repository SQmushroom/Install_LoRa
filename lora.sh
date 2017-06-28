#!/bin/bash
ROOT_DIR="/home/pi/"
before_reboot()
{
	sudo mkdir myupdate
	
	sudo apt-get update
	sudo apt-get -y install vim git wiringpi && echo "Installed"

	printf "Please modify config.txt and cmdline.txt first!\n"
	sudo nano /boot/config.txt

	printf "Please update network config"
	sudo nano /etc/network/interfaces

	sudo rpi-update
	sudo apt-get upgrade
	
	sudo reboot
}

after_reboot()
{
	#printf "Please enable SPI in /boot/config.txt and set ensure the line 'dtparam=spi=on' isn't commented out"
	
	printf "Please modify /boot/config.txt"
	sudo nano /boot/config.txt
	
	printf "Please rm line "
	sudo nano /boot/cmdline.txt
	
	wget http://www.cooking-hacks.com/media/cooking/images/documentation/raspberry_arduino_shield/raspberrypi2.zip && unzip raspberrypi2.zip && cd cooking/arduPi && chmod +x install_arduPi && ./install_arduPi && rm install_arduPi && cd ../..

	wget http://www.cooking-hacks.com/media/cooking/images/documentation/tutorial_kit_lorawan/arduPi_api_LoRaWAN_v1_2.zip && unzip -u arduPi_api_LoRaWAN_v1_2.zip && cd cooking/examples/LoRaWAN && chmod +x cook.sh && cd ../../..
	
	cd $ROOT_DIR
	sudo rm -rf myupdate
}

if [ -d "myupdate" ]; then
	after_reboot
else
	before_reboot
fi
