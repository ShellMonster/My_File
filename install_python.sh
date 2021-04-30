###### 安装前检查 ######
# yum install gcc -y   zlib-devel openssl-devel
###### 安装前检查 ######
# 快捷执行命令(两条任选其一)：
# curl -o- -L https://raw.githubusercontent.com/ShellMonster/My_File/main/install_python.sh | bash -s
# sh -c "$(curl -sSL https://raw.githubusercontent.com/ShellMonster/My_File/main/install_python.sh)"

# 判断是Linux还是Mac os
OS="$(uname)"
if [[ "$OS" == "Linux" ]]; then
  yum install gcc -y   zlib-devel openssl-devel
elif [[ "$OS" != "Darwin" ]]; then
  : # 是MacOS就不用担心；
fi

# 切换到首页
cd  

# 下载3.8.0安装包；
# echo "请在下方输入希望安装的Python版本(例如3.8.0，默认3.8.0)："
# read python_version
wget --no-check-certificate http://npm.taobao.org/mirrors/python/3.8.0/Python-3.8.0.tgz

# 解压缩3.8.0；
tar -zxvf Python-3.8.0.tgz

# 进入解压后的目录；
cd Python-3.8.0

# 开始编译版本到对应Python目录；
./configure --with-ssl --prefix=/usr/local/python3.8

# 安装Python
make & make install

# 删除原有Python快捷方式(有就删掉)
if [ -L /usr/bin/python3 ]; then
    echo "当前已存在python3软链接，将自动替换为最新"
    rm -rf /usr/bin/python3
fi
if [ -L /usr/bin/pip3 ]; then
    echo "当前已存在pip3软链接，将自动替换为最新"
    rm -rf /usr/bin/pip3
fi

# 创建快捷方式；
ln -s /usr/local/python3.8/bin/python3.8 /usr/bin/python3
ln -s /usr/local/python3.8/bin/pip3 /usr/bin/pip3

# 安装完毕后查看当前版本；
echo "安装完毕，当前Python版本为："
python -V

# 删除下载的文件和目录；
cd ..
rm -rf Python-3.8.0.tgz
rm -rf Python-3.8.0
