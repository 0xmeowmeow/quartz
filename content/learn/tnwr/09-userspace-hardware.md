---
title: Userspace hardware access — a process that exposes registers is the driver
doc: tnwr design brief
source: https://www.kernel.org/doc/html/latest/driver-api/uio-howto.html
chapter: 9
priority: 2
project: learn
tags: [study, tnwr, hardware, slice-two]
status: todo
---

# 09. Userspace hardware access

In tnwr, a userspace process exposing registers as nodes **is** the driver.
No kernel build, no reboot, editable while running. This is ecwatch with a
wider aperture.

- UIO: <https://www.kernel.org/doc/html/latest/driver-api/uio-howto.html>
- libgpiod: <https://libgpiod.readthedocs.io/>
- spidev / i2c-dev: `Documentation/spi/spidev.rst`, `Documentation/i2c/dev-interface.rst`
- VFIO: <https://www.kernel.org/doc/html/latest/driver-api/vfio.html>

**Sacrificial boards only.** NanoPi M1 or Banana Pi M2 Zero. Not the Rock 4D,
not the Orange Pi 5 Max.

## Check it yourself

- [ ] On a sacrificial NanoPi: toggle a GPIO from userspace with libgpiod and
      confirm it on an LED or scope. Working blink or it did not happen.
- [ ] `mmap` one peripheral register block through `/dev/mem`, read it, and
      diff the values against the TRM's reset values. Any register that differs
      from its documented reset value is something the bootloader configured —
      write down which.
- [ ] Generate the tier-3 blocklist: grep the mainline DTS for your SoC for
      `efuse`, `nvmem`, `regulator`, `mmc` and `spi-nor` compatible strings,
      and write out the address ranges. This is the blocklist the explorer
      refuses by default, and it is derived, not hand-curated.

## The gotcha

> Three register regions are permanent and completely unsymbolled — nothing on
> the page distinguishes them from the hundreds of harmless writes either side.
>
> **OTP / eFuse** blows one-way. Some SoCs carry secure-boot and JTAG-disable
> fuses; one write and that silicon is permanently restricted, with no undo at
> any price. **PMIC / regulator** registers set core voltage; an out-of-range
> write degrades or kills the die, and it can be a slow death presenting as
> flakiness weeks later, so you will not connect the cause to the effect.
> **Boot-media controller** registers can corrupt the boot flash and put the
> board out of reach of software recovery.
>
> Levers, in order: derive the blocklist and refuse those ranges by default so
> reaching them is a deliberate act rather than a cursor position · read-only
> by default with an explicit arm for writes · snapshot-restore around every
> write · **locate the maskrom / recovery test point before you start**, which
> is what turns boot-flash corruption from a bin into a soldering job.
>
> Everything else in register poking is reversible by power cycle.

## Notes

## Questions
