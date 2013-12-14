require 'pry'

class TracksController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
    @tracks = Track.all
    @track = Track.new
    @places = {
      "SF bay area"=>"sfbay",
      "abilene"=>"abilene",
      "akron / canton"=>"akroncanton",
      "albany"=>"albany",
      "albany, GA"=>"albanyga",
      "albuquerque"=>"albuquerque",
      "altoona-johnstown"=>"altoona",
      "amarillo"=>"amarillo",
      "ames, IA"=>"ames",
      "anchorage / mat-su"=>"anchorage",
      "ann arbor"=>"annarbor",
      "annapolis"=>"annapolis",
      "appleton-oshkosh-FDL"=>"appleton",
      "asheville"=>"asheville",
      "ashtabula"=>"ashtabula",
      "athens, GA"=>"athensga",
      "athens, OH"=>"athensohio",
      "atlanta"=>"atlanta",
      "auburn"=>"auburn",
      "augusta"=>"augusta",
      "austin"=>"austin",
      "bakersfield"=>"bakersfield",
      "baltimore"=>"baltimore",
      "baton rouge"=>"batonrouge",
      "battle creek"=>"battlecreek",
      "beaumont / port arthur"=>"beaumont",
      "bellingham"=>"bellingham",
      "bemidji"=>"bemidji",
      "bend"=>"bend",
      "billings"=>"billings",
      "binghamton"=>"binghamton",
      "birmingham, AL"=>"bham",
      "bismarck"=>"bismarck",
      "bloomington, IN"=>"bloomington",
      "bloomington-normal"=>"bn",
      "boise"=>"boise",
      "boone"=>"boone",
      "boston"=>"boston",
      "boulder"=>"boulder",
      "bowling green"=>"bgky",
      "bozeman"=>"bozeman",
      "brainerd"=>"brainerd",
      "brownsville"=>"brownsville",
      "brunswick, GA"=>"brunswick",
      "buffalo"=>"buffalo",
      "butte"=>"butte",
      "cape cod / islands"=>"capecod",
      "catskills"=>"catskills",
      "cedar rapids"=>"cedarrapids",
      "central NJ"=>"cnj",
      "central louisiana"=>"cenla",
      "central michigan"=>"centralmich",
      "champaign urbana"=>"chambana",
      "charleston, SC"=>"charleston",
      "charleston, WV"=>"charlestonwv",
      "charlotte"=>"charlotte",
      "charlottesville"=>"charlottesville",
      "chattanooga"=>"chattanooga",
      "chautauqua"=>"chautauqua",
      "chicago"=>"chicago",
      "chico"=>"chico",
      "chillicothe"=>"chillicothe",
      "cincinnati, OH"=>"cincinnati",
      "clarksville, TN"=>"clarksville",
      "cleveland"=>"cleveland",
      "clovis / portales"=>"clovis",
      "college station"=>"collegestation",
      "colorado springs"=>"cosprings",
      "columbia / jeff city"=>"columbiamo",
      "columbia, SC"=>"columbia",
      "columbus"=>"columbus",
      "columbus, GA"=>"columbusga",
      "cookeville"=>"cookeville",
      "corpus christi"=>"corpuschristi",
      "corvallis/albany"=>"corvallis",
      "cumberland valley"=>"chambersburg",
      "dallas / fort worth"=>"dallas",
      "danville"=>"danville",
      "dayton / springfield"=>"dayton",
      "daytona beach"=>"daytona",
      "decatur, IL"=>"decatur",
      "deep east texas"=>"nacogdoches",
      "del rio / eagle pass"=>"delrio",
      "delaware"=>"delaware",
      "denver"=>"denver",
      "des moines"=>"desmoines",
      "detroit metro"=>"detroit",
      "dothan, AL"=>"dothan",
      "dubuque"=>"dubuque",
      "duluth / superior"=>"duluth",
      "east idaho"=>"eastidaho",
      "east oregon"=>"eastoregon",
      "eastern CO"=>"eastco",
      "eastern CT"=>"newlondon",
      "eastern NC"=>"eastnc",
      "eastern kentucky"=>"eastky",
      "eastern montana"=>"montana",
      "eastern panhandle"=>"martinsburg",
      "eastern shore"=>"easternshore",
      "eau claire"=>"eauclaire",
      "el paso"=>"elpaso",
      "elko"=>"elko",
      "elmira-corning"=>"elmira",
      "erie, PA"=>"erie",
      "eugene"=>"eugene",
      "evansville"=>"evansville",
      "fairbanks"=>"fairbanks",
      "fargo / moorhead"=>"fargo",
      "farmington, NM"=>"farmington",
      "fayetteville"=>"fayetteville",
      "fayetteville, AR"=>"fayar",
      "finger lakes"=>"fingerlakes",
      "flagstaff / sedona"=>"flagstaff",
      "flint"=>"flint",
      "florence / muscle shoals"=>"shoals",
      "florence, SC"=>"florencesc",
      "florida keys"=>"keys",
      "fort collins / north CO"=>"fortcollins",
      "fort dodge"=>"fortdodge",
      "fort smith, AR"=>"fortsmith",
      "fort wayne"=>"fortwayne",
      "frederick"=>"frederick",
      "fredericksburg"=>"fredericksburg",
      "fresno / madera"=>"fresno",
      "ft myers / SW florida"=>"fortmyers",
      "gadsden-anniston"=>"gadsden",
      "gainesville"=>"gainesville",
      "galveston"=>"galveston",
      "glens falls"=>"glensfalls",
      "gold country"=>"goldcountry",
      "grand forks"=>"grandforks",
      "grand island"=>"grandisland",
      "grand rapids"=>"grandrapids",
      "great falls"=>"greatfalls",
      "green bay"=>"greenbay",
      "greensboro"=>"greensboro",
      "greenville / upstate"=>"greenville",
      "gulfport / biloxi"=>"gulfport",
      "hampton roads"=>"norfolk",
      "hanford-corcoran"=>"hanford",
      "harrisburg"=>"harrisburg",
      "harrisonburg"=>"harrisonburg",
      "hartford"=>"hartford",
      "hattiesburg"=>"hattiesburg",
      "hawaii"=>"honolulu",
      "heartland florida"=>"cfl",
      "helena"=>"helena",
      "hickory / lenoir"=>"hickory",
      "high rockies"=>"rockies",
      "hilton head"=>"hiltonhead",
      "holland"=>"holland",
      "houma"=>"houma",
      "houston"=>"houston",
      "hudson valley"=>"hudsonvalley",
      "humboldt county"=>"humboldt",
      "huntington-ashland"=>"huntington",
      "huntsville / decatur"=>"huntsville",
      "imperial county"=>"imperial",
      "indianapolis"=>"indianapolis",
      "inland empire"=>"inlandempire",
      "iowa city"=>"iowacity",
      "ithaca"=>"ithaca",
      "jackson, MI"=>"jxn",
      "jackson, MS"=>"jackson",
      "jackson, TN"=>"jacksontn",
      "jacksonville"=>"jacksonville",
      "jacksonville, NC"=>"onslow",
      "janesville"=>"janesville",
      "jersey shore"=>"jerseyshore",
      "jonesboro"=>"jonesboro",
      "joplin"=>"joplin",
      "kalamazoo"=>"kalamazoo",
      "kalispell"=>"kalispell",
      "kansas city, MO"=>"kansascity",
      "kenai peninsula"=>"kenai",
      "kennewick-pasco-richland"=>"kpr",
      "kenosha-racine"=>"racine",
      "killeen / temple / ft hood"=>"killeen",
      "kirksville"=>"kirksville",
      "klamath falls"=>"klamath",
      "knoxville"=>"knoxville",
      "kokomo"=>"kokomo",
      "la crosse"=>"lacrosse",
      "la salle co"=>"lasalle",
      "lafayette"=>"lafayette",
      "lafayette / west lafayette"=>"tippecanoe",
      "lake charles"=>"lakecharles",
      "lake of the ozarks"=>"loz",
      "lakeland"=>"lakeland",
      "lancaster, PA"=>"lancaster",
      "lansing"=>"lansing",
      "laredo"=>"laredo",
      "las cruces"=>"lascruces",
      "las vegas"=>"lasvegas",
      "lawrence"=>"lawrence",
      "lawton"=>"lawton",
      "lehigh valley"=>"allentown",
      "lewiston / clarkston"=>"lewiston",
      "lexington, KY"=>"lexington",
      "lima / findlay"=>"limaohio",
      "lincoln"=>"lincoln",
      "little rock"=>"littlerock",
      "logan"=>"logan",
      "long island"=>"longisland",
      "los angeles"=>"losangeles",
      "louisville"=>"louisville",
      "lubbock"=>"lubbock",
      "lynchburg"=>"lynchburg",
      "macon / warner robins"=>"macon",
      "madison"=>"madison",
      "maine"=>"maine",
      "manhattan, KS"=>"ksu",
      "mankato"=>"mankato",
      "mansfield"=>"mansfield",
      "mason city"=>"masoncity",
      "mattoon-charleston"=>"mattoon",
      "mcallen / edinburg"=>"mcallen",
      "meadville"=>"meadville",
      "medford-ashland"=>"medford",
      "memphis, TN"=>"memphis",
      "mendocino county"=>"mendocino",
      "merced"=>"merced",
      "meridian"=>"meridian",
      "milwaukee"=>"milwaukee",
      "minneapolis / st paul"=>"minneapolis",
      "missoula"=>"missoula",
      "mobile"=>"mobile",
      "modesto"=>"modesto",
      "mohave county"=>"mohave",
      "monroe"=>"monroemi",
      "monroe, LA"=>"monroe",
      "monterey bay"=>"monterey",
      "montgomery"=>"montgomery",
      "morgantown"=>"morgantown",
      "moses lake"=>"moseslake",
      "muncie / anderson"=>"muncie",
      "muskegon"=>"muskegon",
      "myrtle beach"=>"myrtlebeach",
      "nashville"=>"nashville",
      "new hampshire"=>"nh",
      "new haven"=>"newhaven",
      "new orleans"=>"neworleans",
      "new river valley"=>"blacksburg",
      "new york city"=>"newyork",
      "north central FL"=>"lakecity",
      "north dakota"=>"nd",
      "north jersey"=>"newjersey",
      "north mississippi"=>"northmiss",
      "north platte"=>"northplatte",
      "northeast SD"=>"nesd",
      "northern WI"=>"northernwi",
      "northern michigan"=>"nmi",
      "northern panhandle"=>"wheeling",
      "northwest CT"=>"nwct",
      "northwest GA"=>"nwga",
      "northwest KS"=>"nwks",
      "northwest OK"=>"enid",
      "ocala"=>"ocala",
      "odessa / midland"=>"odessa",
      "ogden-clearfield"=>"ogden",
      "okaloosa / walton"=>"okaloosa",
      "oklahoma city"=>"oklahomacity",
      "olympic peninsula"=>"olympic",
      "omaha / council bluffs"=>"omaha",
      "oneonta"=>"oneonta",
      "orange county"=>"orangecounty",
      "oregon coast"=>"oregoncoast",
      "orlando"=>"orlando",
      "outer banks"=>"outerbanks",
      "owensboro"=>"owensboro",
      "palm springs, CA"=>"palmsprings",
      "panama city, FL"=>"panamacity",
      "parkersburg-marietta"=>"parkersburg",
      "pensacola"=>"pensacola",
      "peoria"=>"peoria",
      "philadelphia"=>"philadelphia",
      "phoenix"=>"phoenix",
      "pierre / central SD"=>"csd",
      "pittsburgh"=>"pittsburgh",
      "plattsburgh-adirondacks"=>"plattsburgh",
      "poconos"=>"poconos",
      "port huron"=>"porthuron",
      "portland, OR"=>"portland",
      "potsdam-canton-massena"=>"potsdam",
      "prescott"=>"prescott",
      "provo / orem"=>"provo",
      "pueblo"=>"pueblo",
      "pullman / moscow"=>"pullman",
      "quad cities, IA/IL"=>"quadcities",
      "raleigh / durham / CH"=>"raleigh",
      "rapid city / west SD"=>"rapidcity",
      "reading"=>"reading",
      "redding"=>"redding",
      "reno / tahoe"=>"reno",
      "rhode island"=>"providence",
      "richmond"=>"richmond",
      "richmond, IN"=>"richmondin",
      "roanoke"=>"roanoke",
      "rochester, MN"=>"rmn",
      "rochester, NY"=>"rochester",
      "rockford"=>"rockford",
      "roseburg"=>"roseburg",
      "roswell / carlsbad"=>"roswell",
      "sacramento"=>"sacramento",
      "saginaw-midland-baycity"=>"saginaw",
      "salem, OR"=>"salem",
      "salina"=>"salina",
      "salt lake city"=>"saltlakecity",
      "san angelo"=>"sanangelo",
      "san antonio"=>"sanantonio",
      "san diego"=>"sandiego",
      "san luis obispo"=>"slo",
      "san marcos"=>"sanmarcos",
      "sandusky"=>"sandusky",
      "santa barbara"=>"santabarbara",
      "santa fe / taos"=>"santafe",
      "santa maria"=>"santamaria",
      "sarasota-bradenton"=>"sarasota",
      "savannah / hinesville"=>"savannah",
      "scottsbluff / panhandle"=>"scottsbluff",
      "scranton / wilkes-barre"=>"scranton",
      "seattle-tacoma"=>"seattle",
      "sheboygan, WI"=>"sheboygan",
      "show low"=>"showlow",
      "shreveport"=>"shreveport",
      "sierra vista"=>"sierravista",
      "sioux city, IA"=>"siouxcity",
      "sioux falls / SE SD"=>"siouxfalls",
      "siskiyou county"=>"siskiyou",
      "skagit / island / SJI"=>"skagit",
      "south bend / michiana"=>"southbend",
      "south coast"=>"southcoast",
      "south dakota"=>"sd",
      "south florida"=>"miami",
      "south jersey"=>"southjersey",
      "southeast IA"=>"ottumwa",
      "southeast KS"=>"seks",
      "southeast alaska"=>"juneau",
      "southeast missouri"=>"semo",
      "southern WV"=>"swv",
      "southern illinois"=>"carbondale",
      "southern maryland"=>"smd",
      "southwest KS"=>"swks",
      "southwest MN"=>"marshall",
      "southwest MS"=>"natchez",
      "southwest TX"=>"bigbend",
      "southwest VA"=>"swva",
      "southwest michigan"=>"swmi",
      "space coast"=>"spacecoast",
      "spokane / coeur d'alene"=>"spokane",
      "springfield, IL"=>"springfieldil",
      "springfield, MO"=>"springfield",
      "st augustine"=>"staugustine",
      "st cloud"=>"stcloud",
      "st george"=>"stgeorge",
      "st joseph"=>"stjoseph",
      "st louis, MO"=>"stlouis",
      "state college"=>"pennstate",
      "statesboro"=>"statesboro",
      "stillwater"=>"stillwater",
      "stockton"=>"stockton",
      "susanville"=>"susanville",
      "syracuse"=>"syracuse",
      "tallahassee"=>"tallahassee",
      "tampa bay area"=>"tampa",
      "terre haute"=>"terrehaute",
      "texarkana"=>"texarkana",
      "texoma"=>"texoma",
      "the thumb"=>"thumb",
      "toledo"=>"toledo",
      "topeka"=>"topeka",
      "treasure coast"=>"treasure",
      "tri-cities, TN"=>"tricities",
      "tucson"=>"tucson",
      "tulsa"=>"tulsa",
      "tuscaloosa"=>"tuscaloosa",
      "tuscarawas co"=>"tuscarawas",
      "twin falls"=>"twinfalls",
      "twin tiers NY/PA"=>"twintiers",
      "tyler / east TX"=>"easttexas",
      "upper peninsula"=>"up",
      "utica-rome-oneida"=>"utica",
      "valdosta"=>"valdosta",
      "ventura county"=>"ventura",
      "vermont"=>"burlington",
      "victoria, TX"=>"victoriatx",
      "visalia-tulare"=>"visalia",
      "waco"=>"waco",
      "washington, DC"=>"washingtondc",
      "waterloo / cedar falls"=>"waterloo",
      "watertown"=>"watertown",
      "wausau"=>"wausau",
      "wenatchee"=>"wenatchee",
      "west virginia (old)"=>"wv",
      "western IL"=>"quincy",
      "western KY"=>"westky",
      "western maryland"=>"westmd",
      "western massachusetts"=>"westernmass",
      "western slope"=>"westslope",
      "wichita"=>"wichita",
      "wichita falls"=>"wichitafalls",
      "williamsport"=>"williamsport",
      "wilmington, NC"=>"wilmington",
      "winchester"=>"winchester",
      "winston-salem"=>"winstonsalem",
      "worcester / central MA"=>"worcester",
      "wyoming"=>"wyoming",
      "yakima"=>"yakima",
      "york, PA"=>"york",
      "youngstown"=>"youngstown",
      "yuba-sutter"=>"yubasutter",
      "yuma"=>"yuma",
      "zanesville / cambridge"=>"zanesville"
      }
  end

  def create
    # @track = Track.create(params[:track])
    @track = Track.create(
                          title: params[:item],
                          low_cost: params[:low_cost],
                          high_cost: params[:high_cost],
                          location: params[:location],
                          url: params[:url],
                          user_id: params[:user_id]
                          )
    @item_titles = Nokogiri::HTML(open(@track.url)).css('.pl a')
    @item_prices = Nokogiri::HTML(open(@track.url)).css('.price')


    @item_titles.each do |item|
      parsed_item = item.attr('href')
      puts parsed_item
      if !parsed_item.include?('http')
        puts "no http"
        puts @track.location
      end
      # binding.pry
    end

    # if @item_titles.include?(@track.title)
    #   puts "there was something on CL that has this"
    # else
    #   puts "nothing was found on CL"
    # end
    # respond_to do |format|
    #   format.js
    # end
  end

  def destroy
    @track = Track.delete(params[:id])
    @id = params[:id]
        respond_to do |format|
      format.js
    end
  end

  # def search
  #   url = "http://sfbay.craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=555&minAsk=333&query=honda"
  #   # url = "http://[LOCATION_CODE].craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=[MAX_PRICE]&minAsk=[MIN_PRICE]&query=[SEARCHED_ITEM]"
  #   @item_titles = Nokogiri::HTML(open(url)).css('.pl a')
  #   @item_prices = Nokogiri::HTML(open(url)).css('.price')
  #   titles = []
  #   prices = []
  #   @item_titles.each do |item_title|
  #     titles << item_title.text
  #   end
  #   @item_prices.each do |item_price|
  #     prices << item_price.text
  #   end
  #   # test = Hash[titles.zip prices]
  #   # render json: test
  # end

  # def link
  #   url = "http://sfbay.craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=555&minAsk=333&query=" + $searched_item
  #   @links = Nokogiri::HTML(open(url)).css('.pl a').map { |link| link['href'] }
  #   render json: @links
  # end

end


