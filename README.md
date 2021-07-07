<img src="inst/unidecoder.png" width="100%">

While Unicode characters are undeniably important, there can be occasions where you need text only in US-ASCII format. This is where the **R** package **unidecoder** can help. If you provide text to **unidecoder** along with the input language, it will replace accented letters, ligatures, and other Unicode characters with US-ASCII equivalents.

### Installation

Install **unidecoder** from GitHub using the **devtools** package.

```r
devtools::install_github("rich-iannone/unidecoder")
```

### How to Use **unidecoder**

Use the **unidecoder** package's function `unidecode()` to transform text to ASCII. The function takes in a vector of strings and replaces Unicode characters with their best equivalents. Knowing which equivalents are best depends on providing the source language for the input text. Transliterations can be accomplished for several languages: Armenian, Bulgarian, Czech, Danish, French, Georgian, German, Greek, Norwegian, Polish, Romanian, Russian, and Slovenian.

Take, for example, Goethe's *Totentanz* (1813):

```

Der Türmer, der schaut zu Mitten der Nacht
Hinab auf die Gräber in Lage;
Der Mond, der hat alles ins Helle gebracht;
Der Kirchhof, er liegt wie am Tage.
Da regt sich ein Grab und ein anderes dann:
Sie kommen hervor, ein Weib da, ein Mann,
In weißen und schleppenden Hemden.

Das reckt nun, es will sich ergetzen sogleich,
Die Knöchel zur Runde, zum Kranze,
So arm und so jung, und so alt und so reich;
Doch hindern die Schleppen am Tanze.
Und weil hier die Scham nun nicht weiter gebeut,
Sie schütteln sich alle, da liegen zerstreut
Die Hemdlein über den Hügeln.

Nun hebt sich der Schenkel, nun wackelt das Bein,
Gebärden da gibt es vertrackte;
Dann klippert's und klappert's mitunter hinein,
Als schlüg' man die Hölzlein zum Takte.
Das kommt nun dem Türmer so lächerlich vor;
Da raunt ihm der Schalk, der Versucher, ins Ohr:
Geh! hole dir einen der Laken.

Getan wie gedacht! und er flüchtet sich schnell
Nun hinter geheiligte Türen.
Der Mond, und noch immer er scheinet so hell
Zum Tanz, den sie schauderlich führen.
Doch endlich verlieret sich dieser und der,
Schleicht eins nach dem andern gekleidet einher,
Und, husch, ist es unter dem Rasen.

Nur einer, der trippelt und stolpert zuletzt
Und tappet und grapst an den Grüften;
Doch hat kein Geselle so schwer ihn verletzt,
Er wittert das Tuch in den Lüften.
Er rüttelt die Turmtür, sie schlägt ihn zurück,
Geziert und gesegnet, dem Türmer zum Glück,
Sie blinkt von metallenen Kreuzen.

Das Hemd muß er haben, da rastet er nicht,
Da gilt auch kein langes Besinnen,
Den gotischen Zierat ergreift nun der Wicht
Und klettert von Zinne zu Zinnen.
Nun ist's um den armen, den Türmer getan!
Es ruckt sich von Schnörkel zu Schnörkel hinan,
Langbeinigen Spinnen vergleichbar.

Der Türmer erbleichet, der Türmer erbebt,
Gern gäb er ihn wieder, den Laken.
Da häkelt—jetzt hat er am längsten gelebt—
Den Zipfel ein eiserner Zacken.
Schon trübet der Mond sich verschwindenden Scheins,
Die Glocke, sie donnert ein mächtiges Eins,
Und unten zerschellt das Gerippe.

```

Written in German, it contains letters with umlauts and the ß character, all of which are not part of the US-ASCII character set. To process this text, read the lines into an **R** object and call the `unidecode()` function with `language = "German"` or `language = "de"`.

```R
library("downloader")
library("unidecoder")

# Download some Goethe
download("https://raw.githubusercontent.com/rich-iannone/unidecoder/main/inst/examples/Totentanz__de.txt",
  "Totentanz__de.txt")

# Read the poem from the file 'Totentanz__de.txt'
totentanz <- readLines("Totentanz__de.txt")

# Replace the Unicode characters with US-ASCII replacements       
totentanz_ascii <- unidecode(data = totentanz, language = "German")

# View the modified text
cat(totentanz_ascii)
```

