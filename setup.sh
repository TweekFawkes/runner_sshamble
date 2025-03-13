apt-get update
apt-get install -y ca-certificates
apt-get install -y build-essential
apt-get install -y git
wget https://go.dev/dl/go1.22.6.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.22.6.linux-amd64.tar.gz && rm go1.22.6.linux-amd64.tar.gz
export GOROOT=/usr/local/go
export GOPATH=/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GO111MODULE=on
export CGO_ENABLED=1
mkdir -p /go/src
mkdir -p /go/bin
cd /tmp && git clone --depth 1 https://github.com/runZeroInc/sshamble.git
cd /tmp/sshamble && go mod download
cd /tmp/sshamble && go build -o sshamble
cd /tmp/sshamble && cp /tmp/sshamble/sshamble /go/bin/sshamble
cd /tmp/sshamble && /go/bin/sshamble badkeys-update