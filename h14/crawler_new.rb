require "net/http"
require "uri"


$linkArray = Array.new(1,nil)
$pageArray = Array.new(1,nil)


def makeTxtName(givenDomainName , givenOther)
	if givenDomainName.kind_of?(Link)
		givenDomainNameCopy = String.new(givenDomainName.getUrl)
	else
		givenDomainNameCopy = String.new(givenDomainName)
	end
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
	attr_accessor :url, :links,:arrayCounter, :element, :fileName, :source
	@links = Array.new
	@arrayCounter = 0

	def initialize (givenUrl)
		@url = givenUrl
	end

	def stripProtocol(givenUrl)
		givenUrl.slice!("Http://")
		givenUrl.slice!("http://")
	end
	
	def setPage(givenDomainName , givenOther) # Not working really well
		@fileName = makeTxtName(givenDomainName , givenOther)
		f = File.open(@fileName, "w")
		@source = Net::HTTP.get(givenDomainName,givenOther)
		@source = @source.gsub(/\s+/, "")
		#@source = @source.gsub(/\"+/, "")
		f<<@source
	end

	def setPageUri(givenUrl=@url)
		@fileName = makeTxtName(givenUrl,"")
		f = File.open(@fileName, "w")
		if givenUrl.kind_of?(Link)
			puts givenUrl.getUrl
			@source = Net::HTTP.get_response(URI.parse(givenUrl.getUrl)).body
		else
			@source = Net::HTTP.get_response(URI.parse(givenUrl)).body
		end
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
			
			#puts tempString
			$linkArray.push(@element)
			if $linkArray[0] == nil
				$linkArray.delete(nil)
			end
		end
			#puts @links[0].getUrl	
	end

	def getLinks
		return $linkArray
	end

	def getSource
		return @source
	end

end


class Site
	attr_accessor :url, :pages, :element, :workUrl
	
	def initialize(givenUrl)
		@url = givenUrl
		@workUrl  = givenUrl
	end
	
	def follow(steps)
		counter = 0
		while counter <= steps
			tempPage = Page.new(@workUrl)
			puts @workUrl
			tempPage.setPageUri(@workUrl)
			tempPage.setLinks
			$pageArray.push(tempPage)
			@workUrl = tempPage.getLinks.pop
			counter = counter + 1
		end 
	end

end
# -----Test----- #
=begin
testpage = Page.new('http://lubo.elsys-bg.org/software_engineering/')
testpage.setPageUri()
testpage.setLinks
testpage.getLinks

for i in 0..10
	puts "-----------------------------------------------"
end
puts $linkArray
testSite = Site.new('http://lubo.elsys-bg.org/software_engineering/')
testSite.follow(10)
=end
# ---EndOfTest-- #

# -----Main----- #



# ---EndOfMain-- #
# ----Report---- #
# --EndOfReport- #