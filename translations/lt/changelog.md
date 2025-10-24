<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T18:21:58+00:00",
  "source_file": "changelog.md",
  "language_code": "lt"
}
-->
# Pakeitimų žurnalas - AZD pradedantiesiems

## Įvadas

Šiame pakeitimų žurnale dokumentuojami visi svarbūs pakeitimai, atnaujinimai ir patobulinimai AZD pradedantiesiems saugykloje. Mes laikomės semantinio versijavimo principų ir palaikome šį žurnalą, kad padėtume vartotojams suprasti, kas pasikeitė tarp versijų.

## Mokymosi tikslai

Peržiūrėdami šį pakeitimų žurnalą, jūs:
- Sužinosite apie naujas funkcijas ir turinio papildymus
- Suprasite, kokie patobulinimai buvo atlikti esamuose dokumentuose
- Seksite klaidų taisymus ir korekcijas, kad užtikrintumėte tikslumą
- Stebėsite mokymosi medžiagos evoliuciją laikui bėgant

## Mokymosi rezultatai

Peržiūrėję pakeitimų žurnalo įrašus, galėsite:
- Identifikuoti naują turinį ir mokymosi išteklius
- Suprasti, kurios skiltys buvo atnaujintos ar patobulintos
- Planuoti savo mokymosi kelią remiantis naujausia medžiaga
- Teikti atsiliepimus ir pasiūlymus dėl būsimų patobulinimų

## Versijų istorija

### [v3.4.0] - 2025-10-24

#### Infrastruktūros peržiūros ir validacijos patobulinimai
**Ši versija pristato išsamų naujos Azure Developer CLI peržiūros funkcijos palaikymą ir pagerina dirbtuvių naudotojų patirtį.**

#### Pridėta
- **🧪 azd provision --preview funkcijos dokumentacija**: Išsamus naujos infrastruktūros peržiūros galimybės aprašymas
  - Komandų nuorodos ir naudojimo pavyzdžiai „cheat sheet“
  - Detali integracija į diegimo vadovą su naudojimo atvejais ir privalumais
  - Prieš diegimą atliekamų patikrinimų integracija saugesniam diegimui
  - Pradžios vadovo atnaujinimai su saugumo pirmumo diegimo praktika
- **🚧 Dirbtuvių būsenos baneris**: Profesionalus HTML baneris, nurodantis dirbtuvių kūrimo būseną
  - Gradientinis dizainas su statybos indikatoriais aiškiam vartotojų informavimui
  - Paskutinio atnaujinimo laiko žyma skaidrumui užtikrinti
  - Mobiliesiems pritaikytas dizainas visų tipų įrenginiams

#### Patobulinta
- **Infrastruktūros saugumas**: Peržiūros funkcionalumas integruotas visoje diegimo dokumentacijoje
- **Prieš diegimą atliekama validacija**: Automatiniai scenarijai dabar apima infrastruktūros peržiūros testavimą
- **Kūrėjo darbo eiga**: Atnaujintos komandų sekos, įtraukiant peržiūrą kaip geriausią praktiką
- **Dirbtuvių patirtis**: Aiškiai nustatyti lūkesčiai vartotojams dėl turinio kūrimo būsenos

#### Pakeista
- **Diegimo geriausios praktikos**: Rekomenduojama peržiūros pirmumo darbo eiga
- **Dokumentacijos eiga**: Infrastruktūros validacija perkelta į ankstesnį mokymosi proceso etapą
- **Dirbtuvių pristatymas**: Profesionalus būsenos komunikavimas su aiškiu kūrimo grafiku

#### Pagerinta
- **Saugumo pirmumo požiūris**: Infrastruktūros pakeitimus dabar galima patikrinti prieš diegimą
- **Komandinio darbo galimybės**: Peržiūros rezultatus galima dalintis peržiūrai ir patvirtinimui
- **Išlaidų supratimas**: Geresnis resursų kaštų supratimas prieš diegimą
- **Rizikos mažinimas**: Sumažintas diegimo klaidų skaičius per išankstinę validaciją

