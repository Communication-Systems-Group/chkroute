![](http://www.fp7-flamingo.eu/wp-content/uploads/2014/12/flamingo.png)

# chkroute

chkroute is a tool to analyze asymmetric Schengen routing compliance. The tool uses bash, traceroute and/or tracepath, and a geo-location server running at the premises of University of Zurich.

## Dependencies

The following dependencies are required in order to successfully use chkroute:

* Bash
* Netcat
* Tracepath/traceroute

## Installation

The chkroute utility consists of a shell script only (client side). After downloading, the archive must unzipped and then the script must be made executable using chmod ```a+x chkroute.sh```.

On the server side, two scripts are being executed to run the asymmetric measurement: the main script called ```start.sh``` is to be executed, which in turn calls the ```run.sh script```. The .deb file takes care of automatically unpacking and preparing those 2 scripts on the server. Download the .deb file, move it to your server and run from the folder where it is located the following command: ```sudo dpkg -i asymmetric-chkroute_1.0_all.deb```. The server side scripts will be automatically unpacked in ```/home/asymmetric-chkroute```.

Please note that you must also install traceroute (tracepath is installed by default on most unix distributions) if it is not installed.

## Compatibility

The chkroute utility is currently only available for Linux. It should also work on Mac OS X but it has not been tested.

## [Traceroute](https://en.wikipedia.org/wiki/Traceroute)

"Traceroute, by default, sends a sequence of User Datagram Protocol (UDP) packets addressed to a destination host; ICMP Echo Request or TCP SYN packets can also be used. The time-to-live (TTL) value, also known as hop limit, is used in determining the intermediate routers being traversed towards the destination. Routers decrement TTL values of packets by one when routing and discard packets whose TTL value has reached zero, returning the ICMP error message ICMP Time Exceeded. Common default values for TTL are 128 (Windows OS) and 64 (Unix-based OS).

Traceroute works by sending packets with gradually increasing TTL value, starting with TTL value of one. The first router receives the packet, decrements the TTL value and drops the packet because it then has TTL value zero. The router sends an ICMP Time Exceeded message back to the source. The next set of packets are given a TTL value of two, so the first router forwards the packets, but the second router drops them and replies with ICMP Time Exceeded. Proceeding in this way, traceroute uses the returned ICMP Time Exceeded messages to build a list of routers that packets traverse, until the destination is reached and returns an ICMP Echo Reply message."

## [Tracepath](http://www.howtogeek.com/108511/how-to-work-with-the-network-from-the-linux-terminal-11-commands-you-need-to-know/)

"The tracepath command is similar to traceroute, but it doesn’t require root privileges. It’s also installed by default on Ubuntu, while traceroute isn’t. tracepath traces the network path to a destination you specify and reports each “hop” along the path. If you’re having network problems or slowness, tracepath can show you where the network is failing or where the slowness is occurring."

## [Autonomous systems](https://www.cs.rutgers.edu/~pxk/352/notes/autonomous_systems.html)

"An Autonomous System (AS) is a collection of routers whose prefixes and routing policies are under common administrative control. This could be a network service provider, a large company, a university, a division of a company, or a group of companies. The AS represents a connected group of one or more blocks of IP addresses (called IP prefixes) that have been assigned to that organization and provides a single routing policy to systems outside the AS. Autonomous Systems create a two-level hierarchy for routing in the Internet.

Routers within an AS use an Interior Gateway Protocol (IGP), which handles routing between nodes inside the AS.  The AS administrator decides what routing algorithm should run within it.

To get traffic from a host in one AS to a host in another AS, the autonomous systems need to be connected. Most ASes do not share a direct link with each other, in which case data traffic may be routed through the networks of other ASes that agree to carry the traffic. BGP version 4, the Border Gateway Protocol, is the de facto standard EGP for inter-AS routing. At some point in the future, the Internet is expected to adopt IDRP, the OSI Inter-Domain Routing protocol."

## [AS assignment](https://www.cs.rutgers.edu/~pxk/352/notes/autonomous_systems.html)

"An AS has a globally unique 32-bit number associated with it, called an ASN (Autonomous System Number). If an Autonomous System exchanges routing information with other Autonomous Systems on the public Internet, it needs to have a unique ASN. This number is used in exchanging exterior routing information, particularly in identifying paths through multiple ASes via BGP. AS numbers are assigned to organizations by the Regional Internet Registry (RIR) for their country."

## Possibilities and limitations

* Honeypots or traffic redirection in general might result in inacurate data 
* Autonomous Systems from outside Schengen Area might have legal ASes in Schengen Area as well (e.g. google, facebook, etc.) 
* If client is either using a VPN or a Proxy connection, this might lead again to data inacuracy 
* Tracepath is extremely slower compared to traceroute

## PlanetLAB and EmanicsLab

On one hand, Planet-Lab and EMANICSLab provide administrative access to the machines and, therefore, allow for full control over all aspects of the experiment. On the other hand, the number of ASes currently covered by these test-beds in Europe is lower when compared to RIPE Atlas: EMANICSLab provide nodes in 11 different ASes, while Planet-Lab provides nodes in 69 ASes. In contrast, RIPE Atlas provides 1306 ASes in the Schengen Area alone. Since Planet-Lab and EMANICSLab nodes are predominantly located in academic and research networks, such a distribution may not necessarily be representative for assessing Schengen routing compliance in the Schengen Internet as a whole.

## Usage

* Open a terminal window
* Navigate to the directory where chkroute.rar was extracted to
* Copy the .deb package to your server and install it by running ```sudo dpkg -i asymmetric-chkroute_1.0_all.deb```
* On your remote server, run ./start.sh
* On your local machine, run ./chkroute.sh
