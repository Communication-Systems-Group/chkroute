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

## Usage

* Open a terminal window
* Navigate to the directory where chkroute.rar was extracted to
* Run ./chkroute.sh <target host>

The target node can be either an IP address or a URL.
