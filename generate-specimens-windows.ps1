# Script to generate VHDX test files
# Requires Windows 7 or later with Hyper-V

# Create an image with logical and physical sector size of 512 bytes
$ImagePath = "sector_l512_p512.vhdx"

New-VHD -Path ${ImagePath} -LogicalSectorSizeBytes 512 -PhysicalSectorSizeBytes 512 -SizeBytes 256MB

Mount-VHD -Path ${ImagePath}

# $VirtualDisk = Get-Disk | Where-Object -FilterScript {$_.Location -Eq ${ImagePath}}
$VirtualDisk = Get-Disk -FriendlyName "Msft Virtual Disk"

Initialize-Disk -Number ${VirtualDisk}.Number -PartitionStyle MBR 

New-Partition -DiskNumber ${VirtualDisk}.Number -UseMaximumSize -DriveLetter X

Format-Volume -DriveLetter X -FileSystem NTFS -Confirm:$False -Force

New-Item -ItemType "File" -Path "X:\\" -Name "emptyfile"

New-Item -ItemType "Directory" -Path "X:\\" -Name "testdir1"

New-Item -ItemType "File" -Path "X:\\testdir1" -Name "testfile1" -Value "My file "

New-Item -ItemType "HardLink" -Path "X:\\" -Name "file_hardlink1" -Value "X:\\testdir1\\testfile1"

New-Item -ItemType "SymbolicLink" -Path "X:\\" -Name "file_symboliclink1" -Value "X:\\testdir1\\testfile1"

New-Item -ItemType "Junction" -Path "X:\\" -Name "directory_symboliclink1" -Value "X:\\testdir1"

New-Item -ItemType "File" -Path "X:\\" -Name "ads"
Add-Content -Path "X:\\ads" -Stream "myads" -Value "My ADS "

Dismount-VHD -DiskNumber ${VirtualDisk}.Number

# Create an image with logical sector size of 512 bytes and a phyical sector size of 4096 bytes
$ImagePath = "sector_l512_p4096.vhdx"

New-VHD -Path ${ImagePath} -LogicalSectorSizeBytes 512 -PhysicalSectorSizeBytes 4096 -SizeBytes 256MB

Mount-VHD -Path ${ImagePath}

$VirtualDisk = Get-Disk -FriendlyName "Msft Virtual Disk"

Initialize-Disk -Number ${VirtualDisk}.Number -PartitionStyle MBR 

New-Partition -DiskNumber ${VirtualDisk}.Number -UseMaximumSize -DriveLetter X

Format-Volume -DriveLetter X -FileSystem NTFS -Confirm:$False -Force

New-Item -ItemType "File" -Path "X:\\" -Name "emptyfile"

New-Item -ItemType "Directory" -Path "X:\\" -Name "testdir1"

New-Item -ItemType "File" -Path "X:\\testdir1" -Name "testfile1" -Value "My file "

New-Item -ItemType "HardLink" -Path "X:\\" -Name "file_hardlink1" -Value "X:\\testdir1\\testfile1"

New-Item -ItemType "SymbolicLink" -Path "X:\\" -Name "file_symboliclink1" -Value "X:\\testdir1\\testfile1"

New-Item -ItemType "Junction" -Path "X:\\" -Name "directory_symboliclink1" -Value "X:\\testdir1"

New-Item -ItemType "File" -Path "X:\\" -Name "ads"
Add-Content -Path "X:\\ads" -Stream "myads" -Value "My ADS "

Dismount-VHD -DiskNumber ${VirtualDisk}.Number

# Create an image with logical and physical sector size of 4096 bytes
$ImagePath = "sector_l4096_p4096.vhdx"

New-VHD -Path ${ImagePath} -LogicalSectorSizeBytes 4096 -PhysicalSectorSizeBytes 4096 -SizeBytes 256MB

Mount-VHD -Path ${ImagePath}

$VirtualDisk = Get-Disk -FriendlyName "Msft Virtual Disk"

Initialize-Disk -Number ${VirtualDisk}.Number -PartitionStyle MBR 

New-Partition -DiskNumber ${VirtualDisk}.Number -UseMaximumSize -DriveLetter X

Format-Volume -DriveLetter X -FileSystem NTFS -Confirm:$False -Force

New-Item -ItemType "File" -Path "X:\\" -Name "emptyfile"

New-Item -ItemType "Directory" -Path "X:\\" -Name "testdir1"

New-Item -ItemType "File" -Path "X:\\testdir1" -Name "testfile1" -Value "My file "

New-Item -ItemType "HardLink" -Path "X:\\" -Name "file_hardlink1" -Value "X:\\testdir1\\testfile1"

New-Item -ItemType "SymbolicLink" -Path "X:\\" -Name "file_symboliclink1" -Value "X:\\testdir1\\testfile1"

New-Item -ItemType "Junction" -Path "X:\\" -Name "directory_symboliclink1" -Value "X:\\testdir1"

New-Item -ItemType "File" -Path "X:\\" -Name "ads"
Add-Content -Path "X:\\ads" -Stream "myads" -Value "My ADS "

Dismount-VHD -DiskNumber ${VirtualDisk}.Number

# Create an image with logical sector size of 4096 bytes and a phyical sector size of 512 bytes
# TODO: determine why New-VHD does not allow the creation of an image with these parameters.

