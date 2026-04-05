; appendix.ks
; おまけモード


;■リプレイモード

*replay_event01
;[exp]    st.trail_capture_触手陵辱_リム_0
;[img]    event39
;[chara]  リム
;[change] hip
;[detail] Human × Tentacles
@eval exp='o.リム.capturers[0] = m.ローパー'
@mu f=battle0
@replay storage="capture.scn" target=*触手陵辱_リム_0
@replay storage="capture.scn" target=*触手陵辱_リム_1
@replay storage="capture.scn" target=*触手陵辱_リム_2
@replay storage="capture.scn" target=*触手陵辱_リム_3
@replay storage="capture.scn" target=*触手陵辱_リム_4
@replay storage="capture.scn" target=*触手陵辱_リム_5
[replayoff]

*replay_event02
;[exp]    st.trail_capture_悪魔陵辱_リム_0
;[img]    event39
;[chara]  リム
;[change] hip
;[detail] Human × Demon
@eval exp='o.リム.capturers[0] = m.スワンプデビル'
@mu f=battle0
@replay storage="capture.scn" target=*悪魔陵辱_リム_0
@replay storage="capture.scn" target=*悪魔陵辱_リム_1
@replay storage="capture.scn" target=*悪魔陵辱_リム_2
@replay storage="capture.scn" target=*悪魔陵辱_リム_3
@replay storage="capture.scn" target=*悪魔陵辱_リム_4
@replay storage="capture.scn" target=*悪魔陵辱_リム_5
[replayoff]

*replay_event03
;[exp]    st.trail_capture_亜人陵辱_リム_0
;[img]    event07
;[chara]  リム
;[change] hip
;[detail] Human × Orc
@eval exp='o.リム.capturers[0] = m.オークシャーマン'
@mu f=battle0
@replay storage="capture.scn" target=*亜人陵辱_リム_0
@replay storage="capture.scn" target=*亜人陵辱_リム_1
@replay storage="capture.scn" target=*亜人陵辱_リム_2
@replay storage="capture.scn" target=*亜人陵辱_リム_3
@replay storage="capture.scn" target=*亜人陵辱_リム_4
@replay storage="capture.scn" target=*亜人陵辱_リム_5
[replayoff]

*replay_event04
;[exp]    st.trail_capture_化物陵辱_リム_0
;[img]    event86
;[chara]  リム
;[change] hip
;[detail] Human × Troll
@eval exp='o.リム.capturers[0] = m.トロール'
@mu f=battle0
@replay storage="capture.scn" target=*化物陵辱_リム_0
@replay storage="capture.scn" target=*化物陵辱_リム_1
@replay storage="capture.scn" target=*化物陵辱_リム_2
@replay storage="capture.scn" target=*化物陵辱_リム_3
@replay storage="capture.scn" target=*化物陵辱_リム_4
@replay storage="capture.scn" target=*化物陵辱_リム_5
[replayoff]

*replay_event05
;[exp]    st.trail_capture_触手陵辱_クレア_0
;[img]    event40
;[chara]  クレア
;[change] hip
;[detail] Elf × Tentacles
@eval exp='o.クレア.capturers[0] = m.ローパー'
@mu f=battle0
@replay storage="capture.scn" target=*触手陵辱_クレア_0
@replay storage="capture.scn" target=*触手陵辱_クレア_1
@replay storage="capture.scn" target=*触手陵辱_クレア_2
@replay storage="capture.scn" target=*触手陵辱_クレア_3
@replay storage="capture.scn" target=*触手陵辱_クレア_4
@replay storage="capture.scn" target=*触手陵辱_クレア_5
[replayoff]

*replay_event06
;[exp]    st.trail_capture_悪魔陵辱_クレア_0
;[img]    event40
;[chara]  クレア
;[change] hip
;[detail] Elf × Demon
@eval exp='o.クレア.capturers[0] = m.スワンプデビル'
@mu f=battle0
@replay storage="capture.scn" target=*悪魔陵辱_クレア_0
@replay storage="capture.scn" target=*悪魔陵辱_クレア_1
@replay storage="capture.scn" target=*悪魔陵辱_クレア_2
@replay storage="capture.scn" target=*悪魔陵辱_クレア_3
@replay storage="capture.scn" target=*悪魔陵辱_クレア_4
@replay storage="capture.scn" target=*悪魔陵辱_クレア_5
[replayoff]

*replay_event07
;[exp]    st.trail_capture_蛮人陵辱_クレア_0
;[img]    event04
;[chara]  クレア
;[change] hip other
;[detail] Elf × Barbarian
@eval exp='o.クレア.capturers[0] = m.バーバリアン'
@mu f=battle0
@replay storage="capture.scn" target=*蛮人陵辱_クレア_0
@replay storage="capture.scn" target=*蛮人陵辱_クレア_1
@replay storage="capture.scn" target=*蛮人陵辱_クレア_2
@replay storage="capture.scn" target=*蛮人陵辱_クレア_3
@replay storage="capture.scn" target=*蛮人陵辱_クレア_4
@replay storage="capture.scn" target=*蛮人陵辱_クレア_5
[replayoff]

*replay_event08
;[exp]    st.trail_capture_山賊陵辱_クレア_0
;[img]    event88
;[chara]  クレア
;[change] hip
;[detail] Elf × Bandit
@eval exp='o.クレア.capturers[0] = m.キャプテン'
@mu f=battle0
@replay storage="capture.scn" target=*山賊陵辱_クレア_0
@replay storage="capture.scn" target=*山賊陵辱_クレア_1
@replay storage="capture.scn" target=*山賊陵辱_クレア_2
@replay storage="capture.scn" target=*山賊陵辱_クレア_3
@replay storage="capture.scn" target=*山賊陵辱_クレア_4
@replay storage="capture.scn" target=*山賊陵辱_クレア_5
[replayoff]

*replay_event09
;[exp]    st.trail_capture_触手陵辱_フレデリカ_0
;[img]    event85
;[chara]  フレデリカ
;[change] hip
;[detail] Dwarf × Tentacles
@eval exp='o.フレデリカ.capturers[0] = m.ローパー'
@mu f=battle0
@replay storage="capture.scn" target=*触手陵辱_フレデリカ_0
@replay storage="capture.scn" target=*触手陵辱_フレデリカ_1
@replay storage="capture.scn" target=*触手陵辱_フレデリカ_2
@replay storage="capture.scn" target=*触手陵辱_フレデリカ_3
@replay storage="capture.scn" target=*触手陵辱_フレデリカ_4
@replay storage="capture.scn" target=*触手陵辱_フレデリカ_5
[replayoff]

*replay_event10
;[exp]    st.trail_capture_悪魔陵辱_フレデリカ_0
;[img]    event85
;[chara]  フレデリカ
;[change] hip
;[detail] Dwarf × Demon
@eval exp='o.フレデリカ.capturers[0] = m.スワンプデビル'
@mu f=battle0
@replay storage="capture.scn" target=*悪魔陵辱_フレデリカ_0
@replay storage="capture.scn" target=*悪魔陵辱_フレデリカ_1
@replay storage="capture.scn" target=*悪魔陵辱_フレデリカ_2
@replay storage="capture.scn" target=*悪魔陵辱_フレデリカ_3
@replay storage="capture.scn" target=*悪魔陵辱_フレデリカ_4
@replay storage="capture.scn" target=*悪魔陵辱_フレデリカ_5
[replayoff]

*replay_event11
;[exp]    st.trail_capture_夢魔陵辱_フレデリカ_0
;[img]    event09
;[chara]  フレデリカ
;[change] hip
;[detail] Dwarf × Nightmare
@eval exp='o.フレデリカ.capturers[0] = m.インキュバス'
@mu f=battle0
@replay storage="capture.scn" target=*夢魔陵辱_フレデリカ_0
@replay storage="capture.scn" target=*夢魔陵辱_フレデリカ_1
@replay storage="capture.scn" target=*夢魔陵辱_フレデリカ_2
@replay storage="capture.scn" target=*夢魔陵辱_フレデリカ_3
@replay storage="capture.scn" target=*夢魔陵辱_フレデリカ_4
@replay storage="capture.scn" target=*夢魔陵辱_フレデリカ_5
[replayoff]

*replay_event12
;[exp]    st.trail_capture_蛮人陵辱_フレデリカ_0
;[img]    event49
;[chara]  フレデリカ
;[change] hip
;[detail] Dwarf × Barbarian
@eval exp='o.フレデリカ.capturers[0] = m.バーバリアン'
@mu f=battle0
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_0
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_1
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_2
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_3
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_4
@replay storage="capture.scn" target=*蛮人陵辱_フレデリカ_5
[replayoff]

*replay_event13
;[exp]    st.trail_capture_触手陵辱_ミューズ_0
;[img]    event16
;[chara]  ミューズ
;[change] hip
;[detail] Gnome × Tentacles
@eval exp='o.ミューズ.capturers[0] = m.ローパー'
@mu f=battle0
@replay storage="capture.scn" target=*触手陵辱_ミューズ_0
@replay storage="capture.scn" target=*触手陵辱_ミューズ_1
@replay storage="capture.scn" target=*触手陵辱_ミューズ_2
@replay storage="capture.scn" target=*触手陵辱_ミューズ_3
@replay storage="capture.scn" target=*触手陵辱_ミューズ_4
@replay storage="capture.scn" target=*触手陵辱_ミューズ_5
[replayoff]

*replay_event14
;[exp]    st.trail_capture_悪魔陵辱_ミューズ_0
;[img]    event16
;[chara]  ミューズ
;[change] hip
;[detail] Gnome × Demon
@eval exp='o.ミューズ.capturers[0] = m.スワンプデビル'
@mu f=battle0
@replay storage="capture.scn" target=*悪魔陵辱_ミューズ_0
@replay storage="capture.scn" target=*悪魔陵辱_ミューズ_1
@replay storage="capture.scn" target=*悪魔陵辱_ミューズ_2
@replay storage="capture.scn" target=*悪魔陵辱_ミューズ_3
@replay storage="capture.scn" target=*悪魔陵辱_ミューズ_4
@replay storage="capture.scn" target=*悪魔陵辱_ミューズ_5
[replayoff]

*replay_event15
;[exp]    st.trail_capture_化物陵辱_ミューズ_0
;[img]    event41
;[chara]  ミューズ
;[change] hip
;[detail] Gnome × Troll
@eval exp='o.ミューズ.capturers[0] = m.トロール'
@mu f=battle0
@replay storage="capture.scn" target=*化物陵辱_ミューズ_0
@replay storage="capture.scn" target=*化物陵辱_ミューズ_1
@replay storage="capture.scn" target=*化物陵辱_ミューズ_2
@replay storage="capture.scn" target=*化物陵辱_ミューズ_3
@replay storage="capture.scn" target=*化物陵辱_ミューズ_4
@replay storage="capture.scn" target=*化物陵辱_ミューズ_5
[replayoff]

*replay_event16
;[exp]    st.trail_capture_小鬼陵辱_ミューズ_0
;[img]    event87
;[chara]  ミューズ
;[change] hip
;[detail] Gnome × Imp
@eval exp='o.ミューズ.capturers[0] = m.ナイトインプ'
@mu f=battle0
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_0
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_1
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_2
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_3
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_4
@replay storage="capture.scn" target=*小鬼陵辱_ミューズ_5
[replayoff]

*replay_event17
;[exp]    st.trail_capture_山賊陵辱_マルエット_0
;[img]    event84
;[chara]  マルエット
;[change] hip
;[detail] Sylph × Tentacles
@eval exp='o.マルエット.capturers[0] = m.ローパー'
@mu f=battle0
@replay storage="capture.scn" target=*触手陵辱_マルエット_0
@replay storage="capture.scn" target=*触手陵辱_マルエット_1
@replay storage="capture.scn" target=*触手陵辱_マルエット_2
@replay storage="capture.scn" target=*触手陵辱_マルエット_3
@replay storage="capture.scn" target=*触手陵辱_マルエット_4
@replay storage="capture.scn" target=*触手陵辱_マルエット_5
[replayoff]

*replay_event18
;[exp]    st.trail_capture_悪魔陵辱_マルエット_0
;[img]    event84
;[chara]  マルエット
;[change] hip
;[detail] Sylph × Demon
@eval exp='o.マルエット.capturers[0] = m.スワンプデビル'
@mu f=battle0
@replay storage="capture.scn" target=*悪魔陵辱_マルエット_0
@replay storage="capture.scn" target=*悪魔陵辱_マルエット_1
@replay storage="capture.scn" target=*悪魔陵辱_マルエット_2
@replay storage="capture.scn" target=*悪魔陵辱_マルエット_3
@replay storage="capture.scn" target=*悪魔陵辱_マルエット_4
@replay storage="capture.scn" target=*悪魔陵辱_マルエット_5
[replayoff]

*replay_event19
;[exp]    st.trail_capture_山賊陵辱_マルエット_0
;[img]    event72
;[chara]  マルエット
;[change] hip
;[detail] Sylph × Bandit
@eval exp='o.マルエット.capturers[0] = m.キャプテン'
@mu f=battle0
@replay storage="capture.scn" target=*山賊陵辱_マルエット_0
@replay storage="capture.scn" target=*山賊陵辱_マルエット_1
@replay storage="capture.scn" target=*山賊陵辱_マルエット_2
@replay storage="capture.scn" target=*山賊陵辱_マルエット_3
@replay storage="capture.scn" target=*山賊陵辱_マルエット_4
@replay storage="capture.scn" target=*山賊陵辱_マルエット_5
[replayoff]

*replay_event20
;[exp]    st.trail_capture_小鬼陵辱_マルエット_0
;[img]    event05
;[chara]  マルエット
;[change] hip
;[detail] Sylph × Imp
@eval exp='o.マルエット.capturers[0] = m.ナイトインプ'
@mu f=battle0
@replay storage="capture.scn" target=*小鬼陵辱_マルエット_0
@replay storage="capture.scn" target=*小鬼陵辱_マルエット_1
@replay storage="capture.scn" target=*小鬼陵辱_マルエット_2
@replay storage="capture.scn" target=*小鬼陵辱_マルエット_3
@replay storage="capture.scn" target=*小鬼陵辱_マルエット_4
@replay storage="capture.scn" target=*小鬼陵辱_マルエット_5
[replayoff]

*replay_event21
;[exp]    st.trail_capture_化物陵辱_リーゼル_0
;[img]    event83
;[chara]  リーゼル
;[change] hip
;[detail] Riselle × Tentacles
@eval exp='o.リーゼル.capturers[0] = m.ローパー'
@mu f=battle0
@replay storage="capture.scn" target=*触手陵辱_リーゼル_0
@replay storage="capture.scn" target=*触手陵辱_リーゼル_1
@replay storage="capture.scn" target=*触手陵辱_リーゼル_2
@replay storage="capture.scn" target=*触手陵辱_リーゼル_3
@replay storage="capture.scn" target=*触手陵辱_リーゼル_4
@replay storage="capture.scn" target=*触手陵辱_リーゼル_5
[replayoff]

*replay_event22
;[exp]    st.trail_capture_悪魔陵辱_リーゼル_0
;[img]    event83
;[chara]  リーゼル
;[change] hip
;[detail] Riselle × Demon
@eval exp='o.リーゼル.capturers[0] = m.スワンプデビル'
@mu f=battle0
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_0
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_1
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_2
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_3
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_4
@replay storage="capture.scn" target=*悪魔陵辱_リーゼル_5
[replayoff]

*replay_event23
;[exp]    st.trail_capture_亜人陵辱_リーゼル_0
;[img]    event82
;[chara]  リーゼル
;[change] hip
;[detail] Riselle × Orc
@eval exp='o.リーゼル.capturers[0] = m.オークシャーマン'
@mu f=battle0
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_0
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_1
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_2
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_3
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_4
@replay storage="capture.scn" target=*亜人陵辱_リーゼル_5
[replayoff]