The resulting text transliteration is returned:

```

Der Tuermer, der schaut zu Mitten der Nacht
Hinab auf die Graeber in Lage;
Der Mond, der hat alles ins Helle gebracht;
Der Kirchhof, er liegt wie am Tage.
Da regt sich ein Grab und ein anderes dann:
Sie kommen hervor, ein Weib da, ein Mann,
In weissen und schleppenden Hemden.

Das reckt nun, es will sich ergetzen sogleich,
Die Knoechel zur Runde, zum Kranze,
So arm und so jung, und so alt und so reich;
Doch hindern die Schleppen am Tanze.
Und weil hier die Scham nun nicht weiter gebeut,
Sie schuetteln sich alle, da liegen zerstreut
Die Hemdlein ueber den Huegeln.

Nun hebt sich der Schenkel, nun wackelt das Bein,
Gebaerden da gibt es vertrackte;
Dann klippert's und klappert's mitunter hinein,
Als schlueg' man die Hoelzlein zum Takte.
Das kommt nun dem Tuermer so laecherlich vor;
Da raunt ihm der Schalk, der Versucher, ins Ohr:
Geh! hole dir einen der Laken.

Getan wie gedacht! und er fluechtet sich schnell
Nun hinter geheiligte Tueren.
Der Mond, und noch immer er scheinet so hell
Zum Tanz, den sie schauderlich fuehren.
Doch endlich verlieret sich dieser und der,
Schleicht eins nach dem andern gekleidet einher,
Und, husch, ist es unter dem Rasen.

Nur einer, der trippelt und stolpert zuletzt
Und tappet und grapst an den Grueften;
Doch hat kein Geselle so schwer ihn verletzt,
Er wittert das Tuch in den Lueften.
Er ruettelt die Turmtuer, sie schlaegt ihn zurueck,
Geziert und gesegnet, dem Tuermer zum Glueck,
Sie blinkt von metallenen Kreuzen.

Das Hemd muss er haben, da rastet er nicht,
Da gilt auch kein langes Besinnen,
Den gotischen Zierat ergreift nun der Wicht
Und klettert von Zinne zu Zinnen.
Nun ist's um den armen, den Tuermer getan!
Es ruckt sich von Schnoerkel zu Schnoerkel hinan,
Langbeinigen Spinnen vergleichbar.

Der Tuermer erbleichet, der Tuermer erbebt,
Gern gaeb er ihn wieder, den Laken.
Da haekelt—jetzt hat er am laengsten gelebt—
Den Zipfel ein eiserner Zacken.
Schon truebet der Mond sich verschwindenden Scheins,
Die Glocke, sie donnert ein maechtiges Eins,
Und unten zerschellt das Gerippe.

```

So, words like `Knöchel` were transliterated to `Knoechel`, resulting in text that is entirely in the US-ASCII character set. Moreover, this is the expected transliteration that's in wide use. The `language` argument accepts the following formats: language name in English (e.g., German), the native language name (e.g., Deutsch), and ISO 639-1 language code (e.g., de).

### Unidecoding in Other Languages

#### Bulgarian // български език, bǎlgarski ezik // bg

Hristo Botev's *Hadji Dimiter* (1873)

