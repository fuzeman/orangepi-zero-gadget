setenv env_addr_r 0x41000000
setenv env_file uboot.env

setenv mmc_dev 0
setenv mmc_part 1

load mmc ${mmc_dev}:${mmc_part} ${env_addr_r} ${env_file}; setenv env_size ${filesize}
env import -t ${env_addr_r} ${env_size}

setenv kernel_args "console=ttyS0,115200 debug net.ifnames=0 ro panic=-1 fixrtc init=/lib/systemd/systemd"
run snappy_boot
