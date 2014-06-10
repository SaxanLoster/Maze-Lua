local mazesE = {}
local mazesE_mt = {}
mazesE_mt.__index = mazesE_mt;

local mazesM = {}
local mazesM_mt = {}
mazesM_mt.__index = mazesM_mt;

local mazesH = {}
local mazesH_mt = {}
mazesH_mt.__index = mazesH_mt;

-- Easy Mazes
	mazesE[1] = '0x00000000000000000000005040404040406a802aeac00505050505050500000505003abad03afafabaaac050100000050005050000050500002aaabaead010406ababac00000000505000505000005002aaaead03a803a906aaa90000005050000000005000000402ad0102aaac06ad02ac00500050000000505050005007aeaba806aaaba903aea9005050000050000000005000010102ac0502aaaeac050000000000505000005050500002aea803ad02aaad01050400005000005000005000505002ad02ac0502aaafa803ad00005000505000005000005006abaaabad02ac03aeaae90050000000500050005005000502aaaaabaaa902ad02b800y000000000000000000000'
	mazesE[2] = '0x00000000000000000000003aaaeaeaaac02ac06aaac00000050500050005050005002aaa90102ad02afabac0500000000000050005000505002aeac040403aeaba80501000050505050005000005000040103abafaeafac02afac00500000005050505000505003ac0402a9050107a8050500005050000050005000505002afabaeaeafac07a8050500005000505050505000505002ad02ad05050503ac050500005000505050500050505002afac0505010106a9010100005050505000005000000006a90501050402abac06ac00500050005050000050505003a8010407ad0402afad0500000000505050500050505002aaaaaba903a9000101050000000000000000000000y0'
	mazesE[3] = '0x00000000000000000000007aaaaaaaaaaaaaeaeaea80050000000000000505050000502aaaaac0402a90507ac0050000000505000005050500502ac06abad0402ad01050050005050005050005000500102aba902ababaea906ad000000000000000050005050yaac0402aaaaaaad02ad050000505000000000500050500407a90402aeaeafac050100505000500050505050500007ad06abaea905050503ac00505050005000505050005005050506aba801050106ad0050505050000000500050500505050502aaaead0405050050505050000050505050500503ad0102aead03ad01010050005000005050005000000102abaaa8010102abaaa8000000000000000000000000'
	mazesE[4] = '0x000000000000000y000000506aaaaa802aaac03aea800505000000000005000500005050402aaaaac050407a8005050500000005050505000050503aaac0403afafafac00505000005050005050505003abaaac0507ac01010105000000005050505000000050040402ad07a90106a8040500505000505000005000505003abaead07aaa807ac03ad0000005050500000505000500402a907abaaa8010506a900500000500000000050500007a802afaaa806aaad07a800500000500000500050500003aaaeabaaa80106aba90400000050000000005000005006aaafaeaaac02ad0406ad00500050500050005050505003a80103a803aaabaea7a9000000000000000000000000'

