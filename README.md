<div align="center">
<img width="100%" height = "100px" src="https://scontent.fdvo5-1.fna.fbcdn.net/v/t1.6435-9/120739533_785949515550660_8312183665269487160_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeHZS-M_4oPgwP_0foStcC-rW5LkDohIAIxbkuQOiEgAjAQVBtUa00s4lfCSPvdZPoiITGo_v89bux6XJQnfNSrF&_nc_ohc=PMlUaPZjGoQAX9YcWqR&_nc_ht=scontent.fdvo5-1.fna&oh=00_AfAFmEWFs5-q5rwIQIRNMtvoO133f4aOAuCbBZbnuOHnfw&oe=64390E17" alt="cover" />
</div>


## Dependencies
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory) --- For Removing and Carry
- [qb-core](https://github.com/qbcore-framework/qb-core) --- Main Frameworks
- [qb-target](https://github.com/BerkieBb/qb-target) ----Target Fucntion
- [qb-menu](https://github.com/qbcore-framework/qb-menu) ---- For Menu
- [ps-UI](https://github.com/Project-Sloth/ps-ui) -- For UI
- [PolyZone](https://github.com/mkafrin/PolyZone) -- For Poly Fish Zone And Target Zone


## Fishing Job

## Put Items (qb-core/shared/item.lua)
    -- fish tools
	['fishingrod'] 			         = {['name'] = 'fishingrod', 				    ['label'] = 'Fish Grod', 			    ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'fishingrod.png', 			    ['unique'] = true, 		    ['useable'] = true, 	['shouldClose'] = true,	       ['combinable'] = nil,          ['description'] = 'Fish Grod Yeah!'},
	['fishbait'] 			         = {['name'] = 'fishbait', 				        ['label'] = 'Fish Bait', 			    ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'fishbait.png', 			    ['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,          ['description'] = 'Fish Bait Yeah!'},
	-- Fish
	['blackfin_tuna'] 			     = {['name'] = 'blackfin_tuna', 				['label'] = 'Blackfin Tuna', 			['weight'] = 500, 	    ['type'] = 'item', 	    ['image'] = 'blackfin_tuna.png', 			['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,          ['description'] = 'Blackfin Tuna Yeah!'},
	['yellowfin_tuna'] 			     = {['name'] = 'yellowfin_tuna', 				['label'] = 'Yellowfin Tuna', 			['weight'] = 500, 	    ['type'] = 'item', 	    ['image'] = 'yellowfin_tuna.png', 			['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,          ['description'] = 'Yellowfin Tuna Yeah!'},
	['cichlid'] 			         = {['name'] = 'cichlid', 				        ['label'] = 'Cichlid', 					['weight'] = 150, 	    ['type'] = 'item', 	    ['image'] = 'cichlid.png', 					['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,          ['description'] = 'Cichild Yeah!'},
	['florida_pompano'] 			 = {['name'] = 'florida_pompano', 				['label'] = 'Florida Pompano', 			['weight'] = 150, 	    ['type'] = 'item', 	    ['image'] = 'florida_pompano.png', 			['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,          ['description'] = 'Florida Pompano Yeah!'},
	['horseye_jack'] 			     = {['name'] = 'horseye_jack', 				    ['label'] = 'Horseye Jack', 			['weight'] = 150, 	    ['type'] = 'item', 	    ['image'] = 'horseye_jack.png', 			['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,          ['description'] = 'Horseye Jack Yeah!'},
	['lane_sanapper'] 			     = {['name'] = 'Lane Sanapper', 				['label'] = 'lane_sanapper', 			['weight'] = 150, 	    ['type'] = 'item', 	    ['image'] = 'lane_sanapper.png', 			['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,          ['description'] = 'Lane Sanappero Yeah!'},
	['mutton_snapper'] 			     = {['name'] = 'mutton_snapper', 				['label'] = 'mutton_snapper', 			['weight'] = 150, 	    ['type'] = 'item', 	    ['image'] = 'mutton_snapper.png', 			['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,          ['description'] = 'Mutton Snapper Yeah!'},
	['pig_fish'] 			         = {['name'] = 'pig_fish', 				        ['label'] = 'pig_fish', 			    ['weight'] = 150, 	    ['type'] = 'item', 	    ['image'] = 'pig_fish.png', 			    ['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,          ['description'] = 'Pig Fish Yeah!'},
	['silver_perch'] 			     = {['name'] = 'silver_perch', 				    ['label'] = 'Silver Perch', 			['weight'] = 150, 	    ['type'] = 'item', 	    ['image'] = 'silver_perch.png', 			['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,          ['description'] = 'Silver Perch Yeah!'},
	['striped_bass'] 			     = {['name'] = 'Striped Bass', 				    ['label'] = 'striped_bass', 			['weight'] = 150, 	    ['type'] = 'item', 	    ['image'] = 'striped_bass.png', 			['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,          ['description'] = 'Striped Bass Yeah!'},

## Put Image (/qb-inventory/html/images)
