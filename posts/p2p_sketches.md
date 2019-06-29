---
pageTitle: Peer-to-Peer Sketchbook
layout: layout.njk
date: 2019-06-25
---

# Really Simple Grid Maps

## Background

In 1985, **Sting** was rocking hard ...  

<img src="/img/maps/Sting2.jpg" width=500>

... but the **Global Positioning System (GPS)** ... wasn't really a thing for most people!  People were still zooming about, of course, in cars and planes and boats and and horses and tuktuks ...

<img src="/img/maps/tuktuk.jpg" width=500>

... but one wonders -- how did they *possibly* find their way about, without GPS? 

Well -- they often used paper maps!   

<img src="/img/maps/salt_lake.png" width=500>

Oh but hey! you say, what are those weird boxes on that image? Well, if you're doing everything with paper, you can't just 'zoom in / zoom out' ... you need other ways of referencing subsets of data (notice that legend at the bottom of the map, with a rectangle that says "Corresponds to page in atlas") ...

In the era of hyperlinked GPS data, drawing custom boxes must seem like a lot of work, and not very fun.  Indeed, there was a more common, simpler technique: simply overlay a grid on any map:

<img src="/img/maps/florida.png" width=500>

Notice the letters along the left and right sides of the map, and the numbers along the top and bottom -- this makes indexing particular places on the map very easy in the 'INDEX' at the bottom!

And note -- it's not 'either-or' -- you can even have overlapping coordinate systems! See how in this map they've used their own custom grid overlay *and* latitude / longitude:

<img src="/img/maps/mexico.png" width=500>

## Why Grid Maps Today?

So, in the era of GPS, are grid maps still useful? In some cases, yes!  Here are some reasons to consider using them:


### Resilient for Offline Usage 

On a mundane level: it's possible that you're unable to get a stable GPS signal on your navigation device.  Sometimes this happens in cities; certainly it happens indoors!

But what if things go *really* poorly, and -- your GPS device runs out of batteries? Or malfunctions? Or you don't have a GPS device handy?

You can print out a copy of a grid map, and it works!

### Decentralized

When it comes down to it, the satellite network is an example of a 'centralized, single-point-of-failure' system -- if there's something wrong with it, there's not much for you do about it.  We can hope that the satellite companies maintain the system well -- and certainly, there are a lot of strong incentives for them to do so!  So this might not be too much of a worry (unless, eeep, there's a solar flare or something ...)

### Accessible for Users 

On the one hand, GPS-enabled devices provide us with a very simple, magical navigation interface -- often directions are very intuitive on them.  

On the other hand: it is relatively difficult for end users to reason about latitude and longitude coordinates.  Do you know what your current lat / lon is? Even approximately? If you're like most, you would need a GPS system to tell you!  More intuitive and accessible grid systems (a square grid in accessible units like "1,2,3" or "A,B,C") mean that users can quickly ascertain "I'm within block D-3, near the water tower", using language and concepts that are accessible to most, and usually sufficient for everyday location / navigation purposes.

### Resilient for Offline Use

Talk about "offline first" -- if you print out a grid map, you don't even need a computer!

### Accessible for Developers

Not everyone is excited about the challenge of managing map projections in order to manage latitude and longitude coordinates -- but most programmers can index a square grid in their sleep!

### Generic Application

So, this is maybe the most exciting reason for reconsidering the humble 'grid map':  it can be applied to pretty much *anything*.  

For example:  let's say that you're on a hike, and you're given a nice hiking map, on paper:

<img src="/img/maps/wolfesneck.png" width=600>

How do you talk about this map with your friends?  You basically need to point at it, together -- or say things like "So let's meet at this picnic spot that is sort of on the top left of the peninsula near the bottom of the lake ..."

But if you just draw a grid on it:

<img src="/img/maps/wolfesneck_grid.png" width=600> 

Now you've got an easy way to refer to locations!  "Let's meet on the trail at G,12 in an hour from now."

Okay, that might not be as exciting if you're thinking "look I'll just hope for GPS, this is goofy."

But what about this:  let's say that someone with local knowledge does you a kind favor and sketches out a hand-drawn map of the hike, with points of interest:

<img src="/img/maps/hand_drawn_trail.jpg" width=600>

How are you going to apply latitude / longitude to this, haha?  BUT if you just draw a grid overlay:

<img src="/img/maps/trail_grid.png" width=600>

Now you can say "Let's head to 'The Dome' at G-14"!

The real magic of this is when we apply this technique to situations where GPS really isn't a great solution at all, even if it were available.  For example, the floorplan of a warehouse or a greenhouse:

<img src="/img/maps/greenhouse_grid.png" width=600>

## P2P Implementation ... ?

What if we were to make a simple "grid map" system for decentralized p2p devices?  

One simple idea would be to simply store a map image -- which could be a simple bitmapped image -- along with some very simple metadata around the type of grid one wants to apply.  

For example:

- `wolfesneck.png` could be the original image file; and
- `wolfesneck.json` could be the metadata file

where `wolfesneck.json` tells us what kind of grid to apply to the image:

```
{
'ref': 'ax3dj388g8djj38fj83jf',
'num_xticks': 20,
'xticks_style': 'alpha'
'num_yticks': 30,
'xticks_style': 'number'
}
```

... or something like that.  The key would be that you could always have the map image associated with a particular grid configuration, so that computerized systems could always reproduce the grid and the image together consistently.

My sense is that the sort of 'unique hash identifier' functionality that the [dat protocol](https://github.com/datproject) provides out of the box could easily be leveraged for this sort of thing.

Then, once it's easy to refer to 'canonical' versions of these 'grid-maps', people could use p2p chat protocols like [cabal](https://cabal.chat/) to send simple updates of their location to one another -- which will also work easily 'offline'.

What do you think? 



























