ladies, mens = Category.create([{name: "レディース", id: "1"}, {name: "メンズ"}])

tops, pants = ladies.children.create([{name: "トップス"}, {name: "パンツ"}])
tops.children.create([{name: "シャツ"}, {name: "キャミソール"}])
pants.children.create([{name: "チノパン"}, {name: "ジーンズ"}])
panty, watch = mens.children.create([{name: "パンツ"}, {name: "時計"}])
watch.children.create([{name: "腕時計"}, {name: "レザーベルト"}])
panty.children.create([{name: "スラックス"}, {name: "ショートパンツ"}])
