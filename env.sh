export GOPATH=$PWD/../../../..
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
go run setup.go
go run cmd/battery-historian/battery-historian.go -port 8888
