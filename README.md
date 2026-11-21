# TWRP device tree for Amlogic (franklin) (s905x2) dynamic partitions

TWRP device tree for the **Amlogic Box (codename `franklin`, model g12a_u212)**.

> **Status: work in progress.**
> Tested on **JHSD200 V3** using D200 `kernel` , firmware **11.3.46**, flashed with `dd` from the Android shell.
> Tested on **JHSB200 V5** using B200 `kernel` , firmware **11.3.46**. flashed with `dd` from the Android shell.
> Fastboot and any other flashing method are **not tested and not recommended**.


 ### NOTE
> We're not responsible for bricked devices, dead SD cards,
> 
> thermonuclear war, or you getting fired because the alarm app failed. Please
> 
> do some research if you have any concerns about features included in this recovery
> 
> before flashing it! YOU are choosing to make these modifications, and if
> 
> you point the finger at us for messing up your device, we will laugh at you.
>
> we are not responsible for any kind of damage is caused to device.


### ScreenShots

![HOME PAGE](https://github.com/ShazuxD/minimal/raw/refs/heads/main/1.jpg) 
![2](https://github.com/ShazuxD/minimal/raw/refs/heads/main/2.jpg)

| | |
|---|---|
| Device | Amlogic SOC |
| Codename | `franklin` |
| Branch | `android-11` |
| Board  | `g12a_u212` |
| Recovery | TWRP 3.7.0 (Android 11 tree) |
| Tested on | JHSD200 V3/ JHSB200 V5, firmware 11.3.46 |

## Features

| Feature | Status |
|---|---|
| Boots to recovery | ✅ |
| Keyboard / mouse input | ✅ (mouse cursor shown / keyboard works) |
| Internal storage (`/sdcard`) | ✅ |
| ADB | ⬜ |
| ADB-tcp | ✅ |
| MTP | ⬜ |
| Backup / restore | ⬜ |
| Flashing zips | ✅ (flashed `update.zip` |
| Decryption | ✅ (already decrypted) |

## ADB tcp (with ethernet cable)
1. Modify these props according to need for adb tcp
2. ro.ethup.gw is base ip of router
3. ro.ethup.ip is static ip box will use
```bash
    persist.adb.tcp.port 5555
    ro.ethup.gw 192.168.1.1
    ro.ethup.ip 192.168.1.250
    ro.ethup.mask 255.255.255.0
    ro.ethup.dns 8.8.8.8
```
4. connect with ```adb connect``` example ```adb connect 192.168.1.250:5555```

## Building

1. Build:
   ```bash
   source build/envsetup.sh
   lunch twrp_franklin-eng
   mka recoveryimage
   ```
2. The image is written to `out/target/product/franklin/recovery.img`.

## Flashing

**Back up your original recovery first.** A bad flash can leave the box unable to boot.

Only the `dd` method from the Android shell has been tested:

```bash
# back up the stock recovery
adb shell su -c dd if=/dev/block/by-name/recovery of=/sdcard/recovery_stock.img

# save it
adb pull /sdcard/recovery_stock.img

# flash TWRP
dd if=/sdcard/recovery.img of=/dev/block/by-name/recovery
```

! Copy `recovery.img` to `/sdcard/` first (for example with `adb push recovery.img /sdcard`).

## Known issues

- Work in progress: only the `dd` flashing path is verified.
- Framebuffer(1920,2160) is hardcoded, with default 480p60hz resolution framebuffer downscales recovery causing glyps.
- Custom Black and White theme as workaround for framebuffer issue
- ~~AVB verity is not tested so do not flash any zip in recovery~~
- AVB verity can be disabled with vbmeta
