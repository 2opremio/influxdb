# NOTE: make sure that the toolchain required by flux (in rust-toolchain.toml)
#       has the arm-unknown-linux-gnueabihf target installed.
#       this can be done by checking out the flux repo (in the version mandated by
#       go.mod) and running `rustup target add armv7-unknown-linux-gnueabihf` there

make generate
RUSTFLAGS=" -C linker=arm-unknown-linux-gnueabihf-gcc" LD_LIBRARY_PATH=~/arm-unknown-linux-gnueabihf/lib/ CXX=arm-linux-gnueabihf-g++  CC=arm-unknown-linux-gnueabihf-gcc   CGO_ENABLED=1 GOOS=linux GOARCH=arm GOARM=7 PKG_CONFIG=~/go/bin/pkg-config make influxd
