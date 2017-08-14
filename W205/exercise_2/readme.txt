The application was created under project extweetwordcount
The project structure is:
/exercise2
  /plot.png
  /finalresults.py
  /histogram.py 
  /screenshots
    /screenshot-database.png
    /screenshot-finalresults.png
    /screenshot-histogram.png
    /screenshot-twitterStream.png
  /extweetwordcount
    /topologies
	/tweetwordcount.clj
    /src 
	/bolts
	  /wordcount.py
	  /parse.py
  	/spouts
	  /tweets.py
	
The application is run from the extweeetwordcount folder using: 
$ sparse run

finalresults.py can be run from its folder with an optional word used as a single variable.
histogram.py can be run from its folder with 2 arguments for a min and max value of word counts.
