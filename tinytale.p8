pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--tinytale
--aurelien dos santos

#include actions.lua
#include autotiles.lua
#include battles.lua
#include database.lua
#include easing.lua
#include hud.lua
#include inventory.lua
#include main_loop.lua
#include picoboard.lua
#include player.lua
#include scene_map.lua
#include title.lua
#include tools.lua
#include towns.lua
#include ui_elements.lua
__gfx__
00000000bbbbbbbbbbbbbbbbbbbbbbbbbbbf1bbbbbbbbbbbbb3333bbbbb30bbb0000000000000000000000000000000000000000000000000000000000000000
00000000bbbbbbbbbbbbbbbbbbbbbbbbbbff51bbbbb33bbbb3bab31bbbb01bbb0000000000000000000000000000000000000000000000000000000000000000
00700700bbbbbbbbbbb33bbbbb1111bbbfffd51bbb3bb3bb03ab3331bb3101bb0000000000000000000000000000000000000000000000000000000000000000
00077000bbbbbbbbbb3993bbbb1111bbbffdf551b3bab31b11311310bb0310bb0000000000000000000000000000000000000000000000000000000000000000
00077000bbbbbbbbbb9ff9bbbb1111bbfddfd515b3bb310b01033101b310010b0000000000000000000000000000000000000000000000000000000000000000
00700700bbbbbbbbbb9fffbbbb1111bbd5dd5151b13011bbb0101015b03110050000000000000000000000000000000000000000000000000000000000000000
00000000bbbbbbbbbbbffbbbbbbbbbbb5df51511bb04205b21010102bb00005b0000000000000000000000000000000000000000000000000000000000000000
00000000bbbbbbbbbbbbbbbbbbbbbbbbbf5d511bbbbbbbbbbb42205bbbb555bb0000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b7bbbbbbbbbbb7bbbbbbbbbbbbbbbb3b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
787bbbbbbbbb787bbbbbbbbbbb3bb33b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b75bb7bbbb7bb75bbbbbb3bbbb33b3bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbb787bb787bbbbbb3b33bbbbb3bbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbb75bbb75bbbbbbbb3bbbbbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444349fff43000000000000000000000000000000000000000000000000bbb92bbbbbbbbbbb8bb8bb8bbbbbbbbbbbbbbbbbbbbbbbbbbb9a8bbbbb1bbbbb
222222222499ff41000000000000000000000000000000000000000000000000bb9a42bbddd5d55b21c21c2bbbb22bbbbbb22b1bb101010bb99a88bbbc10bbbb
999999997499ff47000000000000000000000000000000000000000000000000b9a9242bd111112b21c21c2bbb2941bbbb294171b212171b9989188bcc10001b
ffffffffb499ff4b000000000000000000000000000000000000000000000000ba9a42405ddddd5001c01c0bb299441bb29942611c2c260b98ddd18bcc100ccb
44444444b499ff4b000000000000000000000000000000000000000000000000b9a924205d66665081c81c8bb9911440b99944202c2c21208d606d10c1d10cc0
424242427499ff47000000000000000000000000000000000000000000000000ba9442405d6666202012012bb91dd140b99214404c2c2c20d66666d01d6d1110
220000224499ff42000000000000000000000000000000000000000000000000b9400420525222202102102bb2d00d20b920014094400440d60060d0d606d0d0
20111102329fff23000000000000000000000000000000000000000000000000b2400420111111100011010bbd6006d0b2600610b9900990d6006dd0d60666d0
b000000b09999990000000000000000000000000000000000000000000000000bbb1bbbbbb4441bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb200bb33bbbbbb
0922229009222290000000000000000000000000000000000000000000000000bb241bbbb499221bbbb42b1bbbbbbbbb0101010b0202020bbb28260b103333bb
0a4444a009222290000000000000000000000000000000000000000000000000b29441bbb9449210bb494171bb1010bb1212121b2828282bb2882d0b9ffffffb
099999900a2222a000000000000000000000000000000000000000000000000029a4941bb4229210b4994061bb2121bb2c2c2c2b8989898b28882220f444444f
09499490094994900000000000000000000000000000000000000000000000009aa49940bd0d9210b9921200bbc2c2bb2c2c2c208989898028820220f224422f
0949949009499490000000000000000000000000000000000000000000000000aa9d4990b6664d10b92dd120bb21210b2c2c2c2089898980282990204ffffff4
0944449009444490000000000000000000000000000000000000000000000000a9d6d490bbbbd6d0b20d0010bbd00d0b40040040d00dd0d022949900c4444443
bbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000009d606d40bbbb6060bd6600d0bbd00d0b99999990d00666d0b000000bcc444413
00099900000000000009990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0799ff00000999000099ff0000099900000999000000000000000000000000000000000000000000000000000000000000000000000000000007770077700000
0799ff000079ff000079ff000099ff000099ff000000000000000000000000000000000000000000000000000000000000000000000000000077700001710000
070d66000079ff00007d66000799ff000099ff000000000000000000000000000000000000000000000000000000000000000000000000007077777707017770
04d64440007d660000764440070d6600000d66000000000000000000000000000000000000000000000000000000000000000000000000007177777777700171
0fd64940004644400046494007d6444000df47770000000000000000000000000000000000000000000000000000000000000000000000007177771101110711
00d6640000f6494000f6640004d6494000d666400000000000000000000000000000000000000000000000000000000000000000000000000107711000007770
00d0060000d6640000600d000fd6640000d006000000000000000000000000000000000000000000000000000000000000000000000000000000110000000111
0000000000110060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000222222229aaaaaa9
000000000133106000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000025555554a555555a
000000000133104000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000025555554a555555a
000cc0000011313100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000025555554a555555a
0007c7000001331000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000025555554a555555a
00cccc000013310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000025555554a555555a
0cccccc00133331000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000025555554a555555a
0000000001311131000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000244444499aaaaaa9
00042000000f90000099900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00666d0000f004000944490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000dd000000940009449449000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0066dd00000090009449224000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
060000d0000090004224224000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
068822d0000940000422240000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06222250000090000044400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00d55500000940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00006660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
40666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
40040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000bbbbbb33333bbb3333bbbbbbbbbbbb3333bbbb3333bbbbbb017cc741327cc720207cc720207cc7433142c7cccccccccccc7ca923cccccccc
0000000000000000bb33330122433321103333bbbb33330121333301103333bb127cc724327ccc7207cccc7207cc74933012c7ccccccccccc7ca9213cccccccc
0000000000000000b3020112777412172414203bb3020112492120129412103b21cccc42347cccc77cccccc77ccc793bb324c7ccccccccccccc9243b7cccccc7
0000000000000000b3212777ccc7777c7779423bb321422424944122a941243b1cccccc4b347cccccccccccccccc723bb3124c7cccccccccc7c2923bc7cccc7c
0000000000000000b3247cccccccccccccc7293bb324242cccc4942cca49a23bc7cccc7cb327cccccccccccccccc743bb3242c7cccccccccc7c4243b4cccccc4
0000000000000000b307ccc77cccccc77ccc703bb3014c777c7cccc777c4243b7cccccc7b347ccc77cccccc77cccc713b3014ccccccccccccc7c123b24cccc9a
00000000000000003017cc7927cccc7927cc71033012c7ccccc77c7ccc7c4923cccccccc3217cc7927cccc7927ccc74330121c7ccccccccccc7c4213417cc742
00000000000000003127c79a027cc79a027c72133121cccccccccccccccc4413cccccccc317cc79a027cc79a027cc7233041c7cccccccccccccc2123127cc721
00000000000000003127c720207cc720207c72433121cccccccccccccccc9213333bbb33327cc7433012cccccc7c4213cccccccccccccccc0121c7cccc7c4241
00000000000000003047cc7207cccc7207cc74133242c7ccc7c77ccccc7c4a2322433321327c74930101c7cccc7cca2177cccccccccccc77121c7cccccc7c412
0000000000000000b317ccc77cccccc77ccc723bb3142c777cccc7c777c4243b77741217347c793b2020c7cccc7cc9a2cc7cccccccccc7cc77cccccccccccc77
0000000000000000b3497cccccccccccccc74a3bb32142acc9a94cccca49a23bccc7777cb347723b910c7cccccc7cc24ccccccccccccccc9cccccccccccccccc
0000000000000000b3242777c7777ccc7774a23bb314149a9a942942a942443bc7777cccb327743b42ccccccccccccc292cc7cccccc7c492cccccccccccccccc
0000000000000000b3029294749247772419213bb3010149421211219412113b74924777b347c713cc7cccccccccc7cc212cc7cccc7cc9a477cccccccccccc77
0000000000000000bb3333494a333142423333bbbb33330121333312113333bb4a3331423217c74377cccccccccccc770212c7cccccc9a42424c7cccccc7c942
0000000000000000bbbbbb3333bbb33333bbbbbbbbbbbb3333bbbb3333bbbbbb33bbb333317cc723cccccccccccccccc1010c7cccc7c49231424c7cccc7c4a21
000000000000000000000000000000000000000000000000bbb30bbbbbb30bbbbbb30bbbbbb3031001030bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb3bb310bbbbb
000000000000000000000000000000000000000000000000bbb01bbbbbb01bbbbbb01bbbbbb0103110001bbbbbb33bbbbbb33bbbbbb33bbbbbb3313011b33bbb
000000000000000000000000000000000000000000000000bb3101bbbb3101bbbb3101bbbb310100003101bbbb3bb3bbbb3bb3bbbb3bb3bbbb3bb304203bb3bb
000000000000000000000000000000000000000000000000bb0310bbbb0310bbbb0310bbbb031011110310bbb3bab31bb3bab31bb3bab31bb3bab31bb3bab31b
000000000000000000000000000000000000000000000000b3100103031001030310010b0310010303100103b3bb310bb3bb310bb3bb310bb3bb310bb3bb310b
000000000000000000000000000000000000000000000000b031100010311000103110051031100010311000b13011b3313011b3313011bb313011b3313011b3
000000000000000000000000000000000000000000000000bb000031010000310100005b0100003101000031bb04203bb304203bb304205bb304203bb304203b
000000000000000000000000000000000000000000000000bbb5550310111103105555bb1011110310111103bbbbb3bab31bb3bab31bbbbbb31bb3bab31bb3ba
000000000000000000000000000000000000000000000000bbb303100103031001030bbb0103031001030310bbbbb3bb310bb3bb310bbbbb310bb3bb310bb3bb
000000000000000000000000000000000000000000000000bbb010311000103110001bbb1000103110001031bbb3313011b3313011b33bbb11b3313011b33130
000000000000000000000000000000000000000000000000bb31010000310100003101bb0031010000310100bb3bb304203bb304203bb3bb203bb304203bb304
000000000000000000000000000000000000000000000000bb03101111031011110310bb5503101111031055b3bab31bb3bab31bb3bab31bb3bab31bb3bab31b
000000000000000000000000000000000000000000000000b3100103031001030310010bb31001030310010bb3bb310bb3bb310bb3bb310bb3bb310bb3bb310b
000000000000000000000000000000000000000000000000b03110001031100010311005b031100010311005b13011b3313011b3313011bbb13011b3313011bb
000000000000000000000000000000000000000000000000bb000031010000310100005bbb0000310100005bbb04203bb304203bb304205bbb04203bb304205b
000000000000000000000000000000000000000000000000bbb5550310111103105555bbbbb55503105555bbbbbbb3bab31bb3bab31bbbbbbbbbb3bab31bbbbb
000000000000000000000000000000000000000000000000bbb303100103031001030bbbbbb3031001030bbbbbbbb3bb310bb3bb310bbbbbbbbbb3bb310bbbbb
000000000000000000000000000000000000000000000000bbb010311000103110001bbbbbb0103110001bbbbbb3313011b3313011b33bbbbbb3313011b33bbb
000000000000000000000000000000000000000000000000bb31010000310100003101bbbb310100003101bbbb3bb304203bb304203bb3bbbb3bb304203bb3bb
000000000000000000000000000000000000000000000000bb03105555031055550310bbbb031055550310bbb3bab31bb3bab31bb3bab31bb3bab31bb3bab31b
000000000000000000000000000000000000000000000000b310010bb310010bb310010b0310010bb3100103b3bb310bb3bb310bb3bb310bb3bb310bb3bb310b
000000000000000000000000000000000000000000000000b0311005b0311005b031100510311005b0311000b13011bbb13011bbb13011bb313011bbb13011b3
000000000000000000000000000000000000000000000000bb00005bbb00005bbb00005b0100005bbb000031bb04205bbb04205bbb04205bb304205bbb04203b
000000000000000000000000000000000000000000000000bbb555bbbbb555bbbbb555bb10b555bbbbb55503bbbbbbbbbbbbbbbbbbbbbbbbb31bbbbbbbbbb3ba
00000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb3333bbbb3333bbbb3333bbbb333303313333bbbbbf1bbbbbbf1bbbbbbf1bbbbbbf1ddfd51f1bbb
00000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb3bab31bb3bab31bb3bab31bb3bab31013bab31bbbff51bbbbff51bbbbff51bbbbff51dd51ff51bb
00000000bbb333b3bbb33bbbbbb333b333333b33b3333bbb03ab333103ab333103ab333103ab333103ab3331bfffd51bbfffd51bbfffd51bbfffd5151fffd51b
00000000bb399999bb3993bbbb39939999399399999993bb1131131011311310113113101131131011311310bffdf551bffdf551bffdf551bffdf5515ffdf551
00000000bb9fffffbb9ff9bbbb9ff9fffffff9fffffff9bb0103313333033133330331013303313333033133fddfd51f1ddfd51f1ddfd5151ddfd51f1ddfd51f
00000000bb9fffffbb9fffbbbb9fffffffffffffffffffbbb01013bab31013bab3101015b31013bab31013bad5dd51ff51dd51ff51dd515151dd51ff51dd51ff
00000000bbbffbffbb9fffbbbb9ffffbfbfffffbfbffffbb210103ab333103ab33310102333103ab333103ab5df51fffd5151fffd5151511d5151fffd5151fff
00000000bbbbbbbbbb9ffbbbbb9ffbbbbb9ffbbbbbbffbbbbb421131131011311310205b1310113113101131bf5d5ffdf5515ffdf551511bf5515ffdf5515ffd
00000000bbbbbbbbbb9ff9bbbb9ff3bbbb9ff9bbbb3ff9bbbb33330331333303313333bb3133330331333303bbbf1ddfd51f1ddfd51f1bbbd51f1ddfd51f1ddf
00000000bbbbbbbbbb9fffbbbb9fffbbbb9fffbbbb9fffbbb3bab31013bab31013bab31b13bab31013bab310bbff51dd51ff51dd51ff51bb51ff51dd51ff51dd
0000000033333b33bb9fffbbbb9fffb3339fff33b39fffbb03ab333103ab333103ab333103ab333103ab3331bfffd5151fffd5151fffd51b1fffd5151fffd515
0000000099999999bb9fffbbbb9fff99999fff9999ffffbb1131131011311310113113101131131011311310bffdf5515ffdf5515ffdf5515ffdf5515ffdf551
00000000ffffffffbbbfffbbbbbfffffffffffffffffffbb0103313333033133330331010103313333033101fddfd51f1ddfd51f1ddfd515fddfd51f1ddfd515
00000000ffffffffbb9fffbbbb9fffffffffffffffffffbbb01013bab31013bab3101015b01013bab3101015d5dd51ff51dd51ff51dd5151d5dd51ff51dd5151
00000000ffbfffffbb9ffbbbbb9ffbffbffffbfffbfffbbb210103ab333103ab33310102210103ab333101025df51fffd5151fffd51515115df51fffd5151511
00000000bbbbbbbbbb9ff9bbbb9ff3bbbbfff9bbbb9ff9bbbb421131131011311310205bbb4211311310205bbf5d5ffdf5515ffdf551511bbf5d5ffdf551511b
00000000bbbbbbbbbb9fffbbbb9fffbbbbbfffbbbbbfffbbbb33330331333303313333bbbb333303313333bbbbbf1ddfd51f1ddfd51f1bbbbbbf1ddfd51f1bbb
00000000bbbbbbbbbb9fffbbbb9ffbbbbb9fffbbbb3fffbbb3bab31013bab31013bab31bb3bab31013bab31bbbff51dd51ff51dd51ff51bbbbff51dd51ff51bb
00000000b3333bbbbb9fffbbbb9ff3b3339fff33b39fffbb03ab333103ab333103ab333103ab333103ab3331bfffd5151fffd5151fffd51bbfffd5151fffd51b
00000000999993bbbbbfffbbbbbfff9999ffff9999ffffbb1131131011311310113113101131131011311310bffdf5515ffdf5515ffdf551bffdf5515ffdf551
00000000fffff9bbbb9fffbbbb9fffffffffffffffffffbb0103310101033101010331013303310101033133fddfd515fddfd515fddfd5151ddfd515fddfd51f
00000000ffffffbbbb9fffbbbb9fffffffffffffffffffbbb01010151010101510101015b3101015101013bad5dd5151d5dd5151d5dd515151dd5151d5dd51ff
00000000fbfffbbbbbbffbbbbbbffbffffbffffffbfffbbb21010102210101022101010233310102210103ab5df515115df515115df51511d51515115df51fff
00000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb42205bbb42205bbb42205b1310205bbb421131bf5d511bbf5d511bbf5d511bf551511bbf5d5ffd
__gff__
0002040101020408000000000000000002020202000000000000000000000000000000000000000080808080808080804000000000000000808080808080800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000010101010101010101010101010100000101010101010101010101010101000000000000101010101004040404040000000000001010101010040404040400000000000010101010100404040404000202020202080808080801010101010002020202020808080808010101010100020202020208080808080101010101
__map__
01ebececeffcfcfd010101010101010101010101010101010103010101010101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dcdeeceffd0101010101d6d7d801010101010101010101010103010101010101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
eceffcfd010141717204e6e7dad8010101010101010101010103010101010101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
effd01010170630101d6d9e7eaf8010101010101010101010103030101010101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ed010105010101d6d7d9e7eaf801010101d6d7d8010101010101030101010101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dfdd010101d6d7d9eaf7f7f80106060601e6e7dad80101030303030301010101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
eced01400202f7f7f801010106060101d6d9eaf7f80303030303030303010101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
eced0150497979794b0106060601d6d7d9eaf80303030103030303030303010101010101012e010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04dfdd61097172010601060101d6d9eaf7f80303010101010103030303030101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0404dfdcdf040470060604020303f7f801010301010101010101030303030101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
040404040404040406060303030303030103030303030303030303030601010101010101d6d7d7d801010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0404040404040404040606060606060303030505050503030303060606060601010101d6d90606dad8010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
060606060404040101010606060606050505053005050505050303030606da06060606d906060606dad7d801010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
060606060601010101010606060605050505050505050505050505030306060606060606060606060606dad8010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06060606060101010101040606050505050505050505050505050505030606060606eaf7f7f7f7e9060606dad80101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06060606060101010404df0404050505050505050505050505050505030306060606e801010201e606060606dad7d8010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06060606060101040404040404040505050505050101010101010505050303060606e801010201f6f7e90606e7e7e8010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06060606010404040404040404040505050501010101010101010105050503060606dad80102010101e60606e7e7e8010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060404040404040404040405050501010101010101010101010105050306060606dad801010101e60606e7eaf8010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06040404040404010105050505050501010101010101013e3d0101010105030606060606dad80101d6d90606e7e801010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04040404040401010105050505050101010101020201020202020201010103060606060606da0606d9060606eaf801010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0404040401010101010105050101010101010202010101010101020201010301f606060606e90606060606eaf80101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
040404120101050505010101010101010102020101010101010101020101030101010101020606060606eaf8010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0304040101050505050101010101010102020101010101010101010101010301010101020201060606060601010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03030101010505010101012e0202020202010101010101010101010101022002010101020101010606060601010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303010101010101010101010101010101010101010101010101010101010302020202020202010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030301010101010101010101010101010101010101010101010101030301010101010102020101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030301010101010101120101050505010101010101010101010101030101010101010101020101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
030303033f010101011301010505050505010101040404040101010101030101010101010101020202040101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030301010101010505050501040404040404040401010103030301010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030303040404040404040404040404040404040404010303030303030303030303010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030303030404040404040404040404040404040404040303030303030303030303030303030301010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000191501b150211502815000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
