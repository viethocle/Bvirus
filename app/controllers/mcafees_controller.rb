class McafeesController < ApplicationController
  def index
    # @virus = Virus.all
    def index
        @ketqua, @total = Virus.get_pagination(params[:search], params[:page], params[:per_page])
        @virus = @ketqua.sort { |x,y| y["key"] <=> x["key"] }
    end
    render 'mcafees/index.html.jbuilder'
  end
  def home
    require 'openssl'
    require 'open-uri'
    require 'nokogiri'
    i = 9609540
    while i > 10000 do
      doc = Nokogiri::HTML(open("https://home.mcafee.com/VirusInfo/VirusProfile.aspx?key=#{i}"))
      # byebug
      @virus = Virus.new
      @virus.profile  = doc.search("//div//h1//span").children.to_s
      # byebug
      if (doc.search("//div//h1//span").children.to_s != "") 
        assessment = doc.search("//tr//td/span").children.to_s
        @virus.risk_assessment = "Home " + assessment[0..assessment.index('|')-1]+ " | " + " Corporate "+ assessment[assessment.index('|')+1..assessment.length]
        @virus.date_discovered = doc.search("//tr//td")[1].children.to_s
        @virus.date_added = doc.search("//tr//td")[2].children.to_s
        @virus.origin = doc.search("//tr//td")[3].children.to_s
        @virus.length = doc.search("//tr//td")[4].children.to_s
        @virus.type = doc.search("//tr//td")[5].children.to_s
        @virus.subtype = doc.search("//tr//td")[6].children.to_s
        @virus.dat_required = doc.search("//tr//td")[7].children.to_s
        @virus.description = doc.search("//div//div//div//div//div//p")[0..5].children.to_s
        # @formattedrate = virusProfile + "\n"+ assessment+ "\n" + riskAssessment+ "\n" + dateDiscovered + "\n" + dateAdded + "\n" + origin + "\n" + length + "\n" + type + "\n" + subtype  + "\n" + datRequired + "\n" + description
        @virus.key = i
        @formattedrate = @virus.save
      end
   
      i = i-1
    end
    @formattedrate = "oke"
    render template: 'mcafee/home'
  end
end
