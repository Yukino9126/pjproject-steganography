# Get pjproject source code
if [ ! -f 2.14.1.tar.gz ]; then
    wget https://github.com/pjsip/pjproject/archive/refs/tags/2.14.1.tar.gz
fi

# Extract pjproject source code
if [ ! -d pjproject-2.14.1 ]; then
    tar -zxvf 2.14.1.tar.gz
fi

# Copy all file in src to pjproject-2.14.1
# cp -r src/* pjproject-2.14.1

core_count=$(nproc --all)

cd pjproject-2.14.1
./configure
make dep -j$core_count
make -j$core_count

mkdir -p ../bin
cp pjsip-apps/bin/pjsua* ../bin

echo "Done"
