import sys
import psycopg2

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

if len(sys.argv) == 1:
    cur.execute("SELECT word, wordcount from tweetwordcount ORDER BY 2 DESC")
    rows = cur.fetchall()
    print("The number of times each word appears in the processed tweets is:")
    for row in rows:
        print "%s:\t %s" % (row[0], row[1])
elif len(sys.argv) == 2:
    v_word = sys.argv[1]
    cur.execute("SELECT sum(wordcount) FROM tweetwordcount WHERE word = '%s'" % v_word)
    rows = cur.fetchall()

    cnt = rows[0][0]
    print("Total number of occurrences of '%s': %d" % (v_word, cnt or 0))

conn.close
