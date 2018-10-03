### Tinyurl Requirements
1. Given URL, generate a shorter and unique alias of it
2. When clicked on a short link, redirect to original link
3. Optionally be able to pick a custom short link
4. Links will expire after default timespan

Non-functional
1. High availability
2. Not guessable

### Capacity Estimation
Assume 100:1 ratio between read and write.
More redirections than shortenings

**Traffic estimates** 
500M new URL shortenings per month
(100 * 500M => 50B) redirections

#### QPS Calculation
New URL shortenings per second:
500M / (30 days * 24 hours * 3600 seconds)
= ~200 URLs/s

Redirections per second:
50B / (30 days * 24 hours * 3600 seconds)
= 19K /s

#### Storage estimates
Assume we store every shortened link for 5 years
The total number of objects we expect to store will be 30 billion:

500 M * 5 years * 12 months = 30 B

Estimate each object is 500 bytes. We will need 15TB of total storage

#### Bandwidth estimates
Writes: 200 New URLs/s * 500 bytes = 100 KB/s
Reads: 19K URLs/s * 500 bytes = ~9 MB/s

#### Memory estimates
We would like to cache 20% of all URLs

19K * 3600 seconds * 24 hours = ~1.7 billion requests per day

To cache 20% requests, we need:
0.2 * 1.7 billion requests per day * 500 bytes per requests = 170 GB of hot memory per day

#### Multiple Process
4 unicorns (instances of the HTTP server)
One rails instance takes 200-250MB memory
4 instances take 1G memory box
We can get 20 QPS
1.7 billion requests / 20 = 0.085 B = 85 million G of memory box

Buy 11 8G memory box. Handles up to 88QPS (minimum required)
Buy 10 32GB memory box CPU. Handles up to 320GB 

Add Load Balancer
- Nginx

Tuning - optimize the requests that take the longest time and high throughput


### Services
`createURL(api_dev_key, original_url, custome_alias=nil, user_name=nil, expire_date=nil)`

`api_dev_key`: API developer key of registered account -> throttle users based on their allocated quota

optional user name to be used in encoding.

**Returns** shortened URL, otherwise returns an error code.
_
`deleteURL(api_dev_key, url_key)`

A successful deletion returns 'URL removed'

We limit user actions via `api_dev_key`.
Each api key can be limited to certain number of URL creations and redirections per minute.

### DB Design
1. We need to store billions of records
2. Each object we store is small (less than 1K)
3. There are no relationship between records
4. Our service is read-heavy

Two Tables:
URL
```sql
PK: Hash: varchar(16)
    OriginalURL: varchar(512)
    CreationDate: datetime
    ExpirationDate: datetime
    UserID: int
```

User
```sql
PK: UserID: int
    Name: varchar(20)
    Email: varchar(32)
    CreationDate: datetime
    LastLogin: datetime
```

Since we don't anticipate storing billions of rows, a NOSQL key-value store like Dynamo or Cassandra is a better choice. Also easier to scale.

If conflict, we need to regenerate a key until we get a unique one.

### Partitioning
Save all URLs starting with letter 'A' in one partition, save those that start with letter 'B' in another.


### Caching
We need 170GB of hot memory to cache 20% of daily traffic. 

Use single 256GB memory server, or multiple smaller servers.

When the cache is full, and we want to replace a link with newer/hotter URL

Based on Least Recently Used, we discard the least recently used URL first.

### Load Balancer
We can add load balancers at three places in our system:
1. Between Clients and Application servers
2. Between Application servers and database servers
3. Between Application servers and cache servers

We could use a Round Robin approach that distributes incoming requests among backend servers.
If a server is dead, load balancer will take it out of the rotation and will stop sending any traffic to it.