```

Жив е той, жив е! Там на Балкана,    # -> Zhiv e toy, zhiv e! Tam na Balkana,
потънал в кърви, лежи и пъшка        # -> potanal v karvi, lezhi i pashka
юнак с дълбока на гърди рана,        # -> yunak s dalboka na gardi rana,
юнак във младост и в сила мъжка.     # -> yunak vav mladost i v sila mazhka.
 
На една страна захвърлил пушка,      # -> Na edna strana zahvarlil pushka,
на друга сабля на две строшена;      # -> na druga sablya na dve stroshena;
очи темнеят, глава се люшка,         # -> ochi temneyat, glava se lyushka,
уста проклинат цяла вселена!         # -> usta proklinat tsyala vselena!
 
Лежи юнакът, а на небето             # -> Lezhi yunakat, a na nebeto
слънцето спряно сърдито пече;        # -> slantseto spryano sardito peche;
жътварка пее нейде в полето,         # -> zhatvarka pee neyde v poleto,
и кръвта още по-силно тече!          # -> i kravta oshte po-silno teche!
 
Жътва е сега... Пейте, робини,       # -> Zhatva e sega... Peyte, robini,
тез тъжни песни! Грей и ти, слънце,  # -> tez tazhni pesni! Grey i ti, slantse,
в таз робска земя! Ще да загине      # -> v taz robska zemya! Shte da zagine
и тоя юнак... Но млъкни, сърце!      # -> i toya yunak... No mlakni, sartse!

```

#### Czech // čeština, český jazyk // cs

Karel Hynek Mácha's *Máj* (1836)

```

Klesla hvězda s nebes výše,   # -> Klesla hvezda s nebes vyse,
mrtvá hvězda siný svit;       # -> mrtva hvezda siny svit;
padá v neskončené říše        # -> pada v neskoncene rise
padá věčně v věčný byt.       # -> pada vecne v vecny byt.
Její pláč zní z hrobu všeho,  # -> Jeji plac zni z hrobu vseho,
strašný jekot, hrůzný kvíl.   # -> strasny jekot, hruzny kvil.
„Kdy dopadne konce svého?“    # -> "Kdy dopadne konce sveho?"

```

#### French // français // fr

Charles Baudelaire's *Tout entière* (1857)

```

Le Démon, dans ma chambre haute       # -> Le Demon, dans ma chambre haute
Ce matin est venu me voir,            # -> Ce matin est venu me voir,
Et, tâchant à me prendre en faute     # -> Et, tachant a me prendre en faute
Me dit: «Je voudrais bien savoir      # -> Me dit: "Je voudrais bien savoir
Parmi toutes les belles choses        # -> Parmi toutes les belles choses
Dont est fait son enchantement,       # -> Dont est fait son enchantement,
Parmi les objets noirs ou roses       # -> Parmi les objets noirs ou roses
Qui composent son corps charmant,     # -> Qui composent son corps charmant,
Quel est le plus doux.» — Ô mon âme!  # -> Quel est le plus doux." — O mon ame!
Tu répondis à l'Abhorré:              # -> Tu repondis a l'Abhorre:
«Puisqu'en Elle tout est dictame      # -> "Puisqu'en Elle tout est dictame
Rien ne peut être préféré.            # -> Rien ne peut etre prefere.

```

#### Georgian // kartuli, ქართული // ka 

Giorgi Leonidze's *Q'ivchaghis P'aemani* (1928)

```

ქსანზედ არაგვზედ ისევ ყვავიან  # -> ksanzed aragvzed isev q'vavian
ხოდაბუნები თავთუხებისა          # -> khodabunebi tavtukhebisa
შენი ტუჩებიც ისე ტკბილია,       # -> sheni t'uchebits ise t'k'bilia,
როგორც ბადაგი დადუღებისას.      # -> rogorts badagi dadughebisas.

ხოხბობას გნახე მიწურვილ იყო,    # -> khokhbobas gnakhe mits'urvil iq'o,
როცა ზაფხული რუსთაველისა        # -> rotsa zapkhuli rustavelisa
ნეტამც ბადაგი არ დამელია        # -> net'amts badagi ar damelia
და იმ დღეს ხმალი არ ამელესა.    # -> da im dghes khmali ar amelesa.

```

#### German // Deutsch, deutsche Sprache // de

Goethe's *Auf Dem See* (1775)