#### Techninė įgyvendinimo dalis
- **Daugiafailinė integracija**: Peržiūros funkcija dokumentuota 4 pagrindiniuose failuose
- **Komandų šablonai**: Nuosekli sintaksė ir pavyzdžiai visoje dokumentacijoje
- **Geriausios praktikos integracija**: Peržiūra įtraukta į validacijos darbo eigas ir scenarijus
- **Vizualiniai indikatoriai**: Aiškūs NAUJOS funkcijos žymėjimai atradimui

#### Dirbtuvių infrastruktūra
- **Būsenos komunikacija**: Profesionalus HTML baneris su gradientiniu stiliumi
- **Vartotojo patirtis**: Aiški kūrimo būsenos komunikacija, kad būtų išvengta painiavos
- **Profesionalus pristatymas**: Saugo saugyklos patikimumą, nustatant lūkesčius
- **Laiko skaidrumas**: 2025 m. spalio mėn. paskutinio atnaujinimo laiko žyma užtikrinant atskaitomybę

### [v3.3.0] - 2025-09-24

#### Patobulintos dirbtuvių medžiagos ir interaktyvi mokymosi patirtis
**Ši versija pristato išsamias dirbtuvių medžiagas su naršyklėje veikiančiais interaktyviais vadovais ir struktūrizuotais mokymosi keliais.**

#### Pridėta
- **🎥 Interaktyvus dirbtuvių vadovas**: Naršyklėje veikianti dirbtuvių patirtis su MkDocs peržiūros galimybe
- **📝 Struktūrizuotos dirbtuvių instrukcijos**: 7 žingsnių mokymosi kelias nuo atradimo iki pritaikymo
  - 0-Įvadas: Dirbtuvių apžvalga ir nustatymai
  - 1-Pasirinkti-AI-Šabloną: Šablono atradimo ir pasirinkimo procesas
  - 2-Patikrinti-AI-Šabloną: Diegimo ir validacijos procedūros
  - 3-Išskaidyti-AI-Šabloną: Šablono architektūros supratimas
  - 4-Konfigūruoti-AI-Šabloną: Konfigūravimas ir pritaikymas
  - 5-Pritaikyti-AI-Šabloną: Pažangūs pakeitimai ir iteracijos
  - 6-Infrastruktūros išardymas: Valymas ir resursų valdymas
  - 7-Santrauka: Apibendrinimas ir tolesni žingsniai
- **🛠️ Dirbtuvių įrankiai**: MkDocs konfigūracija su Material tema, skirta patobulintai mokymosi patirčiai
- **🎯 Praktinis mokymosi kelias**: 3 žingsnių metodologija (Atradimas → Diegimas → Pritaikymas)
- **📱 GitHub Codespaces integracija**: Sklandus kūrimo aplinkos nustatymas

#### Patobulinta
- **AI dirbtuvių laboratorija**: Išplėsta iki išsamios 2-3 valandų struktūrizuotos mokymosi patirties
- **Dirbtuvių dokumentacija**: Profesionalus pristatymas su navigacija ir vizualinėmis priemonėmis
- **Mokymosi progresija**: Aiškus žingsnis po žingsnio vadovavimas nuo šablono pasirinkimo iki gamybos diegimo
- **Kūrėjo patirtis**: Integruoti įrankiai sklandžiam kūrimo darbo eigai

#### Pagerinta
- **Prieinamumas**: Naršyklėje veikianti sąsaja su paieška, kopijavimo funkcija ir temos perjungimu
- **Savarankiškas mokymasis**: Lanksti dirbtuvių struktūra, pritaikoma skirtingiems mokymosi tempams
- **Praktinis pritaikymas**: Realūs AI šablonų diegimo scenarijai
- **Bendruomenės integracija**: Discord integracija dirbtuvių palaikymui ir bendradarbiavimui

