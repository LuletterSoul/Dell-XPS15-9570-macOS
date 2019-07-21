# 介绍

该项目是使用Clover针对`Dell XPS 9570 8750H 4K`笔记本构建的黑苹果配置文件，目的是能够让`XPS 9570` 在 `Mac OS Mojave 10.14.X`及其以上版本的Hackintosh系统较完美地运行。该配置整合了常用的原生声卡驱动、显卡驱动、4K显示器驱动、摄像头驱动，能够支持热插拔式的 `HDMI 2.0` 与 `DisplaryPort via Type C` 双屏`4K@60Hz`输出，支持冷启动的雷电3设备，能驱动无线网卡DW1830以支持Wifi、AirDrop等无线网络传输功能，支持类似白苹果的触控手势，睡眠唤醒基本正常。

# 硬件配置

## 已驱动

* Machine :Dell XPS 9570
* CPU: Intel i7-8750H
* GPU: UHD630 + Nvidia Gefore 1050Ti(屏蔽)
* RAM: 16GB RAM
* Display: 4K Sharp Display
* SSD: PC401 NVMe SK hynix 512GB SSD
* Audio: Realtek ALC298
* Touchscreen
* WLAN + Bluetooth : DW1830（已更换）

## 未驱动

* Killer 1535 (无解)
* Goodix fingerpint reader (无解)
* Nvidia Geforce 1050Ti (无解，已屏蔽)

# 软件环境

* BIOS: `1.5.0 ~ 1.11.2`
* 系统: `Mac Mojave + Windows 10 1809` 双系统共存
* macOS: `Mojave 10.14 ~  10.14.5`

