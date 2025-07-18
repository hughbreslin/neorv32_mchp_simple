# NeoRV32 Hello World On Microchip FPGA

This repository contains a simple design and software application to show the implementation of NeoRV32 in a Microchip FPGA. All tools will use free or no licenses.

Check out the [NeoRV32 GitHub](https://github.com/stnolting/neorv32) for more information.

## Contents

- [Supported Devices](#supported-devices)
- [Structure](#structure)
  - [FPGA Design](#fpga-design)
  - [Embedded Software](#embedded-software)
- [Running Hello World](#running-hello-world)
  - [Tools Required](#tools-required)
  - [Generating the FPGA Design](#generating-the-fpga-design)
  - [Building an Application in SoftConsole](#building-an-application-in-softconsole)
  - [Debugging an Application](#debugging-an-application)
- [Benchmarks](#benchmarks)

## Supported Devices

The design generated via this repository targets the [PolarFire SoC Discovery Kit](https://www.microchip.com/en-us/development-tool/mpfs-disco-kit) but any IGLOO&reg;2, SmartFusion&reg;2, PolarFire&reg; or PolarFire&reg; SoC device should be supported.

## Structure

This workspace contains several files and directories used to generate an FPGA design and embedded software project for NeoRV32. An "images" directory stores all images for this readme.

### FPGA Design

The FPGA design files consist of:

- neorv32_mchp_simple.tcl: this is the main Tcl script to generate a Libero project.
- script: a directory containing exported Tcl scripts used in the design flow.
- neorv32: a submodule of the NeoRV32 repository.

### Embedded Software

The embedded software consists of:

- sc-ws: a SoftConsole project workspace.

## Running Hello World

This section will outline the tool set up, tool flow and steps to run the hello world project with NeoRV32.

### Tools Required

To generate the FPGA design Libero SoC and a license will be required.

- Libero SoC can be downloaded [here](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/fpga/libero-software-later-versions), these scripts have been tested with 2025.1.
- A Libero SoC free silver license can be obtained [here](https://www.microchipdirect.com/fpga-software-products).
  - For more information see the [Libero SoC License Installation Guide](https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/swdocs/libero/Libero_Installation_Licensing_Setup_User_Guide_2025_1.pdf).

To generate embedded software using the included workspace SoftConsole and OpenOCD will be required.

- SoftConsole is available [here](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/soc-fpga/softconsole).

**_NOTE:_** SoftConsole does include OpenOCD but this version does not support the NeoRV32 debugger, a newer OpenOCD release will be required to use NeoRV32.

- OpenOCD with NeoRV32 support is available [here](https://github.com/microchip-fpga/openocd/releases/tag/v0.12.0-mchp.0.0.1).
  - On Windows [USB Driver Tool](https://visualgdb.com/UsbDriverTool/) will also be required.

### Generating the FPGA Design

To generate the FPGA design ensure you have Libero installed with a valid license.

1. Clone this repository and ensure submodules have been initialized.

    ```bash
    git clone https://github.com/hughbreslin/neorv32_mchp_simple.git
    cd ./neorv32_mchp_simple
    git submodule init
    git submodule update
    ```

2. Launch Libero SoC.

3. Open the run script dialog (CTRL + U) and run the `neorv32_mchp_simple.tcl` script from this directory.

![A gif](./images/gen_proj.gif)

**_NOTE:_** default I/O constraints for UART0 and PWM[6:0] are automatically imported.

**_NOTE:_** default clock constraints for JTAG / system clocks are imported or derived.

**_NOTE:_** the bootrom component is automatically initialized with a copy of the NeoRV32 bootloader built for RV32I.

**_NOTE:_** it is easier to view the SmartDesign if the "Auto Arrange Layout" option is run.

![A button](./images/auto_arrange_layout.png)


4. At this stage NeoRV32 can be configured as required by double clicking on the `neorv32_libero_ip_0` component.

**_NOTE:_** Libero only supports integer or natural types in configurators, for this reason all boolean parameters are converted to ints in the wrapper file.

5. It is recommended to run the "Verify Timing" stage of the design flow.

6. Select "Run PROGRAM Action" from the design flow.

### Integrating NeoRV32 into a Custom Design

The NeoRV32 source repository contains an [RTL integration script](https://github.com/stnolting/neorv32/blob/main/rtl/system_integration/neorv32_libero_ip.tcl). To use NeoRV32 in your own design:

1. Clone the source repository
2. In Libero run the integration Tcl script
3. The NeoRV32 library should now be availble in your Design Hierarchy

### Building an Application in SoftConsole

This repository includes a SoftConsole workspace with a pre-configured sample application.

1. Open SoftConsole and in the launcher point to the "sc-ws" directory in this repository.

![A launcher](./images/sc_launch.png)

2. This project links to all of the NeoRV32 demo projects available - they are available in `src/demos`

![SoftConsole projects](./images/sc-projects.png)

3. By default the PWM example is selected as PWM is enabled in the demo design - you can build the project by using `CTRL + B`.

4. This build is configured for RV32I as a build, this can be changed from the project properties, right click on the project folder and select "Properties".

![Project properties](./images/sc-properties.png)

5. The application will be built in `NeoRV32/`.

6. Other demos can be selected by exlcuding the current demo from a build and including the desired demo:

    - Right click on the current demo and open `Resource Configurations -> Exclude from Build`.

    ![SoftConsole exclude resource](./images/sc-exclude-resource.png)

    - Select the "NeoRV32" option.

    ![SoftConsole exclude resource 1](./images/sc-exclude-resource-1.png)

    - Right click on the desired demo and open `Resource Configurations -> Exclude from Build`.

    ![SoftConsole include resource](./images/sc-include-resource.png)

    - Deselect the "NeoRV32" option.

    ![SoftConsole include resource 1](./images/sc-include-resource-1.png)

    - Build the project with `CTRL + B`.

#### Debugging an Application

To debug a NeoRV32 core a newer OpenOCD version to the standard version bundled with SoftConsole needs to be used and can be downloaded [here](https://github.com/microchip-fpga/openocd/releases/tag/v0.12.0-mchp.0.0.1) - this is the same link that was provided previously.

1. Download and extract the OpenOCD v0.12.0-3 release for your machine.

2. Open the SoftConsole debug configurations.

![Debug option](./images/sc-debug.png)

3. Double click on "GDB OpenOCD Debugging" to create a new debug configuration.

![Debug config](./images/sc-debug-config-1.png)

4. If the "Project" entry is unset you can select the project by using the "Broswe" option

![Debug Config Project](./images/sc-debug-config-3.png)

4. In the "Debugger" tab ensure "Start OpenOCD locally" is selected and update the "Executable path" to point to the OpenOCD that was downloaded previously and update the "Config options" to

    --file ${workspace_loc}/microchip_riscv.cfg

![Debug config](./images/sc-debug-config-2.png)

5. On Windows:
  - launch "USB Driver Tool".
  - Locate "USB FP5 Serial Converter A", right click and select "Install WinUSB".

![USB Driver Tool](./images/usbdt.png)

  - **_NOTE:_** this step should be reverted and the default "USB FP5 Serial Convertor A" driver restored to program the FPGA.

![USB Driver Tool](./images/usbdt-restore.png)

6. In SoftConsole click apply the settings and select "Debug".

![SoftConsole Debug](./images/sc-debug.gif)

## Benchmarks

The following table contains benchmarks of the NeoRV32 in different configurations using this design, resource values are for the core only unless stated otherwise:

| RV Extensions | Execution Memory | Performance Options                                                                                                                                                                                                                                   | Peripherals                            | CLK    | 4LUT                         | DFF                         | Core LE total | uSRAM | LSRAM | MACC | Logic elements<br> after P&R | Coremark | Coremark/MHz | Code Size |
|---------------|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------|--------|------------------------------|-----------------------------|---------------|-------|-------|------|------------------------------|----------|--------------|-----------|
| RV32I         | IMEM             | - -03<br> - IMEM_EN<br> - IMEM_SIZE 65536<br> - DMEM_EN<br> - DMEM_SIZE 16384<br>                                                                                                                                                                     | - Debug<br> - UART x1<br> - PWM x7<br> | 100MHz | Core: 4996<br> Design: 8292  | Core: 3617<br> Design: 5857 | 8613          | 10    | 40    | 0    | 8955                         | 32.8     | 0.33         | 0xae54    |
| RV32I**C**    | IMEM             | - -03<br> - IMEM_EN<br> - IMEM_SIZE 65536<br> - DMEM_EN<br> - DMEM_SIZE 16384<br>                                                                                                                                                                     | - Debug<br> - UART x1<br> - PWM x7<br> | 100MHz | Core: 5199<br> Design: 8495  | Core: 3645<br> Design: 5885 | 8844          | 10    | 40    | 0    | 9114                         | 33.3     | 0.33         | 0x825c    |
| RV32I**M**C   | IMEM             | - -03<br> - IMEM_EN<br> - IMEM_SIZE 65536<br> - DMEM_EN<br> - DMEM_SIZE 16384<br>                                                                                                                                                                     | - Debug<br> - UART x1<br> - PWM x7<br> | 100MHz | Core: 5618<br> Design: 8977  | Core: 3813<br> Design: 6053 | 9431          | 10    | 40    | 0    | 9628                         | 60.6     | 0.61         | 0x7e54    |
| RV32IMC       | IMEM             | - -03<br> - IMEM_EN<br> - IMEM_SIZE 65536<br> - DMEM_EN<br> - DMEM_SIZE 16384<br> - **ICACHE_EN**<br> - **ICACHE_NUM_BLOCKS 256**<br> - **DCACHE_EN**<br> - **DCACHE_NUM_BLOCKS 256**<br> - **CACHE_BLOCK_SIZE 64**<br>                               | - Debug<br> - UART x1<br> - PWM x7<br> | 100MHz | Core: 8104<br> Design: 11516 | Core: 5113<br> Design: 7405 | 13217         | 10    | 58    | 0    | 12181                        | 58.8     | 0.59         | 0x7e54    |
| RV32IMC       | IMEM             | - -03<br> - **CPU_FAST_MUL_EN**<br> - IMEM_EN<br> - IMEM_SIZE 65536<br> - DMEM_EN<br> - DMEM_SIZE 16384<br> - ICACHE_EN<br> - ICACHE_NUM_BLOCKS 256<br> - DCACHE_EN<br> - DCACHE_NUM_BLOCKS 256<br> - CACHE_BLOCK_SIZE 64<br>                         | - Debug<br> - UART x1<br> - PWM x7<br> | 100MHz | Core: 8237<br> Design: 11619 | Core: 5107<br> Design: 7399 | 13344         | 10    | 58    | 0    | 12285                        | 71.4     | 0.71         | 0x7e54    |
| RV32IMC       | IMEM             | - -03<br> - CPU_FAST_MUL_EN<br> - **CPU_FAST_SHIFT_EN**<br> - IMEM_EN<br> - IMEM_SIZE 65536<br> - DMEM_EN<br> - DMEM_SIZE 16384<br> - ICACHE_EN<br> - ICACHE_NUM_BLOCKS 256<br> - DCACHE_EN<br> - DCACHE_NUM_BLOCKS 256<br> - CACHE_BLOCK_SIZE 64<br> | - Debug<br> - UART x1<br> - PWM x7<br> | 100MHz | Core: 8292<br> Design: 11674 | Core: 5253<br> Design: 7545 | 13545         | 10    | 58    | 4    | 12352                        | 90.9     | 0.91         | 0x7e54    |
| RV32IMC       | IMEM             | - -03<br> - CPU_FAST_MUL_EN<br> - CPU_FAST_SHIFT_EN<br> - IMEM_EN<br> - IMEM_SIZE 65536<br> - DMEM_EN<br> - DMEM_SIZE 16384<br>                                                                                                                       | - Debug<br> - UART x1<br> - PWM x7<br> | 100MHz | Core: 5844<br> Design: 9140  | Core: 3953<br> Design: 6193 | 9797          | 10    | 40    | 4    | 9832                         | 90.09    | 0.91         | 0x7e54    |
| RV32IMC       | IMEM             | - -03<br> - CPU_FAST_MUL_EN<br> - CPU_FAST_SHIFT_EN<br> - **CPU_RF_HW_RST_EN**<br> - IMEM_EN<br> - IMEM_SIZE 65536<br> - DMEM_EN<br> - DMEM_SIZE 16384<br>                                                                                            | - Debug<br> - UART x1<br> - PWM x7<br> | 100MHz | Core: 7185<br> Design: 10481 | Core: 4959<br> Design: 7199 | 12144         | 0     | 40    | 4    | 11709                        | 90.09    | 0.91         | 0x7e54    |
| RV32IMC       | **XBUS (LSRAM)** | - -03<br> - CPU_FAST_MUL_EN<br> - CPU_FAST_SHIFT_EN<br> - CPU_RF_HW_RST_EN<br> - DMEM_EN<br> - DMEM_SIZE 16384<br>                                                                                                                                    | - Debug<br> - UART x1<br> - PWM x7<br> | 100MHz | Core: 5978<br> Design: 12915 | Core: 3829<br> Design: 8866 | 9807          | 0     | 8     | 4    | 14270                        | 25.32    | 0.25         | 0x7e54    |
| RV32IMC       | XBUS (LSRAM)     | - -03<br> - CPU_FAST_MUL_EN<br> - CPU_FAST_SHIFT_EN<br> - DMEM_EN<br> - DMEM_SIZE 16384<br>                                                                                                                                                           | - Debug<br> - UART x1<br> - PWM x7<br> | 100MHz | Core: 4624<br> Design: 11561 | Core: 2823<br> Design: 7860 | 7447          | 10    | 8     | 4    | 12322                        | 25.32    | 0.25         | 0x7e54    |
| RV32IMC       | XBUS (LSRAM)     | - -03<br> - CPU_FAST_MUL_EN<br> - CPU_FAST_SHIFT_EN<br> - ICACHE_EN<br> - ICACHE_NUM_BLOCKS 256<br> - **DCACHE_EN**<br> - **DCACHE_NUM_BLOCKS 256**<br> - CACHE_BLOCK_SIZE 64<br>                                                                     | - Debug<br> - UART x1<br> - PWM x7<br> | 100MHz | Core: 6792<br> Design: 13140 | Core: 3833<br> Design: 8462 | 10625         | 10    | 18    | 4    | 13780                        | 74.07    | 0.74         | 0x7e54    |