#### Dirbtuvių funkcijos
- **Integruota paieška**: Greitas raktažodžių ir pamokų atradimas
- **Kopijuoti kodo blokus**: Funkcija „hover-to-copy“ visiems kodo pavyzdžiams
- **Temos perjungimas**: Tamsaus/šviesaus režimo palaikymas skirtingiems pageidavimams
- **Vizualiniai ištekliai**: Ekrano nuotraukos ir diagramos geresniam supratimui
- **Pagalbos integracija**: Tiesioginė Discord prieiga bendruomenės palaikymui

### [v3.2.0] - 2025-09-17

#### Didelis navigacijos pertvarkymas ir mokymosi sistema pagal skyrius
**Ši versija pristato išsamią mokymosi struktūrą pagal skyrius su patobulinta navigacija visoje saugykloje.**

#### Pridėta
- **📚 Mokymosi sistema pagal skyrius**: Pertvarkyta visa mokymo programa į 8 progresyvius mokymosi skyrius
  - 1 skyrius: Pagrindai ir greitas startas (⭐ - 30-45 min.)
  - 2 skyrius: AI-pirmasis kūrimas (⭐⭐ - 1-2 val.)
  - 3 skyrius: Konfigūracija ir autentifikacija (⭐⭐ - 45-60 min.)
  - 4 skyrius: Infrastruktūra kaip kodas ir diegimas (⭐⭐⭐ - 1-1,5 val.)
  - 5 skyrius: Daugiaagentiniai AI sprendimai (⭐⭐⭐⭐ - 2-3 val.)
  - 6 skyrius: Prieš diegimą atliekama validacija ir planavimas (⭐⭐ - 1 val.)
  - 7 skyrius: Trikčių šalinimas ir derinimas (⭐⭐ - 1-1,5 val.)
  - 8 skyrius: Gamybos ir įmonių modeliai (⭐⭐⭐⭐ - 2-3 val.)
- **📚 Išsami navigacijos sistema**: Nuoseklūs navigacijos antraštės ir poraštės visoje dokumentacijoje
- **🎯 Progresavimo stebėjimas**: Kurso užbaigimo kontrolinis sąrašas ir mokymosi patikros sistema
- **🗺️ Mokymosi kelio gairės**: Aiškūs įėjimo taškai skirtingiems patirties lygiams ir tikslams
- **🔗 Kryžminė navigacija**: Susiję skyriai ir būtinos sąlygos aiškiai susietos

#### Patobulinta
- **README struktūra**: Paversta struktūrizuota mokymosi platforma su skyrių organizacija
- **Dokumentacijos navigacija**: Kiekvienas puslapis dabar apima skyriaus kontekstą ir progresavimo gaires
- **Šablonų organizacija**: Pavyzdžiai ir šablonai susieti su atitinkamais mokymosi skyriais
- **Išteklių integracija**: „Cheat sheet“, DUK ir mokymosi vadovai susieti su atitinkamais skyriais
- **Dirbtuvių integracija**: Praktinės laboratorijos susietos su keliais skyriaus mokymosi tikslais

#### Pakeista
- **Mokymosi progresija**: Pereita nuo linijinės dokumentacijos prie lankstaus mokymosi pagal skyrius
- **Konfigūracijos vieta**: Konfigūracijos vadovas perkeltas į 3 skyrių, kad būtų geresnis mokymosi srautas
- **AI turinio integracija**: Geresnė AI specifinio turinio integracija viso mokymosi metu
- **Gamybos turinys**: Pažangūs modeliai sujungti į 8 skyrių įmonių mokymuisi

#### Pagerinta
- **Vartotojo patirtis**: Aiškūs navigacijos kelio ženklai ir skyriaus progresavimo indikatoriai
- **Prieinamumas**: Nuoseklūs navigacijos modeliai, kad būtų lengviau pereiti kursą
- **Profesionalus pristatymas**: Universiteto stiliaus kurso struktūra, tinkama akademiniam ir įmonių mokymui
- **Mokymosi efektyvumas**: Sumažintas laikas rasti atitinkamą turinį per patobulintą organizaciją

