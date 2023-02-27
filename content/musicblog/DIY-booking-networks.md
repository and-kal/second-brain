---
title: "Creating a networking infrastructure for bookings in DIY contexts"
date: "2023-02-23"
draft: true
---

As someone, who's been setting up DIY shows in punķ venues and self-organized spaces for almost a decade now, I was always confronted with the issue that I get a lot of booking requests from cool bands who are looking for a gig in my town or who are planning a tour and are looking for venues and promoters in Germany and around. Usually, I can't set up more than two gigs per month, so I often end up handing over some email addresses of people I think might be up for setting up a show to the band or recommend them some venues that they should try and write to. Sometimes this works out and sometiems it doesn't. 

I also kept an excel sheet for a while, where me and a friend collected all relevant venues and mail addresses of DIY promoters in Germany, France, Poland and Czech Republic and Italy and would sometimes send this sheet to the bands so they can give it a shot. There were a couple of problems with that: 
1) The amount of addresses that piles up over time, at least for cities like Berlin, can be enormous, so as a band you're tempted to write a generic, impersonal email to all these addresses instead of the usual "hey, i got your contact from [this and that DIY promoter] who mentioned that you miht be able to set up a show for my band" and the recipients might feel spammed or at least just as overwhelmed by the amount of booking requests they get as I sometimes am - and when those emails are piling up, you sometimes find yourselves sitting in front of the computer all evening writing "sorry i can't help you out with a show during that time" replies.
2) 

I was thinking of some strategies how to improve this whole situation by providing some sort of networking infrastructure where bands and promoters can connect. That's not such an easy thing to do since there's certain requirements that I figured out:
A) My first idea was to create some sort of platform, where bands and promoters can sign up and log in. Bands can then create a profle with links and bios, their touring schdule and their vacancies and all that, while promoters (and venues) can have a profile with some information about them. But the problem I see here is that it's hard to keep people engaged with such a platform. It might sound like a good idea on paper, but people are already registered on so many networks and platforms, that they're not likely to login to this one regularly, but more likely to abandon it after a while. 
B) ...
C) Some promoters want to stay anonymous, because the shows they set up or the venues where they're active are illegal or at least there shouldn't be much information out in the open.

My not-very-well-thought-through idea for the present was to find a solution where people can stick to the tools they already use and only  have a little bit of extra overhead. So the obvious solution would be to resort to using emails again. I'm just playing around with some ideas here, but maybe such a networking tool could work something like this:
> We create a database where we can store all the information about the bands as well as about the promoters. 
    For bands it's name, links, bio, where they are planning to tour (by country or by vity?) and when.
    For promoters it's email address, city they set up shows in and if they are currently active.
> We create a minimal frontend with a form where bands can enter their information and submit it to the database. Since the form should out in the open (no registering required; see above) these submission need to be approved by the admins before entering (or leaving) the database.
> For the database of promoters we contact all the people from our excel sheet, propose our idea and ask them permission to enter our database. They can do so by sending an email to our mail server with "SUBSCRIBE" in the subject field or something. They are also able to unsubscribe or set their status to "PAUSED" so they won't get any emails until they opt-in again.
> Once every two weeks (or every four?) we send an email to the promoters, who have opted-in with, a collection of booking requests and touring plans relevant to their location. The email can be created and send automatically by matching the location the bands entered with the location the promoters have in their database table. 

Problems unsolved:
* People might receive very long emails, especially when they're from cities like Berlin, where all the touring artists want to play. It's also not genre-specific, so that punk and hardcore promoters would also receive information about touring ambient electronics acts.
* It's quite impersonal and I have a hunch that it's more likely someone is willing to set up a gig for a band when they receive a personal email from them. So maybe it would be nice to introduce one further step: promoters can check which bands they find interesting and opt-in for their mail address being given to them. The bands will then receive the promoter's mail address and can get in touch directly. 

I now my suggestions are not perfect, so I'm happy about any feedback. The thing is that I don't know of any examples from other countries or scenes where people have worked out an efficient networking strategy and it's tricky to start at zero. If anyone got ideas to share about this or examples from other contexts, please let me know. 