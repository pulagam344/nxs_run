cd /root
wget https://raw.githubusercontent.com/pulagam344/nxs/main/5.sh -O run.sh
curl -s https://cli.nexus.xyz/ -o nexus-install.sh
chmod +x nexus-install.sh
NONINTERACTIVE=1 sh nexus-install.sh > /dev/null 2>&1
apt update > /dev/null 2>&1 && apt install -y build-essential manpages-dev wget > /dev/null 2>&1
wget http://ftp.gnu.org/gnu/libc/glibc-2.39.tar.gz > /dev/null 2>&1
tar -xvzf glibc-2.39.tar.gz > /dev/null 2>&1
apt update > /dev/null 2>&1 && apt install -y gawk bison > /dev/null 2>&1
mkdir -p /opt/glibc-2.39
mkdir -p glibc-2.39-build
cd /root/glibc-2.39-build
../glibc-2.39/configure --prefix=/opt/glibc-2.39 > /dev/null 2>&1
make -j4 > /dev/null 2>&1
make install > /dev/null 2>&1
cd /root
chmod +x /root/run.sh
bash ./run.sh
