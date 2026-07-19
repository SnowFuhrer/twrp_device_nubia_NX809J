# TWRP Device Tree — Nubia Red Magic 11 Pro (NX809J)

Unofficial TWRP recovery trees for the Nubia Red Magic 11 Pro (NX809J). I created these to get decryption working and clean up existing trees.

##Nonfunctional
vibration
wifi
?

```bash
mkdir ~/twrp && cd ~/twrp
repo init --depth=1 -u https://github.com/TWRP-Test/platform_manifest_twrp_aosp.git -b twrp-16.0
repo sync

# Clone device tree
git clone https://github.com/SnowFuhrer/twrp_device_nubia_NX809J device/nubia/NX809J

#Apply touch fix
git apply device/nubia/NX809J/touchfix.patch

# Build
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch twrp_NX809J
make recoveryimage -j$(nproc)
```

Output: `out/target/product/NX809J/recovery.img`

## Flashing

```bash
fastboot flash recovery_a recovery.img
fastboot flash recovery_b recovery.img
fastboot reboot
```