# 使用方法
  [bavariancake](https://github.com/bavariancake/XPS9570-macOS)在
  `Installation and system updates`一项中介绍了安装Mojave的基本步骤，
  假设您已经完成了USB安装介质制作先备工作，想使用本仓库发布的配置完成黑苹果之旅，那么，您需要先了解以下三个配置文件的作用，清楚在何时切换到适合你机型的配置文件完成驱动。

## 配置文件介绍

### `config_install.plist`

这是在Mojave安装阶段使用的配置文件，目的是注入一个错误的`ig-platform-id = 0x12345678`，禁用核显，从而能使系统进行桌面完成安装。

### `config.plist`

  与 `config_install.plist` 的不同点在于注入了正确的核显平台id `ig-platform-id = 0x3e9b0000`。该配置配合了WEG中@FireWolf提供的UHD630核显修复补丁，驱动4K/1080P内置显示器。
  
  该文件专门用来驱动XPS 9570 4K版本的机型，其中：
  
  `dpcd-max-link-rate` = `<14000000>`

### `confug_1080P.plist`

  该文件专门用来驱动XPS 9570 1080P版本的机型，与`config.plist`的不同仅在：
  
   `dpcd-max-link-rate` = `<0A000000>`

## 使用步骤

如果你已经对Mac OS的安装基础步骤了如指掌，你仅需要知道以上三个文件的使用时刻；否则，请先完成基础学习，并留意每个这三个配置文件在这些步骤中发挥的作用：

* 1.**替换安装卷EFI**：将本仓库的CLOVER文件夹替换掉USB介质EFI分区自带的CLOVER
* 2.**使用 `config_install.plist`**：进入到CLOVER启动界面时，如果您已经了解CLOVER的基础使用方法，您应该能在这个界面将`config_install.plist`切换为要使用的配置文件；否则，因为config.plist是CLOVER默认是使用的配置文件名，你需要将`clover_install.plist`重命名为`config.plist`并替换掉原`config.plist`（注意备份！）后再进入该界面

* 3.**完成初始安装**：选择Mojave安装卷图标，进入安装界面完成安装（请在此之前完成安装基础的学习）如果过程成出现安装失败等问题，可以多次进入安装界面（3~5次）

* 4.**重建缓存**：进入桌面后运行首先从终端运行`sudo kextcache -i /`，重建缓存

* 5.**使用 `config.plist(for 4k)`**：如果你的机器是4k版本，则可以直接使用`config.plist`。否则，见步骤6
  
* 6.**使用 `config_1080p.plist`**：如果你机型是XPS 9570 1080P,将   `config_1080P.plist`重命名为`config.plist`替换原config
* 7.**加入生成三码**：本仓库没有填入默认的三码，如果你想激活Facetime和iMessage，请参考[bavariancake](https://github.com/bavariancake/XPS9570-macOS)提供的激活方案，或者提取白苹果机器中的三码在本机中使用。如果您没有激活需求，那么您可用`Clover Configruator` 编辑 `config.plist`，在`SIMBIOS`一项中，选择机型`MacBookPro15,1`，随机生成一套三码使用。

* 8.**验证UHD630是否已驱动**：如果核显已经驱动，XPS的4K显示屏应该自动开启1080P的HDpi体现清晰视界。关于本机的报告中的显卡一栏应该显示为`Intel UHD Graphics 630 2048 MB`

   9.**将部分驱动加入`L/E`或者`S/L/E`（可选）**:在本仓库配置的基础上，如果您想让驱动注入方式更加接近白苹果，请仿照[完善方案--去除-v模式]()的驱动安装方法，建议仅保留在将`CLOVE/kexts/Other`中的`VirtualSmc`，其余驱动安装到`L/E`或者`S/L/E`下，然后把在`CLOVER/kexts/Ohter`路径中已安装的驱动删除。最后，重建缓存重启电脑。（注意！在每次系统更新后，已安装的驱动缓存会被清空，要重复以上操作。）

# 已知问题

* ~~4K版本高负载下风扇噪声较大，温度较高，电池续航仅为2.5小时~~
* ~~在使用电池时，睡眠唤醒后蓝牙不可用~~
* ~~去掉-v模式后在进入系统时随机重启(见[完善方案--去除-v模式](#compromise))~~
* ~~kernel_task 进程占用一直不低于20%，或超过100%（此类问题见[完善方案--解决kernel_task超高占用](#compromise))~~
* 睡眠有一定几率出现wake sleep transition的内核崩溃
* ~~不能用鼠标和键盘唤醒，只能用电源和开盖唤醒~~
* 雷电三设备不支持热插拔，仅支持冷启动后的半热插拔

# 待测试

* `Mac Catalina 10.15.X`
* 非4k、8750H的机型

# 完善方案

## 安装时显示固态硬盘

  开机进入BIOS，将硬盘模式改为AHCI，在系统安装并驱动完成后切换至原模式。当然，保留AHCI工作也是正常的。

 <span id = "compromise"></span>

## 去除 -v 模式

### 问题描述

 从`CLOVER/kexts/Other`中注入触摸板与屏幕触控驱动，去掉`-v`模式会导致机器随机重启

### 解决方案

 仓库的默认配置保留了`-v`模式，目的有以下两个：

* 在首次系统安装、进入时，方便大家调试和记录错误
* 保留驱动安装位置的自主选择权

如果您想去除`-v`启动参数，让clover的工作模式切换为正常模式，您需要进行以下步骤：

* 使用 `Kext Utility` 将 `/CLOVER/kexts/Other/` 中的 `VoodooI2C.kext`, `VoodooI2CHID.kext`, `VoodooPS2Controller.kext`安装到 `/System/Library/Extensions/` 或者 `/Libary/Extensions`目录下
* 使用`Kext Utility`，或者在终端运行`sudo kextcache -i /`来重建缓存
* 编辑`config.plist`，删除Boot/Boot Arguments中的`-v`参数；
* 删除`/CLOVER/kexts/Other/`三个已安装的驱动

注意，在首次进入系统时，可以先保留`-v`，确保机器能够正常工作后再进行此项优化。

## 解决耳机偶尔无声

### 问题描述 

原生声卡被成功驱动后，插入耳机调到最大音量，却只听到很低的声音，打开系统设置的声音，在输入源的两个选项做切换，耳机音量又恢复正常，关闭系统设置后，过了约2分钟声音再次失效。

### 解决方法

 为ALC298启用一个守护进程。见[ALC298PlugFix](https://github.com/jardenliu/ALC298PlugFix)

## 解决kernel_task超高占用

### 问题描述

 错误的Layout Id可能使AppleALC工作异常，导致内核繁忙，kernel_taskCPU使用率超过100%，详细讨论见[ISSUE #2](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/issues/2)、[ISSUE #8](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/issues/8)，也可能是AppleALC与某些驱动冲突导致的）。
 
 ### 解决方法

 不同机器的ALC298声卡可能需要使用不同Layout Id,本配置默认的Layout Id 为30，据测试，另一些机器可能需要使用72，因此你需要为机器注入合适的Layout-id（30 or 72），可以有以下两种方式：

* ~~DSDT注入：反编译`SSDT-Config` ，将AUDL值设置为`0x48`。如果你想注入Layout-id 72，请下载[SSDT-Config.zip](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/files/3075808/SSDT-Config.zip)，将文件替换到`CLOVER/ACPI/patched`~~
  
* CLOVER注入：因为SSDT-Config影响了Clover的原生注入方式，因此常规注入失效。如果你需要将layout-id更改为72，这里可使用`Clover Configurator`在`config.plist`的`Devices`添加设备`PciRoot(0)/Pci(0x1f,3)`，在对应的`Properties`中添加以下项：
   * `layout-id   72   NUMBER`

 ## 驱动Dell DA300 网卡

 ### 问题描述

  Mojave不具备Realtek 8153网卡驱动，如果想通过DA300接入以太网，则端口会收不到对应的网络数据包
### 解决方法

需安装额外驱动，详细讨论见[ISSUE #23](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/issues/23).  

## 为CPU生成变频信息
  [one-key-cpufriend](https://github.com/stevezhengshiqi/one-key-cpufriend)一键在桌面生成`CPUFriendDataProvider.kext`,  `CPUFriendDataProvider.kext`，然后将这两个驱动移动到`/CLOVER/kexts/Other/`或安装到`L/E`，`S/L/E`

## 雷电3设备热插拔

### 问题描述

雷电设备热插拔后工作不正常，讨论见[ISSUE #4](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/issues/4)。

### 解决方法

使用仓库内基于SSDT的半雷电3补丁后，执行以下步骤：

* 重启进入BIOS 将 `BIOS assist enumeration` 设为 `enabled`
* 将BIOS雷电接口相关设置都设为开放式，让雷电接口的访问权限设为最低
* 从Dell官网下载最新的Thunderbolt固件更新并安装
* 在 `Windows` 系统下连接雷电设备，连接权限设为设为 `Always allow`
* 在系统启动前，连接雷电3设备，然后进入`Mac Mojave` 测试热插拔，检验其是否工作正常

## 解决DW1830睡眠唤醒后不可用

### 问题描述

在使用电池时，让系统睡眠进入睡眠状态，再次唤醒后约1分钟，蓝牙状态不可用

### 解决方法

从机器中拆下DW1830，用遮盖物(如胶布、双面胶)屏蔽网卡 `Pin 56` 与 `Pin 54` 针脚，见[jaymonkey](https://www.tonymacx86.com/threads/bluetooth-randomly-not-available-after-sleep.266255/post-1862126)提供的方法


  ![屏蔽针脚](https://www.tonymacx86.com/attachments/bcmwifi-jpg.368795)

<!-- # 关于本机
![关于本机](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/blob/master/screenshots/about_my_machine.png)
![Nvme固态硬盘](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/NVME.png)
![集显](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/Graphic.png)
![双显示器输出](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/dual_displays.png)
![输出细节](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/dual_displays_details.png)
![触控板](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/trackpad.png)
![USB3.1](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/USB3.1.png)
![电池](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/Battery.png)
![DW1830蓝牙](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/DW1830%20Bluetooth.png)
![DW1830 Wifi](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/DW1830%20Wifi.png)
![原生管理](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/Extention.png)
![变频](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/Intel%20Turbo%20Boost.png)
 -->
# 更新历史

## 2019年7月21日

**注意：该版本基于 `BIOS 1.11.2`更新，升级前建议将BIOS升级到该版本**

* 用 `SSDT-I2C.xml` 热补丁启用触摸板的 [GPIO Pinning](https://voodooi2c.github.io/#GPIO%20Pinning/GPIO%20Pinning) 中断模式
* 修复了触摸板“双击以拖拽”失效的BUG
* 新增基于`BIOS 1.11.2`提取的反编译DSDT文件
* 用 `SSDT-PTWAKE.aml` 调用深层方法屏蔽独显
* 用 `SSDT-DMAC.aml` 注入系统默认搜索的DMA控制器信息
* 用 `SSDT-UPRW.am` 修复USB潜在的 `Instant wake`
* 通过屏蔽 `Pin 54 Pin 56` 解决DW1830睡眠唤醒后不可用的BUG，感谢    [jaymonkey](https://www.tonymacx86.com/threads/bluetooth-randomly-not-available-after-sleep.266255/post-1862126) 提供的方案
* 使用Clover 注入 layout-id 30(**注意：SSDT注入方式已弃用**)
* 更新至 `Luli 1.3.7`
* 加入 `HibernationFixup.kext` 避免休眠后无法唤醒问题

## 2019年7月6日

* 新增雷电接口3半热插拔SSDT补丁，以便进行广泛性测试，来自[ISSUE #4 @andresandiah](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/issues/4#issuecomment-506429102)，感谢他！
* 更新至WEG 1.3.X，修复了LPSCON驱动状态获取错误的问题

## 2019年7月5日

* 更新至 10.14.5(18F203)
* 更新至 BIOS 1.11.2(使用这个版本的XPS变得安静一些了，建议更新测试)
* 更新至 Clover 4979
* 用VirtualSmc替换FakeSmc，电量显示更精确
* 修复了非啰嗦模式进入系统时两阶段苹果Logo尺寸不一致的问题
* 修复`HDMI 2.0 4k@60Hz 1080P hDpi`模式在唤醒后失效的问题
* [@FireWolf更新](https://github.com/acidanthera/WhateverGreen/pull/24)：这个PR加入了针对LPSCON适配器的驱动，通过将该适配器的工作模式设为Protocol Converter Mode，使DP信号转化为HDMI 2.0信号，从而使UHD630支持4k@60Hz输出（再次顿首叩谢大佬FireWolf！）
* 测试情况：使用官方的WEG 1.3.0，将显示器的工作模式设置为在4k@60hz<-->1080P@60hz hDPi，首次进入系统后HDMI 2.0支持热插拔，但睡眠唤醒显示器无信号。用RDM将工作模式调节为4k@60hz <--> 1080@30hz hDpi，显示器被点亮
* 实验结果：在首次进入系统时，官方WEG提供的LPSCON驱动虽然最大化了HDMI2.0端口传输速率（通过将LPSCON的工作模式置为PCON），但在机器睡眠唤醒后，LPSCON的寄存器信息被重置为初始值，WEG没有在唤醒后继续更新LPSCON的工作模式
* 解决方法：修改内核扩展源码，删除LPSCON驱动仅进行一次初始化的逻辑，在每次系统进入、唤醒、重启后，使内核都创建一个LPSCON Driver实例，本机成功修复了上述问题，需要更多后续测试和反馈
* 在  `devices/Properties/PciRoot(0x0)/Pci(0x2,0x0)`  中加入新的启动参数以激活LPSCON驱动，详情见[WEG使用手册](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.cn.md)。
  * `enable-lspcon-support` = `<01000000>`
  * `framebuffer-con2-has-lspcon` = `<01000000>`
  * `framebuffer-conX-preferred-lspcon-mode` = `<01000000>`
  * 使用新方法驱动`4k/1080P`内置显示屏

    移除Clover `Kernel and Kext Patches` 的下的内核补丁，改用 `Devices/Properties`注入：

    `enable-dpcd-max-link-rate-fix` = `<01000000>`

    `dpcd-max-link-rate` = `<1400000>` (1080P为`<0A000000>`)
  
  * 更新至 Voodool2 2.2
  * 删除了config中一些无用的启动参数

## 2019年4月21日

* 更新至10.14.4

## 2019年4月20日

* 注入USB Power Property

   使用SSDT-USBX.aml 注入四项USB电源属性，设备充电信息变完整了。见[USB power property injection for Sierra (and later)](https://www.tonymacx86.com/threads/guide-usb-power-property-injection-for-sierra-and-later.222266/),谢谢伟人 RehabMan!
* 修复电池显示

   删除了abm_firstpolldelay=16000，修复了重启后电量不显示的问题。
* 驱动更新

  * VoovooI2C 更新至 v1.2.6 ,支持输入时防触控，支持双指激活通知中心。谢谢 [alexandred](https://github.com/alexandred/VoodooI2C)！
  * AppleALC 更新至 v1.3.7
  * AirportBcrmFixup 更新至 v1.19
  * CPUFriend 与 CPUFriendDataProvider 重新生成，改善8750H的变频效果

## 2019年4月14日

### 修复HDMI输出(已过期，见2019年7月5日更新)

XPS 9570的HDMI输出问题终于有了进展：依旧是来自@0xFireWolf的出色工作：[Coffee Lake Intel UHD Graphics 630 on macOS Mojave: HDMI Output Issue](https://www.tonymacx86.com/threads/fix-coffee-lake-intel-uhd-graphics-630-on-macos-mojave-hdmi-output-issue-public-testing-stage.275126/)。（大佬也曾针对CoffeLake UHD 630 Graphic造成的panic问题提出了解决方案，真是太强了）！解决方式如下：

* 1.使用FireWolf发布的WhateverGreen。

* 2.在Devices/Properties中添加如下entry:
  * `framebuffer-con1-enable` =`<01000000>`
  * `framebuffer-con1-alldata` =   `<01050900 00040000 87010000>`
  * `framebuffer-con2-enable` = `<01000000>`
  * `framebuffer-con2-alldata` = `<03040A00 00080000 87010000>`

本机上双屏输出成功的样例：

* `2K 60Hz display<--->HDMI 2.0 cable<---->HDMI 2.0 port(支持HDMI Audio)`
* `4k 60Hz display<--->Type C to DP cable<---->Type C port`

单屏幕输出成功的样例：

* `4k 60Hz display<--->HDMI 2.0 cable<---->HDMI 2.0 port`

* 禁用board id侦测
此前，使用macbook pro 15的board-id存在问题(因为Mac OS的主板侦测)，通过修改board-id为iMac,14,可以驱动Type-C接口。现使用原生的Mbp,15的board-id,同时使用WhateverGreen 中的启动参数agdpmod=vit9696禁用其侦测。

### 更新Voodool2CHID v2.1.5

* 可能修复了一些bug。

### 将显存修改为2048MB

* 通过WhateverGreen修改显存为2048M,可能会解决一些机型的花屏问题。

# 声明

使用该配置的XPS 9570 4K似乎在最新版本工作得很好，持续测试后仍存在许多内核问题、驱动问题，我的愿景是让XPS 9570 4K在Mac OS可以“完美”运行。

但目前看来很困难。首先，我是一名在校大学生，学业十分繁忙，真正接触到XPS 9570黑苹果是在去年12月份，无论从知识基础而言，还是从知识的深广度而言，都十分局限，黑苹果不是我的专业，面临一些疑难杂症无法快速提供解决方案；其次，我的缺乏很多外设和机型，很具有自不同机型的朋友，提出了在我机型上没有体现过的问题，以及一些相关的外设驱动问题（如雷电设备），缺乏设备让我的测试工作举步维艰；再有，Github的朋友虽然踊跃提出很多问题，但大部分偏基础而非广泛性的Bug。也有一些朋友，虽然已经找到相关问题的解决方案，偏偏因为各种原因没把方案详细记录下来给后续人们留下宝贵经验。

因此，时间、精力、能力限制我对此仓库维护的及时性，很多ISSUE的提问我也没时间一一回答。`Mac Catalina 10.15.X`版本即将到来，新版本在XPS 9570的运行情况如何呢？我不知道，但我希望有意愿、有能力的朋友，可以跟我一起探索、攻克已知的困难问题，及时PR或反馈一些有合作性的贡献（如完善中英文ReadMe、提供不同机型的反馈），或者提出更多可改进的方案，而不是做伸手无畏、闭门造车的路人。

希望此仓库可以持续给大家提供有意义的更新，希望XPS 9570 能早日实现完美的Hackintosh!

最后，我非常支持大家推广本项目，但如果您需要发布此EFI或转载给他人，请务必注明我的仓库出处，以及[Xigtun](https://github.com/Xigtun/xps-9570-mojave),[bavariancake](https://github.com/bavariancake/XPS9570-macOS)的仓库地址。如果您肯定我的工作，我也很乐意接受一颗来自君子的大写星星哦~~

**请勿用于商业行为！尊重开源与劳动！您的合作与支持是我们持续维护和分享的动力。**

# 鸣谢

* [Apple](https://www.apple.com) for macOS
* [Rehabman](https://github.com/RehabMan)：提供了大量的黑苹果驱动，国外黑苹果论坛的大佬，向大佬致敬！
* [Lilu](https://github.com/acidanthera/Lilu)： 向该内核扩展项目伟大的逆向工程师与开发者致敬！
* [WhateverGreen](https://github.com/acidanthera/WhateverGreen)：感谢所有参与该开源内核扩展项目的伟大开发者！
* [FireWolf](https://github.com/0xFireWolf/)： 提供DPCD最大链路速率修复、Intel HDMI无限循环连接修复、LSPCON驱动支持等核心的通用性开源贡献，使得基于UHD630的一些新机型，特别是XPS 9570提供了非常强大的技术难关攻坚，非常感谢他！
* [bavariancake](https://github.com/bavariancake/XPS9570-macOS)：提供一份针对XPS 9570 Hackintosh的详尽方案，他的仓库对XPS 9570驱动的每个细节进行了记录，是XPS 9570黑苹果在Github上的开源先驱，为本仓库贡献了大部分配置模板，感谢他的辛勤付出和劳动！
* [Xigtun](https://github.com/Xigtun/xps-9570-mojave)：与@bavariancake一样，属于早期开源XPS 9570黑苹果配置的无私贡献者，本仓库早期是在
*基础上对[bavariancake](https://github.com/bavariancake/XPS9570-macOS)的配置进行深度融合，加以改进才得到如今比较完美的配置，谢谢这位无私的同仁！
* @807133286 ：最早在Xigtun仓库中提出了可移植的[触控板驱动方案](https://github.com/Xigtun/xps-9570-mojave/issues/23)，给XPS 9570拥有将近白苹果触控板的体验，是改善XPS 9570触控版的灵感来源！
* [远景论坛](http://bbs.pcbeta.com/forum-559-1.html)：谢谢诸位大神提供的通用教程，让我能够以小白的身份轻松入门！
* [黑果小兵](https://blog.daliansky.net/): 我想，国内需要更多这样无私的、高水平的黑苹果布道者，感谢他！
* 感谢所有在仓库上曾提供了非常有意义ISSUE、测试反馈的朋友们，是你们让XPS 9570的黑苹果配置变得原来越好，你们持续的反馈和支持让这个项目变得更有意义！
