# RIPE Atlas

![](https://www.ripe.net/++resource++ripe.plonetheme.images/RIPE_NCC_logo.png)

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

## Score system

### RIPE Atlas - The Credit System
The RIPE Atlas credit system allows us to recognise participants' contributions to the system. RIPE Atlas probe hosts earn credits for the time their probes remain connected, and in return can spend these credits to request services (user-defined measurements, called UDMs) from it. It is meant to serve as a means of measuring the level of contribution to, and consumption of, resources in the RIPE Atlas system.

### Earning credits as a RIPE Atlas probe host

Every probe that you host earns you credits that can be spent on user-defined measurements. Credits are earned as long as the probe is connected to the RIPE Atlas infrastructure (shown as "connected"). Accounts are credited once per day.
A host (and sponsor, see below) receives 15 credits for each minute that their probe is connected to our network, so assuming that your probe is connected continuously, you should earn roughly 21,600 credits every 24 hours, which you can spend conducting user-defined measurements. If you host more than one probe, each connected probe will earn credits at this rate.

## Measurement Cost Model

### Basic principles

Each user-defined measurement (UDM) requires resources from the network of involved probes, as well as from the RIPE Atlas infrastructure itself. The credit system is therefore designed to make it more "expensive" (in terms of credit consumption) to run measurements that are more resource intensive.
Because of this, when you schedule a measurement, the system calculates how much each result should cost (this is the "unit cost"). Each time a result is delivered to you, the appropriate amount is withdrawn from your credit balance. The more results are delivered, the more this costs you. The scaling is linear, so, for example, five results will cost five times more credits.
Since the cost of a measurement over a certain time period only depends on the number of results delivered, but not on the frequency or number of probes assigned to the measurement, it costs the same to run a measurement, for example, from one probe every minute or from ten probes every ten minutes or from 100 probes every 100 minutes. (All of these measurements will yield an average of one result per minute).
For efficiency reasons, you are not charged immediately for each delivered result. Instead, we charge in batches every four to six hours for all results delivered in that period.

### Unit cost calculation

The cost for the individual result depends on what type of measurement you conduct, and what options and flags were specified. The following sections describe the current settings. One-off measurement result is twice as expensive.
#### Ping and ping6

Unit cost = N * (int(S/1500) + 1)
Where:
N - number of packet in the train (default: 3), S - packet size (default: 48 octets)
Which makes the default unit cost = 3

#### DNS and DNS6

Unit cost for UDP: 10 credits/result
Unit cost for TCP: 20 credits/result

#### Traceroute and traceroute6

Unit cost = 10 * N * (int(S/1500) + 1)
Where:
N - number of packet in the train (default: 3), S - packet size (default: 40 octets)
Which makes the default unit cost = 30

#### SSLCert and SSLCert6

Unit cost: 10 credits/result
