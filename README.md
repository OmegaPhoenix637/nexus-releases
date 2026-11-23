# Nexus releases

Builds of the Nexus apps. This repository only holds release files and the update feeds; the source code is private.

- `manifest.json` — update feed for the Nexus Hub (Windows, Android). Every file is signed with Ed25519; the Hub
  rejects anything whose signature or SHA-256 does not match.
- `sidestore.json` — SideStore/AltStore source for iPhone. Add this URL in SideStore → Sources:
  `https://raw.githubusercontent.com/OmegaPhoenix637/nexus-releases/main/sidestore.json`

The apps require a one-time activation code per device.