-- Medium Mazes
	mazesM[1] = '0x0000000000000000000000000000000000000000003aaaeaeaaac02ac06aaac06aeaaa806a806a804040000005050005000505000505050000050005000505002aaa90102ad02afabac07ad03aaaaafaeabaeabad0000000000005000500050505000000050500050005002aeac040403aeaba8050103ac06a80107ac07a80300005050505000500000500000505000005050500050040103abafaeafac02afac02ad07aaac050107a8010050000000505050500050500050500050500050000003ac0402a9050107a8050102afad040103a807aaa80000505000005000500050000050505000000050000002afabaeaeafac07a80506aaa907afaaa80407aaa80000500050505050500050500000505000005050000002ad02ad05050503ac050506aea907a806ad03aaac0000500050505050005050505050005000505000005002afac0505010106a90101050502afaaad03aaac010000505050500000500000005050005000500000500006a90501050402abac06ac010502afa80506a807a80050005000505000005050500050005000505000500003a8010407ad0402afad07a80502ad06ababac01000000000050505050005050500050005050000050000006aeaeafa903ad04050503a807ac0107aea803ac040050505050000050505050000050500050500000505005010103a806afa90103aeac010502ad03aea803a9005000000000505000000050500050005000500000000502aeaeaead07aeaea80507a80106afa80104040400500050505050505050005050000050500000505050y902a901050501010506a907ac02ad07aaaeabafad0000000000505000005050005050005050005000505002aaaeac0507aaa80503a80503a80103ac03ac0505000000505050500000500000500000000050005050500406a907a907a802afaeac0106aeaeaea90405010100505000500050000050505000505050500050500000050104010407aaac0501010405010107a803afaeac0050005000505000505000005050000050000050505003aaafaaabafa80107aea803ad06aaafaaa80501030000005000005000005050000050500050000050005002aaafa802afa802a9050402ad0506abaeac07ac010000005000005000000050500050505000505050500002aaad02aeafaaa802abafa8050103ac01050107ac0000005000505000000000500050000050005000505002aaa902a903aaa802aaaba803aaa803a803a8010100000000000000000000000000000000000000000000'
	mazesM[2] = '0x0000000000000000000000000000000000000000005040404040406a802aeaaaaaaaaac02aaaaac04000050505050505050000050000000005000000050500003abad03afafabaaac0102aaaaaaabac02aeafafa80000005000505000005000000000000050005050500002aaabaead010406abaaac02aaaaaeafaea90101000000000050500050500000500000005050500000000002aaaead03a803a902aaabaaaaac010103aaaeaaac000000505000000000000000000050000000005000500402ad0102aaac06ac02ac04040502aaac040502a90050005000000050505000505050500000505050000007aeaba80402aba903aeabababafaaaaabafabaea800505000005000000000500000005000000050005000010102ac07aaaaaeac0102ac040506aaaea90405000000000050500000505000005050505000500050500002aea803ad02aaad01040403aba903a8010403ad040000500000500000500050500000000000005000505002ad02ac0502aaafa803afa802aaac02aaad06ad050000500050500000500000500000005000005050505006abaaabad02ac03aaaaabac0402ad0406afa907a9005000000050005000000000505000505050500050000102aaaaabaea902ac02aaafafaeabafa90102abac0000000000005000005000005050500050000000005002aaac02aaabaeaaabac02a90107ac0502ac0402ad0000005000000050000050000000505050005050005002aaad0402aead040403aaaaac01010102afabaaa90000005050005050505000000050000000005000000002aaabafac050103abaaaaaaabac02aaac010402ac0000000050505000000000000000500000500050005006aeaead03ad02aeaaaeaaac02abaeaaafaeabaea90050505050005000500050005000005000505000500005050503ac0106a902ad0403aaaaa904050102abac0050505000500050000050500000000050500000005001050106ad02ad02aea903ac06aaac050102aaaead0000500050500050005000005050005050000000505006aba8050102aba80102aaabafac03afaaaaaaa905005000005000000000000000005050005000000000500106a8010402aeaaac0402aaa90502a90402aaaea900005000005000500050500000005000005000005000yaabac02afaeabac03ad0406aaa90402ebac06abac000000500050500050005050500000500500505000500002abaaa903a8010003ababaaa803aab803aba80100000000000000000000000000000000000000000000'
	mazesM[3] = '0x0000000000000000000000000000000000000000007aaaaaaaaaaaaaeaeaeaaaeaaaaa804040406a800005000000000000050505000500000005050505000000502aaaaac0402a90507ac0506a806abad07aba800005000000050500000505050505000500050500000000502ac06abad0402ad010503afaeabac03afa806ac005000505000505000500050005050005000500050500102afa902ababaea906ad02ad03a807ac07aaa9010000005000000000500050500050000050505000000002ac0502aaaaaaad02ad0502afaeac01050106aaa8000050500000000050005050005050500050005000000407a90402aeaeafac0503ac05050102a906a906a80050500050005050505050005050500000005000500007ad06abaea905050503ac010507aeaeaaabaeafa80050505000500050505000500050505050000050500005010506aba801050106ad06ad050107aea80503ac005000505000000050005050505050005050005000500504050502aaaead04050505010502a90506afa801005050505000005050505050500050000050505000000503ad0102aead03ad010107a8050402a901050404005000500000505000500000500050500000005050500102afaea8010506abaea80502abafaaac02ababa90000005050000050500050005000005000500000000006aea9010402ad0506afac0102aeafac03aeaeac00005050000050005050505050000050505000505050000107a80407aaad010505050402a90507a8010503ac0000500050500050005050505000005050000050005002ad06afafa807a8010107ad02aead07aeac07a8030000505050500050000000505000505050505050005002a9010107a80106aaaea90506ad0501050103ac010000000000500000500050005050505000500000500002aeaeaead02aea902afa80501010502afac06a9040000505050500050000050005000005000505050005006ad010107a803a802a906afa802ad04050507aead005050000050000000000050500000505050505050500507a802afa802aeaaaaad07aaa801050501010501005050000050000050000050500000005050000050000103ac040502aead02aaad03aaa802abafaea807a80000005050500050500000500000000000505000500006aea907a906ad07ac02afaeaeac06aea9050403a8005050005000505050500050505050505000505000000103a803a8010101010001010101010106ababaaa80000000000000000000000000000000000y000000000'
	mazesM[4] = '0x000000000y00000000000000000000000000000000506aaaaa803aaac02aea802ac06aaac06a80402e80050500000000000500050000050500050500050050005050402aaaaac050407a802ad05040107aaa902bc00505050000000505050500000505050005000000050050503aaac0403afafafaeaaafabad0407a80404050050500000505000505050500050005050500050505003abaaac0507ac0101010502ad040103ad06ababa900000000505050500000005000505000005050000000040402ad07a90106a8040102afad0402ad050404040050500050500000500050000050505000505050505003abaead07aaa807ac03aeaea903aba805050507a9000000505050000050500050500000000050505050000402a907abaaa8010504010506a802ac0507a907ac0050000050000000005050005050000050505000505007a802afaaa806aaad07aaafa90402ad050506ad010050000050000050005050005000500050505050500003aaaeabaaa8010403a90407aaafaea90507a903a8000000500000000050000050500050500050500000000402abaeaaa802ad0402ad07a8010102ad07aaa8040050000050000000505000505000000000505000005003ac0403ac0402abad06aba906aaa802abad02ac0500005050005050000050500000500000000050005050040503aaad05040403afa80403ac0402aeabaaaba90050500000505050500050005000505000500000000007a902ac03ad0503aaafaaa902ad07a807aaa80404005000005000505000005000000050500050000050500502ac03ac07a9040403aea806a903ac07a806aba9005000500050500050500050005000005050005000000502ad0403ad02ad0506abaaabaaaaabad0407aea80050005050005000505050000000000000505050500003ac07afaeafaeafabafaeaea80406a803abad07a80000505050505050500050505000505000000050500006afa90505010107ac010503aaa907a806a80507a800505000505000005050005000000050005000505000010104050506aead0506afaaac06afaeafa80501040000005050505050505050500050505050500050005006aeafa90501050501010502afad050501040106a90050505000500050500000500050505050005000500005010506abac010106a803ac01050507aaad02afa8005000505000500000500000500050505000500050000102a903a803a802abaaaaaba8010103a803aaa90000000000000000000000000000000000000000000000'

