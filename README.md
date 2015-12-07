# chkroute

chkroute is a tool to analyze Schengen routing compliance. The tool 
uses bash, traceroute and/or tracepath, and a geo-location server running at the 
premises of University of Zurich.

## Installation

The chkroute utility consists of a shell script only (client side). After downloading, 
the archive must unzipped and then the script must be made executable 
using chmod a+x chkroute.sh

On the server side, two scripts are being executed to run the asymmetric measurement: the main script called "start.sh" is to be executed, which in turn calls the "run.sh" script. After downloading, the archive must unzipped and then the script must be made executable using chmod a+x chkroute.sh

Please note that you must also install traceroute (tracepath is installed by default on most unix distributions) if it is not
installed.

## Compatibility

The chkroute utility is currently only available for Linux. It should 
also work on Mac OS X but it has not been tested.

## RIPE Atlas

What is RIPE Atlas?

RIPE Atlas is a global network of probes that measure Internet connectivity and reachability, providing an unprecedented understanding of the state of the Internet in real time.

Structure
The RIPE Atlas community is made up of users, hosts, sponsors and ambassadors.
Anyone who accesses RIPE Atlas maps and statistics, which are open and available to the public, is considered a RIPE Atlas user.
A host is anyone who connects a probe or anchor to their own network. Hosts can conduct their own customised measurements in order to gain valuable information about their network using other RIPE Atlas probes.
A sponsor is an individual or organisation that financially supports RIPE Atlas.
An ambassador is someone who helps us distribute RIPE Atlas probes.
Data collection
RIPE Atlas probes are small, USB-powered hardware devices that hosts attach to an Ethernet port on their router via a network (UTP) cable. They conduct different measurements and relay this data to the RIPE NCC, where it is aggregated with data from the rest of the RIPE Atlas network. The probes use a very small amount of bandwidth and cannot determine any information about the content passing to or from their host computers. Probes conduct the following types of measurements: ping, traceroute, DNS and SSLcert.
RIPE Atlas anchors are both enhanced RIPE Atlas probes with much more measurement capacity, as well as powerful regional measurement targets within the greater RIPE Atlas network. They provide valuable information about the local and regional connectivity and reachability of the Internet.


## Usage

* Open a terminal window
* Navigate to the directory where chkroute.rar was extracted to
* Run ./chkroute.sh <target host>

The target node can be either an IP address or a URL.
