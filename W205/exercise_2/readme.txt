The application was created under project extweetwordcount
The project structure is:
/exercise2
  /finalresults.py
  /histogram.py 
	/barchart.ipynb
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
barchart.ipynb should be run in jupyter.
