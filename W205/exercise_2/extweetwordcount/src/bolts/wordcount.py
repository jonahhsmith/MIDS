from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount
        # Table name: Tweetwordcount
        # you need to create both the database and the table in advance.

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))


        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()
        cur.execute("SELECT word from tweetwordcount WHERE word=%s",[word])
        records = cur.fetchall()
        if len(records) > 0:
            cur.execute("UPDATE tweetwordcount SET wordcount=wordcount+1 WHERE word=%s",[word])
        else:
            cur.execute("INSERT INTO tweetwordcount (word,wordcount) VALUES (%s, 1)",[word]);

        conn.commit()
        conn.close()
