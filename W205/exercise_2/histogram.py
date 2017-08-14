import sys
import psycopg2

if len(sys.argv) != 3:
    print("Incorrect number of arguments.")
    print("Pleast provide 2 arguments for word counts: a min value and max value.")
    exit(1)

v_min = int(sys.argv[1])
v_max = int(sys.argv[2])

if v_min > v_max:
    print("Max value must be greater than or equal to the min value.")
    exit(1)

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

cur.execute("SELECT * FROM tweetwordcount WHERE wordcount BETWEEN %d AND %d ORDER BY 2 DESC" % (v_min, v_max))
rows = cur.fetchall()
if len(rows) > 0:
    print("The words with valuse between %d and %d are:" % (v_min, v_max))
    for row in rows:
        print("%s:\t %d" % (row[0], row[1]))
else:
    print("No words have a count between %d and %d in the processed tweets." % (v_min, v_max))
