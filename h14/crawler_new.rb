require "net/http"
require "uri"




def makeTxtName(givenDomainName , givenOther)
	givenDomainNameCopy = String.new(givenDomainName)
	givenOtherCopy = String.new(givenOther)
	givenDomainNameCopy.slice!("http://")
	while true
		if givenDomainNameCopy["."] != nil
			givenDomainNameCopy.slice!(".")
		elsif givenDomainNameCopy["/"] != nil or givenOtherCopy["/"] != nil
			givenDomainNameCopy.slice!("/")
			givenOtherCopy.slice!("/")
		else
			break
		end
	end	
	givenOtherCopy.slice!(".")
	return givenDomainNameCopy + givenOtherCopy + ".txt"
end


def makeTxtNameUri(givenUri)
	host = String.new(givenUri)
	while host["."] != nil
		host["."] = "_"
	end
	while host["/"] != nil
		host["/"] = "-"
	end
	#while path["/"] != nil
	#	path["/"] = "-"
	#end
	#while path["."] != nil
	#	path["."] = "_"
	#end
	return host + ".txt"
end


class Link #- Няма какво да пипаш повече
	attr_accessor :domainName, :domainOther, :uri, :url
	def setDomainName(givenDomainName)
		@domainName = givenDomainName		
	end

	def getDomainName
		return @domainName
	end

	def setDomainOther(givenOther)
		@domainOther = givenOther
	end

	def getDomainOther
		return @domainOther
	end

	def setUri(givenUriString)
		@uri = URI(givenUri)
	end

	def getUri
		return @uri 
	end

	def setUrl(givenUrl)
		@url = givenUrl
	end

	def getUrl
		return @url
	end

end


class Page 
	attr_accessor :url, :links, :element, :fileName, :source
	@links = Array.new
	def stripProtocol(givenUrl)
		givenUrl.slice!("Http://")
		givenUrl.slice!("http://")
	end
	
	def setPage(givenDomainName , givenOther) # makes txt file without white spaces or /" 
		@fileName = makeTxtName(givenDomainName , givenOther)
		f = File.open(@fileName, "w")
		@source = Net::HTTP.get(givenDomainName,givenOther)
		@source = @source.gsub(/\s+/, "")
		#@source = @source.gsub(/\"+/, "")
		f<<@source
	end

	def setPageUri(givenUrl)
		@fileName = makeTxtName(givenUrl,"")
		f = File.open(@fileName, "w")
		@source = Net::HTTP.get_response(URI.parse(givenUrl)).body
		@source = @source.gsub(/\s+/, "")
		#@source = @source.gsub(/\"+/, "")
		f<<@source
	end

	def setLinks
		@source = @source.downcase
		counter = 0
		while @source["ahref=\""] != nil
			
			tempString = String.new
			tempIndex = @source.index("ahref=\"")
			@source["ahref=\""] = ""
			while @source[tempIndex] != "\""
				tempString = tempString + @source[tempIndex]
				tempIndex = tempIndex + 1
			end
			@element = Link.new
			@element.setUrl(tempString)
			if counter == 0 
				@links = Array.new
				counter = 1
			end
			@links.append(@element)
		end
			puts @links[0].getUrl	
	end
	
	def getFile
		return @file
	end

	def getLinks
		return @links
	end

	def getSource
		return @source
	end

end


class Site
	attr_accessor :url, :pages, :element
	def initialize(givenUrl)
		@url = givenUrl
	end
	def follow
		counter = 0
		while counter <= 10

		end 
	end

end
# -----Test----- #

testpage = Page.new
testpage.setPageUri('http://elsys-bg.org')
testpage.setLinks
# ---EndOfTest-- #

# -----Main----- #



# ---EndOfMain-- #
# ----Report---- #
# greshkata moje da e v tova che dobarvash na secundata "\"" ili che triesh vsichkite ahref-ove
# --EndOfReport- #