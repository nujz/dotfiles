# dotfiles

个人开发环境搭建

## 系统安装

### 1. 下载与安装

#### 1.1 选择 manjaro 或 archlinux

https://manjaro.org/downloads/community/cinnamon/

其他可选： https://manjaro.org/downloads/official/kde/

#### 1.2 虚拟机安装(也可以实体机安装)

##### 1.2.1 vmware配置

硬盘建议选100G，使用过程中硬盘会持续加大，收缩不方便。

显示器勾选加速3d图形，图形内存给个128M就可以了。

其它默认，后期还可以再调整。

##### 1.2.2 进入ISO镜像

配置启动选项

> 把 driver=free 改为 driver=mesa

进入图形化界面安装

> swap to file。大部分情况下内存会不够，所以需要交换文件。

### 2. 系统调整

#### 2.1 vmtools与剪切板

```sh
sudo pacman -S open-vm-tools

systemctl enable --now vmtoolsd.service
```

*在主机复制后，应该会同步到虚拟机内了，不行就重启试试*

#### 2.2 fish shell 及相关脚本

```
sudo pacman -S fish
```

config.fish 覆盖 ~/.config/fish/config.fish

```
cp fish/config.fish ~/.config/fish/config.fish
```

> config.fish 有个配置需要注意 http://192.168.66.1:1088 需要指向支持 http 协议的代理软件

需要走代理时，调用 proxy_open 命令设置环境变量就可以了。

配置默认shell

#### 2.3 软件源优化

- 官方源

```sh
sudo pacman-mirrors -i -c China -m rank
```

- archlinuxcn源

```
sudo wget -O /etc/pacman.d/archlinuxcn-mirrorlist https://raw.githubusercontent.com/archlinuxcn/mirrorlist-repo/master/archlinuxcn-mirrorlist

# edit 开启需要的源
```

编辑 /etc/pacman.conf 文件:

```
SyncFirst = ... archlinuxcn-keyring

...

[archlinuxcn]
Include=/etc/pacman.d/archlinuxcn-mirrorlist
```

然后，安装 archlinuxcn-keyring

```
sudo pacman -Syy archlinuxcn-keyring
```

更新系统

```
sudo pacman -Syu
```

#### 2.4 常用软件下载

##### 2.4.1 输入法

```
sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-lua
```

 ~/.pam_environment 文件
 
```
cp etc/.pam_environment ~/.pam_environment
```

重启后，任务栏点击输入法图标，添加pinyin

##### 2.4.2 vscode

```
sudo pacman -S visual-studio-code-bin
```

扩展

1. IntelliJ IDEA Keybindings
2. python、java等语言插件

##### 2.4.3 其它

包管理工具

```
sudo pacman -S paru
```

快捷启动

```
paru -S albert

# 配置自启...
```

vim

google-chrome

> 插件: omega、adguard、user javascript and css、one tab、油猴

opera

intellij-idea-community-edition

...

#### 2.5 虚拟机与主机文件共享配置

```
cp etc/mnt-hgfs.mount /usr/lib/systemd/system/mnt-hgfs.mount

systemctl enable mnt-hgfs.mount
```

vmware 设置共享文件夹

#### 2.6 字体

```
sudo pacman -S ttf-sarasa-gothic
```
