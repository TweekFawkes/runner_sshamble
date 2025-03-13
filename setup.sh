sudo apt-get update
sudo apt-get install -y ca-certificates
sudo apt-get install -y build-essential
sudo apt-get install -y git
sudo wget https://go.dev/dl/go1.22.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.6.linux-amd64.tar.gz
sudo rm go1.22.6.linux-amd64.tar.gz
export GOROOT=/usr/local/go
export GOPATH=/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GO111MODULE=on
export CGO_ENABLED=1
sudo mkdir -p /go/src
sudo mkdir -p /go/bin
cd /tmp && git clone --depth 1 https://github.com/runZeroInc/sshamble.git
cd /tmp/sshamble && sudo go mod download
cd /tmp/sshamble && go build -o sshamble
cd /tmp/sshamble && cp /tmp/sshamble/sshamble /go/bin/sshamble