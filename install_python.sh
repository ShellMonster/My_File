###### 安装前检查 ######
# yum install gcc zlib-devel openssl-devel -y
###### 安装前检查 ######
# 快捷执行命令(两条任选其一)：
# curl -o- -L https://raw.githubusercontent.com/ShellMonster/My_File/main/install_python.sh | bash -s
# sh -c "$(curl -sSL https://raw.githubusercontent.com/ShellMonster/My_File/main/install_python.sh)"

yum install gcc zlib-devel openssl-devel libffi-devel -y

# 判断是Linux还是Mac os
OS="$(uname)"
if [[ "$OS" == "Linux" ]]; then
  yum install gcc zlib-devel openssl-devel -y
  # 切换到根目录下载安装；
  cd
elif [[ "$OS" != "Darwin" ]]; then
  # 是MacOS就不用担心，切到桌面下载安装；
  cd ~/Desktop
fi

# 默认下载3.8.0安装包；
python_version="3.8.0"
# echo "请在下方输入希望安装的Python版本(例如3.9.5，默认3.9.5)："
# read python_version
wget --no-check-certificate http://npm.taobao.org/mirrors/python/${python_version}/Python-${python_version}.tgz

# 解压缩；
tar -zxvf Python-${python_version}.tgz

# 进入解压后的目录；
cd Python-${python_version}

# 开始编译版本到对应Python目录；
mkdir /usr/local/python${python_version}
./configure --with-ssl --prefix=/usr/local/python${python_version}

# 安装Python
make & make install

# 删除原有Python快捷方式(有就删掉)
# if [ -L /usr/bin/python3 ]; then
#     echo "当前已存在python3软链接，将自动替换为最新"
#     rm -rf /usr/bin/python3
# fi
# if [ -L /usr/bin/pip3 ]; then
#     echo "当前已存在pip3软链接，将自动替换为最新"
#     rm -rf /usr/bin/pip3
# fi

# 创建python3快捷链接：
rm -rf /usr/bin/python3
ln -s /usr/local/python${python_version}/bin/python{python_version: 0:3} /usr/bin/python3

# 创建pip3快捷链接；
rm -rf /usr/bin/pip3
ln -s /usr/local/python${python_version}/bin/pip3 /usr/bin/pip3

# # 创建快捷方式；
# ln -s /usr/local/python${python_version: 0:3}/bin/python${python_version: 0:3} /usr/bin/python3
# if [ -f /usr/local/python${python_version: 0:3}/bin/pip3 ]; then
#     ln -s /usr/local/python${python_version: 0:3}/bin/pip3 /usr/bin/pip3
# else
#     echo "当前安装的Python${python_version}版本未包含pip3，无法设定软链接；"
#     # 如果pip3不存在，则不指向；
# fi

# 安装完毕后查看当前版本；
echo "安装完毕，当前Python版本为："
python -V

# 删除下载的文件和目录；
cd ..
rm -rf Python-${python_version}.tgz
rm -rf Python-${python_version}
