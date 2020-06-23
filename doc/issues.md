# 常见问题集锦

## 1. kernel_task高CPU使用率

### 描述
 错误的Layout ID会使AppleALC工作异常，导致内核繁忙，kernel_taskCPU使用率超过100%，详细讨论见[ISSUE #2](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/issues/2)、[ISSUE #8](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/issues/8)，也可能是AppleALC与某些驱动冲突导致的）。

 ### 解决方案

  不同机器的ALC298声卡可能需要使用不同Layout Id,本配置默认的Layout Id 为30，
 据测试一些机器需要注入72：在

## 2. 安装时固态硬盘不显示

### 描述
  安装界面的硬盘助手不显示NVME固态硬盘的盘卷。
### 解决方案
  开机进入BIOS，将硬盘模式改为AHCI，在系统安装并驱动完成后切换至原模式。当然，保留AHCI工作也是正常的。

## 3. 触摸板驱动不稳定

### 描述
 如果在`CLOVER/kexts/Other`文件夹下安放触摸板与屏幕触控驱动，触摸板常常在运行中失效，或在进入系统时导致重启。
### 解决方案

将触摸板驱动安装至系统目录，修复权限，重建缓存。
```
sudo mount -uw /

sudo cp -R VoodooI2C.kext /System/Library/Extensions/

sudo cp -R VoodooI2CHID.kext /System/Library/Extensions/

sudo cp -R VoodooPS2Controller.kext /System/Library/Extensions/

cd /System/Library/Extensions

sudo  chown -R root:wheel VoodooI2C.kext VoodooI2CHID.kext VoodooPS2Controller.kext

sudo kextcache -i /
```
## 4. 耳机无声

### 问题描述 
原生声卡被成功驱动后，插入耳机调到最大音量，却只听到很低的声音，打开系统设置的声音，在输入源的两个选项做切换，耳机音量又恢复正常，关闭系统设置后，过了约2分钟声音再次失效。经测试，在拔掉电源时，睡眠唤醒后这种情况比较常见。

### 解决方法
* 下载[ComboJack Installer](https://github.com/hackintosh-stuff/ComboJack/tree/master/ComboJack_Installer)
* 安装`VerbStub.kext`到驱动目录
* 终端运行`./install.sh` 


 ## 5. 驱动Dell DA300 网卡

 ### 描述
  Mac OS不具备Realtek 8153网卡驱动，如果想通过DA300接入以太网，则端口会收不到对应的网络数据包

### 解决方法
需安装额外驱动，详细讨论见[ISSUE #23](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/issues/23).  

## 6. 为CPU生成变频信息
  [one-key-cpufriend](https://github.com/stevezhengshiqi/one-key-cpufriend)在桌面一键生成: 
  * `CPUFriend.kext`
  * `CPUFriendDataProvider.kext`

将这两个驱动复制到`/CLOVER/kexts/Other/`，或安装到`L/E`，`S/L/E`

## 7. 雷电3设备热插拔

### 描述

雷电设备热插拔后工作不正常，讨论见[ISSUE #4](https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave/issues/4)。

### 解决方法

使用仓库内基于SSDT的半热插拔雷电3补丁后，执行以下步骤：

* 重启进入BIOS 将 `BIOS assist enumeration` 设为 `enabled`
* 将BIOS雷电接口相关设置都设为开放式，让雷电接口的访问权限设为最低
* 从Dell官网下载最新的Thunderbolt固件更新并安装
* 在 `Windows` 系统下连接雷电设备，连接权限设为设为 `Always allow`
* 在系统启动前，连接雷电3设备，然后进入`Mac Mojave` 测试热插拔，检验其是否工作正常

目前基于雷电3接口的完全热插拔暂无很好的解决方案。

## 8. DW1830睡眠唤醒后不可用

### 描述

在使用电池时，让系统睡眠进入睡眠状态，再次唤醒后约1分钟，蓝牙状态不可用

### 解决方法

从机器中拆下DW1830，用遮盖物(如胶布、双面胶)屏蔽网卡 `Pin 56` 与 `Pin 54` 针脚，见[jaymonkey](https://www.tonymacx86.com/threads/bluetooth-randomly-not-available-after-sleep.266255/post-1862126)提供的方法

## 9. DW1830睡眠唤醒掉速

### 描述

  睡眠唤醒后，Wifi网速明显变慢。

### 解决方法

  节能中关闭`唤醒以访问网络`。



## 10.睡眠唤醒内核崩溃

### 描述

睡眠有一定几率出现 `Wake transition timed out after 180 seconds while calling power state change callbacks` 内核崩溃

### 解决方案

初步推断为电源管理出错，调用了一个不正常供电的部件（如显卡），但暂未发现较好的解决方案，通过`Ctrl + Insert`组合键进入的睡眠状态可以使内核崩溃概率大大降低。


## 11. Service exited with abnormal code: 1

### 描述

进入安装界面或recovery时，到即将进入桌面时，出现 `Service exited with abnormal code: 1` 代码

### 解决方案

将`VirtualMC.kext`替换为 `FakeSMC.kext`

## 12. 无法读取SD卡

### 描述
  无法加载SD卡

### 解决方案

见 [bavariancake #75](https://github.com/bavariancake/XPS9570-macOS/pull/75),安装驱动 [Sinetek-rtsx](https://github.com/cholonam/Sinetek-rtsx)