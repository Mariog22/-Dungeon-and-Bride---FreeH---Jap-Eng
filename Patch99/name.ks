; 各名前タグ
[macro name="キャラ"      ][swname * n=&'game.curChara.displayName' key=&'game.curChara.keyName'][endmacro]
[macro name="キャラたち"  ][swname * n=&'game.curChara.displayName + "’s Group"' key=&'game.curChara.keyName'][endmacro]
[macro name="ヒロイン"    ][swname * n=&'game.wife.displayName' key=&'game.wife.keyName'][endmacro]
[macro name="リーダー"    ][swname * n=&'game.leader.displayName' key=&'game.leader.keyName'][endmacro]
[macro name="テオ"        ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname'][endmacro]
[macro name="リム"        ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=4][endmacro]
[macro name="リム２"      ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=4][endmacro]
[macro name="クレア"      ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=5][endmacro]
[macro name="クレア２"    ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=5][endmacro]
[macro name="フレデリカ"  ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=6][endmacro]
[macro name="フレデリカ２"][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=6][endmacro]
[macro name="ミューズ"    ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=7][endmacro]
[macro name="ミューズ２"  ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=7][endmacro]
[macro name="マルエット"  ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=8][endmacro]
[macro name="マルエット２"][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=8][endmacro]
[macro name="リーゼル"    ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=9][endmacro]
[macro name="リーゼル２"  ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname' buf=9][endmacro]
[macro name="マックス"    ][swname * n=&'o[mp.tagname].displayName' key=&'mp.tagname'][endmacro]
[macro name="ブルー"      ][swname * n='Blue' key=&'mp.tagname'][endmacro]
[macro name="ライナス"    ][swname * n='Linus' key=&'mp.tagname'][endmacro]
[macro name="ミレディ"    ][swname * n='Miredy' key=&'mp.tagname' buf=13][endmacro]
[macro name="サンドラ"    ][swname * n='Sandra' key=&'mp.tagname' buf=11][endmacro]
[macro name="マリア"      ][swname * n='Maria' key=&'mp.tagname' buf=10][endmacro]
[macro name="エリック"    ][swname * n='Eric' key=&'mp.tagname'][endmacro]
[macro name="シュバルツ"  ][swname * n='Schwarz' key=&'mp.tagname'][endmacro]
[macro name="アレックス"  ][swname * n='Alex' key=&'mp.tagname'][endmacro]
[macro name="ルーファス"  ][swname * n='Rufus' key=&'mp.tagname'][endmacro]
[macro name="ガラム"      ][swname * n='Garam' key=&'mp.tagname'][endmacro]
[macro name="ポラリス"    ][swname * n='Polaris' key=&'mp.tagname' buf=12][endmacro]
[macro name="悪魔"        ][swname * n='Devil' key=&'mp.tagname' buf=13][endmacro]
[macro name="ムールムール"][swname * n='Murmur' key=&'mp.tagname' buf=13][endmacro]
[macro name="魔公ムールムール"][swname * n='Demon Lord Murmur' key=&'mp.tagname' buf=13][endmacro]
[macro name="雇用キャラ"  ][swname * n=&'game.guest.getHiring().displayName' pre=&'game.guest.getHiring().img'][endmacro]
[macro name="ライバル"    ][swname * n=&'game.curTeam.members[0].displayName' pre=&'game.curTeam.members[0].img'][endmacro]
[macro name="管理人"      ][swname * n='Manager' pre="keeper"   ][endmacro]
[macro name="倉庫の管理人"][swname * n='Warehouse' pre="keeper"   ][endmacro]
[macro name="フィオナ姫"  ][swname * n='Fiona' pre="fiona"    ][endmacro]
[macro name="ドナ"        ][swname * n='Donna' pre="donna"    ][endmacro]
[macro name="シスター"    ][swname * n='Sister' pre="cynthia"  ][endmacro]
[macro name="ブラザー"    ][swname * n='Brother' pre="evil"     ][endmacro]
[macro name="ベトリヌス"  ][swname * n='Vetrinus' pre="vetrinus" ][endmacro]
[macro name="マルティナ"  ][swname * n='Martina' pre="martina"  ][endmacro]
[macro name="サキュバス"  ][swname * n='Succubus' pre="succubus" ][endmacro]
[macro name="オーク"      ][swname * n='Orc' pre="orc"      ][endmacro]
[macro name="警備隊長"    ][swname * n='Guard Captain' pre="violet"   ][endmacro]
[macro name="従業員"      ][swname * n='Shaman' pre="shaman"   ][endmacro]
[macro name="フォスター"  ][swname * n='Foster' pre="foster"   ][endmacro]
[macro name="？？？"      ][swname * n=&'mp.tagname'][endmacro]
[macro name="男"          ][swname * n='Man'][endmacro]
[macro name="少女"        ][swname * n='Girl'][endmacro]
[macro name="受付"        ][swname * n='Receptionist'][endmacro]
[macro name="住民"        ][swname * n='Resident'][endmacro]
[macro name="依頼人"      ][swname * n='Client'][endmacro]
[macro name="客"          ][swname * n='Guest'][endmacro]
[macro name="盗賊"        ][swname * n='Thief'][endmacro]
[macro name="フロント係"  ][swname * n='Receptionist'][endmacro]
[macro name="女性冒険者"  ][swname * n='Female Adventurer'][endmacro]
[macro name="リムの母"    ][swname * n='Mother'][endmacro]
[macro name="リムの弟"    ][swname * n='Brother' pre="brother"][endmacro]




[iscript]

// サンプルネーム女子
var sampleFemaleNames = "Alice,Aline,Anna,Annette,Agnes,Angelica,Emilia,Amelia,Etoile,Olive,Eve,Alma,Iris,Olivia,Vanessa,Violet,Victoria,Virginia,Amel,Triss,Atie,Alise,Elsa,Elena,Cat,Chloe,Colette,Grace,Camilla,Cordelia,Connie,Cathy,Claudia,Katie,Coco,Janet,Carlie,Sophia,Steph,Shelley,Sarah,Julia,Scarlett,Sharon,Jeanne,Diane,Daria,Tabatha,Daphne,Tina,Tanya,Tammy,Therese,Tess,Cham,Beatrice,Noelle,Nancy,Nina,Nicola,Nora,Rufia,Leila,Lilia,Lisa,Aegina,Etna,Barbara,Danica,Simone,Paula,Flora,Fine,Priscila,Helga,Bonnie,Pansy,Patsy,Patricia,Fiore,Melodia,Michelle,Margaret,Miriam,Marlene,Marilyn,Mary,Monica,Margot,Eunice,Rose,Lip,Lily,Rita,Linda,Lola,Lottie,Loretta,Lydia,Rachel,Lucia,Rebecca,Lulu,Rena,Hestia,Artemis,Apple,Peach,Apricot,Pumpkin,Durian,Mango";

// サンプルネーム男子
var sampleMaleNames = "Elias,Ward,Abel,Cain,Falcon,Sparrow,Seagull,Condor,Hawk,Eagle,Scott,Seb,Ryan,Simon,Will,Elio,Graham,Dalton,Pato,Felix,Connor,Joseph,Lewis,Rubens,Alan,Marco,Jenson,Mikhail,Ronnie,Ed,Andrea,Paolo,Felipe,Oriol,Bruno,Abraham,Alex,Ashley,Billy,Brian,Charlie,Jeff,Gordon,Hamilton,James,Jimmy,Marcus,Michael,Mike,Nigel,Oliver,Peter,Roger,Tristan";

// 作中で使われている名前
var usedCharactorNames = "リーゼル,マックス,ライナス,ルーファス,ブルー,エリック,アレックス,マリア,サンドラ,ミレディ,シュバルツ,フォスター,ガラム,ゼルマ,アズーレ,ラーラ,アイシャ,メロディア,エレン,プリエ";

// ストーリーモードでのみ使われる名前
var onlyStoryModeNames = "リーゼル,マックス";

[endscript]
@return
