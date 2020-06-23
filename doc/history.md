# 更新历史

## 2020年6月23日

* 加入英文ReadME
* 支持`macOS Catalina 10.15.0- 10.15.5`
* 移除可能导致DW1820A冲突的PCI描述
* 删除1080P配置的`UIScale=2`

## 2020年4月7日

* 将`README.md`拆分为三个子文件：`介绍`，`常见问题集锦`、`更新历史`

## 2019年10月20日

* 支持 `Mac Catalina 10.15`
* 增加支持 `Mac Catalina` 的 `BrcmBluetoothInjector.kext` 蓝牙驱动

## 2019年8月8日
* 支持 `Mac Mojave 10.14.X` 和 `Mac Catalina Beta 5`
* 采用折中方案禁用触控屏，修复`kenerl_task`CPU使用率超过`10%`的bug（触控屏已被禁用，介意者勿使用该版本）
* 在`Properties`注入伪造的`PCI`列表，完善了系统报告
* 删除`AppleBacklightInjector.kext`，因为WEG已自动注入
* 使用原来`FakeSMC`替换`VirtualSMC`，避免安装`Catalina`时出现的`Service exited with abnormal code: 1`
* 使用非必须的热补丁完善Mac要求的ACPI列表

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