#### Techninė įgyvendinimo dalis
- **Navigacijos antraštės**: Standartizuota skyrių navigacija per 40+ dokumentacijos failų
- **Poraštės navigacija**: Nuoseklios progresavimo gairės ir skyriaus užbaigimo indikatoriai
- **Kryžminis susiejimas**: Išsamus vidinis susiejimo sistema, jungianti susijusias sąvokas
- **Skyrių susiejimas**: Šablonai ir pavyzdžiai aiškiai susieti su mokymosi tikslais

#### Mokymosi vadovo patobulinimas
- **📚 Išsamūs mokymosi tikslai**: Pertvarkytas mokymosi vadovas, kad atitiktų 8 skyrių sistemą
- **🎯 Skyriaus pagrindu atliekamas vertinimas**: Kiekvienas skyrius apima specifinius mokymosi tikslus ir praktinius pratimus
- **📋 Progresavimo stebėjimas**: Savaitinis mokymosi tvarkaraštis su išmatuojamais rezultatais ir užbaigimo kontroliniais sąrašais
- **❓ Vertinimo klausimai**: Žinių patikros klausimai kiekvienam skyriui su profesionaliais rezultatais
- **🛠️ Praktiniai pratimai**: Praktinės veiklos su realiais diegimo scenarijais ir trikčių šalinimu
- **📊 Įgūdžių progresija**: Aiškus perėjimas nuo pagrindinių sąvokų prie įmonių modelių su karjeros plėtros akcentu
- **🎓 Sertifikavimo sistema**: Profesinio tobulėjimo rezultatai ir bendruomenės pripažinimo sistema
- **⏱️ Laiko valdymas**: Struktūrizuotas 10 savaičių mokymosi planas su etapų patikra

### [v3.1.0] - 2025-09-17

#### Patobulinti daugiaagentiniai AI sprendimai
**Ši versija pagerina daugiaagentinį mažmeninės prekybos sprendimą, pakeičiant agentų pavadinimus ir patobulinant dokumentaciją.**

#### Pakeista
- **Daugiaagentinė terminologija**: „Cora agentas“ pakeistas į „Kliento agentas“ visame mažmeninės prekybos daugiaagentiniame sprendime, kad būtų aiškiau suprantama
- **Agentų architektūra**: Atnaujinta visa dokumentacija, ARM šablonai ir kodo pavyzdžiai, naudojant nuoseklų „Kliento agento“ pavadinimą
- **Konfigūracijos pavyzdžiai**: Modernizuoti agentų konfigūracijos modeliai su atnaujintais pavadinimais
- **Dokumentacijos nuoseklumas**: Užtikrinta, kad visi paminėjimai naudoja profesionalius, aprašomuosius agentų pavadinimus

#### Patobulinta
- **ARM šablonų paketas**: Atnaujintas mažmeninės prekybos daugiaagentinis ARM šablonas su Kliento agento paminėjimais
- **Architektūros diagramos**: Atnaujintos Mermaid diagramos su atnaujintais agentų pavadinimais
- **Kodo pavyzdžiai**: Python klasės ir įgyvendinimo pavyzdžiai dabar naudoja CustomerAgent pavadinimą
- **Aplinkos kintamieji**: Atnaujinti visi diegimo scenarijai, kad naudotų CUSTOMER_AGENT_NAME konvencijas

#### Pagerinta
- **Kūrėjo patirtis**: Aiškesni agentų vaidmenys ir atsakomybės dokumentacijoje
- **Gamybos pasirengimas**: Geresnis suderinamumas su įmonių pavadinimų konvencijomis
- **Mokymosi medžiaga**: Intuityvesni agentų pavadinimai mokymo tikslais
- **Šablonų naudojamumas**: Supaprastintas agentų funkcijų ir diegimo modelių supratimas

