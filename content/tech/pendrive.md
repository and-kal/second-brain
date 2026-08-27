---
title: "How to securely insert and inspect a USB pen drive"
date: "2026-08-05"
draft: true
---

Recently, I've found a case with two interesting-looking USB pen drives in it. They looked so enticing and almost screaming "plug me in" that they might as well be some malicious hardware. So I was wondering what is the most secure way of inspecting without compromising my computer. Luckily, next to my main Windows laptop, I've also got some Raspberry Pis and a pretty old Thinkpad with Arch Linux on it, which gives me some options for sandboxing the USB drive.

### Attack vector #1: USB killer

**USB Killer**s are deivces designed to discharge high-voltage into your motherboard, which will fry your computer instantly. There are other possible evil scenarios, where the stick contains some chemicals that will leak out, when the stick is plugged. So depending on your level of suspicion or paranoia, you might have the wear some safety attire before plugging the drive in.

Then you will need a "sacrificial device", like an old **Raspberry Pi** for the initial physical connection. If the pen drive is a USB killer, you will only fry your RPi. Make sure, that there are no important files on the RPi and that it's **not connected to the internet**. Then plug the stick in and see what happens.

### Attack vector #2: "BadUSB"

<!-- TODO: rewrite the following AI-generated text -->

The next threat is a **BadUSB** (like a Rubber Ducky), which identifies itself as a keyboard rather than storage. The moment you plug it in, it "types" malicious commands (like downloading a virus or deleting files) faster than you can react.

**How to handle this on your Arch Linux laptop:**

1.  **Install USBGuard:** This is the best tool for Linux to prevent unauthorized USB behavior.
    ```bash
    sudo pacman -S usbguard
    sudo usbguard generate-policy > /etc/usbguard/rules.conf
    sudo systemctl start usbguard
    ```
2.  **The Benefit:** By default, USBGuard will block any newly connected device. You can then use `usbguard list-devices` to see if the stick is claiming to be a "Keyboard" or a "Mass Storage" device before you "allow" it.

### Phase 3: Software Sandboxing (Malware Isolation)

Once you've confirmed it's not a hardware killer or a fake keyboard, you need to inspect the files without infecting your system.

#### Option A: The Raspberry Pi "Air-Gap" (Highest Security)

1.  **Disconnect the Pi from your network** (no Wi-Fi/Ethernet).
2.  Flash a fresh OS onto the SD card.
3.  Plug the USB into the RPi and mount it as **Read-Only**:
    ```bash
    # Identify the device (e.g., /dev/sdb1)
    lsblk
    # Mount it read-only and prevent execution of any files
    sudo mount -o ro,noexec /dev/sdb1 /mnt/quarantine
    ```
4.  Browse the files. If the RPi gets infected, simply wipe the SD card. **Never** move files from this USB to your main Windows PC.

#### Option B: Virtual Machine Passthrough (On your Arch Laptop)

If you want to use your Arch laptop, use a Virtual Machine (VM) to isolate the drive completely.

1.  **Install `virt-manager` and `qemu`**.
2.  Create a guest VM (e.g., a "Burner" Linux or Windows VM).
3.  **USB Passthrough:** In the VM settings, "Add Hardware" -> "USB Host Device" and select the stick.
4.  **Security Note:** Use **PCIe Passthrough** for the entire USB controller if your hardware supports it. This "hides" the USB hardware from the host OS entirely, making it nearly impossible for malware to escape the VM via a kernel exploit.

### Summary Checklist for Your Setup

1.  **Network:** Turn off Wi-Fi/Ethernet on the inspection machine.
2.  **Physical:** Plug it into the **Raspberry Pi** first (cheapest to lose).
3.  **Logic:** On **Arch**, use `usbguard` to verify the device type (Mass Storage vs. Keyboard).
4.  **Inspection:** Mount as `ro,noexec` or pass it through to a **Virtual Machine**.
5.  **Final Step:** If you find what you need, take a photo of the screen with your phone. **Do not** copy files over to your main system unless you are a professional malware analyst.