*replay_event24
;[exp]    st.trail_capture_化物陵辱_リーゼル_0
;[img]    event45
;[chara]  リーゼル
;[change] hip
;[detail] Riselle × Troll
@eval exp='o.リーゼル.capturers[0] = m.トロール'
@mu f=battle0
@replay storage="capture.scn" target=*化物陵辱_リーゼル_0
@replay storage="capture.scn" target=*化物陵辱_リーゼル_1
@replay storage="capture.scn" target=*化物陵辱_リーゼル_2
@replay storage="capture.scn" target=*化物陵辱_リーゼル_3
@replay storage="capture.scn" target=*化物陵辱_リーゼル_4
@replay storage="capture.scn" target=*化物陵辱_リーゼル_5
[replayoff]

*replay_event25
;[exp]    st.trail_capture_淫魔陵辱・大人_マックス_0
;[img]    event06
;[detail] Max × Elder Succubus
@wakuset w=2
@replay storage="capture.scn" target=*淫魔陵辱・大人_マックス_0
@replay storage="capture.scn" target=*淫魔陵辱・大人_マックス_1
@replay storage="capture.scn" target=*淫魔陵辱・大人_マックス_2
[replayoff]

*replay_event26
;[exp]    st.trail_capture_淫魔陵辱・大人_ライナス_0
;[img]    event28
;[detail] Linus × Elder Succubus
@wakuset w=2
@replay storage="capture.scn" target=*淫魔陵辱・大人_ライナス_0
@replay storage="capture.scn" target=*淫魔陵辱・大人_ライナス_1
@replay storage="capture.scn" target=*淫魔陵辱・大人_ライナス_2
[replayoff]

*replay_event27
;[exp]    st.trail_capture_淫魔陵辱・大人_ブルー_0
;[img]    event32
;[detail] Blue × Elder Succubus
@wakuset w=2
@replay storage="capture.scn" target=*淫魔陵辱・大人_ブルー_0
@replay storage="capture.scn" target=*淫魔陵辱・大人_ブルー_1
[replayoff]

*replay_event28
;[exp]    st.trail_capture_淫魔陵辱・少女_マックス_0
;[img]    event60
;[detail] Max × Succubus
@wakuset w=2
@replay storage="capture.scn" target=*淫魔陵辱・少女_マックス_0
@replay storage="capture.scn" target=*淫魔陵辱・少女_マックス_1
@replay storage="capture.scn" target=*淫魔陵辱・少女_マックス_2
[replayoff]

*replay_event29
;[exp]    st.trail_capture_淫魔陵辱・少女_ライナス_0
;[img]    event33
;[detail] Linus × Succubus
@wakuset w=2
@replay storage="capture.scn" target=*淫魔陵辱・少女_ライナス_0
@replay storage="capture.scn" target=*淫魔陵辱・少女_ライナス_1
@replay storage="capture.scn" target=*淫魔陵辱・少女_ライナス_2
[replayoff]

*replay_event30
;[exp]    st.trail_capture_淫魔陵辱・少女_ブルー_0
;[img]    event59
;[detail] Blue × Succubus
@wakuset w=2
@replay storage="capture.scn" target=*淫魔陵辱・少女_ブルー_0
@replay storage="capture.scn" target=*淫魔陵辱・少女_ブルー_1
[replayoff]

*replay_event31
;[exp]    st.trail_capture_淫魔陵辱・子供_マックス_0
;[img]    event58
;[detail] Max × Apprentice Succubus
@wakuset w=2
@replay storage="capture.scn" target=*淫魔陵辱・子供_マックス_0
@replay storage="capture.scn" target=*淫魔陵辱・子供_マックス_1
@replay storage="capture.scn" target=*淫魔陵辱・子供_マックス_2
[replayoff]

*replay_event32
;[exp]    st.trail_capture_淫魔陵辱・子供_ライナス_0
;[img]    event29
;[detail] Linus × Apprentice Succubus
@wakuset w=2
@replay storage="capture.scn" target=*淫魔陵辱・子供_ライナス_0
@replay storage="capture.scn" target=*淫魔陵辱・子供_ライナス_1
@replay storage="capture.scn" target=*淫魔陵辱・子供_ライナス_2
[replayoff]

*replay_event33
;[exp]    st.trail_capture_淫魔陵辱・子供_ブルー_0
;[img]    event57
;[detail] Blue × Apprentice Succubus
@wakuset w=2
@replay storage="capture.scn" target=*淫魔陵辱・子供_ブルー_0
@replay storage="capture.scn" target=*淫魔陵辱・子供_ブルー_1
[replayoff]



*replay_event37
;[exp]    st.trail_heroine01a_wildbull_01
;[img]    scene53
;[chara]  リム
;[detail] Human Wild Bull 1
@replay storage="heroine01a.scn" target=*wildbull_01
[replayoff]

*replay_event38
;[exp]    st.trail_heroine01a_wildbull_02
;[img]    scene54
;[chara]  リム
;[detail] Human Wild Bull 2
@replay storage="heroine01a.scn" target=*wildbull_02
[replayoff]

*replay_event39
;[exp]    st.trail_heroine01a_wildbull_03
;[img]    event12
;[chara]  リム
;[detail] Human Wild Bull 3
@replay storage="heroine01a.scn" target=*wildbull_03
[replayoff]

*replay_event40
;[exp]    st.trail_heroine02a_wildbull_01
;[img]    scene55
;[chara]  クレア
;[detail] Elf Wild Bull 1
@replay storage="heroine02a.scn" target=*wildbull_01
[replayoff]

*replay_event41
;[exp]    st.trail_heroine02a_wildbull_02
;[img]    event36
;[chara]  クレア
;[detail] Elf Wild Bull 2
@replay storage="heroine02a.scn" target=*wildbull_02
[replayoff]

*replay_event42
;[exp]    st.trail_heroine03a_wildbull_01
;[img]    scene56
;[chara]  フレデリカ
;[detail] Dwarf Wild Bull 1
@replay storage="heroine03a.scn" target=*wildbull_01
[replayoff]

*replay_event43
;[exp]    st.trail_heroine03a_wildbull_02
;[img]    event43
;[chara]  フレデリカ
;[detail] Dwarf Wild Bull 2
@replay storage="heroine03a.scn" target=*wildbull_02
[replayoff]

*replay_event44
;[exp]    st.trail_heroine03a_wildbull_03
;[img]    scene57
;[chara]  フレデリカ
;[detail] Dwarf Wild Bull 3
@replay storage="heroine03a.scn" target=*wildbull_03
[replayoff]

*replay_event45
;[exp]    st.trail_heroine04a_wildbull_01
;[img]    event10
;[chara]  ミューズ
;[detail] Gnome Wild Bull 1
@replay storage="heroine04a.scn" target=*wildbull_01
[replayoff]

*replay_event46
;[exp]    st.trail_heroine04a_wildbull_02
;[img]    scene58
;[chara]  ミューズ
;[detail] Gnome Wild Bull 2
@replay storage="heroine04a.scn" target=*wildbull_02
[replayoff]

*replay_event47
;[exp]    st.trail_heroine04a_wildbull_03
;[img]    event35
;[chara]  ミューズ
;[detail] Gnome Wild Bull 3
@replay storage="heroine04a.scn" target=*wildbull_03
[replayoff]

*replay_event48
;[exp]    st.trail_heroine05a_wildbull_01
;[img]    event44
;[chara]  マルエット
;[detail] Sylph Wild Bull 1
@replay storage="heroine05a.scn" target=*wildbull_01
[replayoff]

*replay_event49
;[exp]    st.trail_heroine05a_wildbull_02
;[img]    scene59
;[chara]  マルエット
;[detail] Sylph Wild Bull 2
@replay storage="heroine05a.scn" target=*wildbull_02
[replayoff]




*replay_event61
;[exp]    st.trail_heroine01b_theo_15_3rd
;[img]    event21
;[chara]  リム
;[detail] Human: Attacked by a childhood friend
@replay storage="heroine01b.scn" target=*_replay_theo_15_3rd
[replayoff]

*replay_event62
;[exp]    st.trail_heroine01b_theo_20
;[img]    event51
;[chara]  リム
;[detail] Human × Protagonist: Night
@replay storage="heroine01b.scn" target=*theo_20
[replayoff]

*replay_event63
;[exp]    st.trail_heroine01a_max_04
;[img]    scene01
;[chara]  リム
;[detail] Human × Max 1
@replay storage="heroine01a.scn" target=*max_04
[replayoff]

*replay_event64
;[exp]    st.trail_heroine01a_max_05
;[img]    event13
;[chara]  リム
;[detail] Human × Max 2
@replay storage="heroine01a.scn" target=*max_05
[replayoff]

*replay_event65
;[exp]    st.trail_heroine01a_max_06
;[img]    event13
;[chara]  リム
;[detail] Human × Max 3
@replay storage="heroine01a.scn" target=*max_06
[replayoff]

*replay_event66
;[exp]    st.trail_heroine01a_linus_01
;[img]    scene05
;[chara]  リム
;[detail] Human × Linus 1
@replay storage="heroine01a.scn" target=*linus_01
[replayoff]

*replay_event67
;[exp]    st.trail_heroine01a_linus_02
;[img]    event23
;[chara]  リム
;[detail] Human × Linus 2
@replay storage="heroine01a.scn" target=*linus_02
[replayoff]

*replay_event68
;[exp]    st.trail_heroine01a_linus_03
;[img]    event23
;[chara]  リム
;[detail] Human × Linus 3
@replay storage="heroine01a.scn" target=*linus_03
[replayoff]

*replay_event69
;[exp]    st.trail_heroine01b_blue_01
;[img]    event08
;[chara]  リム
;[detail] Human × Blue 1
@replay storage="heroine01b.scn" target=*_blue_01_case1
[replayoff]

*replay_event70
;[exp]    st.trail_heroine01b_blue_02
;[img]    event08
;[chara]  リム
;[detail] Human × Blue 2
@replay storage="heroine01b.scn" target=*_blue_02_case1
[replayoff]

*replay_event71
;[exp]    st.trail_heroine01b_blue_04
;[img]    scene21
;[chara]  リム
;[detail] Human × Blue: Early Morning Inn
@replay storage="heroine01b.scn" target=*blue_04
[replayoff]

*replay_event72
;[exp]    st.trail_heroine01b_married_01
;[img]    scene11
;[chara]  リム
;[detail] Human × Blue: After Marriage 1
@replay storage="heroine01b.scn" target=*married_01
[replayoff]

*replay_event73
;[exp]    st.trail_heroine01b_married_02
;[img]    event02
;[chara]  リム
;[detail] Human × Blue: After Marriage 2
@replay storage="heroine01b.scn" target=*married_02
[replayoff]

*replay_event74
;[exp]    st.trail_heroine01b_married_03
;[img]    scene04
;[chara]  リム
;[detail] Human × Blue: After Marriage 3
@replay storage="heroine01b.scn" target=*married_03
[replayoff]

*replay_event75
;[exp]    st.trail_heroine01b_hotel_theo_2
;[img]    back04
;[chara]  リム
;[detail] Human × Protagonist: Love Hotel - Morning
@replay storage="heroine01b.scn" target=*hotel_theo_2
[replayoff]

*replay_event76
;[exp]    st.trail_heroine01b_hotel_max_1
;[img]    scene03
;[chara]  リム
;[detail] Human × Max: Love Hotel - Night
@replay storage="heroine01b.scn" target=*hotel_max_1
[replayoff]

*replay_event77
;[exp]    st.trail_heroine01b_adultery_max
;[img]    scene02
;[chara]  リム
;[detail] Human × Max Affair
@replay storage="heroine01b.scn" target=*adultery_max
[replayoff]

*replay_event78
;[exp]    st.trail_heroine01b_adultery_linus
;[img]    back01
;[chara]  リム
;[detail] Human × Linus Affair
@replay storage="heroine01b.scn" target=*adultery_linus
[replayoff]

*replay_event79
;[exp]    st.trail_others02_spa_human
;[img]    event22
;[chara]  リム
;[detail] Human: Hot Spring Event
@mu f=duel
@replay storage="others02.scn" target=*spa_human
@replay storage="others02.scn" target=*spa_human2
[replayoff]




*replay_event85
;[exp]    st.trail_heroine02b__theo_08_a
;[img]    scene06
;[chara]  クレア
;[detail] Elf: Attempted Rape by Foster
@replay storage="heroine02b.scn" target=*_theo_08_a
[replayoff]

*replay_event86
;[exp]    st.trail_heroine02b__theo_08_b
;[img]    event17
;[chara]  クレア
;[detail] Elf: Violated by Foster
@replay storage="heroine02b.scn" target=*_theo_08_b
[replayoff]

*replay_event87
;[exp]    st.trail_heroine02b_theo_wedding
;[img]    event52
;[chara]  クレア
;[detail] Elf × Protagonist: Morning
@replay storage="heroine02b.scn" target=*_replay_theo_wedding
[replayoff]

*replay_event88
;[exp]    st.trail_heroine02b_theo_20
;[img]    scene07
;[chara]  クレア
;[detail] Elf × Protagonist: Night
@replay storage="heroine02b.scn" target=*theo_20
[replayoff]

*replay_event89
;[exp]    st.trail_heroine02a_max_03
;[img]    event94
;[chara]  クレア
;[detail] Elf × Max 1
@replay storage="heroine02a.scn" target=*max_03
[replayoff]

*replay_event90
;[exp]    st.trail_heroine02a_max_04
;[img]    event15
;[chara]  クレア
;[detail] Elf × Max 2
@replay storage="heroine02a.scn" target=*max_04
[replayoff]

*replay_event91
;[exp]    st.trail_heroine02a_linus_01
;[img]    scene08
;[chara]  クレア
;[detail] Elf × Linus 1
@replay storage="heroine02a.scn" target=*linus_01
[replayoff]

*replay_event92
;[exp]    st.trail_heroine02a_linus_02
;[img]    event42
;[chara]  クレア
;[detail] Elf × Linus 2
@replay storage="heroine02a.scn" target=*linus_02
[replayoff]

*replay_event93
;[exp]    st.trail_heroine02a_linus_03
;[img]    event37
;[chara]  クレア
;[detail] Elf × Linus 3
@replay storage="heroine02a.scn" target=*linus_03
[replayoff]

*replay_event94
;[exp]    st.trail_heroine02b_blue_01
;[img]    scene09
;[chara]  クレア
;[detail] Elf × Blue 1
@replay storage="heroine02b.scn" target=*_blue_01_case1
[replayoff]

*replay_event95
;[exp]    st.trail_heroine02b_blue_02
;[img]    event61
;[chara]  クレア
;[detail] Elf × Blue 2
@replay storage="heroine02b.scn" target=*_blue_02_case1
[replayoff]

*replay_event96
;[exp]    st.trail_heroine02b_blue_04
;[img]    scene22
;[chara]  クレア
;[detail] Elf × Blue: Early Morning Inn
@replay storage="heroine02b.scn" target=*blue_04
[replayoff]

*replay_event97
;[exp]    st.trail_heroine02b_married_01
;[img]    event20
;[chara]  クレア
;[detail] Elf × Blue: After Marriage 1
@replay storage="heroine02b.scn" target=*married_01
[replayoff]

*replay_event98
;[exp]    st.trail_heroine02b_married_02
;[img]    scene10
;[chara]  クレア
;[detail] Elf × Blue: After Marriage 2
@replay storage="heroine02b.scn" target=*married_02
[replayoff]

*replay_event99
;[exp]    st.trail_heroine02b_married_03
;[img]    scene12
;[chara]  クレア
;[detail] Elf × Blue: After Marriage 3
@replay storage="heroine02b.scn" target=*married_03
[replayoff]

*replay_event100
;[exp]    st.trail_heroine02b_hotel_theo_2
;[img]    scene16
;[chara]  クレア
;[detail] Elf × Protagonist: Love Hotel - Morning
@replay storage="heroine02b.scn" target=*hotel_theo_2
[replayoff]

*replay_event101
;[exp]    st.trail_heroine02b_hotel_max_1
;[img]    scene60
;[chara]  クレア
;[detail] Elf × Max: Love Hotel - Night
@replay storage="heroine02b.scn" target=*hotel_max_1
[replayoff]

*replay_event102
;[exp]    st.trail_heroine02b_hotel_max_2
;[img]    event15
;[chara]  クレア
;[detail] Elf × Max: Love Hotel - Morning
@replay storage="heroine02b.scn" target=*hotel_max_2
[replayoff]

