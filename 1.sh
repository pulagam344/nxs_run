cd /root

# Download and install Nexus
wget https://raw.githubusercontent.com/pulagam344/nxs/main/1.sh -O run.sh
curl -s https://cli.nexus.xyz/ -o nexus-install.sh
chmod +x nexus-install.sh
NONINTERACTIVE=1 sh nexus-install.sh > /dev/null 2>&1

# Install dependencies
apt update > /dev/null 2>&1 && apt install -y build-essential manpages-dev wget gawk bison > /dev/null 2>&1

# Download and extract glibc
wget http://ftp.gnu.org/gnu/libc/glibc-2.39.tar.gz > /dev/null 2>&1
tar -xvzf glibc-2.39.tar.gz > /dev/null 2>&1

# Prepare build and install directories
mkdir -p /opt/glibc-2.39
mkdir -p /root/glibc-2.39-build

# Correctly run configure and build in the build directory
cd /root/glibc-2.39-build && ../glibc-2.39/configure --prefix=/opt/glibc-2.39 > /dev/null 2>&1
cd /root/glibc-2.39-build && make -j4 > /dev/null 2>&1
cd /root/glibc-2.39-build && make install > /dev/null 2>&1

chmod +x /root/run.sh
bash /root/run.sh
