import urllib, json
import sys


#isbn, title, authors,publisher,releaseDate,pagecount,categories,description, previewLink
def getDetails(isbn,target):
	global number
	url = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn
	response = urllib.urlopen(url)
	data = json.loads(response.read())
	if(data.get('items','none')!="none"):

        #id
		target.write(str(number))
		target.write("\t")
		number=number+1  #increase 1
		target.write("\t")

        
		target.write(isbn)
		target.write("\t")

		#title
		if((data['items'][0]["volumeInfo"].get("title","none"))=="none"):
			print "no title"
			target.write("none")
		else:
			target.write(data['items'][0]["volumeInfo"]["title"].encode('utf-8'))
		target.write("\t")

		#author, convert list to string
		if((data['items'][0]["volumeInfo"].get("authors","none"))=="none"):
			print "no authors"
			target.write("none")
		else:
			authors=data['items'][0]["volumeInfo"]["authors"]
			authorString=""
			count=0
			for elem in authors:
				#seperate authors by ","
				if(count!=0):
					authorString=authorString+","
				authorString=authorString+elem
				count=count+1
			target.write(authorString.encode('utf-8'))
		target.write("\t")

		#publisher
		if((data['items'][0]["volumeInfo"].get("publisher","none"))=="none"):
			print "no publisher"
			target.write("none")
		else:
			target.write(data['items'][0]["volumeInfo"]["publisher"].encode('utf-8'))
		target.write("\t")

		#releaseDate
		if((data['items'][0]["volumeInfo"].get("publishedDate","none"))=="none"):
			print "no publishedDate"
			target.write("none")
		else:
			target.write(data['items'][0]["volumeInfo"]["publishedDate"].encode('utf-8'))
		target.write("\t")

		#pageCount
		if((data['items'][0]["volumeInfo"].get("pageCount","none"))=="none"):
			print "no pageCount"
			target.write("none")
		else:
			target.write(str(data['items'][0]["volumeInfo"]["pageCount"]))
		target.write("\t")

		#category, convert list to string
		if((data['items'][0]["volumeInfo"].get("categories","none"))=="none"):
			print "no categories"
			target.write("none")
		else:
			categories=data['items'][0]["volumeInfo"]["categories"]
			categoryString=""
			count=0
			for elem in categories:
				#seperate each category by ","
				if(count!=0):
					categoryString=categoryString+","
				categoryString=categoryString+elem
				count=count+1
			target.write(categoryString)
		target.write("\t")

		#description
		if((data['items'][0]["volumeInfo"].get("description","none"))=="none"):
			print "no description"
			target.write("none")
		else:
			target.write(data['items'][0]["volumeInfo"]["description"].encode('utf-8'))
		target.write("\t")

		#previewLink
		if((data['items'][0]["volumeInfo"].get("previewLink","none"))=="none"):
			print "no previewLink"
			target.write("none")
		else:
			target.write(data['items'][0]["volumeInfo"]["previewLink"].encode('utf-8'))
		target.write("\t")
		
		#imageURL
		if((data['items'][0]["volumeInfo"].get("imageLinks","none"))=="none"):
			print "no image"
			target.write("none")
		else:
			target.write(data['items'][0]["volumeInfo"]["imageLinks"]["thumbnail"].encode('utf-8'))
		target.write("\n")
		

fileName=str(sys.argv[1]) #read old file name
number=int(sys.argv[2]) #read old file name
f1=open(fileName)
target = open("details4.txt", 'w')
for line in f1:
	line = line.replace('\n', '')
	#print line
	getDetails(line,target)

target.close()
f1.close()


