基于谷歌项目Battery Historian改造，改动主要有

1 总结BH的完整搭建过程

2 加入PCB温度显示，方便分析问题（需要配合framework）

3 修改原生 monsoon.py，可以导入Power monitor数据

4 加入系统电流数据显示，方便分析问题（需要配合framework）

显示图view.jpeg

#1 执行以下命令  搭建Battery Historian

echo 'export GOPATH=~/work' >> ~/.bashrc

echo 'export GOBIN=$GOPATH/bin' >> ~/.bashrc

echo 'export PATH=$PATH:$GOBIN' >> ~/.bashrc

cd ~

source .bashrc

go get -d -u github.com/google/battery-historian/...

cd $GOPATH/src/github.com/google/battery-historian/

git pull https://github.com/chenjiaju279/battery-historian

mkdir third_party

cd third_party

git clone https://github.com/google/closure-compiler

git clone https://github.com/google/closure-library --branch v20170409

git clone https://github.com/markrcote/flot-axislabels

git clone https://github.com/gusha915/no-ssr-battery-historian.git

cp -r no-ssr-battery-historian/cdn .

cp no-ssr-battery-historian/base.html ../templates/

cd ..


#2 使用

进入到目录 battery-historian/

source env.sh

go run setup.go

go run cmd/battery-historian/battery-historian.go -port 8878

---------------------------------------

关于power monitor导入Battery Historian的方法

使用 monsoonx.py（基于monsoon.py改造）

一

Power monitpr连接ubuntu主机

查看 /dev/ 下面是否有ttyACM0之类的文件

 sudo chmod 777 /dev/ttyACM0
 
二

手机连接type-c（这样才能开机，估计是电压问题）

python monsoonx.py --voltage=4.0 --device /dev/ttyACM0

按power键开机

三

开机后，注意手机电量是不是0，如果是0则马上adb设置一下，避免关机

开始抓电流

python monsoonx.py --hz 1 --samples 1000 -timestamp

--hz 1表示一秒抓一条电流数据

--samples 1000 表示抓1000条

根据脚本提示操作  （抓取过程中，按Ctrl + c可停止抓取）

四

显示

done  save on powerReport.txt 

则抓取成功

用此项目Battery Historian打开powerReport.txt 即可

Ps :在抓取过程中，并非每抓到一条数据就会print，而是每一秒只print一条数据
