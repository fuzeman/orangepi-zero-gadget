echo boot.cmd

setenv env_addr_r 0x41000000
setenv env_file uboot.env

setenv mmc_dev 0
setenv mmc_part 1

echo " - env_addr_r: ${env_addr_r}"
echo " - env_file: ${env_file}"

echo " - mmc_dev: ${mmc_dev}"
echo " - mmc_part: ${mmc_part}"
echo ""

echo Loading \"${env_file}\" environment into ${env_addr_r}...
echo ""
load mmc ${mmc_dev}:${mmc_part} ${env_addr_r} ${env_file}; setenv env_size ${filesize}
echo ""

echo Importing environment from ${env_addr_r}...
echo ""
env import -t ${env_addr_r} ${env_size}
echo ""

setenv kernel_args "console=ttyS0,115200 debug net.ifnames=0 ro panic=-1 fixrtc init=/lib/systemd/systemd"

echo Booting snappy...
echo " - kernel_args: ${kernel_args}"
echo ""

run snappy_boot