```

Und frische Nahrung, neues Blut       # -> Und frische Nahrung, neues Blut
Saug ich aus freier Welt:             # -> Saug ich aus freier Welt:
Wie ist Natur so hold und gut,        # -> Wie ist Natur so hold und gut,
Die mich am Busen hält!               # -> Die mich am Busen haelt!

Die Welle wieget unsern Kahn          # -> Die Welle wieget unsern Kahn
Im Rudertakt hinauf,                  # -> Im Rudertakt hinauf,
Und Berge, wolkig himmelan,           # -> Und Berge, wolkig himmelan,
Begegnen unserm Lauf.                 # -> Begegnen unserm Lauf.

Aug, mein Aug, was sinkst du nieder?  # -> Aug, mein Aug, was sinkst du nieder?
Goldne Träume, kommt ihr wieder?      # -> Goldne Traeume, kommt ihr wieder?
Weg, du Traum! so gold du bist:       # -> Weg, du Traum! so gold du bist:
Hier auch Lieb und Leben ist.         # -> Hier auch Lieb und Leben ist.

Auf der Welle blinken                 # -> Auf der Welle blinken
Tausend schwebende Sterne,            # -> Tausend schwebende Sterne,
Weiche Nebel trinken                  # -> Weiche Nebel trinken
Rings die türmende Ferne;             # -> Rings die tuermende Ferne;

Morgenwind umflügelt                  # -> Morgenwind umfluegelt
Die beschattete Bucht,                # -> Die beschattete Bucht,
Und im See bespiegelt                 # -> Und im See bespiegelt
Sich die reifende Frucht.             # -> Sich die reifende Frucht.

```

#### Greek // ελληνικά // el

Giorgos Seferis's *The King of Asine* (1938)

```

Κοιτάξαμε όλο το πρωί γύρω-γύρω το κάστρο              % -> Koitaxame olo to proi yiro-yiro to kastro
αρχίζοντας από το μέρος του ίσκιου εκεί που η θάλασσα  % -> arhizontas apo to meros toi iskioi ekei poi i thalassa
πράσινη και χωρίς αναλαμπή, το στήθος σκοτωμένου       % -> prasini kai horis analampi, to stithos skotomenoi
παγονιού                                               % -> payonioi
Μας δέχτηκε όπως ο καιρός χωρίς κανένα χάσμα.          % -> Mas dehtike opos o kairos horis kanena hasma.
Οι φλέβες του βράχου κατέβαιναν από ψηλά               % -> Oi fleves toi vrahoi katevainan apo psila
στριμμένα κλήματα γυμνά πολύκλωνα ζωντανεύοντας        % -> strimmena klimata yimna poliklona zontaneiontas
στ άγγιγμα του νερού, καθώς το μάτι ακολουθώυτας τις   % -> st ayyiyma toi neroi, kathos to mati akoloithoitas tis
πάλευε να ξεφύγει το κουραστικό λίκνισμα               % -> paleie na xefiyei to koirastiko liknisma
χάνοντας δύναμη ολοένα.                                % -> hanontas dinami oloena.

```

#### Hungarian // magyar // hu

Sándor Márai's *Hol vagyok? (Where am I?)* (1972)

```

Ülök a padon, nézem az eget                           % -> Ulok a padon, nezem az eget. 
A Central Park nem a Margitsziget.                    % -> A Central Park nem a Margitsziget.
Milyen szép az élet, - kapok, amit kérek.             % -> Milyen szep az elet, - kapok, amit kerek.
Milyen furcsa íze van itt a kenyérnek.                % -> Milyen furcsa ize van itt a kenyernek.
Micsoda házak és micsoda utak!                        % -> Micsoda hazak es micsoda utak!
Vajon, hogy hívják most a Károly körutat?             % -> Vajon, hogy hivjak most a Karoly korutat?
Micsoda nép! - az iramot bírják.                      % -> Micsoda nep! - az iramot birjak.
Vajon ki ápolja szegény Mama sírját?                  % -> Vajon ki apolja szegeny Mama sirjat?
Izzik a levegő, a Nap ragyog.                         % -> Izzik a levego, a Nap ragyog.
Szent Isten! - hol vagyok?                            % -> Szent Isten! - hol vagyok?

```

#### Polish // język polski // pl

Szymborska Wisława's *Utopia* (1976)