#### Techninės detalės
- Atnaujintos Mermaid architektūros diagramos su CustomerAgent paminėjimais
- CoraAgent klasės pavadinimai pakeisti į CustomerAgent Python pavyzdžiuose
- Mod
- **Dokumentacijos formatas**: Standartizuota visa dokumentacija, naudojant nuoseklią mokymuisi pritaikytą struktūrą
- **Navigacijos eiga**: Įgyvendinta logiška progresija per visą mokymosi medžiagą
- **Turinio pateikimas**: Pašalinti dekoratyviniai elementai, siekiant aiškaus ir profesionalaus formatavimo
- **Nuorodų struktūra**: Atnaujintos visos vidinės nuorodos, kad palaikytų naują navigacijos sistemą

#### Patobulinta
- **Prieinamumas**: Pašalinta priklausomybė nuo jaustukų, kad būtų geriau suderinama su ekrano skaitytuvais
- **Profesionalus vaizdas**: Švarus, akademinio stiliaus pateikimas, tinkamas įmonių mokymams
- **Mokymosi patirtis**: Struktūruotas požiūris su aiškiais kiekvienos pamokos tikslais ir rezultatais
- **Turinio organizavimas**: Geresnė logiška eiga ir ryšys tarp susijusių temų

### [v1.0.0] - 2025-09-09

#### Pradinis leidimas - Išsamus AZD mokymosi šaltinis

#### Pridėta
- **Pagrindinė dokumentacijos struktūra**
  - Pilnas pradedančiųjų vadovų serijos rinkinys
  - Išsami dokumentacija apie diegimą ir paruošimą
  - Detalūs trikčių šalinimo ištekliai ir klaidų taisymo vadovai
  - Prieš diegimą skirti patikros įrankiai ir procedūros

- **Pradedančiųjų modulis**
  - AZD pagrindai: pagrindinės sąvokos ir terminologija
  - Diegimo vadovas: platformai pritaikytos nustatymo instrukcijos
  - Konfigūracijos vadovas: aplinkos nustatymas ir autentifikacija
  - Pirmojo projekto pamoka: žingsnis po žingsnio praktinis mokymasis

- **Diegimo ir paruošimo modulis**
  - Diegimo vadovas: pilna darbo eiga dokumentacija
  - Paruošimo vadovas: infrastruktūra kaip kodas su Bicep
  - Geriausios praktikos gamybos diegimams
  - Daugiafunkcinės architektūros modeliai

- **Prieš diegimą skirta patikros modulis**
  - Talpos planavimas: „Azure“ išteklių prieinamumo patikra
  - SKU pasirinkimas: išsamios paslaugų lygio gairės
  - Prieš skrydį patikros: automatiniai patikros scenarijai (PowerShell ir Bash)
  - Išlaidų vertinimo ir biudžeto planavimo įrankiai

- **Trikčių šalinimo modulis**
  - Dažniausios problemos: dažniausiai pasitaikančių problemų sprendimai
  - Klaidų taisymo vadovas: sistemingi trikčių šalinimo metodai
  - Pažangios diagnostikos technikos ir įrankiai
  - Našumo stebėjimas ir optimizavimas

- **Ištekliai ir nuorodos**
  - Komandų atmintinė: greita pagrindinių komandų nuoroda
  - Žodynas: išsamūs terminų ir akronimų apibrėžimai
  - DUK: detalūs atsakymai į dažniausiai užduodamus klausimus
  - Išorinės nuorodos ir bendruomenės ryšiai

- **Pavyzdžiai ir šablonai**
  - Paprasto interneto programos pavyzdys
  - Statinio tinklalapio diegimo šablonas
  - Konteinerio programos konfigūracija
  - Duomenų bazės integracijos modeliai
  - Mikroservisų architektūros pavyzdžiai
  - Serverless funkcijų įgyvendinimai

