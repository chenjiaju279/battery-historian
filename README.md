BH的完整搭建过程，以及加入PCB温度显示代码，需要配合定制化的bugreport文件（framework）

把以下命令复制到一个.sh脚本执行

export GOPATH=$PWD/BHWORK

export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOBIN

go get -d -u github.com/google/battery-historian/...

cd BHWORK/src/github.com/google/battery-historian/

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


使用

进入到目录BHWORK/src/github.com/google/battery-historian/
source env.sh

go run setup.go

go run cmd/battery-historian/battery-historian.go -port 8878