*replay_event103
;[exp]    st.trail_heroine02b_adultery_max
;[img]    scene17
;[chara]  クレア
;[detail] Elf × Max Affair
@replay storage="heroine02b.scn" target=*adultery_max
[replayoff]

*replay_event104
;[exp]    st.trail_heroine02b_adultery_linus
;[img]    event37
;[chara]  クレア
;[detail] Elf × Linus Affair
@replay storage="heroine02b.scn" target=*adultery_linus
[replayoff]

*replay_event105
;[exp]    st.trail_others02_spa_elf
;[img]    event34
;[chara]  クレア
;[detail] Elf: Hot Spring Event
@mu f=duel
@replay storage="others02.scn" target=*spa_elf
@replay storage="others02.scn" target=*spa_elf2
[replayoff]




*replay_event109
;[exp]    st.trail_heroine03b_theo_wedding
;[img]    event65
;[chara]  フレデリカ
;[detail] Dwarf: Days in the Dwarf Village
@replay storage="heroine03b.scn" target=*_replay_theo_wedding1a
[replayoff]

*replay_event110
;[exp]    st.trail_heroine03b__another_dwarf_route
;[img]    event101
;[chara]  フレデリカ
;[detail] Dwarf: Days of Comforting Myself
@replay storage="heroine03b.scn" target=*_another_dwarf_route
[replayoff]

*replay_event111
;[exp]    st.trail_heroine03b_theo_wedding
;[img]    scene18
;[chara]  フレデリカ
;[detail] Dwarf × Protagonist: Morning
@replay storage="heroine03b.scn" target=*_replay_theo_wedding2
[replayoff]

*replay_event112
;[exp]    st.trail_heroine03b_theo_20
;[img]    event50
;[chara]  フレデリカ
;[detail] Dwarf × Protagonist: Night
@replay storage="heroine03b.scn" target=*theo_20
[replayoff]

*replay_event113
;[exp]    st.trail_heroine03a_max_04
;[img]    scene19
;[chara]  フレデリカ
;[detail] Dwarf × Max 1
@replay storage="heroine03a.scn" target=*max_04
[replayoff]

*replay_event114
;[exp]    st.trail_heroine03a_max_05
;[img]    event25
;[chara]  フレデリカ
;[detail] Dwarf × Max 2
@replay storage="heroine03a.scn" target=*max_05
[replayoff]

*replay_event115
;[exp]    st.trail_heroine03a_linus_01
;[img]    scene20
;[chara]  フレデリカ
;[detail] Dwarf × Linus 1
@replay storage="heroine03a.scn" target=*linus_01
[replayoff]

*replay_event116
;[exp]    st.trail_heroine03a_linus_02
;[img]    scene26
;[chara]  フレデリカ
;[detail] Dwarf × Linus 2
@replay storage="heroine03a.scn" target=*linus_02
[replayoff]

*replay_event117
;[exp]    st.trail_heroine03a_linus_03
;[img]    event56
;[chara]  フレデリカ
;[detail] Dwarf × Linus 3
@replay storage="heroine03a.scn" target=*linus_03
[replayoff]

*replay_event118
;[exp]    st.trail_heroine03a_linus_03
;[img]    scene27
;[chara]  フレデリカ
;[detail] Dwarf × Linus 4
@replay storage="heroine03a.scn" target=*linus_04
[replayoff]

*replay_event119
;[exp]    st.trail_heroine03b_blue_01
;[img]    scene28
;[chara]  フレデリカ
;[detail] Dwarf × Blue 1
@replay storage="heroine03b.scn" target=*_blue_01_case1
[replayoff]

*replay_event120
;[exp]    st.trail_heroine03b_blue_02
;[img]    event73
;[chara]  フレデリカ
;[detail] Dwarf × Blue 2
@replay storage="heroine03b.scn" target=*_blue_02_case1
[replayoff]

*replay_event121
;[exp]    st.trail_heroine03b_blue_04
;[img]    scene23
;[chara]  フレデリカ
;[detail] Dwarf × Blue: Early Morning Inn
@replay storage="heroine03b.scn" target=*blue_04
[replayoff]

*replay_event122
;[exp]    st.trail_heroine03b_married_01
;[img]    scene29
;[chara]  フレデリカ
;[detail] Dwarf × Blue: After Marriage 1
@replay storage="heroine03b.scn" target=*married_01
[replayoff]

*replay_event123
;[exp]    st.trail_heroine03b_married_02
;[img]    scene30
;[chara]  フレデリカ
;[detail] Dwarf × Blue: After Marriage 2
@replay storage="heroine03b.scn" target=*married_02
[replayoff]

*replay_event124
;[exp]    st.trail_heroine03b_married_03
;[img]    scene31
;[chara]  フレデリカ
;[detail] Dwarf × Blue: After Marriage 3
@replay storage="heroine03b.scn" target=*married_03
[replayoff]

*replay_event125
;[exp]    st.trail_heroine03b_hotel_theo_1
;[img]    scene32
;[chara]  フレデリカ
;[detail] Dwarf × Protagonist: Love Hotel - Night
@replay storage="heroine03b.scn" target=*hotel_theo_1
[replayoff]

*replay_event126
;[exp]    st.trail_heroine03b_hotel_theo_2
;[img]    back04
;[chara]  フレデリカ
;[detail] Dwarf × Protagonist: Love Hotel - Morning
@replay storage="heroine03b.scn" target=*hotel_theo_2
[replayoff]

*replay_event127
;[exp]    st.trail_heroine03b_hotel_max_1
;[img]    scene33
;[chara]  フレデリカ
;[detail] Dwarf × Max: Love Hotel - Night
@replay storage="heroine03b.scn" target=*hotel_max_1
[replayoff]

*replay_event128
;[exp]    st.trail_heroine03b_hotel_max_2
;[img]    event25
;[chara]  フレデリカ
;[detail] Dwarf × Max: Love Hotel - Morning
@replay storage="heroine03b.scn" target=*hotel_max_2
[replayoff]

*replay_event129
;[exp]    st.trail_heroine03b_adultery_max
;[img]    scene34
;[chara]  フレデリカ
;[detail] Dwarf × Max Affair
@replay storage="heroine03b.scn" target=*adultery_max
[replayoff]

*replay_event130
;[exp]    st.trail_heroine03b_adultery_linus
;[img]    back01
;[chara]  フレデリカ
;[detail] Dwarf × Linus Affair
@replay storage="heroine03b.scn" target=*adultery_linus
[replayoff]

*replay_event131
;[exp]    st.trail_others02_spa_dwarf
;[img]    event78
;[chara]  フレデリカ
;[detail] Dwarf: Hot Spring Event
@mu f=duel
@replay storage="others02.scn" target=*spa_dwarf
@replay storage="others02.scn" target=*spa_dwarf2
[replayoff]




*replay_event133
;[exp]    st.trail_heroine04b_theo_09
;[img]    event102
;[detail] Tragedy in Gnome Village
@replay storage="heroine04b.scn" target=*theo_09
[replayoff]

*replay_event134
;[exp]    st.trail_heroine04b_theo_20
;[img]    event11
;[chara]  ミューズ
;[detail] Gnome × Protagonist: Night 
@replay storage="heroine04b.scn" target=*theo_20
[replayoff]

*replay_event135
;[exp]    st.trail_heroine04a_max_04
;[img]    scene35
;[chara]  ミューズ
;[detail] Gnome × Max 1
@replay storage="heroine04a.scn" target=*max_04
[replayoff]

*replay_event136
;[exp]    st.trail_heroine04a_max_05
;[img]    scene36
;[chara]  ミューズ
;[detail] Gnome × Max 2
@replay storage="heroine04a.scn" target=*max_05
[replayoff]

*replay_event137
;[exp]    st.trail_heroine04a_max_06
;[img]    scene37
;[chara]  ミューズ
;[detail] Gnome × Max 3
@replay storage="heroine04a.scn" target=*max_06
[replayoff]

*replay_event138
;[exp]    st.trail_heroine04a_max_07
;[img]    scene38
;[chara]  ミューズ
;[detail] Gnome × Max 4
@replay storage="heroine04a.scn" target=*max_07
[replayoff]

*replay_event139
;[exp]    st.trail_heroine04a_linus_02
;[img]    scene39
;[chara]  ミューズ
;[detail] Gnome × Linus 1
@replay storage="heroine04a.scn" target=*linus_02
[replayoff]

*replay_event140
;[exp]    st.trail_heroine04a_linus_03
;[img]    event55
;[chara]  ミューズ
;[detail] Gnome × Linus 2
@replay storage="heroine04a.scn" target=*linus_03
[replayoff]

*replay_event141
;[exp]    st.trail_heroine04a_linus_04
;[img]    scene40
;[chara]  ミューズ
;[detail] Gnome × Linus 3
@replay storage="heroine04a.scn" target=*linus_04
[replayoff]

*replay_event142
;[exp]    st.trail_heroine04b_blue_01
;[img]    scene41
;[chara]  ミューズ
;[detail] Gnome × Blue 1
@replay storage="heroine04b.scn" target=*_blue_01_case1
[replayoff]

*replay_event143
;[exp]    st.trail_heroine04b_blue_02
;[img]    event38
;[chara]  ミューズ
;[detail] Gnome × Blue 2
@replay storage="heroine04b.scn" target=*_blue_02_case1
[replayoff]

*replay_event144
;[exp]    st.trail_heroine04b_blue_04
;[img]    scene24
;[chara]  ミューズ
;[detail] Gnome × Blue: Early Morning Inn
@replay storage="heroine04b.scn" target=*blue_04
[replayoff]

*replay_event145
;[exp]    st.trail_heroine04b_married_01
;[img]    scene14
;[chara]  ミューズ
;[detail] Gnome × Blue: After Marriage 1
@replay storage="heroine04b.scn" target=*married_01
[replayoff]

*replay_event146
;[exp]    st.trail_heroine04b_married_02
;[img]    scene44
;[chara]  ミューズ
;[detail] Gnome × Blue: After Marriage 2
@replay storage="heroine04b.scn" target=*married_02
[replayoff]

*replay_event147
;[exp]    st.trail_heroine04b_married_03
;[img]    scene41
;[chara]  ミューズ
;[detail] Gnome × Blue: After Marriage 3
@replay storage="heroine04b.scn" target=*married_03
[replayoff]

*replay_event148
;[exp]    st.trail_heroine04b_hotel_theo_2
;[img]    scene42
;[chara]  ミューズ
;[detail] Gnome × Protagonist: Love Hotel - Morning
@replay storage="heroine04b.scn" target=*hotel_theo_2
[replayoff]

*replay_event149
;[exp]    st.trail_heroine04b_hotel_max_1
;[img]    scene43
;[chara]  ミューズ
;[detail] Gnome × Max: Love Hotel - Night
@replay storage="heroine04b.scn" target=*hotel_max_1
[replayoff]

*replay_event150
;[exp]    st.trail_heroine04b_hotel_max_2
;[img]    scene36
;[chara]  ミューズ
;[detail] Gnome × Max: Love Hotel - Morning
@replay storage="heroine04b.scn" target=*hotel_max_2
[replayoff]

*replay_event151
;[exp]    st.trail_heroine04b_adultery_max
;[img]    scene35
;[chara]  ミューズ
;[detail] Gnome × Max Affair
@replay storage="heroine04b.scn" target=*adultery_max
[replayoff]

*replay_event152
;[exp]    st.trail_heroine04b_adultery_linus
;[img]    back01
;[chara]  ミューズ
;[detail] Gnome × Linus Affair
@replay storage="heroine04b.scn" target=*adultery_linus
[replayoff]

*replay_event153
;[exp]    st.trail_others02_spa_gnome
;[img]    event79
;[chara]  ミューズ
;[detail] Gnome: Hot Spring Event
@mu f=duel
@replay storage="others02.scn" target=*spa_gnome
@replay storage="others02.scn" target=*spa_gnome2
[replayoff]




*replay_event157
;[exp]    st.trail_heroine05b_theo_07
;[img]    event75
;[chara]  マルエット
;[detail] Sylph: Table corner
@replay storage="heroine05b.scn" target=*theo_07
[replayoff]

*replay_event158
;[exp]    st.trail_heroine05b_theo_20
;[img]    event53
;[chara]  マルエット
;[detail] Sylph × Protagonist: Night
@replay storage="heroine05b.scn" target=*theo_20
[replayoff]

*replay_event159
;[exp]    st.trail_heroine05a_max_02
;[img]    scene45
;[chara]  マルエット
;[detail] Sylph × Max 1
@replay storage="heroine05a.scn" target=*max_02
[replayoff]

*replay_event160
;[exp]    st.trail_heroine05a_max_03
;[img]    scene46
;[chara]  マルエット
;[detail] Sylph × Max 2
@replay storage="heroine05a.scn" target=*max_03
[replayoff]

*replay_event161
;[exp]    st.trail_heroine05a_max_04
;[img]    event62
;[chara]  マルエット
;[detail] Sylph × Max 3
@replay storage="heroine05a.scn" target=*max_04
[replayoff]

*replay_event162
;[exp]    st.trail_heroine05a_max_06
;[img]    scene47
;[chara]  マルエット
;[detail] Sylph × Max 4
@replay storage="heroine05a.scn" target=*max_06
[replayoff]

*replay_event163
;[exp]    st.trail_heroine05a_linus_03
;[img]    event54
;[chara]  マルエット
;[detail] Sylph × Linus 1
@replay storage="heroine05a.scn" target=*linus_03
[replayoff]

*replay_event164
;[exp]    st.trail_heroine05a_linus_04
;[img]    scene48
;[chara]  マルエット
;[detail] Sylph × Linus 2
@replay storage="heroine05a.scn" target=*linus_04
[replayoff]

*replay_event165
;[exp]    st.trail_heroine05b_blue_01
;[img]    scene49
;[chara]  マルエット
;[detail] Sylph × Blue 1
@replay storage="heroine05b.scn" target=*_blue_01_case1
[replayoff]

*replay_event166
;[exp]    st.trail_heroine05b_blue_02
;[img]    event64
;[chara]  マルエット
;[detail] Sylph × Blue 2
@replay storage="heroine05b.scn" target=*_blue_02_case1
[replayoff]

*replay_event167
;[exp]    st.trail_heroine05b_blue_03
;[img]    event74
;[chara]  マルエット
;[detail] Sylph × Blue 3
@replay storage="heroine05b.scn" target=*_blue_03_case1
[replayoff]

*replay_event168
;[exp]    st.trail_heroine05b_blue_05
;[img]    scene25
;[chara]  マルエット
;[detail] Sylph × Blue: Early Morning Inn
@replay storage="heroine05b.scn" target=*blue_05
[replayoff]

*replay_event169
;[exp]    st.trail_heroine05b_married_01
;[img]    scene15
;[chara]  マルエット
;[detail] Sylph × Blue: After Marriage 1
@replay storage="heroine05b.scn" target=*married_01
[replayoff]

*replay_event170
;[exp]    st.trail_heroine05b_married_02
;[img]    event63
;[chara]  マルエット
;[detail] Sylph × Blue: After Marriage 2
@replay storage="heroine05b.scn" target=*married_02
[replayoff]

*replay_event171
;[exp]    st.trail_heroine05b_married_03
;[img]    scene50
;[chara]  マルエット
;[detail] Sylph × Blue: After Marriage 3
@replay storage="heroine05b.scn" target=*married_03
[replayoff]

*replay_event172
;[exp]    st.trail_heroine05b_hotel_theo_2
;[img]    back04
;[chara]  マルエット
;[detail] Sylph × Protagonist: Love Hotel - Morning
@replay storage="heroine05b.scn" target=*hotel_theo_2
[replayoff]

*replay_event173
;[exp]    st.trail_heroine05b_hotel_max_1
;[img]    scene51
;[chara]  マルエット
;[detail] Sylph × Max: Love Hotel - Night
@replay storage="heroine05b.scn" target=*hotel_max_1
[replayoff]

