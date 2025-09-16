# nlmt_killreward

`nlmt_killreward` is a lightweight FiveM script that grants players a reward whenever they eliminate another player. Currently, it supports **ESX** only, with potential for a standalone version in the future.

**Hosting & Support**

This script is created and maintained by **NolimitHost**. Use code **WELCOME** at checkout to receive **10% off** your first month of FiveM hosting!

* **Website:** [https://nolimitHost.cc/fivem](https://nolimithost.cc/fivem-hosting.html)
* **Discord:** [discord.nolimithost.cc](https://discord.nolimithost.cc)

**Features**

* Automatically rewards players upon killing another player.
* Fully configurable reward amount via the server-side configuration.
* Lightweight and easy to integrate into existing ESX servers.

**Installation**

1. Clone this repository into your resources folder:

```bash
git clone https://github.com/Nolimithost/nlmt_killreward.git
```

2. Add the resource to your `server.cfg`:

```cfg
ensure nlmt_killreward
```

3. Restart your server or start the resource manually:

```cfg
ensure nlmt_killreward
```

**Configuration**

* Open `config.lua` to set the reward amount and other options.
* Ensure ESX is running and properly configured to handle money rewards.