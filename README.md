
English | [中文](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/README_CN.md)

# Introduction

***
This hackintosh configuration is built for the Dell XPS 9570 laptop based Clover.It theoretically supports macOS 10.14.X - macOS 10.15.X. It integrates common kexts for almost all devices,such as audio card, intel graphic card, 4K display and so on.It fully supports  dual signals output using 4K@60Hz via HDMI 2.0 and Type C, thunderbolt devices are boot coldly and DW1830 is used to suppot WLAN and Airdop.It also brings original touch gestures like Mac devices, and sleep and wake up are general normal.。

# Tested Environment
***
##  Harware
- [x] Model: Dell XPS 9570
- [x] CPU: Intel Core i7-8750H
- [x] Intel Graphic: UHD630
- [x] Memory: Micron 8ATF1G64HZ-2G6E1 8GB* 2
- [x] Display: 4K Sharp Display
- [x] SSD: PC401 NVMe SK hynix 512GB SSD
- [x] Trackpad: Synaptics SYNA2393
- [x] Audio: Realtek ALC298
- [x] Touchscreen: Wacom WCOM488F
- [x] WLAN + Bluetooth : DW1830
- [ ] Killer 1535
- [ ] Goodix fingerpint reader
- [ ] Nvidia Geforce 1050Ti

## Software
- [x] BIOS: `1.5.0 - 1.11.2`
- [x] macOS Mojave: `10.14.0 - 10.14.6`
- [x] macOS Catalina: `10.15.0 - 10.15.5`

# Tutorial

***
[Kevin Shroff](https://github.com/kevinshroff) brought us awsome [Full Installation Guide](https://www.youtube.com/watch?v=h22MJD8C1r8&t=823s).See it firstly and you should kown as below before installation:
 ## Configuration Plist

***
### `config_install.plist`

This is used for installation phase, the purpose is to inject a incorrect `ig-platform-id = 0x12345678`, and disable graphic card, so that the system can enter desktop after complete installation.

### `config.plist`


This file is used for `XPS 9570 8750H 4K` model. The following sub-item injects the correct graphic platform and enables graphic acceleration.

  * Devices/Properties/PciRoot(0x0)/Pci(0x2,0x0)
    * framebuffer-portcount = <04000000>
    * framebuffer-con1-enable = <01000000>
    * framebuffer-con1-alldata = <01050900 00040000 87010000>
    * framebuffer-con2-enable = <01000000>
    * framebuffer-con2-alldata = <02060900 00040000 87010000>
    * framebuffer-con3-enable = <01000000>
    * framebuffer-con3-alldata = <03040a00 00080000 87010000>
    * enable-hdmi20 = <01000000>
    * enable-lspcon-support = <01000000>
    * framebuffer-con3-has-lspcon = <01000000>
    * framebuffer-con3-preferred-lspcon-mode = <01000000>


  It's different from `config_install.plist` is that the correct `ig-platform-id = 0x3e9b0000` is injected into our system.One the other hand，the maximum link rate of the `XPS 9570 8750H 4K` model is fixed by the following field:  

  `dpcd-max-link-rate` = `<14000000>`

### `config_1080P.plist`

This file is used for `XPS 9570 8750H 1080P` model.The difference from `config.plist` is only that:
  
   `dpcd-max-link-rate` = `<0A000000>`

## Installation

***
### 1. Replace EFI of installation volume

Delete the clover folder from original EFI partition and replace it with the Clover folder of this repository.

### 2. Complete Installation

Use `config_install.plist` to enter installation UI and complete the installation; if there are installation failure problems, try multiple times to enter the installation UI.(3~5 times）

### 3. Rebuild kext cache

Run `sudo kextcache -i /` command in terminal to rebuild kext cache after entering desktop. 

### 4. Use `config.plist(for 4k)`


If your model is 4K, use `config.plist` to enter desktop directly.Otherwise,use `config_1080P.plist` instead.


### 5. Install some drivers into `L/E` or `S/L/E` (optional)


It is recommended to only keep `VirtualSmc.kext`/`FakeSMC.kext` in `CLOVE/kexts/Other`, install the rest of kexts into `L/E` or `S/L/E`. Delete all kexts in `CLOVER/kexts/other` which already are installed.Finally, rebuild kext cache again and restart your computer.

   
## Upgrade

***
Switch back `config_install.plist` to complete upgrade, run `sudo kextcache -i /` to rebuild kext cache immediately after entering destop.


# More contents

***
  see more details from [issues set](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/doc/issues.md) and [update history](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/doc/issues.md)


# Statement

***
I sincerely apologize for my procrastination.But the project is stable enough and has supported full version of Catalina so far.Thank you for all passion and stars.I am strongly support everyone to promote this project. If you need to publish this EFI or reprint it to others, please be sure to indicate my [repo](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave), [bavariancake's repo](https://github.com/bavariancake/XPS9570-macOS) and [Xigtun's repo](https://github.com/Xigtun/xps-9570-mojave).Star me if you really like my contribution for hackintosh community!


# Credits

***

* [Apple](https://www.apple.com) 
* [Rehabman](https://github.com/RehabMan)
* [Lilu](https://github.com/acidanthera/Lilu)
* [WhateverGreen](https://github.com/acidanthera/WhateverGreen)
* [FireWolf](https://github.com/0xFireWolf/)
* [bavariancake](https://github.com/bavariancake/XPS9570-macOS)
* [Xigtun](https://github.com/Xigtun/xps-9570-mojave)
* [远景论坛](http://bbs.pcbeta.com/forum-559-1.html)
* [黑果小兵](https://blog.daliansky.net/)