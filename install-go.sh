# ============================================
# 1. 移除旧版本
# ============================================
sudo apt remove -y golang-go 2>/dev/null
sudo rm -rf /usr/local/go /usr/lib/go

# 1. 彻底移除旧版本
sudo apt remove --purge golang-go
sudo rm -rf /usr/lib/go-1.22
sudo rm -f /usr/bin/go /usr/bin/gofmt

# 2. 下载 Go 1.25.1（这才是满足要求的版本）
cd /tmp
wget https://go.dev/dl/go1.25.1.linux-amd64.tar.gz

# 3. 解压到 /usr/local
sudo tar -C /usr/local -xzf go1.25.1.linux-amd64.tar.gz

# 4. 创建软链接
sudo ln -s /usr/local/go/bin/go /usr/bin/go
sudo ln -s /usr/local/go/bin/gofmt /usr/bin/gofmt

# 5. 配置环境变量
cat >> ~/.bashrc << 'EOF'

# Go 环境变量
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct
export GOTOOLCHAIN=auto
EOF

# 6. 生效
source ~/.bashrc

# 7. 验证版本（应该是 1.24.2）
go version
