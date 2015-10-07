# Nephology
noun \[nɪˈfɒlədʒɪ\]

1. The branch of meteorology that deals with clouds.
2. A system for building and deploying clouds.

Nephology is a flexible bare-metal provisioning system. It is designed to take newly racked hardware from an unknown state all the way through hardware configuration and finally booting an operating system with an (optional) configuration management client installed.  The idea is to take new hardware provisioning time down from hours to minutes.

Unlike other systems, Nepholoy does not dictate which OS or configuration management tools you need to install.  You can even use Nephology to perform initial hardware configuration tasks, verify physical requirements, and then pass off to a third-party netboot installer (like XenServer or WDS).

## Features

* Template based configuration
* Modular Design (bring your own external tools or use ones already built in)
* Scriptable client and server
* OS Independent
* Configuration Management system independent (including no CM)
* Configutation of BIOS settings (on supported platforms)
* Configuration of RAID controllers
* Configuration of IPMI/DRAC/iLO controllers
* Firmware management (of supported devices)
* Detection, reporting, and optional configuration of network connections
* Support for a rescue mode in order to resolve issues in the same environment as the installer

## Requirements

Offical cookbook for deployment can be found here https://github.com/dreamhost/nephology-cookbook


## Status

This project is under active development, and currently in use at DreamHost for deployment of our systems.
