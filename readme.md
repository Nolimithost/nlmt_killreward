# nlmt_killreward

`nlmt_killreward` is a lightweight FiveM script that grants players a reward whenever they eliminate another player.  
It now supports **ESX** or **txAdmin events**, with rewards handled via **ox_inventory**.  

**Hosting & Support**

This script is created and maintained by **NolimitHost**. Use code **WELCOME** at checkout to receive **10% off** your first month of FiveM hosting!

* **Website:** [https://nolimithost.cc/fivem-hosting](https://nolimithost.cc/fivem-hosting.html)  
* **Discord:** [discord.nolimithost.cc](https://discord.nolimithost.cc)

**Features**

* Automatically rewards players upon killing another player.
* Supports ESX or txAdmin event handling.
* Uses **ox_inventory** for item/money rewards.
* Fully configurable reward amount and item type via `config.lua`.
* Lightweight and easy to integrate into any server setup.

**Installation**

1. Clone this repository into your resources folder:

```bash
git clone https://github.com/Nolimithost/nlmt_killreward.git
````

2. Add the resource to your `server.cfg`:

```cfg
ensure nlmt_killreward
```

3. Restart your server or start the resource manually:

```cfg
ensure nlmt_killreward
```

**Configuration**

* Open `config.lua` to set:
  * Reward item
  * Whether to hook into ESX or txAdmin events
* Requires **ox_inventory** for reward distribution.