*replay_event174
;[exp]    st.trail_heroine05b_hotel_max_2
;[img]    scene47
;[chara]  マルエット
;[detail] Sylph × Max: Love Hotel - Morning
@replay storage="heroine05b.scn" target=*hotel_max_2
[replayoff]

*replay_event175
;[exp]    st.trail_heroine05b_adultery_max
;[img]    scene47
;[chara]  マルエット
;[detail] Sylph × Max Affair
@replay storage="heroine05b.scn" target=*adultery_max
[replayoff]

*replay_event176
;[exp]    st.trail_heroine05b_adultery_linus
;[img]    back01
;[chara]  マルエット
;[detail] Sylph × Linus Affair
@replay storage="heroine05b.scn" target=*adultery_linus
[replayoff]

*replay_event177
;[exp]    st.trail_others02_spa_sylph
;[img]    event80
;[chara]  マルエット
;[detail] Sylph: Hot Spring Event
@mu f=duel
@replay storage="others02.scn" target=*spa_sylph
@replay storage="others02.scn" target=*spa_sylph2
[replayoff]




*replay_event181
;[exp]    st.trail_others01_miredy_max
;[img]    event98
;[detail] Miredy × Max
@replay storage="others01.scn" target=*miredy_max
[replayoff]

*replay_event182
;[exp]    st.trail_others01_miredy_linus
;[img]    event98
;[detail] Miredy × Linus
@replay storage="others01.scn" target=*miredy_linus
[replayoff]

*replay_event183
;[exp]    st.trail_others01_sandra_max
;[img]    event97
;[detail] Sandra × Max
@replay storage="others01.scn" target=*sandra_max
[replayoff]

*replay_event184
;[exp]    st.trail_others01_sandra_blue
;[img]    event97
;[detail] Sandra × Blue
@replay storage="others01.scn" target=*sandra_blue
[replayoff]

*replay_event185
;[exp]    st.trail_others02_sandra_rufus
;[img]    event96
;[detail] Sandra Defeat Event
@mu f=duel
@replay storage="others02.scn" target=*sandra_rufus
[replayoff]

*replay_event186
;[exp]    st.trail_others02_maria_rufus
;[img]    event95
;[detail] Maria Defeat Event
@mu f=duel
@replay storage="others02.scn" target=*maria_rufus
[replayoff]

*replay_event187
;[exp]    st.trail_main11_fortress
;[img]    event100
;[detail] Maria Church Event
@replay storage="main11.scn" target=*fortress
[replayoff]




*replay_event193
;[exp]    st.trail_main04_labyrinth_4
;[img]    event46
;[detail] Girls violated by Headless in the labyrinth
@replay storage="main04.scn" target=*_replay_labyrinth_4
[replayoff]

*replay_event194
;[exp]    st.trail_main07_liesel_2
;[img]    event67
;[detail] Riselle: Beach date
@replay storage="main07.scn" target=*liesel_2
[replayoff]

*replay_event195
;[exp]    st.trail_main07_liesel_5
;[img]    event01
;[detail] Riselle: Violated by Blue in the forest
@replay storage="main07.scn" target=*_replay_liesel_5
[replayoff]

*replay_event196
;[exp]    st.trail_main08_revenge_2
;[img]    scene52
;[detail] Riselle: Reunion in town
@replay storage="main08.scn" target=*revenge_2
[replayoff]

*replay_event197
;[exp]    st.trail_main08_revenge_3
;[img]    event70
;[detail] Riselle: Sex with Blue in mansion
@replay storage="main08.scn" target=*_replay_revenge_3
[replayoff]

*replay_event198
;[exp]    st.trail_others02_spa_sylph
;[img]    event81
;[chara]  リーゼル
;[detail] Riselle: Hot Spring Event
@mu f=duel
@replay storage="others02.scn" target=*spa_liesel
@replay storage="others02.scn" target=*spa_liesel2
[replayoff]

*replay_event199
;[exp]    st.trail_main09_return_1
;[img]    event18
;[detail] Girl being violated in the barbarian settlement
@replay storage="main09.scn" target=*return_1
[replayoff]

*replay_event200
;[exp]    st.trail_main11_pond_2
;[img]    event104
;[detail] Girls raped in the Swamp of the Dead
@replay storage="main11.scn" target=*pond_2
[replayoff]

*replay_event201
;[exp]    st.trail_main10_orc_1
;[img]    event92
;[detail] Guard Captain attacked by an orc
@replay storage="main10.scn" target=*_replay_orc_1
[replayoff]

*replay_event202
;[exp]    st.trail_main11_barn_2
;[img]    event90
;[detail] Lady having an affair in the field shed
@replay storage="main11.scn" target=*_replay_barn_2
[replayoff]

*replay_event203
;[exp]    st.trail_other01_fiona_trophy
;[img]    event93
;[detail] Princess Fiona's invitation
@replay storage="others01.scn" target=*_replay_iona_trophy
[replayoff]





;■ＣＧ閲覧モード

*cg_event03
@album chara=リム f=event03 p0=hair p1=01
[albumoff]

*cg_event02
@album chara=リム f=event02 p0=hair p2=01 p3=01
@album chara=リム f=event02 p1=hair p2=02 p3=02
@album f=event02 p2=03
@album f=event02 p2=04
@album chara=リム f=event02 p1=hair p2=02 p3=03
@album chara=リム f=event02 p1=hair p2=02 p3=04
@album f=event02 p2=05
@album chara=リム f=event02 p0=hair p2=01 p3=01
[albumoff]

*cg_event07
@eval exp='o.リム.capturers[0] = m.オークキング'
@album chara=リム f=event07 p0=hair p1=monster p2=hip p14=06
@album chara=リム f=event07 p0=hair p1=monster p2=hip p14=01
@album chara=リム f=event07 p0=hair p3=monster p4=hip p14=06
@album chara=リム f=event07 p0=hair p5=monster p6=hip p14=06
@album chara=リム f=event07 p0=hair p1=monster p14=05
@album chara=リム f=event07 p0=hair p1=monster p14=01
@album chara=リム f=event07 p0=hair p7=monster p14=01
@album chara=リム f=event07 p0=hair p8=monster p14=05
@album chara=リム f=event07 p0=hair p9=monster p14=03
@album chara=リム f=event07 p0=hair p9=monster p14=06
@album chara=リム f=event07 p0=hair p10=monster p14=06
@album chara=リム f=event07 p0=hair p9=monster p14=08
@album chara=リム f=event07 p0=hair p10=monster p14=08
@album chara=リム f=event07 p0=hair p11=monster p14=08
@album chara=リム f=event07 p0=hair p12=monster p14=07
[albumoff]

*cg_event08
@album chara=リム f=event08 p0=01 p1=hair p2=01 p3=01 p4=01
@album chara=リム f=event08 p0=01 p1=hair p2=01 p3=02 p4=01
@album chara=リム f=event08 p0=01 p1=hair p2=01 p3=03 p4=01
@album chara=リム f=event08 p0=01 p1=hair p2=02 p3=04 p4=04
@album chara=リム f=event08 p0=01 p1=hair p2=03 p3=04 p4=05
@album chara=リム f=event08 p0=01 p1=hair p2=03 p3=04 p4=04
@album chara=リム f=event08 p0=01 p1=hair p2=03 p3=01 p4=06
@album chara=リム f=event08 p0=01 p1=hair p2=04 p3=09 p4=05
@album chara=リム f=event08 p0=01 p1=hair p2=04 p3=06 p4=06
@album chara=リム f=event08 p0=01 p1=hair p2=04 p3=09 p4=06
@album chara=リム f=event08 p0=01 p1=hair p2=04 p3=09 p4=04
[albumoff]

*cg_event12
@album chara=リム f=event12 p0=01 p1=hair p2=01 p3=01
@album chara=リム f=event12 p0=01 p1=hair p2=02 p3=01
@album chara=リム f=event12 p0=02 p4=hair p5=01
@album chara=リム f=event12 p0=02 p4=hair p5=02
@album chara=リム f=event12 p0=02 p4=hair p5=03
@album chara=リム f=event12 p0=02 p4=hair p5=04
@album chara=リム f=event12 p0=02 p4=hair p5=05
@album chara=リム f=event12 p0=02 p4=hair p5=06
@album chara=リム f=event12 p0=03 p6=hair p7=01
[albumoff]

*cg_event13
@album chara=リム f=event13 p0=hair p1=01 p2=01
@album chara=リム f=event13 p0=hair p1=02 p2=03
@album chara=リム f=event13 p0=hair p1=03 p2=03
@album chara=リム f=event13 p0=hair p1=04 p2=03
@album chara=リム f=event13 p0=hair p1=04 p2=04
@album chara=リム f=event13 p0=hair p1=05 p2=07
@album chara=リム f=event13 p0=hair p1=01 p2=03
@album chara=リム f=event13 p0=hair p1=03 p2=04
[albumoff]

*cg_event21
@album chara=リム f=event21 p0=hair p1=01
@album chara=リム f=event21 p0=hair p1=02
[albumoff]

*cg_event22
@album chara=リム f=event22 p0=hair p1=01 p2=04
@album chara=リム f=event22 p3=hair p4=01 p5=01
@album chara=リム f=event22 p3=hair p4=01 p5=02
@album chara=リム f=event22 p0=hair p1=01 p2=03
[albumoff]

*cg_event23
@album chara=リム f=event23 p0=hair p1=01 p2=01
@album chara=リム f=event23 p0=hair p1=01 p2=03
@album chara=リム f=event23 p0=hair p1=02 p2=03
@album chara=リム f=event23 p0=hair p1=03 p2=03
@album chara=リム f=event23 p0=hair p1=04 p2=03
@album chara=リム f=event23 p0=hair p1=03 p2=02
@album chara=リム f=event23 p0=hair p1=04 p2=02
@album chara=リム f=event23 p0=hair p1=05 p2=01
@album chara=リム f=event23 p0=hair p1=05 p2=03
@album chara=リム f=event23 p0=hair p1=03 p2=04
[albumoff]

*cg_event39
@eval exp='o.リム.capturers[0] = m.ローパー'
@album chara=リム f=event39 p0=hair p1=01 p2=hip p4=01
@album chara=リム f=event39 p0=hair p1=02 p2=hip p4=05
@album chara=リム f=event39 p0=hair p1=02 p4=08
@album chara=リム f=event39 p0=hair p1=03 p4=02
@album chara=リム f=event39 p0=hair p1=03 p3=01 p4=02
@album chara=リム f=event39 p0=hair p1=03 p3=02 p4=02
@album chara=リム f=event39 p0=hair p1=03 p3=03 p4=08
@album chara=リム f=event39 p0=hair p1=03 p3=02 p4=08
@album chara=リム f=event39 p0=hair p1=04 p3=04 p4=08
@album chara=リム f=event39 p0=hair p1=04 p3=05 p4=08
@album chara=リム f=event39 p0=hair p1=04 p3=04 p4=05
@album chara=リム f=event39 p0=hair p1=04 p3=05 p4=05
@album chara=リム f=event39 p0=hair p1=04 p3=05 p4=03
@album chara=リム f=event39 p0=hair p1=04 p4=02
@album chara=リム f=event39 p0=hair p1=04 p3=06 p4=02
@album chara=リム f=event39 p0=hair p1=05 p4=05
@album chara=リム f=event39 p0=hair p1=06 p4=05
@album chara=リム f=event39 p0=hair p1=06 p4=06
@album chara=リム f=event39 p0=hair p1=08 p4=08
@album chara=リム f=event39 p0=hair p1=08 p4=09
@eval exp='o.リム.capturers[0] = m.マウンテンデビル'
@album chara=リム f=event39 p0=hair p1=04 p4=02 p5=monster
@album chara=リム f=event39 p0=hair p1=04 p4=05 p5=monster
@album chara=リム f=event39 p0=hair p1=07 p4=05 p6=monster
@album chara=リム f=event39 p0=hair p1=07 p4=06 p6=monster
[albumoff]

*cg_event76
@album chara=リム f=event76 p0=hair p1=02
@album chara=リム f=event76 p0=hair p1=03
[albumoff]

*cg_event51
@album chara=リム f=event51 p0=hair p1=01 p2=02
@album chara=リム f=event51 p0=hair p1=02 p2=01
[albumoff]

*cg_event26a
@album f=event26 chara=リム p1=hair
[albumoff]

*cg_event86
@album chara=リム f=event86 p0=hair p2=01 p3=hip p4=01
@album chara=リム f=event86 p0=hair p2=01 p3=hip p4=04
@album chara=リム f=event86 p0=hair p2=01 p3=hip p4=02
@album chara=リム f=event86 p0=hair p2=01 p4=01
@album chara=リム f=event86 p0=hair p2=02 p4=03
@album chara=リム f=event86 p0=hair p2=03 p4=01
@album chara=リム f=event86 p0=hair p2=03 p4=04
@album chara=リム f=event86 p1=hair p2=04 p4=06
@album chara=リム f=event86 p1=hair p2=04 p4=05
@album chara=リム f=event86 p0=hair p2=05 p4=03
[albumoff]

*cg_event30a
@album f=event30 chara=クレア p2=01 p3=hair
@album f=event30 p1=01
[albumoff]

*cg_event52
@album chara=クレア f=event52 p0=hair p1=01 p2=03
@album chara=クレア f=event52 p0=hair p1=01 p2=01
@album chara=クレア f=event52 p0=hair p1=01 p2=02
[albumoff]

*cg_event40
@eval exp='o.クレア.capturers[0] = m.ローパー'
@album chara=クレア f=event40 p0=hair p1=01 p2=hip p9=01
@album chara=クレア f=event40 p0=hair p1=02 p2=hip p9=09
@album chara=クレア f=event40 p0=hair p1=02 p2=hip p9=08
@album chara=クレア f=event40 p0=hair p1=02 p9=08
@album chara=クレア f=event40 p0=hair p1=03 p9=01
@album chara=クレア f=event40 p0=hair p1=04 p9=01
@album chara=クレア f=event40 p0=hair p1=05 p9=07
@album chara=クレア f=event40 p0=hair p1=05 p9=05
@album chara=クレア f=event40 p0=hair p1=06 p9=05
@album chara=クレア f=event40 p0=hair p1=05 p9=06
@album chara=クレア f=event40 p0=hair p1=06 p9=06
@album chara=クレア f=event40 p0=hair p1=07 p9=05
@album chara=クレア f=event40 p0=hair p1=08 p9=07
@album chara=クレア f=event40 p0=hair p1=08 p9=08
@album chara=クレア f=event40 p0=hair p1=09 p9=07
@album chara=クレア f=event40 p0=hair p1=10 p9=05
@eval exp='o.クレア.capturers[0] = m.マウンテンデビル'
@album chara=クレア f=event40 p0=hair p3=monster p9=01
@album chara=クレア f=event40 p0=hair p4=monster p9=07
@album chara=クレア f=event40 p0=hair p4=monster p9=08
@album chara=クレア f=event40 p0=hair p5=monster p9=08
[albumoff]

*cg_event15
@album chara=クレア f=event15 p0=hair p3=01
@album chara=クレア f=event15 p1=hair p3=02
@album chara=クレア f=event15 p2=hair p3=03
[albumoff]

*cg_event36
@fg c=0022 index=900 b
@album chara=クレア f=event36 p0=hair p1=01 p2=01 p3=01 left=100 top=-65
@album chara=クレア f=event36 p0=hair p1=01 p2=03 p3=04 left=100 top=-65
@album chara=クレア f=event36 p0=hair p1=01 p2=01 p3=03 left=100 top=-65
@album chara=クレア f=event36 p0=hair p1=02 p2=03 p3=04 left=100 top=-65
@album chara=クレア f=event36 p0=hair p1=02 p2=02 p3=04 left=100 top=-65
@album chara=クレア f=event36 p0=hair p1=03 p2=02 p3=04 left=100 top=-65
@album chara=クレア f=event36a p0=hair p1=01 left=0 top=0
[albumoff]

