

[English ](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/blob/master/README.md) | 中文

# 介绍

本项目是基于`Clover`为`Dell XPS 9570 8750H 4K`笔记本构建的黑苹果配置， 理论上支持`macOS 10.14.X - Mac OS 10.15.X`。该配置整合常用的原生声卡驱动、显卡驱动、4K显示器驱动、摄像头驱动，支持 `HDMI 2.0` 与 `DisplaryPort via Type C` 双屏`4K@60Hz`输出，支持冷启动的雷电3设备，驱动无线网卡DW1830以支持Wifi、AirDrop等无线网络传输功能，支持仿白苹果的触控手势，睡眠唤醒基本正常。


# 环境
##  硬件
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
- [x] Killer 1535
- [ ] Goodix fingerpint reader
- [ ] Nvidia Geforce 1050Ti


## 软件
- [x] BIOS: `1.5.0 - 1.11.2`
- [x] macOS Mojave: `10.14.0 - 10.14.6`
- [x] macOS Catalina: `10.15.0 - 10.15.5`

# 使用方法
[Kevin Shroff](https://github.com/kevinshroff)为我们带来了非常棒的[安装流程](https://www.youtube.com/watch?v=h22MJD8C1r8&t=823s)。在开始安装前，我们需要了解的是：
 ## 配置文件介绍

### `config_install.plist`

这是安装阶段使用的配置文件，目的是注入一个错误的`ig-platform-id = 0x12345678`，禁用核显，从而能使系统进行桌面完成安装。

### `config.plist`

本文件用于`XPS 9570 8750H 4K`机型，以下子项为系统注入正确的核显平台，启动核显加速：

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


  与 `config_install.plist` 的不同点在于，这里我们注入了正确的核显平台id `ig-platform-id = 0x3e9b0000`。
  
  另外，以下字段修正 `XPS 9570 8750H 4K` 机型的最大链路速率：
  
  `dpcd-max-link-rate` = `<14000000>`

### `config_1080P.plist`

 本文件用于`XPS 9570 8750H 1080P`机型，与`config.plist`的不同仅在于：
  
   `dpcd-max-link-rate` = `<0A000000>`

## 安装

### 1. 替换安装卷EFI


将USB介质EFI分区自带的Clover文件夹删除，替换为本仓库的Clover

### 2. 完成安装

使用 `config_install.plist`配置进入安装界面完成安装；如果出现安装失败等问题，可以多次进入安装界面（3~5次）

### 3. 重建缓存

进入桌面后，从终端运行`sudo kextcache -i /`，重建缓存

### 4. 使用 `config.plist(for 4k)`


若机器是4k版本，直接使用`config.plist`。否则，使用`config_1080P.plist`


### 5. 将部分驱动安装至`L/E`或者`S/L/E`（可选）

建议仅保留在将`CLOVE/kexts/Other`中的`VirtualSmc.kext`/ `FakeSMC.kext`，其余驱动安装到`L/E`或者`S/L/E`下，然后把在`CLOVER/kexts/Ohter`路径中已安装的驱动删除。最后，重建缓存重启电脑。
   
## 更新

切换到 `config_install.plist` 完成更新，进入系统后马上运行`sudo kextcache -i /`重建缓存


# 更多内容
  见[问题集锦](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/doc/issues.md)和[更新历史](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/doc/issues.md)


# 声明
因为本人精力有限，仓库维护及时性得不到保证，对此我深感抱歉。目前项目已支持Catalina全版本。

感谢大家一直以来的厚爱，我非常支持大家推广本项目，如果您需要发布此EFI或转载给他人，请务必注明我的仓库出处，以及[bavariancake](https://github.com/bavariancake/XPS9570-macOS)，[Xigtun](https://github.com/Xigtun/xps-9570-mojave)的仓库地址。如果您肯定我的工作，我也很乐意接受一颗来自君子的大写星星哦~~

**请勿用于商业行为！尊重开源与劳动！您的合作与支持是我们持续维护和分享的动力。**

# 鸣谢
* [Apple](https://www.apple.com) for macOS
* [Rehabman](https://github.com/RehabMan)：提供了大量的黑苹果驱动，国外黑苹果论坛的大佬，向大佬致敬！
* [Lilu](https://github.com/acidanthera/Lilu)： 向该内核扩展项目伟大的逆向工程师与开发者致敬！
* [WhateverGreen](https://github.com/acidanthera/WhateverGreen)：感谢所有参与该开源内核扩展项目的伟大开发者！
* [FireWolf](https://github.com/0xFireWolf/)： 提供DPCD最大链路速率修复、Intel HDMI无限循环连接修复、LSPCON驱动支持等通用性开源贡献，为基于UHD630核显的新机型，特别是XPS 9570提供了技术攻坚，非常感谢他！
* [bavariancake](https://github.com/bavariancake/XPS9570-macOS)：提供一份针对XPS 9570 Hackintosh的详尽方案，他的仓库对XPS 9570驱动的每个细节进行了记录，是XPS 9570黑苹果在Github上的开源先驱，为本仓库贡献了大部分配置模板，感谢他的辛勤付出和劳动！
* [Xigtun](https://github.com/Xigtun/xps-9570-mojave)：与bavariancake一样，早期开源了XPS 9570黑苹果配置，本仓库是在其基础上对[bavariancake](https://github.com/bavariancake/XPS9570-macOS)的配置进行深度融合得到的，谢谢这位无私的同仁！
* @807133286 ：最早在Xigtun仓库中提出了可移植的[触控板驱动方案](https://github.com/Xigtun/xps-9570-mojave/issues/23)，给XPS 9570拥有将近白苹果触控板的体验，是改善XPS 9570触控版的灵感来源！
* [远景论坛](http://bbs.pcbeta.com/forum-559-1.html)：谢谢诸位大神提供的通用教程，让我能够以小白的身份轻松入门！
* [黑果小兵](https://blog.daliansky.net/): 我想，国内需要更多这样无私的、高水平的黑苹果布道者，感谢他！
* 感谢所有在仓库上曾提供了非常有意义ISSUE、测试反馈的朋友们，是你们让XPS 9570的黑苹果配置变得原来越好，你们持续的反馈和支持让这个项目变得更有意义！
