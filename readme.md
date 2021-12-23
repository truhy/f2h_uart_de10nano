# FPGA to HPS UART peripheral (UART-USB) for the Terasic DE10-Nano Development Kit

## Overview

This contains a Quartus Prime Verilog HDL project that demonstrates the FPGA portion directly sending a serial message to the existing UART-USB which is wired to the HPS side on the DE10-Nano board.  It does so by accessing the HPS UART0 controller (hard-IP) over the FPGA-to-HPS bridge.  This initial version relies on U-Boot to configure the serial port during its boot up.  For the next version, I'll try to remove the need for U-Boot by directly configuring the serial port from the FPGA side.

## Running instructions

1. Write the sdcard_de10nano.img to a micro SD card.  Use any of these:
- Win32 Disk Imager (https://sourceforge.net/projects/win32diskimager/)
- Rufus (https://rufus.ie/en/)
- balenaEtcher (https://www.balena.io/etcher/)
2. Connect a USB cable between the UART-USB connector on the DE10-Nano and your computer
3. Start a serial console program such as PuTTY and set it to serial mode, 115200 baud, 8 data bits, 1 stop bit, no control flow
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
| f2h_uart_tx.v                    | Top level Verilog file                              |
| uart_dev.v                       | UART device Verilog module                          |
| rd_axi.v                         | Basic read axi helper Verilog module                |
| wr_axi.v                         | Basic write axi helper Verilog module               |
| clk_div.v                        | Clock divider for debounce Verilog module           |
| debounce.v                       | Key or switch debounce Verilog module               |
| debounce_profile0.v              | Debounce with profile0 preset values Verilog module |

## The SD card image is built using the following software versions

- Ubuntu 20.04.1 LTS 64bit
- [Quartus Prime 21.1 Lite Edition for Linux](https://www.intel.co.uk/content/www/uk/en/software/programmable/quartus-prime/download.html)
- [Quartus SoC EDS 20.1 for Linux](https://fpgasoftware.intel.com/soceds)
- [U-Boot source socfpga fork v2021.07](https://github.com/altera-opensource/u-boot-socfpga)
- [GNU Arm Embedded Toolchain 10.3-2021.07 for Linux x86 64] (https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads)

Older versions should work just as well, but for older Quartus you'll need to create a new project:
- add the Verilog files (.v)
- add pin assignment settings using a text editor in Quartus file (.qsf) or recreate the pin assignments (matching DE10-Nano) using Quartus Prime pin assignment editor
- configure HPS in Platform Designer (Qsys in older versions)

## Building a SD card image

Follow this nice guide on how to build U-Boot and SD card image:
https://rocketboards.org/foswiki/Documentation/BuildingBootloaderCycloneVAndArria10

Amend it with this guide to boot FPGA .rbf file from a U-Boot script:
https://github.com/zangman/de10-nano/wiki/Creating-a-Bootscript

## For more info and other projects

Visit my personal website at:
https://trueapps.co.uk