#### Funkcijos
- **Daugiaplatforminis palaikymas**: Diegimo ir konfigūracijos vadovai „Windows“, „macOS“ ir „Linux“
- **Skirtingi įgūdžių lygiai**: Turinys skirtas nuo studentų iki profesionalių kūrėjų
- **Praktinis dėmesys**: Praktiniai pavyzdžiai ir realaus pasaulio scenarijai
- **Išsamus aprėptis**: Nuo pagrindinių sąvokų iki pažangių įmonių modelių
- **Saugumo prioritetas**: Saugumo geriausios praktikos integruotos visame turinyje
- **Išlaidų optimizavimas**: Gairės ekonomiškiems diegimams ir išteklių valdymui

#### Dokumentacijos kokybė
- **Detalūs kodo pavyzdžiai**: Praktiniai, patikrinti kodo pavyzdžiai
- **Žingsnis po žingsnio instrukcijos**: Aiškios, veiksmingos gairės
- **Išsamus klaidų tvarkymas**: Trikčių šalinimas dažniausiai pasitaikančioms problemoms
- **Geriausių praktikų integracija**: Pramonės standartai ir rekomendacijos
- **Versijų suderinamumas**: Naujausia informacija apie „Azure“ paslaugas ir „azd“ funkcijas

## Planuojami būsimi patobulinimai

### Versija 3.1.0 (Planuojama)
#### AI platformos plėtra
- **Daugelio modelių palaikymas**: Integracijos modeliai „Hugging Face“, „Azure Machine Learning“ ir individualiems modeliams
- **AI agentų karkasai**: Šablonai „LangChain“, „Semantic Kernel“ ir „AutoGen“ diegimams
- **Pažangūs RAG modeliai**: Vektorinės duomenų bazės galimybės už „Azure AI Search“ ribų (Pinecone, Weaviate ir kt.)
- **AI stebėjimas**: Patobulintas modelių našumo, žetonų naudojimo ir atsakymų kokybės stebėjimas

#### Kūrėjų patirtis
- **VS Code plėtinys**: Integruota AZD + AI Foundry kūrimo patirtis
- **GitHub Copilot integracija**: AI padedamas AZD šablonų generavimas
- **Interaktyvios pamokos**: Praktiniai kodavimo pratimai su automatine AI scenarijų patikra
- **Vaizdo turinys**: Papildomos vaizdo pamokos vizualiems mokiniams, orientuotos į AI diegimus

### Versija 4.0.0 (Planuojama)
#### Įmonių AI modeliai
- **Valdymo karkasas**: AI modelių valdymas, atitiktis ir audito pėdsakai
- **Daugiaklientinis AI**: Modeliai, skirti aptarnauti kelis klientus su izoliuotomis AI paslaugomis
- **Edge AI diegimas**: Integracija su „Azure IoT Edge“ ir konteinerių instancijomis
- **Hibridinis debesų AI**: Daugiadebesiniai ir hibridiniai AI darbo krūvių diegimo modeliai

#### Pažangios funkcijos
- **AI vamzdynų automatizavimas**: MLOps integracija su „Azure Machine Learning“ vamzdynais
- **Pažangus saugumas**: Zero-trust modeliai, privatūs galiniai taškai ir pažangi grėsmių apsauga
- **Našumo optimizavimas**: Pažangios derinimo ir mastelio strategijos didelio našumo AI programoms
- **Pasaulinis paskirstymas**: Turinio pristatymo ir kraštinių talpyklų modeliai AI programoms

### Versija 3.0.0 (Planuojama) - Pakeista dabartiniu leidimu
#### Siūlomi papildymai - Dabar įgyvendinti v3.0.0
- ✅ **AI orientuotas turinys**: Išsamus „Azure AI Foundry“ integravimas (Baigta)
- ✅ **Interaktyvios pamokos**: Praktinis AI dirbtuvių laboratorijos darbas (Baigta)
- ✅ **Pažangus saugumo modulis**: AI specifiniai saugumo modeliai (Baigta)
- ✅ **Našumo optimizavimas**: AI darbo krūvių derinimo strategijos (Baigta)

