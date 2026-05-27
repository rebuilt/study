# Chapter 1 - Trade-offs in Data systems architecture

| Application Type              | Description                                                                             |
| ---                           | ---                                                                                     |
| Data intensive application    | Data management is the primary challenge in developing the application                  |
| Compute intensive application | Parallelizing a large computation is the primary challenge in developing the applicaton |


## Applications do the following: 

- Store data so that they, or another application, can find it again later (databases)•
- Remember the result of an expensive operation, to speed up reads (caches)•
- Allow users to search data by keyword or filter it in various ways (search indexes)•
- Handle events and data changes as soon as they occur (stream processing)•
- Periodically crunch a large amount of accumulated data (batch processing)•

Software architecture is the specific implementation and choices for these individual building blocks.  There is no single best choice.  There are trade-offs for any solution.

Teams have different goals.  Teams work better if the goals are explicit and all team members understand the shared goals. 

## Common choices 

- The difference between operational and analytical systems
- The pros and cons of cloud services and self-hosted systems
- When to move from single-node systems to distributed systems
- Balancing the needs of the business and the rights of the user

## Employees who work with data

| Job role          | Description                                                                                                       |
| ---               | ---                                                                                                               |
| Business Analysts | Generate reports about activities of the organization                                                             |
| Data Scientists   | Look for novel insights in data or create user-facing product features built on data analysis or machine learning | 


## Systems that hold the data

| System Type         | Description                                                                                              |
| ---                 | ---                                                                                                      |
| Operational systems | Where the data is created. Reads and modifies data in the database based on actions by the users         |
| Analytical Systems  | serve the business analysts and data scientists.  Read-only copy of data.  Optimized for data processing |

Data engineers are people who know how to integrate operational and analytical systems.  Analytics engineers model and transform data to make it more useful for the business analysts and data scientists

## Database paradigms 

OLTP - online transaction processing
OLAP - online analytical processing

| Property            | Operational Systems (OLTP)                      | Analytical Systems (OLAP)                 |
| ---                 | ---                                             | ---                                       |
| Main read pattern   | Point queries (Fetch individual records by key) | Aggregae over large number of records     |
| Main write pattern  | Create, update, and delete individual records   | Bulk import or event stream               |
| Human user example  | End user of web/mobile application              | Internal analyst, for decision support    |
| Machine use example | Checking if an action is authorized             | Detecting fraud/abuse patterns            |
| Type of queries     | Fixed, predefined by application                | Arbitrary, ad-hoc exploration by analysts |
| Query volume        | Lots of small queries                           | Few queries, each is complex              |
| Data represents     | Latest state of data (current point in time)    | History of events that happened over time |
| Dataset size        | Gigabytes to terabytes                          | Terabytes to petabytes                    |


## Data warehousing


Data warehouse

Extract data from various operational systems into a single large analytical system.  The data is transformed into a structured database like sql.  

Data lake
Unstructured data, often as files.   Text, images, videos, sensor readings, sparse matrices, feature vectors, genome sequences, database records or any other kind of data. Uses object stores to save data.

## Systems of record and derived data

Systems of record
Source of truth.  Holds the authoritative or canonical version of data.  Data is written here first.  Each fact is represented once.  That representation is normalized.  

Derived data systems
Data is the result of taking existing data from another system and transforming or processing it.  If you lose derived data, it can be recreated.  

## Cloud vs Self-hosting
Anything that is a core-competency should be done in-house. Commonplace things should be left to a vendor.

Who builds the software and who deploys it?

Cloud providers claim that using their
services saves you time and money and allows you to move faster compared to setting
up your own infrastructure.
Whether using a cloud service is actually cheaper and easier than self-hosting
depends very much on your skills and the workload on your systems, however.

Downsides of cloud service:
- If it is lacking a feature you need, all you can do is politely ask the vendor•
whether they will add it; you generally cannot implement it yourself.
- If the service goes down, all you can do is to wait for it to recover.•
- If you are using the service in a way that triggers a bug or causes performance•
problems, diagnosing the issue will be difficult. With software that you run
yourself, you can get performance metrics and debugging information from the
operating system to help you understand its behavior, and you can look at the
server logs. With a service hosted by a vendor, you usually do not have access to
these internals.
- If the service shuts down or becomes unacceptably expensive, or if the vendor•
changes their product in a way you don’t like, you are at their mercy; continuing
to run an old version of the software is usually not an option, so you’ll be forced
to migrate to an alternative service [23]. This risk is mitigated if alternative serv‐
ices expose a compatible API, but for many cloud services there are no standard
APIs, which raises the cost of switching, making vendor lock-in a problem.
- If the cloud provider is in another country and a political conflict arises between•
that country and your own, you risk being locked out of the service due to
imposed sanctions.
- The cloud provider needs to be trusted to keep the data secure, which can•
complicate the process of complying with privacy and security regulations.


