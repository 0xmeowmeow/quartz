---
title: The device tree is already the graph
doc: tnwr design brief
source: https://www.devicetree.org/specifications/
chapter: 8
priority: 2
project: learn
tags: [study, tnwr, hardware, slice-two]
status: todo
---

# 08. Device tree

**You have a live problem here.** Four boards that half-work. The cause is
almost never "nobody wrote a driver" — it is almost always missing
*description*.

- Spec: <https://www.devicetree.org/specifications/>
- `dtc` is in Debian: `apt install device-tree-compiler`
- linux-sunxi wiki — twenty years of exactly this knowledge:
  <https://linux-sunxi.org/Main_Page>

Vendor kernels are GPL. The source has to be available, and the driver is
usually already in it.

### What is actually wrong, by frequency

| Cause | Effort |
|---|---|
| Driver exists upstream, DT never references the device | hours — an overlay |
| Driver exists for a sibling SoC, needs a compatible string + quirk | small patch |
| Vendor wrote it for 4.19, needs forward-porting | days, mechanical |
| Register-level peripheral, TRM published | writable from the datasheet |
| Needs a signed firmware blob | extract from the vendor image |
| Undocumented silicon | reverse engineering — rare on Rockchip/Allwinner |

## Check it yourself

- [ ] For each of the four boards: pull the vendor DTB from the boot
      partition, `dtc -I dtb -O dts`, diff against the mainline DTS. Record the
      count of differing nodes per board. Five minutes each.
- [ ] Read `/sys/kernel/debug/devices_deferred` on every board and paste the
      output into this note. That file is a literal list of hardware that did
      not come up.
- [ ] Pick one non-working peripheral and name which row of the table above it
      is in. One row, stated flatly.

## The gotcha

> Copying nodes from a vendor DTS into a mainline DTS produces a device tree
> that compiles cleanly and silently does nothing. The mechanism: vendor trees
> reference vendor-only bindings and vendor-only compatible strings, and `dtc`
> validates syntax, not semantics — an unknown compatible string is not an
> error, it just never matches a driver. The symptom is a successful build, a
> clean boot, and no device. The lever: before copying a node, grep
> `Documentation/devicetree/bindings/` in the mainline tree for its compatible
> string. If it is not there, no driver will ever bind to it.

## Notes

## Questions
