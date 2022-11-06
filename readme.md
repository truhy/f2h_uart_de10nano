# FPGA to HPS UART peripheral (UART-USB) for the Terasic DE10-Nano Development Kit

## Overview

This contains a Quartus Prime Verilog HDL project that demonstrates the FPGA portion directly sending a serial message using the on-board UART-USB which is wired to the HPS side on the DE10-Nano board.  It does so by accessing the HPS UART0 controller (hard-IP) over the FPGA-to-HPS bridge.  This relies on the sdcard with U-Boot to configure the FPGA-to-HPS bridge and serial port during its boot up.

## Running instructions

1. Write the sdcard_de10nano.img to a micro SD card.  Use any of these:
   - Win32 Disk Imager (https://sourceforge.net/projects/win32diskimager/)
   - Rufus (https://rufus.ie/en/)
   - balenaEtcher (https://www.balena.io/etcher/)
2. Connect a USB cable between the UART-USB connector on the DE10-Nano and your computer
3. Start a serial console program such as PuTTY and set it to serial mode, 115200 baud, 8 data bits, 1 stop bit, no parity, no control flow
4. Insert the micro SD card into the DE10-Nano and turn on the 5V power supply
5. Wait for U-Boot to boot up.  You should see a bunch of U-Boot messages and then stop with a console prompt
6. If the FPGA is configured LED7 should be blinking now
7. Press and release key0 on the DE10-Nano and you should see a hello message - this comes directly from the FPGA side!

Note, I've configured U-Boot so it doesn't boot to a Linux system or a user baremetal application.

## Main files

| File                             | Description                                         |
| -------------------------------- | --------------------------------------------------- |
| sdcard_image/sdcard_de10nano.img | A prebuilt SD card image                            |
| f2h_uart_tx.qpf                  | Quartus Prime project file                          |
| f2h_uart_tx.qsf                  | Quartus Prime settings file                         |
| top.v                            | Top level Verilog file                              |
| uart_dev.v                       | UART device Verilog module                          |
| rd_axi.v                         | Basic read axi helper Verilog module                |
| wr_axi.v                         | Basic write axi helper Verilog module               |
| clk_div.v                        | Clock divider for creating slow clocks              |
| debounce.v                       | Key or switch debounce Verilog module               |

## The SD card image is built using the following software versions

- [Ubuntu 22.04.1 LTS 64bit](https://ubuntu.com/download/desktop)
- [Quartus Prime 21.1 Lite Edition for Linux](https://www.intel.co.uk/content/www/uk/en/software/programmable/quartus-prime/download.html)
- [Quartus SoC EDS 20.1 for Linux](https://fpgasoftware.intel.com/soceds)
- [U-Boot source, tag v2022.01](https://github.com/u-boot/u-boot/tree/v2022.01)
- [GNU Arm Embedded Toolchain 10.3-2021.07 for Linux x86 64](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads)

Older versions should work just as well, but for older Quartus you'll need to create a new project:
- add the Verilog files (.v)
- add pin assignment settings using a text editor in Quartus file (.qsf) or recreate the pin assignments (matching DE10-Nano) using Quartus Prime Pin Planner or Assignment Editor
- configure HPS in Platform Designer (Qsys in older versions)

## Building a SD card image

Follow this nice guide on how to build U-Boot and SD card image:<br />
https://rocketboards.org/foswiki/Documentation/BuildingBootloaderCycloneVAndArria10

Amend it with this guide to boot FPGA .rbf file from a U-Boot script:<br />
https://github.com/zangman/de10-nano/wiki/Creating-a-Bootscript

Alternatively use my bash shell scripts and patch files located in the scripts folder

## For more info and other projects

Visit my personal website for a little more info at:<br />
https://truhy.co.uk
