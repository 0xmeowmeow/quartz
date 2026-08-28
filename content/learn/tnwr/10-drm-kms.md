---
title: DRM/KMS — taking the display
doc: tnwr design brief
source: https://github.com/dvdhrm/docs/tree/master/drm-howto
chapter: 10
priority: 2
project: learn
tags: [study, tnwr, display, slice-one]
status: todo
---

# 10. DRM/KMS

The kernel VT is 16 colours and a fixed bitmap font, which kills every
aesthetic requirement in the brief. The resolution is not to use the VT's
terminal emulator: take the VT, become DRM master, mode-set, and render on the
GPU yourself.

- drm-howto and `modeset.c`, about 500 lines of C:
  <https://github.com/dvdhrm/docs/tree/master/drm-howto>
- Read it as a story, for the nouns, not the syntax.

## Check it yourself

- [ ] Build and run `modeset.c` from TTY2 on Artemis and put a colour on the
      panel. It will fail while Hyprland holds the display — that failure *is*
      the DRM-master lesson, so record the exact error before you fix it.
- [ ] Write the five nouns in order with one clause each: device, connector,
      encoder, CRTC, framebuffer.
- [ ] Enumerate connectors on Artemis and on the Rock 4D and note the
      difference. Artemis routes HDMI through the NVIDIA GPU, not the Intel
      iGPU — confirm that in the connector list rather than taking it on trust.

## The gotcha

> DRM master is exclusive: one process at a time owns modesetting on a device.
> The mechanism is that the kernel grants master to the first opener and
> refuses everyone else, so the failure is not a rendering bug — it is a
> permissions-shaped error at open time. The symptom is `Permission denied` or
> `Device or resource busy` from `drmModeSetCrtc` while a compositor is
> running, which reads like a driver problem and is not. The lever: libseat,
> which arbitrates who holds the session, and is also what keeps Ctrl+Alt+F1
> working so you can always escape back to Hyprland.

## Notes

## Questions