*cg_event37
@album chara=クレア f=event37 p0=hair p1=01 p2=01 p3=04
@album chara=クレア f=event37 p0=hair p1=01 p2=01 p3=01
@album chara=クレア f=event37 p0=hair p1=01 p2=01 p3=02
@album chara=クレア f=event37 p0=hair p1=01 p2=01 p3=03
@album chara=クレア f=event37 p0=hair p1=01 p2=02 p3=02
@album chara=クレア f=event37 p0=hair p1=02 p2=01 p3=03
[albumoff]

*cg_event17
@album chara=クレア f=event17 p0=hair p1=01 p2=01 p3=04
@album chara=クレア f=event17 p0=hair p1=01 p2=01 p3=01
@album chara=クレア f=event17 p0=hair p1=01 p2=01 p3=05
@album chara=クレア f=event17 p0=hair p1=01 p2=01 p3=03
@album chara=クレア f=event17 p0=hair p1=01 p2=02 p3=03
@album chara=クレア f=event17 p4=hair p5=01 p6=03
@album chara=クレア f=event17 p0=hair p1=01 p3=04
@album chara=クレア f=event17 p0=hair p1=01 p3=05
@album chara=クレア f=event17 p0=hair p1=02 p3=04
@album chara=クレア f=event17 p0=hair p1=02 p3=02
@album chara=クレア f=event17 p0=hair p1=02 p2=01 p3=02
@album chara=クレア f=event17 p0=hair p1=02 p2=01 p3=04
[albumoff]

*cg_event20
@album chara=クレア f=event20 p0=hair p1=01
[albumoff]

*cg_event04
@eval exp='o.クレア.capturers[0] = m.バーバリアン'
@album chara=クレア f=event04 p0=hair p1=01 p2=hip p4=arm p5=00 p6=leg p8=01 p9=01
@album chara=クレア f=event04 p0=hair p1=01 p3=hip p4=arm p5=00 p6=leg p8=02 p9=03
@album chara=クレア f=event04 p0=hair p1=01 p4=arm p5=00 p6=leg p9=03
@album chara=クレア f=event04 p0=hair p1=02 p4=arm p5=00 p7=leg p8=03 p9=01
@album chara=クレア f=event04 p0=hair p1=03 p4=arm p5=00 p6=leg p9=04
@album chara=クレア f=event04 p0=hair p1=03 p4=arm p5=00 p6=leg p9=05
@album chara=クレア f=event04 p0=hair p1=04 p4=arm p5=00 p6=leg p9=05
@album chara=クレア f=event04 p0=hair p1=04 p4=arm p5=00 p6=leg p9=04
@album chara=クレア f=event04 p0=hair p1=05 p4=arm p6=leg p9=06
[albumoff]

*cg_event61
@album chara=クレア f=event61 p0=hair p1=02 p2=06
@album chara=クレア f=event61 p0=hair p1=02 p2=05
@album chara=クレア f=event61 p3=hair p4=01 p5=05
@album chara=クレア f=event61 p3=hair p4=01 p5=01
@album chara=クレア f=event61 p3=hair p4=03 p5=05
@album chara=クレア f=event61 p3=hair p4=03 p5=01
@album chara=クレア f=event61 p3=hair p4=02 p5=04
@album chara=クレア f=event61 p3=hair p4=03 p5=04
@album chara=クレア f=event61 p0=hair p1=01 p2=06
[albumoff]

*cg_event42
@album chara=クレア f=event42 p0=hair p1=02 p2=03
@album chara=クレア f=event42 p0=hair p1=03 p2=01
@album chara=クレア f=event42 p0=hair p1=01 p2=04
@album chara=クレア f=event42 p0=hair p1=04 p2=01
@album chara=クレア f=event42 p0=hair p1=04 p2=04
@album chara=クレア f=event42 p0=hair p1=05 p2=04
@album chara=クレア f=event42 p0=hair p1=06 p2=04
[albumoff]

*cg_event48
@album chara=クレア f=event48 p0=hair p1=01
[albumoff]

*cg_event34
@album chara=クレア f=event34 p0=hair p1=01 p2=02
@album chara=クレア f=event34 p0=hair p1=01 p2=03
[albumoff]

*cg_event88
@album chara=クレア f=event88 p0=hair p1=01 p2=hip p3=01
@album chara=クレア f=event88 p0=hair p1=01 p2=hip p3=02
@album chara=クレア f=event88 p0=hair p1=01 p2=hip p3=02 p4=01
@album chara=クレア f=event88 p0=hair p1=01 p2=hip p3=03 p4=01
@album chara=クレア f=event88 p0=hair p1=01 p3=01
@album chara=クレア f=event88 p0=hair p1=02 p3=03
@album chara=クレア f=event88 p0=hair p1=03 p3=03
@album chara=クレア f=event88 p0=hair p1=01 p3=02
@album chara=クレア f=event88 p0=hair p1=03 p3=02
@album chara=クレア f=event88 p0=hair p1=04 p3=01
@album chara=クレア f=event88 p0=hair p1=04 p3=03
@album chara=クレア f=event88 p0=hair p1=05 p3=03
[albumoff]

*cg_event43
@album chara=フレデリカ f=event43 p0=01 p1=hair p2=01 p3=01
@album chara=フレデリカ f=event43 p0=01 p1=hair p2=01 p3=02
@album chara=フレデリカ f=event43 p0=01 p1=hair p2=02 p3=02
@album chara=フレデリカ f=event43 p0=01 p1=hair p2=02 p3=01
@album chara=フレデリカ f=event43 p0=02 p4=hair p5=01 p6=01
@album chara=フレデリカ f=event43 p0=02 p4=hair p5=01 p6=02
@album chara=フレデリカ f=event43 p0=02 p4=hair p5=02 p6=02
[albumoff]

*cg_event09
@eval exp='o.フレデリカ.capturers[0] = m.インキュバス'
@album chara=フレデリカ f=event09 p0=hair p1=01 p2=hip p3=monster p12=07
@album chara=フレデリカ f=event09 p0=hair p1=01 p2=hip p5=monster p12=07
@album chara=フレデリカ f=event09 p0=hair p1=01 p2=hip p6=monster p12=02
@album chara=フレデリカ f=event09 p0=hair p1=01 p2=hip p6=monster p12=09
@album chara=フレデリカ f=event09 p0=hair p1=01 p3=monster p12=05
@album chara=フレデリカ f=event09 p0=hair p1=02 p4=monster p12=08
@album chara=フレデリカ f=event09 p0=hair p1=02 p4=monster p12=09
@album chara=フレデリカ f=event09 p0=hair p1=01 p5=monster p12=09
@album chara=フレデリカ f=event09 p0=hair p1=02 p7=monster p12=02
@album chara=フレデリカ f=event09 p0=hair p1=02 p7=monster p12=07
@album chara=フレデリカ f=event09 p0=hair p1=02 p7=monster p12=08
@album chara=フレデリカ f=event09 p0=hair p1=02 p8=monster p12=02
@album chara=フレデリカ f=event09 p0=hair p1=02 p8=monster p12=09
@album chara=フレデリカ f=event09 p0=hair p1=02 p8=monster p12=08
@album chara=フレデリカ f=event09 p0=hair p1=02 p8=monster p12=07
@album chara=フレデリカ f=event09 p0=hair p1=01 p9=monster p12=09
[albumoff]

*cg_event25
@album chara=フレデリカ f=event25 p0=hair p1=04 p2=03
@album chara=フレデリカ f=event25 p0=hair p1=04 p2=04
@album chara=フレデリカ f=event25 p0=hair p1=05 p2=02
@album chara=フレデリカ f=event25 p0=hair p1=05 p2=01
@album chara=フレデリカ f=event25 p0=hair p1=05 p2=03
[albumoff]

*cg_event26
@album f=event26 chara=フレデリカ p0=hair
[albumoff]

*cg_event73
@album chara=フレデリカ f=event73 p0=hair p1=01 p2=01
@album chara=フレデリカ f=event73 p0=hair p1=02 p2=04
@album chara=フレデリカ f=event73 p0=hair p1=03 p2=05
@album chara=フレデリカ f=event73 p0=hair p1=03 p2=04
@album chara=フレデリカ f=event73 p0=hair p1=04 p2=05
@album chara=フレデリカ f=event73 p0=hair p1=01 p2=03
@album chara=フレデリカ f=event73 p0=hair p1=02 p2=05
@album chara=フレデリカ f=event73 p0=hair p1=02 p2=06
@album chara=フレデリカ f=event73 p0=hair p1=02 p2=03
@album chara=フレデリカ f=event73 p3=hair p4=01 p5=02
@album chara=フレデリカ f=event73 p3=hair p4=01 p5=01
@album chara=フレデリカ f=event73 p3=hair p4=01 p5=03
@album chara=フレデリカ f=event73 p3=hair p4=02 p5=03
@album chara=フレデリカ f=event73 p3=hair p4=02 p5=04
@album chara=フレデリカ f=event73 p3=hair p4=03 p5=02
[albumoff]

*cg_event49
@album chara=フレデリカ f=event49 p0=hair p1=01 p2=hip p3=03
@album chara=フレデリカ f=event49 p0=hair p1=01 p2=hip p3=02
@album chara=フレデリカ f=event49 p0=hair p1=01 p2=hip p3=04
@album chara=フレデリカ f=event49 p0=hair p1=01 p2=hip p3=01
@album chara=フレデリカ f=event49 p0=hair p1=01 p3=03
@album chara=フレデリカ f=event49 p0=hair p1=02 p3=03
@album chara=フレデリカ f=event49 p0=hair p1=03 p3=01
@album chara=フレデリカ f=event49 p0=hair p1=03 p3=02
@album chara=フレデリカ f=event49 p0=hair p1=04 p3=02
@album chara=フレデリカ f=event49 p0=hair p1=05 p3=02
@album chara=フレデリカ f=event49 p0=hair p1=06 p3=01
@album chara=フレデリカ f=event49 p0=hair p1=07 p3=03
@album chara=フレデリカ f=event49 p0=hair p1=07 p3=05
@album chara=フレデリカ f=event49 p0=hair p1=08 p3=02
@album chara=フレデリカ f=event49 p0=hair p1=08 p3=04
[albumoff]

*cg_event50
@album chara=フレデリカ f=event50 p0=hair p1=01 p2=04
@album chara=フレデリカ f=event50 p0=hair p1=01 p2=05
@album chara=フレデリカ f=event50 p0=hair p1=01 p2=01
@album chara=フレデリカ f=event50 p0=hair p1=02 p2=06
@album chara=フレデリカ f=event50 p0=hair p1=02 p2=03
[albumoff]

*cg_event31
@album chara=フレデリカ f=event31 p0=hair p1=brown p2=01
[albumoff]

*cg_event65
@album chara=フレデリカ f=event65 p3=hair p4=01 p5=01
@album chara=フレデリカ f=event65 p3=hair p4=01 p5=05
@album chara=フレデリカ f=event65 p3=hair p4=02 p5=04
@album chara=フレデリカ f=event65 p3=hair p4=03 p5=04
@album chara=フレデリカ f=event65 p3=hair p4=04 p5=03
[albumoff]

*cg_event56
@album chara=フレデリカ f=event56 p0=hair p1=01 p2=04
@album chara=フレデリカ f=event56 p0=hair p1=01 p2=03
@album chara=フレデリカ f=event56 p0=hair p1=02 p2=05
@album chara=フレデリカ f=event56 p0=hair p1=02 p2=04
@album chara=フレデリカ f=event56 p0=hair p1=03 p2=06
@album chara=フレデリカ f=event56 p0=hair p1=03 p2=03
@album chara=フレデリカ f=event56 p0=hair p1=03 p2=01 p3=01
@album chara=フレデリカ f=event56 p0=hair p1=03 p2=04 p3=02
@album chara=フレデリカ f=event56 p0=hair p1=03 p2=06 p3=02
@album chara=フレデリカ f=event56 p0=hair p1=03 p2=05 p3=02
@album chara=フレデリカ f=event56 p0=hair p1=04 p2=05
@album chara=フレデリカ f=event56 p0=hair p1=04 p2=04 p3=02
@album chara=フレデリカ f=event56 p0=hair p1=04 p2=05 p3=02
[albumoff]

*cg_event78
@album chara=フレデリカ f=event78 p3=hair p4=01 p5=01
@album chara=フレデリカ f=event78 p3=hair p4=01 p5=03
@album chara=フレデリカ f=event78 p3=hair p4=01 p5=04
@album chara=フレデリカ f=event78 p0=hair p1=01 p2=01
@album chara=フレデリカ f=event78 p0=hair p1=01 p2=04
@album chara=フレデリカ f=event78 p0=hair p1=01 p2=03
@album chara=フレデリカ f=event78 p0=hair p1=02 p2=03
[albumoff]

*cg_event85
@eval exp='o.フレデリカ.capturers[0] = m.ローパー'
@album chara=フレデリカ f=event85 p0=hair p1=01 p2=hip p5=01
@album chara=フレデリカ f=event85 p0=hair p1=02 p2=hip p5=05
@album chara=フレデリカ f=event85 p0=hair p1=03 p2=hip p5=01
@album chara=フレデリカ f=event85 p0=hair p1=02 p5=04
@album chara=フレデリカ f=event85 p0=hair p1=03 p5=01
@album chara=フレデリカ f=event85 p0=hair p1=04 p5=05
@album chara=フレデリカ f=event85 p0=hair p1=04 p5=06
@album chara=フレデリカ f=event85 p0=hair p1=05 p5=02
@album chara=フレデリカ f=event85 p0=hair p1=06 p5=04
@album chara=フレデリカ f=event85 p0=hair p1=06 p5=05
@album chara=フレデリカ f=event85 p0=hair p1=06 p5=02
@album chara=フレデリカ f=event85 p0=hair p1=07 p5=05
@eval exp='o.フレデリカ.capturers[0] = m.マウンテンデビル'
@album chara=フレデリカ f=event85 p0=hair p3=monster p5=02
@album chara=フレデリカ f=event85 p0=hair p4=monster p5=04
[albumoff]

*cg_event101
@album chara=フレデリカ f=event101 p0=01
@album chara=フレデリカ f=event101 p0=02
@album chara=フレデリカ f=event101 p0=03
[albumoff]

*cg_event47
@album chara=ミューズ f=event47 p0=hair p1=01 p2=02
@album chara=ミューズ f=event47 p0=hair p1=01 p2=01
[albumoff]

*cg_event27
@album chara=ミューズ f=event27 p0=01 p1=hair p2=01
[albumoff]

*cg_event10
@album chara=ミューズ f=event10 p0=hair p1=01 p2=01 p3=01
@album chara=ミューズ f=event10 p0=hair p1=01 p2=01 p3=02
[albumoff]

*cg_event11
@album chara=ミューズ f=event11 p0=hair p2=01 p3=02
@album chara=ミューズ f=event11 p0=hair p2=01 p3=05
@album chara=ミューズ f=event11 p0=hair p2=01 p3=06
@album chara=ミューズ f=event11 p1=hair p2=03 p4=04
@album chara=ミューズ f=event11 p1=hair p2=03 p4=06
@album chara=ミューズ f=event11 p0=hair p2=02 p3=02
[albumoff]

*cg_event14
@album chara=ミューズ f=event14 p1=hair p2=04
@album chara=ミューズ f=event14 p1=hair p2=05
@album chara=ミューズ f=event14 p1=hair p2=06
@album chara=ミューズ f=event14 p0=hair p2=02
@album chara=ミューズ f=event14 p0=hair p2=03
[albumoff]

*cg_event16
@eval exp='o.ミューズ.capturers[0] = m.ローパー'
@album chara=ミューズ f=event16 p0=hair p1=01 p2=hip p4=01 p8=01
@album chara=ミューズ f=event16 p0=hair p1=01 p2=hip p4=02 p8=01
@album chara=ミューズ f=event16 p0=hair p1=02 p2=hip p4=03 p8=03
@album chara=ミューズ f=event16 p0=hair p1=02 p2=hip p4=04 p8=02
@album chara=ミューズ f=event16 p0=hair p1=02 p3=hip p4=05 p8=03
@album chara=ミューズ f=event16 p0=hair p1=02 p4=04 p8=02
@album chara=ミューズ f=event16 p0=hair p1=03 p4=05 p8=03
@album chara=ミューズ f=event16 p0=hair p1=02 p4=03 p8=03
@album chara=ミューズ f=event16 p0=hair p1=02 p4=04 p7=01 p8=02
@album chara=ミューズ f=event16 p0=hair p1=02 p4=03 p7=02 p8=03
@eval exp='o.ミューズ.capturers[0] = m.マウンテンデビル'
@album chara=ミューズ f=event16 p0=hair p1=02 p4=04 p5=monster p8=02
@album chara=ミューズ f=event16 p0=hair p1=02 p4=03 p6=monster p8=03
@album chara=ミューズ f=event16 p0=hair p1=05 p4=03 p8=03
[albumoff]