### Versija 2.1.0 (Planuojama) - Iš dalies įgyvendinta v3.0.0
#### Nedideli patobulinimai - Kai kurie baigti dabartiniame leidime
- ✅ **Papildomi pavyzdžiai**: AI orientuoti diegimo scenarijai (Baigta)
- ✅ **Išplėstas DUK**: AI specifiniai klausimai ir trikčių šalinimas (Baigta)
- **Įrankių integracija**: Patobulintos IDE ir redaktoriaus integracijos gairės
- ✅ **Stebėjimo plėtra**: AI specifiniai stebėjimo ir įspėjimo modeliai (Baigta)

#### Vis dar planuojama būsimam leidimui
- **Mobiliesiems pritaikyta dokumentacija**: Reaguojantis dizainas mobiliajam mokymuisi
- **Prieiga neprisijungus**: Atsisiunčiami dokumentacijos paketai
- **Patobulinta IDE integracija**: VS Code plėtinys AZD + AI darbo eigoms
- **Bendruomenės prietaisų skydelis**: Realaus laiko bendruomenės metrikos ir indėlio stebėjimas

## Prisidėjimas prie pakeitimų žurnalo

### Pakeitimų pranešimas
Prisidedant prie šio saugyklos, įsitikinkite, kad pakeitimų žurnalo įrašai apima:

1. **Versijos numeris**: laikantis semantinio versijavimo (major.minor.patch)
2. **Data**: leidimo arba atnaujinimo data YYYY-MM-DD formatu
3. **Kategorija**: Pridėta, Pakeista, Pasenusi, Pašalinta, Ištaisyta, Saugumas
4. **Aiškus aprašymas**: Trumpas aprašymas, kas buvo pakeista
5. **Poveikio vertinimas**: Kaip pakeitimai paveikia esamus vartotojus

### Pakeitimų kategorijos

#### Pridėta
- Naujos funkcijos, dokumentacijos skyriai ar galimybės
- Nauji pavyzdžiai, šablonai ar mokymosi ištekliai
- Papildomi įrankiai, scenarijai ar priemonės

#### Pakeista
- Esamų funkcijų ar dokumentacijos pakeitimai
- Atnaujinimai, skirti aiškumui ar tikslumui pagerinti
- Turinio ar organizacijos restruktūrizavimas

#### Pasenusi
- Funkcijos ar metodai, kurie yra palaipsniui naikinami
- Dokumentacijos skyriai, numatyti pašalinimui
- Metodai, turintys geresnių alternatyvų

#### Pašalinta
- Funkcijos, dokumentacija ar pavyzdžiai, kurie nebėra aktualūs
- Pasenusi informacija ar pasenę metodai
- Perteklinis ar sujungtas turinys

#### Ištaisyta
- Klaidų dokumentacijoje ar kode taisymai
- Praneštų problemų ar trūkumų sprendimas
- Tikslumo ar funkcionalumo patobulinimai

#### Saugumas
- Su saugumu susiję patobulinimai ar taisymai
- Atnaujinimai saugumo geriausioms praktikoms
- Saugumo pažeidžiamumų sprendimas

### Semantinio versijavimo gairės

#### Pagrindinė versija (X.0.0)
- Pakeitimai, reikalaujantys vartotojo veiksmų
- Reikšmingas turinio ar organizacijos restruktūrizavimas
- Pakeitimai, keičiantys pagrindinį požiūrį ar metodiką

#### Mažesnė versija (X.Y.0)
- Naujos funkcijos ar turinio papildymai
- Patobulinimai, išlaikantys atgalinį suderinamumą
- Papildomi pavyzdžiai, įrankiai ar ištekliai

#### Taisymo versija (X.Y.Z)
- Klaidų taisymai ir korekcijos
- Nedideli esamo turinio patobulinimai
- Paaiškinimai ir nedideli patobulinimai

## Bendruomenės atsiliepimai ir pasiūlymai

Mes aktyviai skatiname bendruomenės atsiliepimus, kad galėtume tobulinti šį mokymosi šaltinį:

