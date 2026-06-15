# Forum: Garbage Collection in Monkey C

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/6257/garbage-collection-in-monkey-c

## Original Question

User jgpallero asked whether memory needs to be manually freed for arrays in
Monkey C or if the language has garbage collection.

## Key Responses

### jim_m_58

Manual deallocation isn't required upon program exit, but developers should
monitor "peak memory and peak objects" using the simulator's memory viewing
tools to avoid runtime issues.

### Travis.ConnectIQ (Official)

MonkeyC implements automatic memory management through reference counting.
When objects are created, they start with a reference count of 1, which
increments when additional references are made and decrements when references
leave scope. Objects are automatically deallocated when their reference count
reaches zero.

One important caveat: "reference cycles" can occur when object A references
object B while B maintains a reference back to A. These situations can cause
memory to remain allocated at program termination, which will trigger errors
in the simulator.

Even if memory isn't fully deallocated before exit, the entire application's
memory space is reclaimed by the system upon termination.

## Bottom Line

MonkeyC developers generally don't need to manually free memory, but should be
aware of potential circular reference issues that the simulator will flag.