*cg_event19
@album chara=ミューズ f=event19 p0=hair p1=01
@album chara=ミューズ f=event19 p0=hair p1=02
@album chara=ミューズ f=event19 p2=hair p3=01
@album chara=ミューズ f=event19 p2=hair p3=02
@album chara=ミューズ f=event19 p2=hair p3=03
[albumoff]

*cg_event35
@fg c=0022 index=900 b
@album chara=ミューズ f=event35 p0=hair p1=01 p2=03 p6=01 left=200 top=-20
@album chara=ミューズ f=event35 p3=hair p4=02 p5=04 p6=01 left=200 top=-30
@album chara=ミューズ f=event35 p0=hair p1=01 p2=04 p6=01 left=200 top=-20
@album chara=ミューズ f=event35 p0=hair p1=01 p2=05 p6=01 left=200 top=-20
@album chara=ミューズ f=event35 p3=hair p4=02 p5=04 p6=02 left=200 top=-40
@album chara=ミューズ f=event35 p0=hair p1=01 p2=04 p6=02 left=200 top=-20
@album chara=ミューズ f=event35 p3=hair p4=02 p5=04 p6=02 left=200 top=-50
@album chara=ミューズ f=event35 p3=hair p4=03 p5=02 p6=01 left=200 top=-20
[albumoff]

*cg_event38
@album chara=ミューズ f=event38 p0=hair p1=01 p2=04
@album chara=ミューズ f=event38 p0=hair p1=01 p2=02
@album chara=ミューズ f=event38 p0=hair p1=02 p2=04
@album chara=ミューズ f=event38 p0=hair p1=02 p2=03
@album chara=ミューズ f=event38 p0=hair p1=01 p2=03
[albumoff]

*cg_event41
@album chara=ミューズ f=event41 p0=hair p1=01 p2=hip p3=01
@album chara=ミューズ f=event41 p0=hair p1=01 p3=01
@album chara=ミューズ f=event41 p0=hair p1=02 p3=04
@album chara=ミューズ f=event41 p0=hair p1=03 p3=04
@album chara=ミューズ f=event41 p0=hair p1=03 p3=01
@album chara=ミューズ f=event41 p0=hair p1=03 p3=06
@album chara=ミューズ f=event41 p0=hair p1=04 p3=04
@album chara=ミューズ f=event41 p0=hair p1=05 p3=01
@album chara=ミューズ f=event41 p0=hair p1=05 p3=07
@album chara=ミューズ f=event41 p0=hair p1=06 p3=08
@album chara=ミューズ f=event41 p0=hair p1=07 p3=07
@album chara=ミューズ f=event41 p0=hair p1=07 p3=06
[albumoff]

*cg_event55
@album chara=ミューズ f=event55 p0=hair p1=01 p2=05
@album chara=ミューズ f=event55 p0=hair p1=02 p2=05
@album chara=ミューズ f=event55 p0=hair p1=03 p2=02
@album chara=ミューズ f=event55 p0=hair p1=04 p2=05
@album chara=ミューズ f=event55 p0=hair p1=05 p2=04
@album chara=ミューズ f=event55 p0=hair p1=05 p2=05
@album chara=ミューズ f=event55 p0=hair p1=04 p2=04
@album chara=ミューズ f=event55 p0=hair p1=06 p2=05
[albumoff]

*cg_event87
@eval exp='o.ミューズ.capturers[0] = m.ナイトインプ'
@album chara=ミューズ f=event87 p0=hair p1=monster p2=hip p7=01
@album chara=ミューズ f=event87 p0=hair p1=monster p2=hip p7=04
@album chara=ミューズ f=event87 p0=hair p1=monster p2=hip p7=03
@album chara=ミューズ f=event87 p0=hair p1=monster p7=03
@album chara=ミューズ f=event87 p0=hair p3=monster p7=01
@album chara=ミューズ f=event87 p0=hair p3=monster p7=02
@album chara=ミューズ f=event87 p0=hair p4=monster p7=01
@album chara=ミューズ f=event87 p0=hair p5=monster p7=03
@album chara=ミューズ f=event87 p0=hair p5=monster p7=04
@album chara=ミューズ f=event87 p0=hair p6=monster p7=01
[albumoff]

*cg_event79
@album chara=ミューズ f=event79 p3=hair p4=01 p5=02
@album chara=ミューズ f=event79 p3=hair p4=01 p5=01
@album chara=ミューズ f=event79 p3=hair p4=01 p5=02
@album chara=ミューズ f=event79 p0=hair p1=01 p2=02
@album chara=ミューズ f=event79 p0=hair p1=01 p2=01
@album chara=ミューズ f=event79 p0=hair p1=02 p2=02
[albumoff]

*cg_event99
@album f=event99 p1=02
@album chara=ミューズ f=event99 p0=hair p1=01
[albumoff]

*cg_event77
@album chara=マルエット f=event77 p0=hair p1=01
[albumoff]

*cg_event05
@eval exp='o.マルエット.capturers[0] = m.ナイトインプ'
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p4=hip p7=monster p16=01
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p4=hip p7=monster p10=monster p16=01
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p4=hip p7=monster p10=monster p16=02
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p4=hip p7=monster p9=monster p10=monster p16=04
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p5=hip p7=monster p9=monster p12=monster p16=05
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p5=hip p7=monster p9=monster p12=monster p16=06
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p6=hip p7=monster p9=monster p11=monster p16=08
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p7=monster p9=monster p16=03
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p8=monster p9=monster p16=08
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p8=monster p9=monster p12=monster p16=06
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p8=monster p9=monster p16=06
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p8=monster p13=monster p16=08
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p8=monster p14=monster p16=07
@album chara=マルエット f=event05 p0=hair p1=01 p2=arm p3=leg p8=monster p14=monster p16=06
@album chara=マルエット f=event05 p0=hair p1=02 p2=arm p3=leg p8=monster p15=monster p16=03
@album chara=マルエット f=event05 p0=hair p1=03 p2=arm p3=leg p8=monster p15=monster p16=03
@album chara=マルエット f=event05 p0=hair p1=04 p2=arm p3=leg p8=monster p16=06
[albumoff]

*cg_event30
@album f=event30 chara=マルエット p0=hair
[albumoff]

*cg_event24
@album chara=マルエット f=event24 p0=hair p1=01
[albumoff]

*cg_event44
@album chara=マルエット f=event44 p0=hair p1=01 p2=03
@album chara=マルエット f=event44 p0=hair p1=02 p2=08
@album chara=マルエット f=event44 p0=hair p1=03 p2=03
@album chara=マルエット f=event44 p0=hair p1=04 p2=01
@album chara=マルエット f=event44 p0=hair p1=05 p2=02
@album chara=マルエット f=event44 p0=hair p1=06 p2=02
@album chara=マルエット f=event44 p0=hair p1=07 p2=02
@album chara=マルエット f=event44 p0=hair p1=08 p2=06
@album chara=マルエット f=event44 p0=hair p1=11 p2=03
@album chara=マルエット f=event44 p0=hair p1=12 p2=07
@album chara=マルエット f=event44 p0=hair p1=13 p2=03
@album chara=マルエット f=event44 p0=hair p1=15 p2=02
@album chara=マルエット f=event44 p0=hair p1=16 p2=02
@album chara=マルエット f=event44 p0=hair p1=17 p2=02
@album chara=マルエット f=event44 p0=hair p1=18 p2=05
@album chara=マルエット f=event44 p0=hair p1=18 p2=04
[albumoff]

*cg_event72
@album chara=マルエット f=event72 p0=hair p1=01 p2=hip p5=02
@album chara=マルエット f=event72 p0=hair p1=01 p3=hip p4=01 p5=02
@album chara=マルエット f=event72 p0=hair p1=01 p3=hip p4=01 p5=05
@album chara=マルエット f=event72 p0=hair p1=02 p2=hip p5=01
@album chara=マルエット f=event72 p0=hair p1=02 p5=01
@album chara=マルエット f=event72 p0=hair p1=03 p5=06
@album chara=マルエット f=event72 p0=hair p1=04 p5=04
@album chara=マルエット f=event72 p0=hair p1=05 p5=04
@album chara=マルエット f=event72 p0=hair p1=06 p5=05
[albumoff]

*cg_event74
@album chara=マルエット f=event74 p0=hair p1=01 p2=01
@album chara=マルエット f=event74 p0=hair p1=02 p2=01
@album chara=マルエット f=event74 p0=hair p1=03 p2=04
@album chara=マルエット f=event74 p0=hair p1=03 p2=06
@album chara=マルエット f=event74 p0=hair p1=04 p2=04
@album chara=マルエット f=event74 p0=hair p1=05 p2=05
[albumoff]

*cg_event62
@album chara=マルエット f=event62 p0=hair p1=01 p2=01
@album chara=マルエット f=event62 p0=hair p1=02 p2=03
@album chara=マルエット f=event62 p0=hair p1=03 p2=03
@album chara=マルエット f=event62 p0=hair p1=04 p2=03
@album chara=マルエット f=event62 p0=hair p1=05 p2=01
@album chara=マルエット f=event62 p0=hair p1=04 p2=01
[albumoff]

*cg_event63
@album chara=マルエット f=event63 p0=hair p1=01 p2=03
@album chara=マルエット f=event63 p0=hair p1=01 p2=02
@album chara=マルエット f=event63 p0=hair p1=03 p2=01
@album chara=マルエット f=event63 p0=hair p1=03 p2=04
@album chara=マルエット f=event63 p0=hair p1=02 p2=05
@album chara=マルエット f=event63 p0=hair p1=03 p2=02
@album chara=マルエット f=event63 p0=hair p1=04 p2=04
@album chara=マルエット f=event63 p0=hair p1=04 p2=05
@album chara=マルエット f=event63 p0=hair p1=05 p2=05
@album chara=マルエット f=event63 p0=hair p1=06 p2=06

@album chara=マルエット f=event63 p0=hair p1=07 p2=05
@album chara=マルエット f=event63 p0=hair p1=07 p2=03
@album chara=マルエット f=event63 p0=hair p1=07 p2=04
@album chara=マルエット f=event63 p0=hair p1=07 p2=02
@album chara=マルエット f=event63 p0=hair p1=07 p2=01
@album chara=マルエット f=event63 p0=hair p1=08 p2=04
@album chara=マルエット f=event63 p0=hair p1=06 p2=05
@album chara=マルエット f=event63 p0=hair p1=08 p2=02
@album chara=マルエット f=event63 p0=hair p1=08 p2=01
@album chara=マルエット f=event63 p0=hair p1=06 p2=04
@album chara=マルエット f=event63 p0=hair p1=06 p2=03
[albumoff]

*cg_event64
@album chara=マルエット f=event64 p0=hair p1=01 p2=03
@album chara=マルエット f=event64 p0=hair p1=01 p2=04
@album chara=マルエット f=event64 p0=hair p1=02 p2=05
@album chara=マルエット f=event64 p0=hair p1=02 p2=04
@album chara=マルエット f=event64 p0=hair p1=02 p2=02
@album chara=マルエット f=event64 p0=hair p1=03 p2=02
[albumoff]

*cg_event75
@album chara=マルエット f=event75 p0=hair p1=01 p2=04
@album chara=マルエット f=event75 p0=hair p1=01 p2=01
[albumoff]

*cg_event53
@album chara=マルエット f=event53 p0=hair p1=01 p2=04
@album chara=マルエット f=event53 p0=hair p1=01 p2=02
@album chara=マルエット f=event53 p0=hair p1=01 p2=05
@album chara=マルエット f=event53 p0=hair p1=01 p2=01
@album chara=マルエット f=event53 p0=hair p1=02 p2=01
@album chara=マルエット f=event53 p0=hair p1=02 p2=04
[albumoff]

*cg_event54
@album chara=マルエット f=event54 p0=hair p1=01 p2=01
@album chara=マルエット f=event54 p0=hair p1=02 p2=02
@album chara=マルエット f=event54 p0=hair p1=02 p2=01
@album chara=マルエット f=event54 p0=hair p1=02 p2=03
@album chara=マルエット f=event54 p0=hair p1=01 p2=05
@album chara=マルエット f=event54 p0=hair p1=03 p2=02
@album chara=マルエット f=event54 p0=hair p1=04 p2=01
@album chara=マルエット f=event54 p0=hair p1=04 p2=03
@album chara=マルエット f=event54 p0=hair p1=05 p2=05
@album chara=マルエット f=event54 p0=hair p1=04 p2=02
@album chara=マルエット f=event54 p0=hair p1=05 p2=02
[albumoff]

*cg_event80
@album chara=マルエット f=event80 p0=hair p1=01 p2=02
@album chara=マルエット f=event80 p0=hair p1=02 p2=02
@album chara=マルエット f=event80 p0=hair p1=02 p2=04
@album chara=マルエット f=event80 p3=hair p4=01 p5=04
@album chara=マルエット f=event80 p3=hair p4=01 p5=01
@album chara=マルエット f=event80 p3=hair p4=01 p5=04
@album chara=マルエット f=event80 p3=hair p4=01 p5=03
@album chara=マルエット f=event80 p3=hair p4=01 p5=06
[albumoff]

*cg_event84
@eval exp='o.マルエット.capturers[0] = m.ローパー'
@album chara=マルエット f=event84 p0=hair p3=01 p4=hip p7=06
@album chara=マルエット f=event84 p0=hair p3=01 p4=hip p7=04
@album chara=マルエット f=event84 p0=hair p3=01 p7=02
@album chara=マルエット f=event84 p0=hair p3=03 p7=07
@album chara=マルエット f=event84 p0=hair p3=04 p7=08
@album chara=マルエット f=event84 p0=hair p3=04 p7=07
@album chara=マルエット f=event84 p0=hair p3=04 p7=09
@album chara=マルエット f=event84 p0=hair p3=02 p7=02
@album chara=マルエット f=event84 p0=hair p3=05 p7=02
@album chara=マルエット f=event84 p0=hair p3=06 p7=07
@album chara=マルエット f=event84 p0=hair p3=06 p7=09
@album chara=マルエット f=event84 p0=hair p3=07 p7=02
@eval exp='o.マルエット.capturers[0] = m.マウンテンデビル'
@album chara=マルエット f=event84 p1=hair p5=monster p7=02
@album chara=マルエット f=event84 p2=hair p6=monster p7=07
@album chara=マルエット f=event84 p2=hair p6=monster p7=09
@album chara=マルエット f=event84 p2=hair p6=monster p7=08
[albumoff]

*cg_event45
@eval exp='o.リーゼル.capturers[0] = m.トロール'
@album chara=リーゼル f=event45 p0=hair p1=monster p2=01 p3=hip p8=01
@album chara=リーゼル f=event45 p0=hair p1=monster p2=01 p3=hip p8=02
@album chara=リーゼル f=event45 p0=hair p1=monster p2=02 p3=hip p4=monster p8=05
@album chara=リーゼル f=event45 p0=hair p1=monster p2=02 p3=hip p4=monster p8=06
@album chara=リーゼル f=event45 p0=hair p1=monster p2=01 p3=hip p8=06
@album chara=リーゼル f=event45 p0=hair p1=monster p2=01 p8=06
@album chara=リーゼル f=event45 p0=hair p1=monster p2=01 p8=02
@album chara=リーゼル f=event45 p0=hair p1=monster p2=01 p5=monster p8=02
@album chara=リーゼル f=event45 p0=hair p1=monster p2=01 p5=monster p8=04
@album chara=リーゼル f=event45 p0=hair p1=monster p2=01 p6=monster p8=02
@album chara=リーゼル f=event45 p0=hair p1=monster p2=03 p7=monster p8=05
@album chara=リーゼル f=event45 p0=hair p1=monster p2=04 p8=07
[albumoff]