### Kaip pateikti atsiliepimus
- **GitHub problemos**: Praneškite apie problemas arba siūlykite patobulinimus (laukiami AI specifiniai klausimai)
- **Discord diskusijos**: Dalinkitės idėjomis ir bendraukite su „Azure AI Foundry“ bendruomene
- **Pull Requests**: Tiesiogiai prisidėkite prie turinio tobulinimo, ypač AI šablonų ir vadovų
- **Azure AI Foundry Discord**: Dalyvaukite #Azure kanale diskusijoms apie AZD + AI
- **Bendruomenės forumai**: Dalyvaukite platesnėse „Azure“ kūrėjų diskusijose

### Atsiliepimų kategorijos
- **AI turinio tikslumas**: AI paslaugų integracijos ir diegimo informacijos pataisymai
- **Mokymosi patirtis**: Pasiūlymai, kaip pagerinti AI kūrėjų mokymosi eigą
- **Trūkstamas AI turinys**: Prašymai dėl papildomų AI šablonų, modelių ar pavyzdžių
- **Prieinamumas**: Patobulinimai įvairiems mokymosi poreikiams
- **AI įrankių integracija**: Pasiūlymai geresnei AI kūrimo darbo eigai
- **Gamybos AI modeliai**: Prašymai dėl įmonių AI diegimo modelių

### Atsakymo įsipareigojimas
- **Problemos atsakymas**: Per 48 valandas nuo pranešimo apie problemas
- **Funkcijų prašymai**: Įvertinimas per savaitę
- **Bendruomenės indėlis**: Peržiūra per savaitę
- **Saugumo problemos**: Skubus prioritetas su pagreitintu atsakymu

## Priežiūros tvarkaraštis

### Reguliarūs atnaujinimai
- **Mėnesiniai peržiūros**: Turinio tikslumo ir nuorodų patikra
- **Ketvirtiniai atnaujinimai**: Pagrindiniai turinio papildymai ir patobulinimai
- **Pusmetinės peržiūros**: Išsamus restruktūrizavimas ir patobulinimas
- **Metiniai leidimai**: Pagrindiniai versijų atnaujinimai su reikšmingais patobulinimais

### Stebėjimas ir kokybės užtikrinimas
- **Automatiniai testai**: Reguliari kodo pavyzdžių ir nuorodų patikra
- **Bendruomenės atsiliepimų integracija**: Reguliarus vartotojų pasiūlymų įtraukimas
- **Technologijų atnaujinimai**: Suderinimas su naujausiomis „Azure“ paslaugomis ir „azd“ leidimais
- **Prieinamumo auditai**: Reguliari peržiūra, siekiant įtraukti dizaino principus

## Versijų palaikymo politika

### Dabartinės versijos palaikymas
- **Naujausia pagrindinė versija**: Pilnas palaikymas su reguliariais atnaujinimais
- **Ankstesnė pagrindinė versija**: Saugumo atnaujinimai ir kritiniai pataisymai 12 mėnesių
- **Senos versijos**: Tik bendruomenės palaikymas, oficialių atnaujinimų nėra

### Migracijos gairės
Kai išleidžiamos pagrindinės versijos, mes teikiame:
- **Migracijos vadovus**: Žingsnis po žingsnio perėjimo instrukcijas
- **Suderinamumo pastabas**: Informacija apie esminius pakeitimus
- **Įrankių palaikymą**: Scenarijus ar priemones, padedančias migracijoje
- **Bendruomenės palaikymą**: Specialūs forumai migracijos klausimams

---

**Navigacija**
- **Ankstesnė pamoka**: [Mokymosi vadovas](resources/study-guide.md)
- **Kita pamoka**: Grįžti į [Pagrindinį README](README.md)

**Būkite informuoti**: Stebėkite šią saugyklą, kad gautumėte pranešimus apie naujus leidimus ir svarbius mokymosi medžiagos atnaujinimus.

---

**Atsakomybės atsisakymas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus interpretavimus, atsiradusius naudojant šį vertimą.