```

Wyspa na której wszystko się wyjaśnia.    # -> Wyspa na ktorej wszystko sie wyjasnia.
Tu można stanąć na gruncie dowodów.       # -> Tu mozna stanac na gruncie dowodow.
Nie ma dróg innych oprócz drogi dojścia.  # -> Nie ma drog innych oprocz drogi dojscia.
Krzaki aż uginają się od odpowiedzi.      # -> Krzaki az uginaja sie od odpowiedzi.

Rośnie tu drzewo Słusznego Domysłu        # -> Rosnie tu drzewo Slusznego Domyslu
o rozwikłanych wiecznie gałęziach.        # -> o rozwiklanych wiecznie galeziach.

Olśniewająco proste drzewo Zrozumienia    # -> Olsniewajaco proste drzewo Zrozumienia
przy źródle, co się zwie Ach Więc To Tak. # -> przy zrodle, co sie zwie Ach Wiec To Tak.

```

#### Romanian // limba română // ro

George Coşbuc's *Crăiasa zânelor* (1893)

```

Orcanul însuşi stă domol      # -> Orcanul insusi sta domol
Şi-n gânduri dulci se pierde, # -> Si-n ganduri dulci se pierde,
Când zânele cu pieptul gol    # -> Cand zanele cu pieptul gol
Răsar pe lunca verde.         # -> Rasar pe lunca verde.
Uşoare, ca de neguri, fug     # -> Usoare, ca de neguri, fug
Prin liniştea adâncă,         # -> Prin linistea adanca,
Obrajii lor, ca flori de rug, # -> Obrajii lor, ca flori de rug,
Sunt nesărutaţi încă.         # -> Sunt nesarutati inca.

Vezi tu departe-n Răsărit     # -> Vezi tu departe-n Rasarit
Aprins lucind ca focul        # -> Aprins lucind ca focul
Palatul lor? Împrejmuit       # -> Palatul lor? Imprejmuit
Cu zid d-argint e locul:      # -> Cu zid d-argint e locul:
Acolo ele-n veci nu mor       # -> Acolo ele-n veci nu mor
Şi vara-n veci nu moare,      # -> Si vara-n veci nu moare,
Iar ele-şi au crăiasa lor     # -> Iar ele-si au craiasa lor
Şi toate sunt fecioare.       # -> Si toate sunt fecioare.

```

#### Russian // русский язык // ru

Mikhail Lermontov's *Valerik* (1843)

```

И знать вам также нету нужды,  # -> I znаt' vаm tаkzhе nеtu nuzhdy'
Где я? что я? в какой глуши?   # -> Gdе ya? chto ya? v kаkoj glushi?
Душою мы друг другу чужды,     # -> Dushoyu my' drug drugu chuzhdy',
Да вряд ли есть родство души.  # -> Dа vryad li еct' rodctvo dushi.
Страницы прошлого читая,       # -> Ctrаniczy' proshlogo chitаya,
Их по порядку разбирая         # -> Ikh po poryadku rаzbirаya
Теперь остынувшим умом,        # -> Tеpеr' octy'nuvshim umom,
Разуверяюсь я во всем.         # -> Rаzuvеryayuc' ya vo vcеm.
Смешно же сердцем лицемерить   # -> Cmеshno zhе cеrdczеm liczеmеrit'
Перед собою столько лет;       # -> Pеrеd coboyu ctol'ko lеt;
Добро б еще морочить свет!     # -> Dobro b еshhе morochit' cvеt!

```

#### Slovenian // slovenski jezik, slovenščina // sl

France Prešeren's *Prošnja* (1834)

```

Po drugih se oziraj,      # -> Po drugih se oziraj,
ne morem ti branít;       # -> ne morem ti branit;
še men' oči odpiraj,      # -> se men' oci odpiraj,
mi gledat daj njih svit!  # -> mi gledat daj njih svit!
Obešajo glavíce,          # -> Obesajo glavice,
ni rožam mar cvetét;      # -> ni rozam mar cvetet;
molčijo v gójzdi tice,    # -> molcijo v gojzdi tice,
ne ljubi se jim pét'.     # -> ne ljubi se jim pet'.

Ne letajo čebele,         # -> Ne letajo cebele,
krog cvetja ne šumé;      # -> krog cvetja ne sume;
c'lo ribice vesele        # -> c'lo ribice vesele
se klavrno držé.          # -> se klavrno drze.

```