*cg_event46
@album f=event46_p0_01
@album f=event46_p0_02
[albumoff]

*cg_event01
@album f=event01 p0=01 p1=02
@album f=event01 p2=01 p3=06
@album f=event01 p2=02 p3=05
@album f=event01 p4=02 p5=02
@album f=event01 p4=03 p5=01
@album f=event01 p0=02 p1=02
@album f=event01 p0=03 p1=04
@album f=event01 p0=03 p1=02
@album f=event01 p0=04 p1=06
@album f=event01 p0=04 p1=04
@album f=event01 p0=05 p1=04
@album f=event01 p0=06 p1=06
@album f=event01 p0=08 p1=05
@album f=event01 p0=07 p1=05
@album f=event01 p0=08 p1=04
@album f=event01 p0=07 p1=04
@album f=event01 p0=06 p1=04
@album f=event01 p0=09 p1=02
@album f=event01 p0=10 p1=07
@album f=event01 p4=09 p5=02
@album f=event01 p4=06 p5=01
@album f=event01 p4=07 p5=01
@album f=event01 p4=08 p5=01
@album f=event01 p0=10 p1=02
[albumoff]

*cg_event66
@album f=event66 p0=01 p1=02
@album f=event66 p0=01 p1=01
@album f=event66 p0=02 p1=02
[albumoff]

*cg_event67
@album f=event67 p0=01 p1=09
@album f=event67 p0=01 p1=06
@album f=event67 p0=01 p1=01
@album f=event67 p0=02 p1=01
@album f=event67 p0=02 p1=05
@album f=event67 p0=02 p1=06
@album f=event67 p0=02 p1=07
@album f=event67 p0=03 p1=06
@album f=event67 p0=03 p1=02
@album f=event67 p0=03 p1=08
[albumoff]

*cg_event68
@album f=event68 p0=01
@album f=event68 p0=02
@album f=event68 p0=04
@album f=event68 p0=03
[albumoff]

*cg_event69
@album f=event69 p0=02 p1=02
@album f=event69 p0=02 p1=01
@album f=event69 p0=03 p1=02
[albumoff]

*cg_event70
@album f=event70 p0=01 p1=04
@album f=event70 p0=02 p1=04
@album f=event70 p0=02 p1=01
@album f=event70 p0=02 p1=05
@album f=event70 p0=02 p1=02
@album f=event70 p0=01 p1=06
@album f=event70 p0=03 p1=06
@album f=event70 p0=03 p1=05
[albumoff]

*cg_event71
@album f=event71 p0=01 p1=01 p2=01
@album f=event71 p0=01 p1=01 p2=03
@album f=event71 p0=02 p1=05 p2=02
@album f=event71 p0=02 p1=05 p2=03
@album f=event71 p0=03 p1=04 p2=02
@album f=event71 p0=03 p1=05 p2=02
@album f=event71 p0=03 p1=05 p2=05
@album f=event71 p0=04 p1=05 p2=05
@album f=event71 p0=05 p1=04 p2=01
[albumoff]

*cg_event81
@album chara=リーゼル f=event81 p0=hair p1=01 p2=01
@album chara=リーゼル f=event81 p0=hair p1=02 p2=01
@album chara=リーゼル f=event81 p0=hair p1=02 p2=04
@album chara=リーゼル f=event81 p0=hair p1=03 p2=05
@album chara=リーゼル f=event81 p0=hair p1=03 p2=04
@album chara=リーゼル f=event81 p0=hair p1=03 p2=01
[albumoff]

*cg_event82
@eval exp='o.リーゼル.capturers[0] = m.オークキング'
@album chara=リーゼル f=event82 p0=hair p1=monster p2=hip p6=01
@album chara=リーゼル f=event82 p0=hair p1=monster p2=hip p6=02
@album chara=リーゼル f=event82 p0=hair p1=monster p6=03
@album chara=リーゼル f=event82 p0=hair p1=monster p6=01
@album chara=リーゼル f=event82 p0=hair p3=monster p6=03
@album chara=リーゼル f=event82 p0=hair p3=monster p6=04
@album chara=リーゼル f=event82 p0=hair p4=monster p6=03
@album chara=リーゼル f=event82 p0=hair p5=monster p6=04
@album chara=リーゼル f=event82 p0=hair p5=monster p6=05
[albumoff]

*cg_event83
@eval exp='o.リーゼル.capturers[0] = m.ローパー'
@album chara=リーゼル f=event83 p0=hair p1=01 p2=hip p5=01
@album chara=リーゼル f=event83 p0=hair p1=01 p2=hip p5=04
@album chara=リーゼル f=event83 p0=hair p1=02 p2=hip p5=01
@album chara=リーゼル f=event83 p0=hair p1=03 p5=01
@album chara=リーゼル f=event83 p0=hair p1=03 p5=03
@album chara=リーゼル f=event83 p0=hair p1=01 p5=04
@album chara=リーゼル f=event83 p0=hair p1=04 p5=04
@album chara=リーゼル f=event83 p0=hair p1=05 p5=03
@album chara=リーゼル f=event83 p0=hair p1=05 p5=04
@album chara=リーゼル f=event83 p0=hair p1=06 p5=02
@eval exp='o.リーゼル.capturers[0] = m.マウンテンデビル'
@album chara=リーゼル f=event83 p0=hair p3=monster p5=04
@album chara=リーゼル f=event83 p0=hair p4=monster p5=03
@album chara=リーゼル f=event83 p0=hair p4=monster p5=04
[albumoff]

*cg_event95
@album f=event95 p0=01 p1=02
@album f=event95 p0=01 p1=01
@album f=event95 p0=02 p1=02
[albumoff]

*cg_event100
@album f=event100 p0=02
@album f=event100 p0=01
@album f=event100 p0=03
@album f=event100 p0=04
[albumoff]

*cg_event96
@album f=event96 p0=01 p1=02
@album f=event96 p0=01 p1=04
@album f=event96 p0=01 p1=05
@album f=event96 p0=01 p1=03
[albumoff]

*cg_event97
@album f=event97 p0=01 p1=05
@album f=event97 p0=01 p1=01
@album f=event97 p0=02 p1=05
@album f=event97 p0=02 p1=02
[albumoff]

*cg_event98
@album f=event98 p0=01 p1=05
@album f=event98 p0=01 p1=06
@album f=event98 p0=01 p1=02
@album f=event98 p0=02 p1=01
@album f=event98 p0=02 p1=05
[albumoff]

*cg_event06
@album f=event06 p0=02
@album f=event06 p0=01
@album f=event06 p0=05 p1=02 p2=01
@album f=event06 p0=03 p1=03 p2=01
@album f=event06 p0=04 p1=01 p2=01
@album f=event06 p0=03 p1=02 p2=01
[albumoff]

*cg_event28
@album f=event28 p0=01 p1=01
@album f=event28 p0=01 p1=01 p2=01
@album f=event28 p0=02 p1=01
@album f=event28 p0=03 p1=02
@album f=event28 p0=04 p1=02
@album f=event28 p0=06
@album f=event28 p0=05 p1=02
[albumoff]

*cg_event32
@album f=event32 p0=01
@album f=event32 p0=02
@album f=event32 p0=03
[albumoff]

*cg_event59
@album f=event59 p2=01 p3=01 p4=01
@album f=event59 p2=01 p3=02 p4=01
@album f=event59 p2=01 p3=02 p4=02
@album f=event59 p2=01 p3=02 p4=03
@album f=event59 p2=02 p4=02
@album f=event59 p0=01 p1=03
@album f=event59 p0=01 p1=01
@album f=event59 p0=03 p1=04
@album f=event59 p0=03 p1=03
@album f=event59 p0=02 p1=04
@album f=event59 p0=04 p1=04
[albumoff]

*cg_event33
@album f=event33 p0=01 p1=03
@album f=event33 p0=01 p1=04
@album f=event33 p0=01 p1=01
@album f=event33 p0=02
@album f=event33 p0=03
@album f=event33 p0=04 p1=04
@album f=event33 p0=05 p1=04
[albumoff]

*cg_event60
@album f=event60 p4=01 p5=01
@album f=event60 p4=01 p5=02
@album f=event60 p2=01 p3=04
@album f=event60 p2=02 p3=03
@album f=event60 p2=01 p3=01
@album f=event60 p2=03 p3=01
@album f=event60 p0=01 p1=01
@album f=event60 p0=02 p1=03
@album f=event60 p0=02 p1=01
@album f=event60 p0=02 p1=04
@album f=event60 p0=03 p1=03
@album f=event60 p0=03 p1=01
@album f=event60 p0=04 p1=01
[albumoff]

*cg_event57
@album f=event57 p0=09 p1=05
@album f=event57 p0=10
@album f=event57 p0=09 p1=06
@album f=event57 p0=11
@album f=event57 p0=01 p1=01 p2=01
@album f=event57 p0=01 p1=02 p2=01
@album f=event57 p0=01 p1=02 p2=02
@album f=event57 p0=02 p1=02
@album f=event57 p0=03 p1=03 p2=03
@album f=event57 p0=03 p1=04 p2=04
@album f=event57 p0=04 p3=01
@album f=event57 p0=04 p3=02
@album f=event57 p0=04 p3=03
@album f=event57 p0=06 p3=03
@album f=event57 p0=07 p3=03
@album f=event57 p0=08 p3=04
[albumoff]

*cg_event29
@album f=event28 p0=07 p1=01
@album f=event28 p0=07 p1=02
@album f=event29 p0=01
@album f=event29 p0=04
@album f=event29 p0=02
@album f=event29 p0=05
@album f=event29 p0=03
@album f=event29 p0=06
@album f=event29 p0=07
[albumoff]

*cg_event58
@album f=event58 p0=06 p1=03 p2=01
@album f=event58 p0=06 p1=03 p2=02
@album f=event58 p0=06 p1=04 p2=02
@album f=event58 p0=06 p1=04 p2=03
@album f=event58 p0=01 p1=01
@album f=event58 p0=02 p1=01
@album f=event58 p0=03 p1=02
@album f=event58 p0=04 p1=02
@album f=event58 p0=05 p1=02
[albumoff]

*cg_event18
@album f=event18 p0=01
@album f=event18 p0=02
[albumoff]

*cg_event102
@album f=event102 p0=02
@album f=event102 p0=01
[albumoff]

*cg_event103
@album f=event103
[albumoff]

*cg_event104
@album f=event104 p0=01
@album f=event104 p0=02
@album f=event104 p0=03
[albumoff]

*cg_event90
@album f=event90
[albumoff]

*cg_event91
@album f=event91
[albumoff]

*cg_event92
@album f=event92
[albumoff]

*cg_event93
@album f=event93
[albumoff]

*cg_event94
@album f=event94
[albumoff]




;■プレイ記録閲覧

*view_last_record

[if exp='sf.lastGameScore === void']
	@eval exp='System.inform("System data is corrupted", "Warning")'
	@return
[endif]

@eval exp='game.rightClickEnabled = false'
@image layer=0 storage=back_record visible=true
@current layer=message1 page=fore
@position frame="" opacity=0 width=1024 height=768 left=0 top=0 marginl=0 margint=0 marginr=0 marginb=0 visible=true
@font face="MS PGothic" size=24 color=0x4B4545 edge=false bold=true
@eval exp='tf.x = 600, tf.y = 322, tf.num = 40'
[nowait]
[locate x=&'tf.x + 0' y=&'tf.y += tf.num'][emb exp='sf.lastGameScore.time']
[locate x=&'tf.x + 0' y=&'tf.y += tf.num'][emb exp='"%9d".sprintf(sf.lastGameScore.battle)']
[locate x=&'tf.x + 0' y=&'tf.y += tf.num'][emb exp='"%9d".sprintf(sf.lastGameScore.win)']
[locate x=&'tf.x + 0' y=&'tf.y += tf.num'][emb exp='"%9d".sprintf(sf.lastGameScore.monster)']
[locate x=&'tf.x + 0' y=&'tf.y += tf.num'][emb exp='"%9d".sprintf(sf.lastGameScore.hyper)']
@wait time=500
[endnowait][c]
@eval exp='game.rightClickEnabled = true'
@return



;■アイテム・モンスターの閲覧情報

*weapons_list
@eval exp='game.collectionList = []'
@exhibit name=短剣 displayname=Dagger col=4 row=2 base=50 item=ダガー,良い短剣,悪い短剣,盗賊の短刀,スティレット,メイジマッシャー,破魔の短剣,アサシンダガー
@exhibit name=小剣 displayname=Shortsword col=5 row=1 base=100 item=ショートソード,グラディウス,カトラス,氷の牙,疾風の剣
@exhibit name=長剣 displayname=Longsword col=8 row=1 base=80 item=ロングソード,サーベル,フレイムソード,シャムシール,ファルシオン,悪のサーベル,魔王の剣,ウィローブレード
@exhibit name=大剣 displayname=Greatsword col=8 row=1 base=30 item=クレイモア,グレートソード,フランベルジュ,ムーンブレイド,エクスカリバー,エクスガリバー,ドラゴンスレイヤー,退魔の剣
@exhibit name=斧 displayname=Axe col=5 row=3 item=トマホーク,ハンドアックス,,,,,,,,,いかずちの斧,バトルアックス,グレートアックス,ミノタウロスの斧,死の大斧
@exhibit name=槍 displayname=Spear col=8 row=1 item=木の槍,ジャベリン,鉄の槍,パルチザン,トライデント,グレイブ,聖なる槍,ハルバード
@exhibit name=ハンマー displayname=Hammer col=4 row=2 item=ハンマー,,,,バトルハンマー,スレッジハンマー,ウォーハンマー,大地の槌
@exhibit name=棍棒 displayname=Club col=7 row=1 base=100 item=たいまつ,棍棒,スパイククラブ,メイス,鮮血のメイス,粉砕のメイス,聖なるメイス
@exhibit name=鞭・鎖 displayname=Flail col=8 row=1 base=120 item=フレイル,モーニングスター,聖者のフレイル,革のムチ,鎖のムチ,輝く鎖のムチ,調教師のムチ,吸血のムチ
@exhibit name=格闘 displayname=Specialist col=7 row=4 item=,,,,,トンファー,,,,,,,ゴールドトンファー,,,,,,,,,長い棒,鉄の棒,達人の棒,神秘の棒,ツインロッド,トリプルロッド
@exhibit name=投擲 displayname=Throwing col=3 row=2 base=50 item=スリング,ブーメラン,銅のチャクラム,パワースリング,鉄のブーメラン,鋼のチャクラム
@exhibit name=短弓 displayname=Shortbow col=4 row=1 base=80 item=ショートボウ,コンポジットボウ,魔法使いの弓,腐った弓
@exhibit name=長弓 displayname=Longbow col=6 row=1 base=30 item=ロングボウ,エルフの弓,グレートボウ,マジカルボウ,森の精の弓,邪悪な弓
@exhibit name=小杖 displayname=Wand col=7 row=1 base=30 item=木の杖,いやしの杖,ドクロの杖,炎のロッド,アイスロッド,サンダーロッド,スターロッド
@exhibit name=杖 displayname=Staff col=6 row=1 item=固い杖,魔導士の杖,聖なる杖,沈黙の杖,アルテミスの杖,ねじれた杖
@exhibit name=楽器 displayname=Instrument col=4 row=3 base=20 item=火花のマラカス,氷結の鈴,聖なるハンドベル,,元気のタンバリン,雷のドラム,戦いの銅鑼,大地のドラム,眠りのハープ,狂気のハープ,いやしの竪琴,天使の竪琴
@return

