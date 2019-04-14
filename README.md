# 介绍
>该EFI可以使XPS 9570在Mojave环境下正常工作，这个配置的大部分内容是基于[Xigtun](https://github.com/Xigtun/xps-9570-mojave),[bavariancake](https://github.com/bavariancake/XPS9570-macOS)两位朋友的EFI借鉴得到的，同时807133286朋友向大家提供了非常及时的局部更新.在这里，我要对他们的无私帮助和奉献表示感谢。我总结了Xigtun和bavariancake的配置优缺点,内容如下：

## Xigtun 
 ### 优点
 * 解锁触控板的大部分高级手势
 * 支持触控屏幕
 * 亮度正常
 * 支持typec 转换成HDMI\DP输出
 ### 缺点
 * 睡眠唤醒黑屏
 * 无法驱动原生声卡
 * config过于冗余
 
## bavariancake
 ### 优点
 * 支持睡眠

 ### 缺点
 * 触控板不支持高级手势
 * 不支持屏幕触控
 * DSDT加载方法存在错误
 
## 我的改进
当然，以上配置已经可以让XPS 9570的几个版本正常使用，但离真正的fawlessly还是有差距。我致力于融合以上两位的工作成果，得到一个完善的配置。在`Mojave 10.14.3`版本下,我的配置解决了以下问题:

 * 支持Type-C外接显示器输出
 * 支持HDMI口外接显示器输出
 * 支持睡眠与唤醒
 * 支持原生声卡驱动
 * 支持触控板手势与屏幕触控
 * 更少的DSDT加载错误
 * 利用CpuFriend注入Macbook pro 15.1的变频信息
 

# 硬件配置
 ## 已驱动
  * Machine :Dell XPS 9570
  * CPU: Intel i7-8750H
  * GPU: UHD630 + 1050Ti
  * RAM: 16GB RAM
  * Display: 4K Sharp
  * SSD: PC401 NVMe SK hynix 512GB SSD
  * Audio: Realtek ALC298
  * Touchscreen
  * WLAN + Bluetooth : DW1830（已更换）
 ## 未驱动
  * Killer 1535 (无解)
  * Goodix fingerpint reader (无解)
  * Nvida Geforce 1050Ti (无解，已屏蔽)

# 软件环境
 * BIOS: 1.7.0,1.5.0
 * Mojave 10.14.3 + Windows 10 1809系统
 * macOS: 10.14.2, 10.14.3

# 使用方法
 * 将CLOVER放入EFI分区，使用config_install.plist进系统完成安装
 * 进入桌面后运行`sudo kextcache -i /`重建缓存
 * 用config.plist使能集显加速
 * 加入自生成的三码
 
 `config_10.14.4.plist`是我为了想升级10.14.4版本的朋友准备的，因为精力有限我还未能进行测试，期待有人反馈结果。

# 已知问题
 * 睡眠唤醒后，蓝牙随机出现不可用。
 * -v 模式无法进入系统
 
# 待测试
 * 雷电三接口
 * 非4k、8750H的机型
 * 在10.14.4上运行
 
# 关于本机
![关于本机](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/blob/master/screenshots/2048_mem.png)
![Nvme固态硬盘](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/NVME.png)
![集显](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/Graphic.png)
![双显示器输出](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/dual_displays.png)
![输出细节](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/dual_displays_details.png)
![USB3.1](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/USB3.1.png)
![电池](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/Battery.png)
![DW1830蓝牙](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/DW1830%20Bluetooth.png)
![DW1830 Wifi](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/DW1830%20Wifi.png)
![原生管理](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/Extention.png)
![变频](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/raw/master/screenshots/Intel%20Turbo%20Boost.png)
# 更新历史
## 用FireWolf的WhateverGreen修复HDMI输出
 长久困扰着XPS 9570的HDMI问题终于有了解决方案，依旧是来自FireWolf的[Coffee Lake Intel UHD Graphics 630 on macOS Mojave: HDMI Output Issue ](https://www.tonymacx86.com/threads/fix-coffee-lake-intel-uhd-graphics-630-on-macos-mojave-hdmi-output-issue-public-testing-stage.275126/)。（大佬曾解决了630HD 4k输出的panic问题，非常感谢他！）通过Devices/Properties下注入con index修复补丁，这个方案仅仅适用于HDMI接口没有路由至独立显卡的机器！本人机器上测试情况：HDMI2.0线接HDMI口到2K显示器,TypeC转DP线接TypeC口到4K显示器，输出正常，且支持HDMI Audio高清输出。
## 禁用board id侦测
 为了使Type C接口工作，之前使用的方法是使用iMac,14的board-id,该方法会导致电池图标重启，经反馈可能使DA300转接失效。现在使用原生的mbp,15的board-id,同时使用agdpmod=vit9696禁用其侦测。
## 日常更新Voodool2CHID
  可能修复了一些bug。
## 2048显存
  通过WhateverGreen修改显存为2048M,可能会解决花屏问题。
# 声明

我尝试直接升级10.14.4，失败了。因此我选择我停留在10.14.3（18D42）,在这个版本上机器工作得很好，希望有意愿的朋友可以尝试升级到10.14.3更高版本进行测试，期待更多的朋友可以加入进来，让XPS 9570 实现真正的Hackintosh!

如果你需要发布此EFI或转载给他人，请务必注明我的仓库出处，以及[Xigtun](https://github.com/Xigtun/xps-9570-mojave),[bavariancake](https://github.com/bavariancake/XPS9570-macOS)的仓库地址，请勿用于商业行为！尊重开源与劳动！您的合作与支持是我们持续维护和分享的动力。
