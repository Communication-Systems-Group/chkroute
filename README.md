# chkroute

![](http://www.fp7-flamingo.eu/wp-content/uploads/2014/12/flamingo.png)

chkroute is a tool to analyze asymmetric Schengen routing compliance. The tool uses bash, traceroute and/or tracepath, and a geo-location server running at the premises of University of Zurich.

## Installation

The chkroute utility consists of a shell script only (client side). After downloading, the archive must unzipped and then the script must be made executable using chmod a+x chkroute.sh

On the server side, two scripts are being executed to run the asymmetric measurement: the main script called start.sh is to be executed, which in turn calls the run.sh script. After downloading, the archive must unzipped, copied to the remote server and then the scripts must be made executable using chmod a+x start.sh and chmod a+x run.sh

Please note that you must also install traceroute (tracepath is installed by default on most unix distributions) if it is not installed.

## Compatibility

The chkroute utility is currently only available for Linux. It should also work on Mac OS X but it has not been tested.

## RIPE Atlas

### What is RIPE Atlas?

RIPE Atlas is a global network of probes that measure Internet connectivity and reachability, providing an unprecedented understanding of the state of the Internet in real time.

### Structure

The RIPE Atlas community is made up of users, hosts, sponsors and ambassadors.
Anyone who accesses RIPE Atlas maps and statistics, which are open and available to the public, is considered a RIPE Atlas user.
A host is anyone who connects a probe or anchor to their own network. Hosts can conduct their own customised measurements in order to gain valuable information about their network using other RIPE Atlas probes.
A sponsor is an individual or organisation that financially supports RIPE Atlas.
An ambassador is someone who helps us distribute RIPE Atlas probes.

### Data collection

RIPE Atlas probes are small, USB-powered hardware devices that hosts attach to an Ethernet port on their router via a network (UTP) cable. They conduct different measurements and relay this data to the RIPE NCC, where it is aggregated with data from the rest of the RIPE Atlas network. The probes use a very small amount of bandwidth and cannot determine any information about the content passing to or from their host computers. Probes conduct the following types of measurements: ping, traceroute, DNS and SSLcert.
RIPE Atlas anchors are both enhanced RIPE Atlas probes with much more measurement capacity, as well as powerful regional measurement targets within the greater RIPE Atlas network. They provide valuable information about the local and regional connectivity and reachability of the Internet.

## Traceroute

Traceroute, by default, sends a sequence of User Datagram Protocol (UDP) packets addressed to a destination host; ICMP Echo Request or TCP SYN packets can also be used. The time-to-live (TTL) value, also known as hop limit, is used in determining the intermediate routers being traversed towards the destination. Routers decrement TTL values of packets by one when routing and discard packets whose TTL value has reached zero, returning the ICMP error message ICMP Time Exceeded. Common default values for TTL are 128 (Windows OS) and 64 (Unix-based OS).

Traceroute works by sending packets with gradually increasing TTL value, starting with TTL value of one. The first router receives the packet, decrements the TTL value and drops the packet because it then has TTL value zero. The router sends an ICMP Time Exceeded message back to the source. The next set of packets are given a TTL value of two, so the first router forwards the packets, but the second router drops them and replies with ICMP Time Exceeded. Proceeding in this way, traceroute uses the returned ICMP Time Exceeded messages to build a list of routers that packets traverse, until the destination is reached and returns an ICMP Echo Reply message.

## Tracepath

The tracepath command is similar to traceroute, but it doesn’t require root privileges. It’s also installed by default on Ubuntu, while traceroute isn’t. tracepath traces the network path to a destination you specify and reports each “hop” along the path. If you’re having network problems or slowness, tracepath can show you where the network is failing or where the slowness is occurring.

## Autonomous systems

An Autonomous System (AS) is a collection of routers whose prefixes and routing policies are under common administrative control. This could be a network service provider, a large company, a university, a division of a company, or a group of companies. The AS represents a connected group of one or more blocks of IP addresses (called IP prefixes) that have been assigned to that organization and provides a single routing policy to systems outside the AS. Autonomous Systems create a two-level hierarchy for routing in the Internet.

Routers within an AS use an Interior Gateway Protocol (IGP), which handles routing between nodes inside the AS.  The AS administrator decides what routing algorithm should run within it.

To get traffic from a host in one AS to a host in another AS, the autonomous systems need to be connected. Most ASes do not share a direct link with each other, in which case data traffic may be routed through the networks of other ASes that agree to carry the traffic. BGP version 4, the Border Gateway Protocol, is the de facto standard EGP for inter-AS routing. At some point in the future, the Internet is expected to adopt IDRP, the OSI Inter-Domain Routing protocol.

## AS assignment

An AS has a globally unique 32-bit number associated with it[1], called an ASN (Autonomous System Number). If an Autonomous System exchanges routing information with other Autonomous Systems on the public Internet, it needs to have a unique ASN. This number is used in exchanging exterior routing information, particularly in identifying paths through multiple ASes via BGP. AS numbers are assigned to organizations by the Regional Internet Registry (RIR) for their country.

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
* Copy the files start.sh and run.sh to your remote server
* On your remote server, run ./start.sh
* On your local machine, run ./chkroute.sh
