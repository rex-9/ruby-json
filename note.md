Task: Determine Available Time Intervals

Description:

You are given a JSON that represents an array of busy time intervals. Your task is to determine the individual available hourly time slots between these intervals and return them in the same JSON format. Each interval in the JSON string is represented as an object with a startTime and an endTime.

The available slots should be non-overlapping, hourly intervals.

Input:

A JSON representing an array of objects. Each object has two key-value pairs: startTime and endTime, which are integers.

See the attachment for the input file.

Output:

A JSON string representing an array of objects. Each object represents an individual available hourly time slot with two key-value pairs: startTime and endTime.
Expected output:

[

{

    "startTime": 5,

    "endTime": 6

},

{

    "startTime": 6,

    "endTime": 7

},

{

    "startTime": 11,

    "endTime": 12

},

{

    "startTime": 12,

    "endTime": 13

}

]

Constraints:

The intervals in the input arr might overlap. E.g. [{"startTime":2,"endTime":4},

{"startTime":3,"endTime":5}]

The returned available intervals should be in increasing order based on their start times.
The range of startTime and endTime is (1, 15)
