### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=EronX Kernel for Xiaomi MT6893 Series
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

# boot shell variables
block=boot;
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;
no_block_display=1;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
split_boot;
flash_boot;
flash_dtbo;
## end boot install

ui_print " " "Patching system's build prop for fuse passthrough..."
# FUSE Passthrough
patch_prop /system/build.prop "persist.sys.fuse.passthrough.enable" "true"

# completion message
ui_print " ";
ui_print "  ===================  ";
ui_print "  >> Flash Success <<  ";
ui_print "  ===================  ";
ui_print " ";