*armors_list
@eval exp='game.collectionList = []'
@exhibit name=ローブ displayname="Green Robe" col=3 row=3 item=ローブ,深紅のローブ,聖なるローブ,呪いのローブ,ノームのローブ,女神のドレス,巫女の衣装,妖艶妻のシルク
@exhibit name=布の服 displayname=Tunic col=2 row=5 base=60 item=,,布の服,身かわしの服,町娘の服,エルフの服,ドワーフ民族衣装,シルフのドレス,マタニティドレス,寝室のキャミソール
@exhibit name=ボディスーツ displayname=Leotard col=2 row=5 base=-10 item=レオタード,ドルフィンスーツ,怪盗のレオタード,暗殺者のかたびら,黒のボンデージ,服従の調教服,レジストスーツ
@exhibit name=ボトム displayname=Lower col=2 row=5 base=-20 item=布のズボン,布のスカート,革のズボン,革のスカート,奴隷の前掛け,魔女のスカート,ミニスカート,聖なるミニ
@exhibit name=革鎧 displayname="Leather Armor" col=4 row=1 base=150 item=革鎧,硬い革鎧,豪華な革鎧,腐った革鎧
@exhibit name=鎖かたびら displayname=Chainmail col=4 row=1 base=100 item=鎖かたびら,錆びた鎖かたびら,輝く鎖かたびら,魔法の鎖かたびら
@exhibit name=うろこ鎧 displayname=Scalemail col=3 row=2 base=50 item=スケイルメイル・上,シルバースケイル・上,ドラゴンの鎧・上,スケイルメイル・下,シルバースケイル・下,ドラゴンの鎧・下
@exhibit name=胸当て displayname=Breastplate col=4 row=1 base=150 item=胸当て,中立の胸当て,黄金の胸当て,聖なる胸当て
@exhibit name=プレートメイル displayname=Platemail col=3 row=5 base=50 item=,,,,,,プレートメイル・上,聖騎士の鎧・上,英雄の鎧・上,,,,プレートメイル・下,聖騎士の鎧・下,英雄の鎧・下
@exhibit name=ビキニ鎧 displayname="Bikini Armor" col=4 row=3 base=5 item=ライトアーマー・上,ライトアーマー・下,女傑の鎧・上,女傑の鎧・下,背徳の鎧・上,背徳の鎧・下,戦女神の鎧・上,戦女神の鎧・下,アマゾネスの鎧・上,アマゾネスの鎧・下,奴隷の鎧・上,奴隷の鎧・下
@exhibit name=水着 displayname=Swimwear col=4 row=4 base=40 item=青いビキニ・上,青いビキニ・下,,,魔女のビキニ・上,魔女のビキニ・下,安物のビキニ・上,安物のビキニ・下,革のビキニ・上,革のビキニ・下,人魚のブラ,人魚のパンツ,クラムトップス,クラムボトムズ,マーマンズシェル,シャークパンツ
@exhibit name=下着 displayname=Underwear col=4 row=6 base=30 item=,,,,トランクス,鋼鉄の貞操帯,,,白いブラ,白いパンツ,冒険者のブラ,冒険者のパンツ,ピンクのブラ,ピンクのパンツ,縞のブラ,縞のパンツ,粗末なブラ,粗末なパンツ,赤いブラ,赤いパンツ,黒いブラ,黒いパンツ,ひものブラ,ひものパンツ
@exhibit name=小盾 displayname=Buckler col=4 row=1 base=180 item=バックラー,ブロンズバックラー,ゴールドバックラー,スレイブバックラー
@exhibit name=盾 displayname=Shield col=3 row=2 base=10 item=うろこの盾,支えの盾,魔法の盾,ドラゴンシールド,善の盾,悪魔の盾
@exhibit name=丸盾 displayname="Round Shield" col=5 row=2 base=20 item=,,木の盾,,,,アイアンシールド,,鏡の盾
@exhibit name=大盾 displayname="Tower Shield" col=2 row=1 base=50 item=オーガの盾,タワーシールド
@exhibit name=手袋・　小手 displayname=Gloves col=4 row=2 base=50 item=革の手袋,聖なる手袋,盗賊の手袋,,鉄の小手,銀の小手,錆びた小手,達人の小手
@exhibit name=くつ displayname=Shoes col=4 row=2 base=40 item=革のブーツ,レンジャーブーツ,サンダル,聖なるサンダル,隠密のブーツ,鉄のブーツ,銀のブーツ,ブラックブーツ
@exhibit name=その他 displayname=Other col=3 row=4 base=-10 item=踊り子の服・上,踊り子の服・下,貝のネックレス,魔法のニップレス,天使のはごろも,,魔法の前貼り,バスタオル,魔法の革ひも
@return

*items_list
@eval exp='game.collectionList = []'
@exhibit name=材料 displayname=Material col=3 row=3 base=-10 item=魔法の砂,ミスリルの砂,オリハルコンの砂,ポラリスの宝珠,アウラの宝珠,アダマンタイト鉱石
@exhibit name=食べ物・草・粉 displayname=Misc col=4 row=4 base=0 item=ふっくらパン,はちみつパン,りんご,青りんご,チーズ,カマンベール,気付けの花,毒消しの花,復活の粉,フェロモンの粉,行動力増加袋
@exhibit name=薬 displayname=Medicine col=6 row=4 base=0 item=ポーション,ハイポーション,エーテル,ハイエーテル,眠気ざまし,強力眠気ざまし,麻痺治療薬,石化解除薬,特効薬,精力剤,男の秘薬,女の秘薬,武芸の秘薬,知恵の秘薬,信仰心の秘薬,生命力の秘薬,敏捷性の秘薬,運の秘薬
@exhibit name=巻物 displayname=Scroll1 col=4 row=5 base=-20 item=マインドリードの巻物,スリープの巻物,フリーズの巻物,ファイアリングの巻物,ウィザードアイの巻物,ブリザードの巻物,サンダーバーストの巻物,レビテイトの巻物,イレースマジックの巻物,アクセラレートの巻物,ファイアストームの巻物,アイスブラストの巻物,アースクエイクの巻物,インフェルノの巻物,ワープの巻物,メイルシュトロームの巻物
@exhibit name=巻物 displayname=Scroll2 col=4 row=4 base=-20 item=ライトボールの巻物,サイレンスの巻物,マジックバリアの巻物,プロテクションの巻物,パワーガードの巻物,マルチヒールの巻物,ライトストリームの巻物,ターンデビルの巻物,デスクラウドの巻物,リターンの巻物,グランドヒールの巻物,ディバインレイの巻物
@exhibit name=巻物 displayname=Scroll3 col=4 row=5 base=-20 item=修理の巻物,鑑定の巻物,解呪の巻物,解呪の巻物・改,アシッドの巻物,メタルバレットの巻物,ジャンプの巻物,クイックの巻物,マジックウェポンの巻物,ミサイルシールドの巻物,ミスティックアイの巻物,メタルストームの巻物,ミラーウォールの巻物,アンロックの巻物,マジカルボートの巻物,スターバーストの巻物
@exhibit name=魔法書 displayname=Spellbook1 col=5 row=3 base=10 item=スリープの魔法書,スカウトの魔法書,ウィザードアイの魔法書,ファイアリングの魔法書,ブリザードの魔法書,ミラーウォールの魔法書,レビテイトの魔法書,マインドリードの魔法書,サンダーバーストの魔法書,ファイアストームの魔法書,アイスブラストの魔法書,メイルシュトロームの魔法書,ワープの魔法書,デモニックフレアの魔法書,コールポラリスの魔法書
@exhibit name=魔法書 displayname=Spellbook2 col=5 row=3 base=10 item=サイレンスの魔法書,トーチの魔法書,マジックバリアの魔法書,キュアパラライズの魔法書,パワーヒールの魔法書,キュアポイズンの魔法書,エクストラヒールの魔法書,パワーガードの魔法書,マルチヒールの魔法書,レイズデッドの魔法書,ライトストリームの魔法書,リカバリーの魔法書,リターンの魔法書,レザレクションの魔法書,コールアウラの魔法書
@exhibit name=魔法書 displayname=Spellbook3 col=5 row=3 base=10 item=ジャンプの魔法書,ディテクトの魔法書,スパークの魔法書,イレースマジックの魔法書,ミサイルシールドの魔法書,アナライズの魔法書,ミスティックアイの魔法書,マジックウェポンの魔法書,マジカルボートの魔法書,リムーブカースの魔法書,アンロックの魔法書,アシッドバーストの魔法書,マルチエイドの魔法書,リペアの魔法書,スターバーストの魔法書
@exhibit name=カギ displayname=Key col=5 row=5 base=-20 item=銀の鍵,金の鍵,看守の鍵,鉱山の鍵,王の鍵,吸血鬼の鍵,地下の町の鍵,ワイルド・ブルの鍵,教団の鍵,水門の鍵,倉庫の鍵,ハートの鍵,クリスタルの鍵,,魔法の錠前,こじあけの鍵,宝箱の鍵,貞操帯の鍵,牢屋の鍵
@exhibit name=リング displayname=Ring col=5 row=5 base=20 item=鉄の指輪,パールリング,ブラックパール,シルバーリング,ゴールドリング,覚醒の指輪,精神の指輪,清浄の指輪,破邪の指輪,魔術師の指輪,火の精霊の指輪,氷の精霊の指輪,回復の指輪,沈黙の指輪,死の指輪,堕天使の指輪,さびついた指輪,,,,守りの腕輪,結界の腕輪,師範の腕輪,水の腕輪,パワーブレスレット
@exhibit name=装飾品 displayname=Accessory col=5 row=3 base=-10 item=銀のアンク,金のアンク,闇のネックレス,天使のはね,貝のお守り,統率者のメダル,学びのメダル,加護のメダル,強者のメダル
@exhibit name=魔石 displayname="Magic Stone" col=5 row=4 base=0 item=ガーネットの魔石,アメジストの魔石,アクアマリンの魔石,ダイアモンドの魔石,エメラルドの魔石,ムーンストーンの魔石,ルビーの魔石,ペリドットの魔石,サファイアの魔石,オパールの魔石,トパーズの魔石,ラピスラズリの魔石,オブシダンの魔石
@exhibit name=道具 displayname=Tool col=4 row=5 base=30 item=,,,,魔法の浮き橋,ボム,ハイパーボム,,時のスイッチ,取消しスイッチ,精霊の縫い糸,,,,,,召喚びん,大きな召喚びん,けむり玉,マジックラダー
@exhibit name=カード displayname=Card col=5 row=5 base=-20 item=温泉チケット,５連泊券,１０連泊券,召喚の札,入館証,信徒の称号・月,信徒の称号・星,信徒の称号・雲,信徒の称号・海,信徒の称号・太陽,スターカード・剣,スターカード・盾,スターカード・杖,スターカード・十字架,スターカード・帽子,スターカード・蝶,スターカード・魔法陣,スターカード・杯,スターカード・林檎,スターカード・髑髏
@exhibit name=職業の書 displayname=Manuals col=3 row=5 base=-20 item=初級の書,中級の書,召喚士の書,吟遊詩人の書,ドルイドの書,バルキリーの書,ソーサラーの書,モンクの書,曲刀兵の書,ロードの書,アサシンの書
@exhibit name=手紙 displayname=Letter col=3 row=4 base=-10 item=ギルドへの紹介状,入城許可証,精霊の台座のメモ,ジャンの手紙,カルロスの手紙,ムニョスの手紙,朽ち果てた手記,とある冒険者のメモ,魔導士ラニガンの手紙
@exhibit name=その他 displayname=Other1 col=4 row=5 base=50 item=,,,,精霊の石,千里の鏡,氷竜の心臓,,金のヘッドバンド,マッドウイングの羽,フェニックスの羽,くい,砂の水晶,黄金のリンゴ,,,赤いネックレス,黄金の短剣,つるはし,命の聖杯
@exhibit name=その他 displayname=Other2 col=3 row=6 base=20 item=,,,悪魔の彫像,蛇の彫像,,,,銀のユニコーン,トカゲの彫像,スライムの彫像,,,,,ネズミの彫像,金のフェアリー,黄金の人魚像
@exhibit name=その他 displayname=Other3 col=5 row=4 base=0 item=エレメントプレート・土,エレメントプレート・水,エレメントプレート・火,エレメントプレート・風,小さなボタン,ドライアドの霊薬,ロイヤルゼリー,ワームの毒液,,,リーゼルの髪飾り,ピンクの髪留め,教団のバッジ,古代語の辞書,モンスター図鑑
@return

*monstersList
@eval exp='game.collectionList = []'
@exhibit name=魔法　　生物 displayname=Magical monster=スライム,ポイズンスライム,レッドスライム,ブルースライム,ブラックスライム,マジカルスライム,ゴーストスライム,ジャンボスライム,グレートスライム,ローパー,ハイパーローパー,アネモネ,マンイーター,ゴーレム,メタルゴーレム,ストーンゴーレム,ゴールドマン,ミスリルゴーレム
@exhibit name=動物 displayname=Animal monster=大ねずみ,バンパイアラット,ボーパルハムスター,電気ねずみ,ジャイアントバット,モンストラスバット,バンパイアバット,ユニコーン,クラーケン
@exhibit name=爬虫類 displayname=Reptile monster=大トカゲ,毒トカゲ,サラマンダー,バジリスク,巨大ヘビ,猛毒ヘビ,海ヘビ,デザートバイパー,シーサーペント
@exhibit name=虫 displayname=Insect monster=巨大ぐも,猛毒ぐも,砂ぐも,ブラックウィドウ,クイーンスパイダー,殺人バチ,人食いバチ,ロイヤルホーネット,砂漠の主
@exhibit name=戦士 displayname=Fighter monster=バンディット,パイレーツ,キャプテン,バルキリー,チャンピオン,マスターランサー,エンジェルナイト,ブレイズマン,グラディエイター,ソードダンサー,デュエリスト,囚人,バーバリアン,トログロダイト,シュバルツ,ブルー,アレックス,ルーファス
@exhibit name=僧侶 displayname=Priest monster=アコライト,クレリック,ハイプリースト,アークプリースト,ディサイプル,教祖,ポラリス
@exhibit name=魔法　　使い displayname=Mage monster=ウィッチ,ウォーロック,ミスティック,アークメイジ,メイガス,アルケミスト,ネクロマンサー,ダークサモナー,ライナス,サンドラ
@exhibit name=盗賊 displayname=Thief monster=ローグ,ハイウェイマン,ブッシュワッカー,バーグラー,スパイ,アサシン,マスターシャドウ,シューター,スナイパー,マスターアーチャー,マリア,エリック,ミレディ
@exhibit name=精霊 displayname=Spirit monster=フェアリー,ウンディーネ,ピクシー,ウィルオーウィスプ,コールドウィスプ,サンダーウィスプ,怒りの霊魂,水のエレメンタル,イフリート,フェニックス
@exhibit name=亜人種 displayname=Demihuman monster=コボルド,シニアコボルド,ウインターコボルド,コボルドリーダー,オーク,オークソルジャー,オークシャーマン,オークキング,ヘッドレス,トロール,エリートトロール,サイクロプス,ケイブジャイアント
@exhibit name=獣人 displayname=Beastkin monster=ハーピー,ハーピーウィッチ,マッドウイング,ニクサー,マーメイド,セイレーン,ナーガ,ラミア,エキドナ
@exhibit name=悪魔 displayname=Devil monster=デーモンインプ,シャドウインプ,ナイトインプ,レッサーデビル,スワンプデビル,マウンテンデビル,グレーターデビル,アークデビル,ビフロンス,ケイブデーモン,アビスデーモン,グレーターデーモン,マイルフィック,ディアブロ,ムールムール,魔公ムールムール
@exhibit name=淫魔 displayname=Succubus monster=サキュバス,見習いサキュバス,エルダーサキュバス,アスモデウス,ナイトメア,インキュバス
@exhibit name=アンデッド displayname=Undead monster=ゾンビ,グール,ガスト,レブナント,スケルトン,スケルトンガード,ナイトスケルトン,スケルトンキング,ヴァンパイア,ノスフェラトゥ,ヴァンパイアロード,デュラハン,リッチ,パワーリッチ,リッチキング
@exhibit name=幽霊 displayname=Ghost monster=シャドウ,レイス,スペクター,ゴースト,ファントム
@exhibit name=ドラゴン displayname=Dragon monster=ブラックドラゴン,ガスドラゴン,フロストドラゴン,アクアドラゴン,ファイアドラゴン,サンダードラゴン,アースドラゴン
@return

