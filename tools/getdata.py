import re

pokelist = ["Bulbasaur","Ivysaur","Venusaur","Charmander","Charmeleon","Charizard","Squirtle","Wartortle","Blastoise","Caterpie","Metapod","Butterfree","Weedle","Kakuna","Beedrill","Pidgey","Pidgeotto","Pidgeot","Rattata","Raticate","Spearow","Fearow","Ekans","Arbok","Pikachu","Raichu","Sandshrew","Sandslash","Nidoran_F","Nidorina","Nidoqueen","Nidoran_M","Nidorino","Nidoking","Clefairy","Clefable","Vulpix","Ninetales","Jigglypuff","Wigglytuff","Zubat","Golbat","Oddish","Gloom","Vileplume","Paras","Parasect","Venonat","Venomoth","Diglett","Dugtrio","Meowth","Persian","Psyduck","Golduck","Mankey","Primeape","Growlithe","Arcanine","Poliwag","Poliwhirl","Poliwrath","Abra","Kadabra","Alakazam","Machop","Machoke","Machamp","Bellsprout","Weepinbell","Victreebel","Tentacool","Tentacruel","Geodude","Graveler","Golem","Ponyta","Rapidash","Slowpoke","Slowbro","Magnemite","Magneton","Farfetch_d","Doduo","Dodrio","Seel","Dewgong","Grimer","Muk","Shellder","Cloyster","Gastly","Haunter","Gengar","Onix","Drowzee","Hypno","Krabby","Kingler","Voltorb","Electrode","Exeggcute","Exeggutor","Cubone","Marowak","Hitmonlee","Hitmonchan","Lickitung","Koffing","Weezing","Rhyhorn","Rhydon","Chansey","Tangela","Kangaskhan","Horsea","Seadra","Goldeen","Seaking","Staryu","Starmie","Mr__Mime","Scyther","Jynx","Electabuzz","Magmar","Pinsir","Tauros","Magikarp","Gyarados","Lapras","Ditto","Eevee","Vaporeon","Jolteon","Flareon","Porygon","Omanyte","Omastar","Kabuto","Kabutops","Aerodactyl","Snorlax","Articuno","Zapdos","Moltres","Dratini","Dragonair","Dragonite","Mewtwo","Mew","Chikorita","Bayleef","Meganium","Cyndaquil","Quilava","Typhlosion","Totodile","Croconaw","Feraligatr","Sentret","Furret","Hoothoot","Noctowl","Ledyba","Ledian","Spinarak","Ariados","Crobat","Chinchou","Lanturn","Pichu","Cleffa","Igglybuff","Togepi","Togetic","Natu","Xatu","Mareep","Flaaffy","Ampharos","Bellossom","Marill","Azumarill","Sudowoodo","Politoed","Hoppip","Skiploom","Jumpluff","Aipom","Sunkern","Sunflora","Yanma","Wooper","Quagsire","Espeon","Umbreon","Murkrow","Slowking","Misdreavus","Unown","Wobbuffet","Girafarig","Pineco","Forretress","Dunsparce","Gligar","Steelix","Snubbull","Granbull","Qwilfish","Scizor","Shuckle","Heracross","Sneasel","Teddiursa","Ursaring","Slugma","Magcargo","Swinub","Piloswine","Corsola","Remoraid","Octillery","Delibird","Mantine","Skarmory","Houndour","Houndoom","Kingdra","Phanpy","Donphan","Porygon2","Stantler","Smeargle","Tyrogue","Hitmontop","Smoochum","Elekid","Magby","Miltank","Blissey","Raikou","Entei","Suicune","Larvitar","Pupitar","Tyranitar","Lugia","Ho_Oh","Celebi"]
data = []
id = 0
linenum = 0
evos_attacks = open('data/pokemon/evos_attacks.asm').read()
for poke in pokelist:
    if poke == "Nidoran_F":
        poke = "NidoranF"
    if poke == "Nidoran_M":
        poke = "NidoranM"
    if poke == "Farfetch_d":
        poke = "FarfetchD"
    if poke == "Mr__Mime":
        poke = "MrMime"
    if poke == "Ho_Oh":
        poke = "HoOh"
    # if poke == "Bulbasaur":
    linenum = 0
    x = re.findall(poke + '(.*?); no more level-up moves', evos_attacks, re.DOTALL + re.MULTILINE)
    # y = re.findall('db [\S]+ (\d+), (.*?)\n', x[0], re.DOTALL + re.MULTILINE)
    # for line in y:
    #     for group in line:
    #         data.append(group + ",")
    #     linenum += 1

    learnset = re.findall('db (\d+), (.*?)\n', x[0], re.DOTALL + re.MULTILINE)
    linenum = 0
    for line in learnset:
        for group in line:
            output = group
            y = re.findall('(.*?) ; becomes (.*)', group)
            for replaced in y:
                output = replaced[1].upper()
                # print(replaced[1])
            output = output.replace("_", " ")
            output = re.sub('; becomes (.+)', '', output)
            output = re.sub('; evolution move', '', output)
            output = re.sub('; unevolved move', '', output)
            output = output.replace(";", "")
            output = output.replace("PSYCHIC M", "PSYCHIC")
            output = output.replace("U TURN", "U-TURN")
            output = output.title()
            if len(output) >= 13:
                output = output.replace(" ", "")
            data.append(output + ",")
        linenum += 1

    # with open ('data/pokemon/base_stats/' + poke.lower() + '.asm', 'rt') as myfile:
    #     linenum = 0
    #     id += 1
    #     data.append("#" + str(id).zfill(3) + ",")
    #     data.append(poke + ",")
    #     for line in myfile:
    #         linenum += 1
    #         if linenum == 3:
    #             x = re.findall('[0-9]+', line)
    #             for n in x:
    #                 data.append(n + ",")
    #         if linenum == 6:
    #             x = re.findall('[A-Z]+', line)
    #             typeCount = 0
    #             for n in x:
    #                 if typeCount == 1 and n == x[0]:
    #                     n = ""
    #                 data.append(n + ",")
    #                 typeCount += 1
    data.append("\n")

file1 = open("output.txt","r+")
file1.truncate(0)
for dat in data:
    file1.writelines(dat)
file1.close()
