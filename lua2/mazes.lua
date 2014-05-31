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

-- Hard Mazes
	mazesH[1] = "0x000000000000000000000000000000000000000000000000000000000000003aaac02aaac0402aaaeaaa806a80402aeaaa80402aaac06aaa80406a802ac000000500000505000005000005000500050000050000050500000505000005002ac07aaaaafabac0407a80407a8050407a80403aeaead0506aeababa802ad000050500000500050505000505000505050005000505050505050000000005006afad06ac01040507abaaa9050405050502ad02a90107afa90106aaa802a900505050505000505050000000505050505000500000005050000050000000000101010107aaababafa80406abababa907a80506a802ad0106aeafa806a8040000000000500000005000505000000000500050500000500050505000500050040404040102aeac03aaad05040406aea902abad0406abaea9010106abaaa900505050500000505000005050505050500000005050500050000000500000000503ad0502ac0107a802ad0503abad0106a802abad05040106a802afa80400005000505000500050000050500000500050000000505050005000005000500003aaad0502abaeabaea80507a802ad06abaaa802abad07aaaba80403aea90400000050500000500050005050000050500000000000505000000050005000500406ad050404010407aeabafa80407aba804040406aba906a802abac0506a9005050505050500050505000500050500000505050500000500000005050500003a907ad07ad0405010104050407a90406a9050507aaaaafaaa802abafafa8000000505050505050000050505050005050005050500000500000000050500002aaa903a903afad02aaad0503ad06a907a807ababa802ad06aaaeaea903ac00000000000000505000005050005050005000500000000050500050500000500406aaaaaaac0501040403afaaababa807aaabaaaeaaa803aba80503ac0401005050000000505000505000500000000050000000500000000000500050500003a902aaac07afaea903aaabaea8040407aaaaa803aaa806aaa803a807ad0000000000005050505000000000500050505000000000000050000000005050000406a8040501010502aaac02afa807ababaeaeac06aaaaafaea802aaad07a8005050005050000050000050005000500000505050500000505000000050500003afaaabafaaaaafaeaeabaeabac07aaa8050107afaaa80107aaaaac0107a8000050000050000050505000500050500000500050500000005000005000500006ad0402aba802ad050106ad0403abaea807a80507aaaaac03aaa803a807a80050505000000000505000505050000050005000505000005000000000005000010503aeac02aea90502ad07afaeac07ac07a80507ac04010406ac02ac07ac000050005050005000500050505050505050500050505050005050500050505002a906ad03aaad040106a90501010505010102a90107aba807ad03aaa90501000000505000005050005000500000505000000000005000005050000000500002aaa90506aeabafa807a807aea80507aaa806a806afac06ad010406a80104000000005050500050005000505000505000005000505050505000505000005002aaaea9050102ad02afa80503ac0107aaaaafa8050507ad03aeafafa80405000000500050000050005000500050005000005000505050500050505000505006aaafac03ac02afa80106ad06afa807aaac07ac05050507a8010107aaaba900500050500050005000005050505000500050505050505050000000500000000506ad07a80506abaeac01050107a807ac01050501010507aeaaa807aaaea800505050500050500050500050005000505000505000005050500000500050000101010502a903ac0105040106afa80501040107aaa8050503a802afac03ac000000005000000050005050005050005000500050000050500000005050005002aeac01040402a906abafa8050102afaaad0407a8040507aaa806ad03a801000050500050500000500050005000005000505050005050500000505000000002ad03aaad03ac02afa803ac0106aaad06a90507aaa90503aaac0507aaaea8000050000050005000500000500050005050005050000050000050505000500002ad02aeafaaabaeabaea80106ad02ad03aead03aea807a806a90507a807a8000050005050000050005000005050005000505000500050005000505000500006a906a90502aaafac07ac04010102ad02ad07a80102aba807a80503a807a800500050005000005050505050000000500050500000000000500050000050000102afa807a8040505050503aaaaaaafa80107ac06a804040106afaea803a8000000500050005050505050000000005000005050500050500050505000000006ac0102a902abad0505010402aaaaad06a80107abaaaba904050103aaaea80050500000000000505050005000000050500000500000000050500000005000010506aaaaaaaea90103a803aaaaaeafabaaa8050406aaaaa907aeaea8050000005050000000500000000000000050500000005050500000005050500050000407ad06aeaaafaaaaaeaaaaa806ad07aaaeac03ababaaaea805010102afa8005050505050005000005000000050505000505000000000500050000000500003a901010102aba802aba802aaa90103a80103a802aaa803a803aaa802afa8000000000000000000000000000000000000000000000000000000000000y000"

math.randomseed( os.time() )

local function getE()
	local r = math.random( 1 , #mazesE )
	print( r )
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