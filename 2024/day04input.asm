; vim: set nowrap:
	db 11 dup(0)
	db 11 dup(0)
	db 11 dup(0)
testinput db \
	"MMMSXXMASM",0,\
	"MSAMXMSMSA",0,\
	"AMXSXMAAMM",0,\
	"MSAMASMSMX",0,\
	"XMASAMXAMM",0,\
	"XXAMMXXAMA",0,\
	"SMSMSASXSS",0,\
	"SAXAMASAAA",0,\
	"MAMMMXMMMM",0,\
	"MXMXAXMASX",0
	db 141 dup(0)
	db 141 dup(0)
	db 141 dup(0)
input db \
	"SAXMASMMMASAMMMMXXMMXMMMSSMMMXSAAXMSSMSSSSSSSSXSASXMSMMMSASXSXMASXMSSSMXSSMXSMSSXMXXSXMXAMXMASXASXMSAMSSSMMAAXAMMXXSAMMSXSSSSMSMMSMSAXSAMXMX",0,\
	"MXXAAMAAMAMASXSSSMMSAMMSAMASMMSXSAMXAAMAAAAAAXSXAMMMAMAAXAMMAXXAXAAAXMAMMAMAMMAMXMAXSASXSAMXAXMSMAMMAAXSAMXSSXMMMAMMASAMXAAAXAAAXAAMAMXAMXAM",0,\
	"XSXMASXMMXSAMXAAXMASASMMXXAMAXXAMXXSMMMMMMMMMMXMXMAMASASMMMAMMMMXMMMMSAMSAMAXMAMAMMXSAMXMMXMASXAMXMSMMMSMXMXAXSAMSXSAMASMMMMMSMSMMSMAMSXMASA",0,\
	"SMAMASMAMAMASMMMMMASMMXAAMMSSMMMMMXAXXXAMAMASXAASXXSASAXAAASAAAMASAXMSXXSMMMMSASXSMAMXMAMXAMXMXMMAMXAAAMXSMMMXMAMMAMSSXMMMSMAMXXXAAMAAXASAMS",0,\
	"XMAMAXXAMSSXSMSAXMXSXSMSMMXAXAXMASAMXMMMSMSASXMXSAMMMMXSMMMMSSXSXSASAMXMMMSMMMAMAAMXMMSXSAXXAMAXASASXMSSXXAAXMXMMMMMASXAXAAMSSXXMXSSXSMMMAXX",0,\
	"SSXSXMMXSMMMSASAMSMSAXAAAXMXMSMSASAMAMAAAAMASXMASAMXASXAXAXMXMASAMXMASMSAAAAMMSMSMMAXAAAMMSSXMAMMMAXXAXAXMSMSSMXAMXMAMSAMSXSMMMXXAMXXMASXMMS",0,\
	"XAAAAMSMMMAAMMMSMAAMMMSMSMMMMMAMXSMXAXMSSSMAMXMASAMXMAASXSSMAMXMASASXMASMSSSMAMMXXSSSSMSMXXASASXMMXMMXMMMXMAAASXMMSMAXMXXMMSASMXSAMXSAAXAAAX",0,\
	"SMMMMMAAASMSMSAMMMSMXAXXXAAAAAXMMXMSAXMAMXMAXXMAXAMSXMXMAMXXAXSXMSMMSMMMMAAMMMSXMAXMAMAMXMMAXMXAMXAMXSXXMAMMMSMSMAXMSXMXSAMXMMAMXASAMMSXXMSM",0,\
	"MAAXMSXXMSAAAMMXAXAMMMSMSSMSMSMSAXMASAMAMXSXMMMMXSAMXXXMAMASXXSAMXMXAMAAMMMMAAXASXSMSMMAAMMAASXMMSSSMMMSSMSSMAAAMXMMXAMXSMMSSMXMSAMXXAMMSXMM",0,\
	"SAMMXAMSAMMMSMSSSXXXAXAMMXAXMAMXAXXAMXSXSAMXMSAXAXMMSSMSAMXMMMSAMAMSMMSMSXSSMSMMMAAXXAMSXXXMXSAAMXAAAAAXSXAMSMSMXAMXSAMASXAAAAXMMXAAMSSXMASX",0,\
	"MSSXAAMMASXSAXXAAMSSSSSSMMSMMXMMMMSXSAMAMAXAAAXMMXAAAMXSXMAMXAMAMXMAXMAXXAMXAMASMSMMSXMXMSAMASXMMMXMSMSSXMSXSXMASXSMSXMASMSMMMMXAMMXMAMAMAMS",0,\
	"MAXXMAMXAXXXXMMXMAMAAMXAMXXXMMAAAXXAMXSASMSMSMMXXSMMMMAXMMSSMMSAMXASMMSMSAXMASAMAAXMAMMMASAMXSAMSAMXAAXMXMMAMSSXAAAAXMMASAMSMAMXXSMAMASAMASX",0,\
	"MSSMXMSMMSSMMSMAMASMSMSMMSXAAXSMMSMAMASXSAAAMXAXMASXMMSSXAMAMXXASAMXXSAAXXMAXMAMSMXSAXMAXXAMASAMXMASMSMMAMMXMAXSMSMMMAMAMXMAMMXSXAMSSMSMSMAX",0,\
	"XAMAAAAAAAAAAAXXSASXMAXXAMMSMXXAMAXMMXSSMMMXSASMAMSMSAAAMXSAMXXAMAMAXSMSMAXMMXAMAMAXMSXSSSMMXSMMSAXSAMAMASMMMSXSXAASMXMASMSMXSAMSMSMMMMMSMAA",0,\
	"AMSSMSSSMMSMSSSXMMSMMSMMXSAMXMMAMMSMSMMAXXAMAXMMMMMAMMSSXMMMMSAMXSMXXMAMXMMSMSMSAMXXSMAAAAXSAMXAXMXSAXSSMSAAMXASMSSMASMMMXAAAMAXXXAAAXAAXMXS",0,\
	"SXAXMMXMAMXXMXMMAMXMAAXMAMXSXAXXMXAXAASXMSAMMMAXSXMMMMXMMXAAAXAMSAMXMMAMAMXAAAASXMMXMAXMMMMSXMAMMMASAMXAAXASAMAMAXXMAMAAXSMMMMSMMSSMMSMSSMAX",0,\
	"AMASXXAAXAMXAMXSAMMSMMMMASMXMSAMXSMSSMMAXMAMXMXXXAMSSMAMSSSMMMXMXAMXASASASMMSMMMXASXMASMXSAMASAXAMAMMSSMMMXMMMMMMMXMSSSMMXMAMMAAXXMAXXMMXMAM",0,\
	"MMMMMSMMSMSAXAMSASAAXXASXSAAAXAXMMMAMAMSASXMASMMSAMAAMASAXXMSSSXSXSXMXASMXXAAXAMSXAAXMAMXMASASAMSMSSMAAASXXMXAMAXAXMAXAXMXMASXSSMMMMAAAAMMSS",0,\
	"XXAAAAAXAAXXXMASAMMSSSMSAMMSSMXSAXMASAMAAAAMXSAASAMSSMSMMXXAAAXAAAXAXMMMMSMSMSAXXXSXMXSSMSMMASMMXAMAMSSMAMXXSASMSSMSMSMMASXAAXAAAXASMSMXSAAM",0,\
	"SSSSSSSMMSMXMAXMMMMMXMXMAMAXAAAMMMSXSAMMMSXMXMXMSAMAXXAASMSMMSMXMAXAMXSAAXAAAXXASXMXSAAAAXMMMMXSXASXMAXMAXAAMAMAAAXAAAMMAMMXXASMMMMSAAASMMSS",0,\
	"AAMAAAMXMAXAMXXAXAMXMMXSMMXXMMMXSAMXSAMXAAAMMMMXSAMMXXXXXAAAAMASMMASMMSMMSMMXSAMXAMAMMSMMMMAAMASXMMMMMXXMMAMXAMMSMMMSMXMASXMXMASXAAMMMMXASAM",0,\
	"MSMSMSMSSSSMXAMSMMXXASXSXSAMXAAMMASASAMMMSSMAMXMSAMXMSSXMSMMMSXMAXAAAAXMMAXXXSMXSXMAXAXXAASXSMAMXXAAMXMASMSXSXSXMXSAAMXSXMASMXMSSMSSXXASMMAS",0,\
	"XXAXAXAAAAAXMXSAASASMMAMAMXMSMSSSMMASXMXMAMMXSAMXAXXSAAMAMXMAXMSMMXSMMSXMAXSAMXAMMSXSXSSSXSMXMMSMSSMSASMXAXAXAMXXAMSMSXMXMAMSAMXXMAXMXXMXSMM",0,\
	"AMMMSMMMSMMAMSAXXMAMAMAMAMAXAMAXAMMMMMSXMASXASASXSMMAMMMSXAMSSMMXSAAAMAXXAMMXMAXMAMMAXXAMASAMMMAAMXAMXSAMSMSMSMSMMMXXMAMXMXSSMMMMMMSMSSMASXA",0,\
	"AAXAAXXXXASMMAAMSSMSAXAMASMSSXMSSMXAAAXAMSAMXXXMAXXXMXXXMAMSXAXXAMXSMMASXMMXMMMSMMSSXXMAMSMXMASXSSSSMAMAMMAXAMASXSASASMMAXMAMXAAAAMAAASMAMMS",0,\
	"SSMSSSXMAMMXXMSMXAASASXSMAMSASXAAMMSMMSAMXMASMMMMMMXXXSAMXXSMMMMMMAMXMXSAMAXXAAMAMAAAAMMMMAASAMAMMAMMASXMXSMXMAMAMASAMXMXMXAMSSMSSSMMMMMXMAM",0,\
	"XAAXXXMAXMAXXAAMMMMMMMMAMMSMMAMSSMAXAMXMAMMASAMMAAXMXMXMAMMMAXAMAMSSXMSMASASXSXSAMXSMMSAAMAMMASMMMAMXMMAAXMMXMMSAMXMAMSSSMAXMAMXAAXAMXSSSMSS",0,\
	"SMMMMMSMMSXSSSMSXMASXSSMMXXMXMMMAMASAMXMAMMASXMMMSSMMSSMMSASMMXMASMAMSMMASMSAMXSASAMAXSMSSMXSAMAASXSAMMXMMMASXAXAMXSAMXAAAAASAMMMMMSAMXAAAAX",0,\
	"SAMXXAAAMMAMAAAMXMXAAAAMAXMASXSSMMXSAMMSASMASMMSMAXXAXAAMXMAXSASMXMAMAAMASAMAMASMMXSAMXXAXMXMASMMMASAXSSMXXASMMSAMASMSMSMMMMMASAAAAXASMSMSMS",0,\
	"SAMXASMSMMAMSMMMAMMMMSMMXAXMMAMAXSAMXXAXASMMXXAAMMMMSMMMMSAMXMASAXSASMSMMMXMAMMMASAMAMXMMSAXMASAMMMMSMAASMMMSAXSAMXSASXAMXXXSMMMSMSSXMMMXXAA",0,\
	"MSAMXAAAXSSMXXASASAXAMXMXMXMMAMAXMXSAMMSXMASMMSMSASMXXSAASAMXMSMMMMASXXXMASXMXXXAMASXMXAXAMXAAMAMXXAMMSMMXXXSXMSMSMMAMSMSMSAMAAXMAXMASXSAMXM",0,\
	"XMMMMMSMMAXMASXMMSXMXSASASAMSMSMSMMSASAAAAAXAMXAMAXAXASMXSAMXXXAXAMSMMSMSXMASMMMASXMAAMMXSXSSSSSMMMAMAMASXAMMSMXAAMMAMAXXMAASXMMMMMSMXAMXSAS",0,\
	"MXAAAXAMMMXMASMSXMXMMSASAXAXAAAAAMASXMASMMXSAMMMMSMMMMMMMXXMSMSMMXMAAMAAAMMAMAMMAXAMMMSMAMAMAMAASAMSMXSAMXSAAAMMSMMXASMXXAMXMMAMXAAXXMXMXMAS",0,\
	"AXMSXMXXAXAMASAAMXASAMMMMSSMMMMSXMXSXMXXAMXAAXXXAXAMSXSMSSSXXAXMASMMMSMSMSSSSSSMMSMMXAAMAMAMAMXAXXXAAMMMSSMMSMXAAXSSMSASXSAXASMMMMXSAMASMMMM",0,\
	"SXMMMMMMMSSSMMXMAMXMMSXAAAXASMMMASAMXSAMAMXSXMXMMMAXMASAAASAMSMMMSAXMAAAXMAAAAXAAAMSMSSSXSXSXSMASXSXSMASMXXAXAMSMMMAXMXMAXXMXMASAAASXMAXAAXS",0,\
	"XSAAAXAMMAMAXAMXSAAMXMMMSSSMMAAMXMAXXXASXMAXAMXAMSSMMMMMMXMXMAXAXSASMMXMXMMMMMMMMMXAAMXMXMAMAXXMAMXAXXXMASMSSXMXASXMMXSMMMXAAMMMMMXSAMSSXMSM",0,\
	"SAMSMSSXMASAMMSMMSAMASAMXAAXSXMMSMSMMMMMMMASXMAXXAMASXXXSXSMSXSSXXAMAMASAMXXAASMMSSMSMAMMMAMAMSAMXMXMAXMSMAAMMSXMMAMSMSAAAMMSSXXMSASMMAAASAM",0,\
	"AMXAAMXAMXMAXAAAMMMXAXAMMSMMSMSMSAAXAXSAXMAXAXAMMASASMMMSAAAMMMMMMSMXSAMASXXXASAAXAXAXMXAMMXAXMMASXXAASXMMXMXAXAXSXMAAMXMMSAAXMSXMAXXMMSMSAS",0,\
	"MXSMSMSMMMSAMSSSMAAMXSXSXMAAXMAAMSMMSMSASMSSMMSXSAMMSASAMSMMMAMMMAAXMMMXAMASMASMMSMSSXMMSSSMMXAAMAAASXMMAMMMMSXMMMXSMSMASAMXSMMXXMMMMSXXAMAM",0,\
	"XASMAXAMXXMAXAAAXMSSMAASASMMSSMSMAXXMAXAMAAXMAMXMASXSAMSAXMAXMSSMSSMSASMASAXMAMAXXXMMAAXXAXAXSMMMMMMMAMSAMXSAMSSMSMSAAXXMAMMAMXXMASMAMXMAMXM",0,\
	"MXSAMSSXMXSMMMMMMXAXMMXSAMXMMAAAMXMSMSMXMXMXMAXAMAMXMXMMMMAXXXAMMXAXMAMSAMXSMMMMMMMASXMMMSMSMXMAXXXAMAMSASAAASAMASAMSMSXMAXXAMXMSASMSMMXAMAM",0,\
	"XMXAMXMASAMXSXSXXMMSXXAMMMSSSMMMMMMAAAAAMMSMSASMSSMXMAXAMMAMXMMSSMXMMMMMSMSMXSAMAASMMAXMAMAMAMSMMMSXMAMSMMMMMMMMAMAMMMMASASMMSSXMASAMXSSSSSS",0,\
	"MSMAXXSAMASAAMAMMAASAMXMAAAAXAXXMASMSMSXSAAMAAMXAMXASXSSMMASAAXAMAMXAXAXASXAASMSMXMASXMXXMAMAMAAAXXXSMMXAASXMXXMASXMMASAMAXXMAMXMXMMMXMAMAAM",0,\
	"AMXMMXMXMXMXMAAAXMMSXMAMMSSMSMMXSAMMAAXMMMSSMMMXMXSMSAMAXSASMSMXSXMXXSASMMMMMSXSXSSXMMMXMSAMXXMSMSAMMSSSSMSAMXSAAXMXSMMXSMSSMSSXMXMAAXMAMMMM",0,\
	"SMSMMAMMSXSAMSSSMSXMASXSAMAXSAAXMAMSMSMSAMXAAMMAMMMMMMMAMSAMXMXXMASMXSAMAAXMXSAXAXMMMAXMASXSXSAAXMAXAAMAAASXMAMMMXMASAMXSAAMAMXAMASAMXMAMAAX",0,\
	"ASAAMXSAAAMAXAAAAMXSAMMMASMMSMMSSSXAAAMAMMSSMMSAMAAAAXMAMMMMMMSASAMMAMASXMSXAMAMSMMASMSAMXXAAMSMMSMMMSXSSMMMMASAAASASAMAMMMMMMSXMASASASXSSSS",0,\
	"SSSSMXAXMSSSMMSMMMMXMASMXMAXXAAAAAMMMMSAMXMASXSXSSSSMSMXMASXXASMAMSMXMAMAMMMMSAAMAMASMAMXMXMXMAMAAAMAMMMAXAXMXSMMXMASXMXSAMMMMXAMXXMMXAAXAAX",0,\
	"AMAMXMMSXMAXAAMAAXSAMXMXXSMMSMMMMMXXAXSMSMSAAMMMMMAXASMMMAMXMASMAMXMAMMXSXAAMMMXSAMXSXMMXSMSASMSXSXMAXASAMXMMAXXXAMAMAMASAMAAXSSMMMXMSMXMMMM",0,\
	"MMAMXSAAAMAMMMSSMXSAMSAMXSXMXAXASXSSMXMASAMMMMAXXMAMMMASAXSAMXXMAXAMAMSAMSSSSXMASASASAMXXXAXASAAMMXMSSMMXMASMSASXXMASXMASAMSMXAAAXSAMAAASASM",0,\
	"XSMSAMSSSMASXAAAXAXMASXMXMAMSSMMSAAAXAMAMAMMXSASXMMSXMAMMXXXMAMXSSMSASMAMAMAXXMASXMASXMAXMSMAMMMXXAMXAXSAMXXAAAAMSSXXAMASAMAMMMMSMSASMSMMASA",0,\
	"MMAMAMAMXMASMMSSMMMSASASASAMXMASMMMMSMSASAMXAMAXXAAMMSMMXSMMXASAAAXMXSMSMAMSSMMMSAMXMMMXMAAMXMXMSAMXMMMXAMSMSSMMAXMMMMAMSXMASAXMAASXMAMAMSMM",0,\
	"AMAMXMMSMSAXAMAAASAMXMAXMXASXSXMAXSXSAXAXAXMSSMMSMMSAAAXAXAAXAXMSMMMASXMSXXMAASAMMXSAAASMSMXSASAXAAMAXMMSSXAAMAXSXSAAXAMMMSXSXSSMMMMMSMSMAAA",0,\
	"MMXSXSXMAMAMSMMXMMSSSMSMMSAMASXSAMMAMXMMSSMAAAAAMASMMXSMMSXMXSMMAAMMMSAMXSMSSMMASXXSMMMSAMAMMASMSMSSMXMAMAMXMSAMXXSSSSXSAAXMMAAMMMAMMMAMMSXM",0,\
	"XSXMMSAMMMSAMXSAXXAMAAXAMMMMMXASXSMAMMMMAAAMSSMMMXMASXXAAMAXAAASXMMAMMAMAMMAAASXMMMSASAMXMSMMAMXXAAAMSMMXSAMXXMXMMMMMAXXMMSAMXMMASAMXMAMAMMM",0,\
	"AXAMASAMXAMASAASAMXSSMMXMASMMMAMAAMMXSAASXMMAMASXMMAAXSMMXAMSXMMASXXSSMMSXMMSMMXMAAMXMXMXMMAMSSMMSMSMXAAAMMAMASAMAAAAMSXSXSASXMSMSASXMXSAMAM",0,\
	"SSMMXSAMXXSAMXMAXAAAAXSXSASMXMAMAMXXAMMXXAMMXSAXMAMAMMMSSMMMAASMMMMAMXAAMASAXXMASMSSXSSMXSSMMAAAAXXMAMMMMMSSMASASXSMSAMAMMMMMMMAXSAMXXXMASAM",0,\
	"XAMSXSASXAMXMSXMXMMMMXMXMAMAASXMXMAMMSMMSAMMMMMSSXMXXSAAXAXMXXMASAMSMSMMMAMASAXAXAAAMAMXAXAMSSSMXSXSASMSMMAAMASMMAXAAMMAMSSXXAXMMMAMSAMXXSAS",0,\
	"SMMXASAMMMMMAXAAXXAAXASMMSXSASXSAMAMMAXXSAMAAXXXAMXMMMMMSMMSMXSMMAAMASXSMSSMSXMSSSMMAMMMASMMMAXMAMAMASAAMMSXMMSAMSMXMXMASAAAMSSMMSMMASAXXSAM",0,\
	"XAAMXMSMAAAMMSAMXSSXSASAAXMMAMXSASASXMMMSASXSSMMSAAXXAMXXXAAXMXXMXMMAMMAAAAXXAXMAMXXMSSMASAAMMMMASAMMMXMMAMASMSXMXAXXAAXMMMMSAAMAAAMAMXMAMMM",0,\
	"SMMSAAAXSSSSMSAMXXAAXASMMMAXSMMSXMAMAXAASAMAMXMAXSSSSSSSSMMSAMMXMAMMMMAMMMXAMSMMAMMSMAAMASMMMAASXSASXAMXMASXMAMMMSMMSMSMXXXMAMMMSSXMMXAMSMAM",0,\
	"MAASMSMXMAAAMSAMXMMMMMMXMMXMAAXMMMMSMMMMSAMSMSMMXAMAXAAXXAAXMAAAMAMXMAMXMSMSMXASXMAAMSSMASXSSSXSXSMMMMSXMASMMAMXAMAMXMXMMXSAMXMXAMXMAXXXAAAS",0,\
	"SMMSAMMAMSSMMSXMAMAAAAAAMAAASAMXAAAAAAAMSXMAAAAXSAMXMMMMMMMSXMXXSASMXSXAAXAXXMXMMMSSXMXMASAMXXMXMMMSXSMMMXSXSASMASXMASAMMAMXXMASASMXMASXSSMS",0,\
	"XXSMAMSSMMAAXXAMXSSSSMSSSSXXMSXXMMSSSSSMXXMMSMSMXMASMSAXMAMSASAXMASMAMSSMMXMXSMXXAAMMMAMXMAMXMAAXAAMMSXAXASXSASMXMASMSMSAMXMASXMAMXAXASAMAAX",0,\
	"MMMMMMXMASXMMSXMXAMXAXXXAAXAAXMXSAMAAMMAMMSAMXAAXMXSASASMAXSAMMMSAMMSMAXMASMAAAXMMXSASXSXSAMAMMSSMXSAMSSMASMMMXXMSXMAXAMAMAMMXMMSMMXMXSAXMMM",0,\
	"SASAXMMSAMAAAAASMSSSMMXMMSAMXMAMMAMMMMSAMMAMASMSMMAMAMXMMMMMAMAAMAMSAMXSXAAMASMMXAAMXSAMASXSASAMXMXMMMAXMMMXSMMXXXAMXMXMASMSMXMAAXXAMXMAMSAM",0,\
	"SASAXSAMXXMMMSSMAAAMXASAAAMXSMSMSSMSXXXAMXASXSXAASASAMMSASASAMMSSMMMMMAXMXMSAMXAMMMSAMXMAMXAAMASASAMSMSXSASMSAASMSMAAAASXMMAASMMSAXAXAMAMXAX",0,\
	"MMMAMMASAMSAMXAMMMMMMSAAMSXMAAXXAAAXMSSSMSXSAMXMXSXSXSXSASMSASAAAMXSXMMSMSMSMSMXSAMXMSXMASAMAMXSASAAXAMXSASASMMMAAMSSSMMAASAMMASXMMXSASXSSSM",0,\
	"SSMMMSMMAMXAMXAMSAMMMMMAAXMSMSMMSAMXXAAAXSASMMAMMSMMASAMXMXXXMMSMMAAXMSXAAAMXXMAMXSMXXASAMASAMXMASXMMMMMMMMMMAXSSSMXAMXXSMXAAMXMASAMSAMXAAMX",0,\
	"XAAMXAMMSMSSMAXAXAXAAAXXXXAAAAXMMMXSMMXMXMAMSSXSASAMAMAMAMMSMSAXAMXSMMMXXMSMAMMXMAMAXSXMASAMASXSMMXMAAAASXSXSMMAMMMMAMMAMASMXMXSAMAMMXMMMMMS",0,\
	"SMMMSASAXMAMXAMMSMMSSSSMMSSMSMMMAMAXXMASMMAMXXAMASXMSSMSXSAAXMASMXAXAAMMMMMMSSMSMSXSAMASAMXSAMXMAAASXSSMXASMAMAMXAAXXMXXMAMXAAXMMSMMMAXAAXXA",0,\
	"MAAASMMMSMASXMAXAAAAAXAAMAAMMAXSAMMXMMXAAXASXSAMAMAXXAXAAMXSMMAMAMSSSXSAAXAAAAMMAAAXMSAMXSXMAMXSMMMAMMXXMAMXAMXXMSSSSMSXMMMMMMXAAXMASXSSMSSM",0,\
	"ASMXXASXXMASXAXSMSMSSSSMMXXMMMMSAXMASMSSSSXSASASXSMMSMMMMMMMAMXSMXXAMXMMSMMSSSMMMMSMXSAMXXMASXMMXMASMMAXMAMSSSSMAXMAAAMXSAAASXSMMMXMSXAAXAAX",0,\
	"XMMMMAMMAMXXXSXSAAAAXMAXXSXSASAMXXSASAAAAXAMASAMMMXMXSMXMAAMSSXMXSMAMXMAMXMAAAMXAAAXMMMSSMXAXMAMAMAXAMXMASAXAAAXMXMMMMMASMSSSMXMASAASMSMMSSM",0,\
	"MSASMSMXSMSXAXAMMMSMMSSMSAAXMXAXMAMXXMMSMMSMAMMMAXXXMASASMXSAMAXAMMMMXMASASMSMMSMSSSMAAAAAMXSXSSSSMMSMAXAMAAMSMMSMMXMAMAMAMAMAAMASMXSAAXAXAA",0,\
	"AMAMAMSMMASMMMMMAAXXAAAMXMMXSMMMSMMMMSAAXXXMSSXSSSMMXASMXAMMASMMMSAAXAMMSAMMAXAXMAXAMMMSSMXMMMAMXAAAMMSMXXMMXMMXAAXSSMMMSAMSXSMMAXXAMMMXMMMS",0,\
	"SMAMMMAMMAMAAAASMSSMMMMMXXXXXASASXSAAMMSMSXAXAMMXAMXSXMXSAXMXMXASMXSMMSAMXMXAMMXMSXSMXXXAMXMAXAMSMMMSAXXMMSAXASXMSMXAAAASAMXMXAMASMSSMMSAAMM",0,\
	"ASXSASXMMMMSMSMSAMMMSAMMXMXXSAMASXMMXSAXXMMXMAMXSMMAXAAAMMMMSMSSSMAMAAMMMXSMXXSAAAAXXSXSAMXSSSMMAMXXSAMASAMXMAMXXMXXMMMMSASXASXMMAXAAAASXMMM",0,\
	"MMMSMSASXMAXXXAMXMAAMASMAAAAMAMXMXMAMXAMAXSMSSSMAAMXSMMMMMAMAAMAMMAMMXMSMMMSAASMMMXMAAMSXSXMAAMSAMSAMASXMASAMSSSSXSMMAMXSAMXMAXMXXASMMMSMSAX",0,\
	"ASAMXSMMAMASAMXMMMMMSAMMSMMSSSMSXXMASMMMXMXAAAAXSMMMXMAAASMSMSMAXMXXXAAAAAAMMXMXAXAMMMAMMSAMSAMXMXMASXMASMMXSAAAMASMASXMMSXSMMXSAMMMXMMXAXXM",0,\
	"SSMSASXSMMAMAMAMASMAMXSAXAXMXMAXMAXAMAAAAMMMMSMXMXAXAMMXXSAAAMXMMMSMSSSSSMSSSSXSASMSAAXSASAMXMXASXSAMXMASXSXMMSMMAMXAXASAMXMAAAXAMMSXMSSMMSS",0,\
	"MMAMASAMXMXSMMXSAMMASMMMSMMSAMXMMSMASMMSXSAAMMXMASMSMXASXMMMAMAMAXAAAAAAMXMAXAMSAAASMSAMXSAMXAMSAMXAXAMAMAMSAMXXMASMSSMMASMSMMMSAMXMMMAAAAAA",0,\
	"SMAMMMMMAMXXMAMMASMXSAMXSAASAMAXAAAXXMAXAXMSMMAMMMMAXAAMXAXXXSAMXSMSMMMMMAMMMMAMMMXMXMASMSAMAXMAMASASMMMMAAAXMASXXXAXMAXAMMASMXXXAMXAMMMMMMM",0,\
	"MMMXSASXSSXMMMSMXMMASXMAMMXSAMAMMMMAMXMMMMAXXSAMAASAMXSXSAMSXMXSAAXXXAAMXMSMMXXXAXXMXSMSASAMMXMAXMAAAXAXXSSSXSAMXMMSMSMMSXXAMMXXMMMMMSASMSMS",0,\
	"MASMMASAMXXMAAAXMMMAMAMXMMXSMMAXMSSXAAXAXMXSASASMXMAMMXASXMXAAAMMMMSSSMSASAMXAMMXSXMAMXMAMMXXASMSSMMMSXMMAAXMAXSAAAMAXXSXAXSAMXMMASXMMAXAAAA",0,\
	"SASAMAMAMASMMSSXSAMSSMSXMSAMXSMSXAAAXMSXXSAMXMXAXXSXMAMXMASMMMMMAXMAXMASMSXSMASXAAAMASAMMMMMMXXMAMXAXAMSAMXMASMMAMSMAMXXMXMMAMXMSASASMSMSMMM",0,\
	"MASXMASAMXSXAMAASMMMAXAAXMASAAASMMSMAMAMXMMSAMASMMAAXSMMSAMAXXMSSSXMSMXMMXAXMAAMXMXMAXMMSAXAAMSMMMMASMAMSXMSXXXXAMXMAXSASXSSXMAXMMSAMXXAXXAS",0,\
	"MAMAMAXAAXSMSSMMMMSSMMMMMMASXMMMAXAXXMXSAAASASAAAMAXMAAAMASAMAAAAAMXAMASMMMXMMSMAMMMXMSASMSAXAAMXXMASXAXASAMXMMSMSXXAXSAMAMAMSSSMAMXMMMSMXMX",0,\
	"SMSSMMSXMASMMAXXAAMAAAXXSMMMASMSSSSSSMAMMMMSAMMXXMASMMMSMXMXASMMSMASASASXASAMXAMASAMAAMAXAXAXSASMMMASMMXMSMMMMAAAMAMSXMAMMMAMAAAMMXAXXAMMASM",0,\
	"AAAMAXAAXXSASXMSMMSMSXSAXAXSAMMXAAMAAMXSAMXMMXMSXMAAMSXXXXAMMMAMXXXSXMASMMMMSSMSXSASMSMSMMMMMMAAXAMMSASMXSASXMSSSMSMMASAMASXSMXAMXMSMMAXSAMA",0,\
	"MMMSMMSXMASAMXMASXMXMXMMSMMMXXAMMMMSMMMMAMXMSAASXMMMAMAMMMMMAXAMXXAMMMXMXSAAAAAAASAXAAAAXXXXXMXXMMSXSAMXAMAAXAAAAAXAMAMXSXSMXXMSXMAMMSMMMSSM",0,\
	"XMMSMAMMMXMXMMMSXXXAXMAAAAMMSAMXAAAMASXSAMXAMMXMAXMSMMAMAAXMASMMMSSMASXMASMMSSMMXMMMSMSMSXMMMSMMMASAMXMMXMAMMMMSMMMMMSMMSXMXSXMMASMMAXASAMXX",0,\
	"XSASMXSASMMMMSXMXSMMSAXSMSMAMAXXXMXSAMAMAXMAXMASXMMAXXSSSMSAMXXAAAASASXMASAMMAAXMXMAMAXXMMAXAAAMMXSAMSXMSXSXSAAAAXSXAMAMXAMAXSASMMMMSSMMSSMX",0,\
	"XMASXAMXMAAAASAMAXAAAXMXMMMMMSMMXXAMXMXMAXSSMSASAMSSSXXAAAXAAMSMMSMMXSXXASMMMXMMAAMXMXMXSASMSSSMXMSAMXAAAAAXSMSSMMSMXMAMSSMASMXXAAXSAAAMAMAM",0,\
	"MMMMMMSXMXMMXXAMASMMMSMMMMAAXMAMXSSSMMAMXXMAAMXMAMAAMMMMMMSXMAAXAAAAXMMMMMAAMASMSSSSMXSAMXXAXMAMMAMAMXMMMXMMSMMMMSXMMSXMXAMXMXMSSMMMXSMMASXX",0,\
	"AXSAXSAMMSSXMSAMXSASAMXAASMMMSAMXAMAMSASMMSMMMMSAMXSMAAXXAMMSSXMSXSAMMAAAXSMSASAAAAAAAMXXAMXMSAMASMMMXMMXAMAMAMXXSAMXAASMMMXMAAMASXAAMASASAM",0,\
	"SMSMXMASAAXAXMMSSXAMMSXSXXAXAMAMMMSAMSASAASAMAAMAMSMXSSMMMSAMAMMAXMASXSXSXMAMXMMMSMMMMSSMMXXAMAMXXAAMMMSMMMAMAMMMSAMMXMXAXAASXMSAMMMMXAMASXA",0,\
	"MAXMASAMMSMXMMAMAMMMMSAMMMMMMSMMAXMAMMXMMMMAMMXMASXMAMAXAXMXMASMMXSXMAMAXXMXMAXMAXAXSAAXAAAASMSSXSSMMAAXASXXMAMAASAMXMMSXMXMSAAMASMASMXMXMMS",0,\
	"SSMSMSASXXMAMMASAAAMASAMXASXMAMXMSSXMSMXXMSMMMSSMSAMSSSMXSAMSXMASAMAMAMMMSSMSMSXMSXMMMSSMMMSAAAAXXASMMSSXMASMSASMSMMXXMAXSXMMMMMAXMASMSXSAAA",0,\
	"SAAMXSASAASXSSMMXSASMSAMMXXAMXSAAMMMMAAAMMAAAAMAMMMMXAAAAMMMMXSAMXSXMASAAAAAMMMAMMXAMSMXXAMXMMMMMSAMXMMMMMMMAMMMAXAMMXAMMMASXMXMSXMMSAAASMMS",0,\
	"XMMMAMMMMXASAMSMXMMMXSXMMSSMMAXMXSAMSASMASXSMXSAMSXMASMMMMSAMMMMSXMASMSMSXMMMASMMSSMXAAMXMSMXXMXAMXMSXMAAAAMAMASXSAMSAMXXSAMAMSMMASXMMMXMMAX",0,\
	"XSAMAMAXXMMXXMAMAAAMXMMXXMASMMSXASAMXAXMXMAAAMSMXMAMMXXXXMSASAMXMMMAXXMAXXMXXXXAAAAXSMSMMMAAXAMMMSMAAASMSSSMXSXSXSAXMASAXMMMAMAAXAMAAXMASXAM",0,\
	"XSASMSMSXAXAMMASMXMXAASMXXAXXSAMXXMMMMXMAMMMMMMMXSAMXMAMMMSAXXXAXAMMSXMAMAMAMXSMMSXMXAAAASMSMXXAAAAMXMMAMAAXAAMMAMMMSAMXSMMSMSMSMSSSMMMSAMAS",0,\
	"XSXMAAASASMMSAMXMASMSSMAMSMMMXXAMXSXXMASXSAXASXAAMXSAMAMAMMMMMXMSXSASAMXSAMASMAXAXMSXSMSMSAAASMMMMXSXMMSMSMMMMAMAMAASAMXSAASXSAXXMAMXAXAAMXS",0,\
	"MMMMSMMSAMXAAXSSMXSAMXMXMAAAAXMSAMXAXSAMAMXMMSMMXSASXSASXXASXMAXMXMASMMASXSASXSMXSASAAXXAXMMSMASXSMMMAAMXMAMXASMMMMXSAMAMXMSAXMASXSMSSSSSMAX",0,\
	"XAAMAMMMMMMMMXMAMMMMMXSSSSSMXSAMXSAMXMMSSMAXSMMAXMAMXMASMSMSAMXSAAMAMAMAMAMXMXMAAMAMMMMMXMAXAMMMAAAASMSMSMMSSMMASXSASAMAXAMMMMSAMMXAXAXMAMMS",0,\
	"SSXMASAMXASMSMSAMMSMAMSAMAAAASAMMSAMXSMAAMXMXAMSXMAMAMAMXAASXMSXMXMAMXMASMSSSXSMMSXMXMXMSAMXMSMSSSMMXAAXXSAAAASXMASASXXXSMMAXAMAMAMAMMMMSMXM",0,\
	"XMMSMMMAXMXAAMMAMMAMASMAMSMMMSAMMSAMMAMXMMAMXXMAASAMSSMMAMXMMXMAMXSXSAMXAXAAXAMAMXXXXMXMXMMMXAAMAMXSMSMXMMMSSMMSMXMAMMXMAXXXMASMMSMMSASMMSAA",0,\
	"SMMAAXXSSMMSMXMAMSAXXXXMMXAAXSMMAMSAMXMAXXASMMSMMSASAMXSXXXXAAMAMAAXAMMMMMMMMXMASMSSMMSAMXAMXMSMSMAXXXXAXAMAAMSASXMSMAMMASMXMXMMAXAASASMASMS",0,\
	"XASXSMAXAAXXMXAMMSASMSAMXMAMXMAMMXMMSAMMMSASMAAXXMMAMXAAAXMASMSXSMSSSMAAXXAXXXSMSAXMAAAMASAXSAXAMMMSMMSXSAMSSMSASXMAMMSMAMAAXAAMAMMMMAMMASMA",0,\
	"SAMXAMXMXMMAMXSMAXXAASMMSSXMAMMAMAMXMAAAMAMXMMSSXSMMMXXMXMAMXXSASAAAASMSSSMXSAMXMMMSMMXXMSAXMAMMMAMAAXAMMXMAAAMAMXMASMXMASMXSXXMASMSMSMMAMMM",0,\
	"AAMSXMAMASMMMAMMXMMSAMXAASASXSAASXSXSSMSSXSXMMXMAAMASAMXMASMMAMAMMMSMMXXAXMASAMXAXAAXXXSMMMMMMMASASXMMASMMMSMXMSMAXASAAXASMXSMXXMAXAXAXMMSMX",0,\
	"SAMAMSASASAAMSSXMXXMSSMSSSXMASMMMXAXXXMXXXMASAMMMMSAMMAAXAAMMSMXMXAAAXMMAMMASAMSSSSMSSXSAMXAAASXSAMXASAMXAAAXAAXMMMXSMSMAMMASMXSMMSXMMXSAAXM",0,\
	"MMAMXMAMASXMMAMASXSMAMAMAMMMXMASXMMMMASAMXSAMMSAAXMASXSMSSXSAAMAMMSSMMMMSMMAXAMAAXXXAXXMAASXSMSAMXSAMMASXSSMSMSMAAAMMAXMAMMAXMAMAAAMSMAMMMSA",0,\
	"XASXSMSMMMMSMMSAMSMMASMMAMSAMXXMXMXAMAMMSAMXSXMXMXAXAMXAMXAMMSXXSAXAXAAAMXMSMMMMSMMMXSMSSMAMMMMXMAAAXSAMXAAXXXAMSXSAMAMMSSMMMMAMXMSAAMASXXXM",0,\
	"MXMASXXASAAXAAMAMAXMASAXXMXMASXXAASMXSSMMXMAXMMMSMMXSAMXSMXMXMMXMXSAMSMSSSXMAXAAAAAXXSAAAMXSAAXAMXXMMMAXMSMMASXXXMAXMASXAXAAAMMSXMXXXSASXMMM",0,\
	"AAMXMMSAMMXSSMSSMAMSASMMSSMSAMXSXMMMAXAMXSMASASAAAAMMAAMAMXMAXMXSXMAMXAAXMASMSMSSSMSASMSMMASMSMSMMMSXSMXMAMXXXMASMMXAAMMMMMSXSAAMSASXMASAXAA",0,\
	"SXMASXMMMXXMAAAAMAMMAMXMMAAMMSAMMAAMSSMMAXMXSAMSSMSMSASXMSXMAMSAMXSXMASMXMASAAMAAAAMAXXAXMXSAXAXMASAAASMXSAMSAMMMAXXMAMAAAAAAMMMSMASAMXMMXXM",0,\
	"MASASASXXXAMMMMMXAAMSMMSAMXMAMAXSMXMMAAMXSMAMAMAMAAASAXMXSXMMXMAXAMASAXAXMAMMSMMXMXMXMSASXAXAMXMSMSMSMSXAXAXSASMSMMMSXSSSMSSSMSXSMSMMMSSXSSS",0,\
	"SAMASXMMMSMMAAXXMMXXAAXMAXAMXSXMMXMMSSMMSAMASAXAMSMXMMXMAMAMXASMSMSMMSSMXMAMXAMMSSMSAAMASMMMXMAMAAXAAAXMASMMSAMXAMAXSMMMAAAMMMXAXXMAMAAXXAAS",0,\
	"MAMMMMSMAAXXSMSXAXMSSSMMMMXSAMXMMAMXAXAXXASAXXSXXXXMAXAMASAMXMMMAAXAAAXASXMSSMSASXASMSMAXAASMMXSMSMSMSMMAAAMMMMSXMSXMASXMMMMSXMXMXMAMMSSMMXM",0,\
	"SXMAAAAMXSSMXASMMAMXMMAAAASMMMAAMASMAMXXSXMXSAMXMASXXSMSASASMSSSMMMMMMSMXASAXAMXMMXMXXMXSAMXASAMXMAXXXXMASAMAXMAMXMXXAMASXSAMXSMMSSMMAAXASXS",0,\
	"MXSSMXXSXAXAMAXAMSASMSSMMMXAAXMMMMSMAMXAXAAASAMASMMSMAMMXSASAMMAAXXXAXMASMMMXMASMMAMXXSAMXSXMAMMMMXMASMSAXXSXSMMASMSMASXMAAXMXAAMAAAMMMXXMAA",0,\
	"SAMXSXASMMMXMAMSMAAMMAXAXMMSMSSXMSSXSXSASMXMXASMXMAAXAMXAMMMAMSSMMXMMSAMXXAXMSXMASASMXMASAMAMMSAXMAMMMAMASAMXMAMSAAXMAMMMSMMSMMAMSSMMASMSMXM",0,\
	"MASAMMMMAAAXXMAMXMXMMAMXMMMMAAAAXAXAMAAASXAMSMMMMMSSSSSMXSSSSMXAMXAAAMXXMSMMASASXSASAXSAMXSXMASMMSASASMMAMAMAXXMMMMMSASAAMXAAAXMMXMASASAMXAX",0,\
	"MMMAMAAMXMSSMSMXMMAMMMXAAXAMMMSMMMMSMSMMMXSMMAASAAXAAAMAMXAAXXXMASXSXSSMMASXMSAMAMAMXAMASXSXMXSXASASASXMXSXMMSSMXAMASASMASMSSSMXXAMXMMMAMSXS",0,\
	"SSSMSSSSXAXMMAMAASXSAAMSMMMSMXAAAXAAMASMXXMASMMSMMSAMSMSSMMMMMSMMAXMASAMSAMXXMAMAMXMSXMASMMMSAMMAMXMXMMAMXAMAAMASMMAMAMMXXAAXAMXSXMSXSXSMSMA",0,\
	"XMAAAAAMMMMMSASXXAMMMSMMAXXAXMSXMMSSSMAMXMMAMXXXXXMXXAAXAAXXAAAAMSAMXMAMMASMMSXSASAMMASAXAAAMSMMSXSAMXXMXSXMMSSMSAMXSMXMMMMMSSMXXMXSAMAMASAM",0,\
	"XSMMMSMAAMAASXSMSMMAXMAXSMSMSXXAMAAXAXMSMSMSSMMXSSSMSMXMMSMSMSSSMXXMMSXMSAMAXAASASMXSAMXSSMXSASXAAXXAMAMXMSXXAXXXMMXXAAMASXAAAMMMMAMAMSMAMSA",0,\
	"ASASXXMSSSMMSASAAXXAMSMMMXMXSAMAMMSXMMXAAAMMAMXXXAAMXSAAXAAAAAXAMXASAMXMMSSSMMMMXMXMMAMXXMAMSAMMMMMMAMASAAAMMMXSXMSSMSMSSSMMMMSAAMMSMMMMAMMM",0,\
	"XSAMXMAAAMXXMAMMMSASMXMASAAAXXMXMXXMAASMSMSSSMAAMSMMAMMXSMSMSMSMMXMMXSXMAMMAMXMMXSAMSSMMMMXMMAMXAXASXSASMSMSXMASMMAXAMAXAXMAMAMXXSMMAAMSSSMS",0,\
	"MMMMMMMMSMXMMXMASXAXAAMASXMAXSAMXAMXXMXAXMMAMXXSMXAMXMXAXXAXAXMASXSXMAXMAXSAMXSAXXAMAXAAAAAMSXSSMSMXXMXXAAXMAMXSAMASXMMMAMSAMXMAMSASMMMAAAAS",0,\
	"XMAMAAXMAMXXAAMXMMMMSXMASAXMASMSMXSSSSMXMXMAMXAXXSXMMXSAMMSXMSMASXAXAASXMMAASAMXSSSMSSSSSSMXAAAAMAXMSMSMSMSSXMASMMASXAXAXASMXSAMXSAMXMMMSMMM",0,\
	"MSSSSSSXSXSXSMSAMAXAMAMXSMMSMMXMMMAXAAASMSSSSMMMMXAXMAXAAMAASMMASXSXMASAAMSMMMMAXXXAAAXXAAXMASMMXMSXAAAAAAXMSMMSXMXMMAMSMMMSASXSAMXMAMXAMMMS",0,\
	"MMMAXAMAMAMXMAMXXAXSMSMAMXAXASMAAMXMMMMXAAAMXAAMMSAXMASMSMSSMAMAXMAASASMMMAAXSMSSMMMMSMXSMMMAMMSAMMMMSMMMXMAASAMXSMMMSAAXAAAMSAXXXASASMMMAAA",0,\
	"SAMXMMMAMAMMSAMSMSXMAAMMAMXSAMASMSAMSMSMMMSMXSMSAMXMSAXXAAMAMAMXXASAMAMMMXMSMXXMAXAAXMXMMXMMXMASMSAMXAAMSSMSMSMSAMAAAMSSSMSXAMMMSMASAMMASMSS",0,\
	"XSMXAXAAXXMAMAMXAMAMXMMXAAXMAMXMXSMSAAAXXMXXAAXMMSXMASXSMSMASMMMSMMMMSMSAASAMXSSMMSSSXMAXASXMMAMXMMMMMSMAAXXAMAMMSSMXXAXXXXMMXSAAMAMAXSMSMAA",0,\
	"SXXSAMMXXXMAMAMMAMXMSXMXAMXXAMMXASXSMSMXXSAMSSMMXMXMAMXMAMMMMXMAAXXAAXMMXMXAMAMAMAXAXMASMMMAASAMSMMSSMAMMSASAMXMAXMMSMMMSSXAXAMMMMXMMXMAXXMX",0,\
	"AXAAAMAASMSASXSMAMAMAASXSMMSASAMXSAXAMMSMMMMMAXMAMAMMMAMAMMMASMSMSSMSSMAMSSSMASXMSMSMMAXXMMMMMAXSAAAAXMSXXASXMAXMMMAASASAMXMMMSMSSMMSSMAMMXM",0,\
	"MMMMSMXXSAAAAAXXASASXXMAMAASXMASMMMMSMAAAASASMMSASASMSSMASXMAMAAXMASAXMAMXAASAMXAXAAAMSSSMAXXSXMSMMSSMXAAMAMXSXSXAMSSSSMASAXAMAXAAAAAAAMSAAA",0,\
	"XXXXMAMXMAMSMAMSXSMSXMMAMMMMXXMAMAXXXMSSSMSMSXMSASMSMXMAXSAMMSSMSSMMSSSMSMSMMSAMXMSMSMMAASXSAMXMXXMAXXSMSMSMMXXSMSXXAMXMASASMSSSSSMMSSMXAXSS",0
	db 141 dup(0)
	db 141 dup(0)
	db 141 dup(0)