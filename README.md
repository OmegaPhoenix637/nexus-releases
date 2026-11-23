# Nexus releases

Builds of the Nexus apps. This repository only holds release files and the update feeds; the source code is private.

- `manifest.json` — update feed for the Nexus Hub (Windows, Android). Every file is signed with Ed25519; the Hub
  rejects anything whose signature or SHA-256 does not match.
- `sidestore.json` — SideStore/AltStore source for iPhone. Add this URL in SideStore → Sources:
  `https://raw.githubusercontent.com/OmegaPhoenix637/nexus-releases/main/sidestore.json`

The apps require a one-time activation code per device.

## Install the Nexus Hub on Windows

Open PowerShell and run:

```powershell
irm https://raw.githubusercontent.com/OmegaPhoenix637/nexus-releases/main/install.ps1 | iex
```

This downloads the latest Hub, checks its SHA-256 and installs it for the current user, without the SmartScreen
prompt you get when running a downloaded installer from the browser. After that, the Hub installs and updates all
apps (and itself) automatically.
