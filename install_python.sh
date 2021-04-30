###### 安装前检查 ######
# yum install gcc -y   zlib-devel openssl-devel
###### 安装前检查 ######
# 快捷执行命令：
# curl -o- -L https://raw.githubusercontent.com/ShellMonster/My_File/main/install_python.sh | bash -s
# sh -c "$(curl -sSL https://raw.githubusercontent.com/ShellMonster/My_File/main/install_python.sh)"

echo 111
# # 切换到首页
# cd  

# # 下载3.8.0安装包；
# wget --no-check-certificate http://npm.taobao.org/mirrors/python/3.8.0/Python-3.8.0.tgz

# # 解压缩3.8.0；
# tar -zxvf Python-3.8.0.tgz

# # 进入解压后的目录；
# cd Python-3.8.0

# # 开始编译版本到对应Python目录；
# ./configure --with-ssl --prefix=/usr/local/python3.8

# # 安装Python
# make & make install

# # 删除原有Python快捷方式(有就删掉)
# rm -rf /usr/bin/python3

# # 创建快捷方式；
# ln -s /usr/local/python3.8/bin/python3.8 /usr/bin/python3
# ln -s /usr/local/python3.8/bin/pip3 /usr/bin/pip3

# # 安装完毕后查看当前版本；
# echo "安装完毕，当前Python版本为："
# python -V

# # 删除下载的文件和目录；
# cd ..
# rm -rf Python-3.8.0.tgz
# rm -rf Python-3.8.0
