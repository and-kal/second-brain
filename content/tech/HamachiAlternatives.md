---
title: "Virtual gaming networks with something other than Hamachi"
date: "2023-01-10"
draft: false
---

Though I ain't much of a gamer anymore, I was interested to check what kind of strategies people use these days for creating virtual gaming networks and was surprised to see that LogMeIn's Hamachi, which I've used in the 00's at private LAN parties or when playing games via ISDN connection, is still utilized a lot. Other options are commercial VPN providers, some of which have specialized in offering gaming networks.

However, my intuition was that you can also use Wire Guard-based tools these days for building gaming networks. And [apparently you can](https://tailscale.com/blog/hamachi/). Here's two applications I cam across:

- [innernet](https://github.com/tonarino/innernet)
- [Tailscale](https://tailscale.com/blog/hamachi/)

I'll post my experiences with these two here eventuall, when I've tried them out.

Note that, Tailscale provides a default coordination/control server with some limitations. For example you can only have one user account, so if your gaming via Tailscale, you'll all need to log in to the same account. That being said, when you don't trust your co-players or when your infrastructure scales, you might consider hosting your own control server with [headscale](https://github.com/juanfont/headscale) or paying for a Tailscale plan. `innernet` however is completely free and self-hosted by default.