-- Hard Mazes
	mazesH[1] = "0x000000000000000000000000000000000000000000000000000000000000003aaac02aaac0402aaaeaaa806a80402aeaaa80402aaac06aaa80406a802ac000000500000505000005000005000500050000050000050500000505000005002ac07aaaaafabac0407a80407a8050407a80403aeaead0506aeababa802ad000050500000500050505000505000505050005000505050505050000000005006afad06ac01040507abaaa9050405050502ad02a90107afa90106aaa802a900505050505000505050000000505050505000500000005050000050000000000101010107aaababafa80406abababa907a80506a802ad0106aeafa806a8040000000000500000005000505000000000500050500000500050505000500050040404040102aeac03aaad05040406aea902abad0406abaea9010106abaaa900505050500000505000005050505050500000005050500050000000500000000503ad0502ac0107a802ad0503abad0106a802abad05040106a802afa80400005000505000500050000050500000500050000000505050005000005000500003aaad0502abaeabaea80507a802ad06abaaa802abad07aaaba80403aea90400000050500000500050005050000050500000000000505000000050005000500406ad050404010407aeabafa80407aba804040406aba906a802abac0506a9005050505050500050505000500050500000505050500000500000005050500003a907ad07ad0405010104050407a90406a9050507aaaaafaaa802abafafa8000000505050505050000050505050005050005050500000500000000050500002aaa903a903afad02aaad0503ad06a907a807ababa802ad06aaaeaea903ac00000000000000505000005050005050005000500000000050500050500000500406aaaaaaac0501040403afaaababa807aaabaaaeaaa803aba80503ac0401005050000000505000505000500000000050000000500000000000500050500003a902aaac07afaea903aaabaea8040407aaaaa803aaa806aaa803a807ad0000000000005050505000000000500050505000000000000050000000005050000406a8040501010502aaac02afa807ababaeaeac06aaaaafaea802aaad07a8005050005050000050000050005000500000505050500000505000000050500003afaaabafaaaaafaeaeabaeabac07aaa8050107afaaa80107aaaaac0107a8000050000050000050505000500050500000500050500000005000005000500006ad0402aba802ad050106ad0403abaea807a80507aaaaac03aaa803a807a80050505000000000505000505050000050005000505000005000000000005000010503aeac02aea90502ad07afaeac07ac07a80507ac04010406ac02ac07ac000050005050005000500050505050505050500050505050005050500050505002a906ad03aaad040106a90501010505010102a90107aba807ad03aaa90501000000505000005050005000500000505000000000005000005050000000500002aaa90506aeabafa807a807aea80507aaa806a806afac06ad010406a80104000000005050500050005000505000505000005000505050505000505000005002aaaea9050102ad02afa80503ac0107aaaaafa8050507ad03aeafafa80405000000500050000050005000500050005000005000505050500050505000505006aaafac03ac02afa80106ad06afa807aaac07ac05050507a8010107aaaba900500050500050005000005050505000500050505050505050000000500000000506ad07a80506abaeac01050107a807ac01050501010507aeaaa807aaaea800505050500050500050500050005000505000505000005050500000500050000101010502a903ac0105040106afa80501040107aaa8050503a802afac03ac000000005000000050005050005050005000500050000050500000005050005002aeac01040402a906abafa8050102afaaad0407a8040507aaa806ad03a801000050500050500000500050005000005000505050005050500000505000000002ad03aaad03ac02afa803ac0106aaad06a90507aaa90503aaac0507aaaea8000050000050005000500000500050005050005050000050000050505000500002ad02aeafaaabaeabaea80106ad02ad03aead03aea807a806a90507a807a8000050005050000050005000005050005000505000500050005000505000500006a906a90502aaafac07ac04010102ad02ad07a80102aba807a80503a807a800500050005000005050505050000000500050500000000000500050000050000102afa807a8040505050503aaaaaaafa80107ac06a804040106afaea803a8000000500050005050505050000000005000005050500050500050505000000006ac0102a902abad0505010402aaaaad06a80107abaaaba904050103aaaea80050500000000000505050005000000050500000500000000050500000005000010506aaaaaaaea90103a803aaaaaeafabaaa8050406aaaaa907aeaea8050000005050000000500000000000000050500000005050500000005050500050000407ad06aeaaafaaaaaeaaaaa806ad07aaaeac03ababaaaea805010102afa8005050505050005000005000000050505000505000000000500050000000500003a901010102aba802aba802aaa90103a80103a802aaa803a803aaa802afa8000000000000000000000000000000000000000000000000000000000000y000"
	--

math.randomseed( os.time() )

local function getE()
	convert( makeMaze( 7 ) , 7 )
	--local r = math.random( 1 , #mazesE )
	--print( r )
	return mazesE[r]
	end

local function getM()
	local r = math.random( 1 , #mazesM )
	print( r )
	return mazesM[r]
	end

local function getH()
	local r = math.random( 1 , #mazesH )
	print( r )
	return mazesH[r]
	end

return {
	getE = getE ,
	getM = getM ,
	getH = getH
	}