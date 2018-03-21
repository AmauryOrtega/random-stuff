# Backup
sudo dd bs=4M if=/dev/sdb of=raspbian.img
# Restore
sudo dd bs=4M if=raspbian.img of=/dev/sdb
# Backup compressing
sudo dd bs=4M if=/dev/sdb | gzip > raspbian.img.gz
# Restore compressed
gunzip --stdout raspbian.img.gz | sudo dd bs=4M of=/dev/sdb
