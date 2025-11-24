<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-24T09:01:20+00:00",
  "source_file": "changelog.md",
  "language_code": "lt"
}
-->
# Keitimo žurnalas - AZD pradedantiesiems

## Įvadas

Šis keitimo žurnalas dokumentuoja visus svarbius pakeitimus, atnaujinimus ir patobulinimus AZD pradedantiesiems saugykloje. Mes laikomės semantinio versijavimo principų ir palaikome šį žurnalą, kad padėtume vartotojams suprasti, kas pasikeitė tarp versijų.

## Mokymosi tikslai

Peržiūrėję šį keitimo žurnalą, jūs:
- Sužinosite apie naujas funkcijas ir turinio papildymus
- Suprasite patobulinimus, atliktus esamoje dokumentacijoje
- Seksite klaidų taisymus ir užtikrinsite tikslumą
- Stebėsite mokymosi medžiagos evoliuciją laikui bėgant

## Mokymosi rezultatai

Peržiūrėję keitimo žurnalo įrašus, jūs galėsite:
- Atpažinti naują turinį ir mokymosi išteklius
- Suprasti, kurios skiltys buvo atnaujintos ar patobulintos
- Planuoti savo mokymosi kelią pagal naujausią medžiagą
- Teikti atsiliepimus ir pasiūlymus būsimam tobulinimui

## Versijų istorija

### [v3.8.0] - 2025-11-19

#### Išplėstinė dokumentacija: stebėjimas, saugumas ir kelių agentų modeliai
**Ši versija prideda išsamias A lygio pamokas apie Application Insights integraciją, autentifikavimo modelius ir kelių agentų koordinavimą gamybos diegimams.**

#### Pridėta
- **📊 Application Insights integracijos pamoka**: `docs/pre-deployment/application-insights.md`:
  - AZD orientuotas diegimas su automatiniu paruošimu
  - Pilni Bicep šablonai Application Insights + Log Analytics
  - Veikiantys Python programos pavyzdžiai su pritaikyta telemetrija (1 200+ eilučių)
  - AI/LLM stebėjimo modeliai (Azure OpenAI žetonų/kainų sekimas)
  - 6 Mermaid diagramos (architektūra, paskirstytas sekimas, telemetrijos srautas)
  - 3 praktinės užduotys (įspėjimai, prietaisų skydeliai, AI stebėjimas)
  - Kusto užklausų pavyzdžiai ir kaštų optimizavimo strategijos
  - Tiesioginė metrikų transliacija ir realaus laiko derinimas
  - 40-50 minučių mokymosi laikas su gamybai paruoštais modeliais

- **🔐 Autentifikavimo ir saugumo modelių pamoka**: `docs/getting-started/authsecurity.md`:
  - 3 autentifikavimo modeliai (prisijungimo eilutės, Key Vault, valdomas identitetas)
  - Pilni Bicep infrastruktūros šablonai saugiems diegimams
  - Node.js programos kodas su Azure SDK integracija
  - 3 pilnos užduotys (valdomo identiteto įjungimas, vartotojo priskirtas identitetas, Key Vault rotacija)
  - Saugumo geriausios praktikos ir RBAC konfigūracijos
  - Trikčių šalinimo vadovas ir kaštų analizė
  - Gamybai paruošti autentifikavimo modeliai be slaptažodžių

- **🤖 Kelių agentų koordinavimo modelių pamoka**: `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinavimo modeliai (sekvencinis, lygiagretus, hierarchinis, įvykių pagrindu, konsensusas)
  - Pilnas orkestratoriaus paslaugos įgyvendinimas (Python/Flask, 1 500+ eilučių)
  - 3 specializuoti agentai (Tyrėjas, Rašytojas, Redaktorius)
  - Service Bus integracija pranešimų eilėms
  - Cosmos DB būsenos valdymas paskirstytoms sistemoms
  - 6 Mermaid diagramos, rodančios agentų sąveiką
  - 3 pažangios užduotys (laiko limitų valdymas, pakartojimo logika, grandinės pertraukiklis)
  - Kaštų suskirstymas ($240-565/mėn.) su optimizavimo strategijomis
  - Application Insights integracija stebėjimui

#### Patobulinta
- **Prieš diegimą skyrius**: Dabar apima išsamius stebėjimo ir koordinavimo modelius
- **Pradžios skyrius**: Patobulintas profesionaliais autentifikavimo modeliais
- **Gamybos pasirengimas**: Visiška aprėptis nuo saugumo iki stebėjimo
- **Kurso planas**: Atnaujintas, kad nurodytų naujas pamokas 3 ir 6 skyriuose

#### Pakeista
- **Mokymosi progresija**: Geresnė saugumo ir stebėjimo integracija visame kurse
- **Dokumentacijos kokybė**: Nuoseklūs A lygio standartai (95-97%) naujose pamokose
- **Gamybos modeliai**: Visiška aprėptis nuo pradžios iki pabaigos įmonių diegimams

#### Pagerinta
- **Kūrėjų patirtis**: Aiškus kelias nuo kūrimo iki gamybos stebėjimo
- **Saugumo standartai**: Profesionalūs autentifikavimo ir paslapčių valdymo modeliai
- **Stebėjimas**: Visiška Application Insights integracija su AZD
- **AI darbo krūviai**: Specializuotas stebėjimas Azure OpenAI ir kelių agentų sistemoms

#### Patvirtinta
- ✅ Visos pamokos apima pilną veikiantį kodą (ne fragmentus)
- ✅ Mermaid diagramos vizualiam mokymuisi (iš viso 19 per 3 pamokas)
- ✅ Praktinės užduotys su patikrinimo žingsniais (iš viso 9)
- ✅ Gamybai paruošti Bicep šablonai, diegiami per `azd up`
- ✅ Kaštų analizė ir optimizavimo strategijos
- ✅ Trikčių šalinimo vadovai ir geriausios praktikos
- ✅ Žinių patikrinimo punktai su patikrinimo komandomis

#### Dokumentacijos vertinimo rezultatai
- **docs/pre-deployment/application-insights.md**: - Išsamus stebėjimo vadovas
- **docs/getting-started/authsecurity.md**: - Profesionalūs saugumo modeliai
- **docs/pre-deployment/coordination-patterns.md**: - Pažangios kelių agentų architektūros
- **Bendras naujas turinys**: - Nuoseklūs aukštos kokybės standartai

#### Techninis įgyvendinimas
- **Application Insights**: Log Analytics + pritaikyta telemetrija + paskirstytas sekimas
- **Autentifikavimas**: Valdomas identitetas + Key Vault + RBAC modeliai
- **Kelių agentų modeliai**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Stebėjimas**: Tiesioginė metrikų transliacija + Kusto užklausos + įspėjimai + prietaisų skydeliai
- **Kaštų valdymas**: Mėginių ėmimo strategijos, saugojimo politikos, biudžeto kontrolė

### [v3.7.0] - 2025-11-19

#### Dokumentacijos kokybės patobulinimai ir naujas Azure OpenAI pavyzdys
**Ši versija pagerina dokumentacijos kokybę visoje saugykloje ir prideda pilną Azure OpenAI diegimo pavyzdį su GPT-4 pokalbių sąsaja.**

#### Pridėta
- **🤖 Azure OpenAI pokalbių pavyzdys**: Pilnas GPT-4 diegimas su veikiančiu įgyvendinimu `examples/azure-openai-chat/`:
  - Pilna Azure OpenAI infrastruktūra (GPT-4 modelio diegimas)
  - Python komandinės eilutės pokalbių sąsaja su pokalbių istorija
  - Key Vault integracija saugiam API raktų saugojimui
  - Žetonų naudojimo sekimas ir kaštų įvertinimas
  - Greičio ribojimas ir klaidų valdymas
  - Išsamus README su 35-45 minučių diegimo vadovu
  - 11 gamybai paruoštų failų (Bicep šablonai, Python programa, konfigūracija)
- **📚 Dokumentacijos užduotys**: Pridėtos praktinės užduotys konfigūracijos vadovui:
  - Užduotis 1: Kelių aplinkų konfigūracija (15 minučių)
  - Užduotis 2: Paslapčių valdymo praktika (10 minučių)
  - Aiškūs sėkmės kriterijai ir patikrinimo žingsniai
- **✅ Diegimo patikrinimas**: Pridėtas patikrinimo skyrius diegimo vadovui:
  - Sveikatos patikrinimo procedūros
  - Sėkmės kriterijų kontrolinis sąrašas
  - Tikėtini rezultatai visoms diegimo komandoms
  - Greitos trikčių šalinimo nuorodos

#### Patobulinta
- **examples/README.md**: Atnaujinta iki A lygio kokybės (93%):
  - Pridėtas azure-openai-chat į visas atitinkamas skiltis
  - Atnaujintas vietinių pavyzdžių skaičius nuo 3 iki 4
  - Pridėta į AI programų pavyzdžių lentelę
  - Integruota į Tarpinių vartotojų greitą pradžią
  - Pridėta į Microsoft Foundry šablonų skyrių
  - Atnaujinta palyginimo matrica ir technologijų paieškos skiltys
- **Dokumentacijos kokybė**: Pagerinta nuo B+ (87%) iki A- (92%) visame docs aplanke:
  - Pridėti tikėtini rezultatai prie svarbių komandų pavyzdžių
  - Įtraukti patikrinimo žingsniai konfigūracijos pakeitimams
  - Patobulintas praktinis mokymasis su praktinėmis užduotimis

#### Pakeista
- **Mokymosi progresija**: Geresnė AI pavyzdžių integracija tarpiniams mokiniams
- **Dokumentacijos struktūra**: Daugiau veiksmingų užduočių su aiškiais rezultatais
- **Patikrinimo procesas**: Aiškūs sėkmės kriterijai pridėti prie pagrindinių darbo eigų

#### Pagerinta
- **Kūrėjų patirtis**: Azure OpenAI diegimas dabar trunka 35-45 minutes (vietoj 60-90 sudėtingesnėms alternatyvoms)
- **Kaštų skaidrumas**: Aiškūs kaštų įvertinimai ($50-200/mėn.) Azure OpenAI pavyzdžiui
- **Mokymosi kelias**: AI kūrėjai turi aiškų įėjimo tašką su azure-openai-chat
- **Dokumentacijos standartai**: Nuoseklūs tikėtini rezultatai ir patikrinimo žingsniai

#### Patvirtinta
- ✅ Azure OpenAI pavyzdys visiškai veikia su `azd up`
- ✅ Visi 11 įgyvendinimo failų sintaksiškai teisingi
- ✅ README instrukcijos atitinka tikrąją diegimo patirtį
- ✅ Dokumentacijos nuorodos atnaujintos daugiau nei 8 vietose
- ✅ Pavyzdžių indeksas tiksliai atspindi 4 vietinius pavyzdžius
- ✅ Nėra pasikartojančių išorinių nuorodų lentelėse
- ✅ Visos navigacijos nuorodos teisingos

#### Techninis įgyvendinimas
- **Azure OpenAI architektūra**: GPT-4 + Key Vault + Container Apps modelis
- **Saugumas**: Paruoštas valdomas identitetas, paslaptys Key Vault
- **Stebėjimas**: Application Insights integracija
- **Kaštų valdymas**: Žetonų sekimas ir naudojimo optimizavimas
- **Diegimas**: Viena `azd up` komanda visam nustatymui

### [v3.6.0] - 2025-11-19

#### Didelis atnaujinimas: konteinerių programų diegimo pavyzdžiai
**Ši versija pristato išsamius, gamybai paruoštus konteinerių programų diegimo pavyzdžius naudojant Azure Developer CLI (AZD), su pilna dokumentacija ir integracija į mokymosi kelią.**

#### Pridėta
- **🚀 Konteinerių programų pavyzdžiai**: Nauji vietiniai pavyzdžiai `examples/container-app/`:
  - [Pagrindinis vadovas](examples/container-app/README.md): Išsamus konteinerizuotų diegimų apžvalga, greita pradžia, gamyba ir pažangūs modeliai
  - [Paprastas Flask API](../../examples/container-app/simple-flask-api): Pradedantiesiems pritaikytas REST API su mastelio mažinimu iki nulio, sveikatos patikromis, stebėjimu ir trikčių šalinimu
  - [Mikropaslaugų architektūra](../../examples/container-app/microservices): Gamybai paruoštas daugiapaslaugis diegimas (API vartai, Produktas, Užsakymas, Vartotojas, Pranešimas), asinchroninis pranešimų siuntimas, Service Bus, Cosmos DB, Azure SQL, paskirstytas sekimas, mėlynos-žalios/kanarėlių diegimas
- **Geriausios praktikos**: Saugumo, stebėjimo, kaštų optimizavimo ir CI/CD gairės konteinerizuotoms darbo apkrovoms
- **Kodo pavyzdžiai**: Pilnas `azure.yaml`, Bicep šablonai ir daugiakalbiai paslaugų įgyvendinimai (Python, Node.js, C#, Go)
- **Testavimas ir trikčių šalinimas**: Pilni testavimo scenarijai, stebėjimo komandos, trikčių šalinimo gairės

#### Pakeista
- **README.md**: Atnaujinta, kad būtų rodomi ir susieti nauji konteinerių programų pavyzdžiai skiltyje "Vietiniai pavyzdžiai - konteinerių programos"
- **examples/README.md**: Atnaujinta, kad būtų pabrėžti konteinerių programų pavyzdžiai, pridėti palyginimo matricos įrašai ir atnaujintos technologijų/architektūros nuorodos
- **Kurso planas ir mokymosi vadovas**: Atnaujinta, kad būtų nurodyti nauji konteinerių programų pavyzdžiai ir diegimo modeliai atitinkamuose skyriuose

#### Patvirtinta
- ✅ Visi nauji pavyzdžiai diegiami su `azd up` ir atitinka geriausias praktikas
- ✅ Dokumentacijos kryžminės nuorodos ir navigacija atnaujintos
- ✅ Pavyzdžiai apima nuo pradedančiųjų iki pažangių scenarijų, įskaitant gamybos mikropaslaugas

#### Pastabos
- **Apimtis**: Tik anglų kalbos dokumentacija ir pavyzdžiai
- **Kiti žingsniai**: Ateityje išplėsti papildomais pažangiais konteinerių modeliais ir CI/CD automatizavimu

### [v3.5.0] - 2025-11-19

#### Produkto pervadinimas: Microsoft Foundry
**Ši versija įgyvendina išsamų produkto pavadinimo pakeitimą iš "Azure AI Foundry" į "Microsoft Foundry" visoje anglų kalbos dokumentacijoje, atspindint oficialų Microsoft pervadinimą.**

#### Pakeista
- **🔄 Produkto pavadinimo atnaujinimas**: Visiškas pervadinimas iš "Azure AI Foundry" į "Microsoft Foundry"
  - Atnaujintos visos nuorodos anglų kalbos dokumentacijoje `docs/` aplanke
  - Pervadintas aplankas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pervadintas failas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Iš viso: 23 turinio nuorodos atnaujintos 7 dokumentacijos failuose

- **📁 Aplankų struktūros pakeitimai**:
  - `docs/ai-foundry/` pervadintas į `docs/microsoft-foundry/`
  - Visos kryžminės nu
- **Dirbtuvės**: Dirbtuvių medžiaga (`workshop/`) šiame leidime neatnaujinta
- **Pavyzdžiai**: Pavyzdiniai failai gali vis dar naudoti senus pavadinimus (bus ištaisyta būsimame atnaujinime)
- **Išorinės nuorodos**: Išorinės URL ir GitHub saugyklos nuorodos lieka nepakitusios

#### Migracijos vadovas bendradarbiams
Jei turite vietines šakas ar dokumentaciją, kuri remiasi sena struktūra:
1. Atnaujinkite aplankų nuorodas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atnaujinkite failų nuorodas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Pakeiskite produkto pavadinimą: „Azure AI Foundry“ → „Microsoft Foundry“
4. Patikrinkite, ar visos vidinės dokumentacijos nuorodos vis dar veikia

---

### [v3.4.0] - 2025-10-24

#### Infrastruktūros peržiūros ir patvirtinimo patobulinimai
**Ši versija pristato išsamų naujos „Azure Developer CLI“ peržiūros funkcijos palaikymą ir pagerina dirbtuvių naudotojų patirtį.**

#### Pridėta
- **🧪 azd provision --preview funkcijos dokumentacija**: Išsamus naujos infrastruktūros peržiūros galimybės aprašymas
  - Komandų nuorodos ir naudojimo pavyzdžiai atmintinėje
  - Detali integracija į diegimo vadovą su naudojimo atvejais ir privalumais
  - Prieš diegimą atliekamų patikrinimų integracija saugesniam diegimui
  - Pradžios vadovo atnaujinimai su saugumo pirmumo praktika
- **🚧 Dirbtuvių būsenos baneris**: Profesionalus HTML baneris, nurodantis dirbtuvių kūrimo būseną
  - Gradientinis dizainas su statybos indikatoriais aiškiam naudotojų informavimui
  - Paskutinio atnaujinimo laiko žyma skaidrumui
  - Mobiliesiems pritaikytas dizainas visų tipų įrenginiams

#### Patobulinta
- **Infrastruktūros saugumas**: Peržiūros funkcionalumas integruotas visoje diegimo dokumentacijoje
- **Prieš diegimą atliekamas patvirtinimas**: Automatiniai scenarijai dabar apima infrastruktūros peržiūros testavimą
- **Kūrėjų darbo eiga**: Atnaujintos komandų sekos, įtraukiant peržiūrą kaip geriausią praktiką
- **Dirbtuvių patirtis**: Aiškiai nustatyti lūkesčiai naudotojams dėl turinio kūrimo būsenos

#### Pakeista
- **Diegimo geriausios praktikos**: Dabar rekomenduojama peržiūros pirmumo darbo eiga
- **Dokumentacijos eiga**: Infrastruktūros patvirtinimas perkeltas į ankstesnį mokymosi proceso etapą
- **Dirbtuvių pateikimas**: Profesionalus būsenos komunikavimas su aiškiu kūrimo grafiku

#### Pagerinta
- **Saugumo pirmumo požiūris**: Dabar infrastruktūros pakeitimus galima patvirtinti prieš diegimą
- **Komandos bendradarbiavimas**: Peržiūros rezultatus galima dalintis peržiūrai ir patvirtinimui
- **Išlaidų supratimas**: Geresnis resursų išlaidų supratimas prieš diegimą
- **Rizikos mažinimas**: Sumažinta diegimo klaidų tikimybė per išankstinį patvirtinimą

#### Techninė įgyvendinimas
- **Daugiadokumentinė integracija**: Peržiūros funkcija dokumentuota 4 pagrindiniuose failuose
- **Komandų šablonai**: Nuosekli sintaksė ir pavyzdžiai visoje dokumentacijoje
- **Geriausios praktikos integracija**: Peržiūra įtraukta į patvirtinimo darbo eigas ir scenarijus
- **Vizualiniai indikatoriai**: Aiškūs NAUJOS funkcijos žymėjimai atradimui

#### Dirbtuvių infrastruktūra
- **Būsenos komunikavimas**: Profesionalus HTML baneris su gradientiniu stiliumi
- **Naudotojo patirtis**: Aiški kūrimo būsenos informacija užkerta kelią painiavai
- **Profesionalus pateikimas**: Išlaikomas saugyklos patikimumas, nustatant lūkesčius
- **Grafiko skaidrumas**: 2025 m. spalio mėn. paskutinio atnaujinimo laiko žyma atsakomybei

### [v3.3.0] - 2025-09-24

#### Patobulinta dirbtuvių medžiaga ir interaktyvi mokymosi patirtis
**Ši versija pristato išsamią dirbtuvių medžiagą su naršyklėje veikiančiais interaktyviais vadovais ir struktūrizuotais mokymosi keliais.**

#### Pridėta
- **🎥 Interaktyvus dirbtuvių vadovas**: Naršyklėje veikianti dirbtuvių patirtis su MkDocs peržiūros galimybe
- **📝 Struktūrizuotos dirbtuvių instrukcijos**: 7 žingsnių vadovaujamas mokymosi kelias nuo atradimo iki pritaikymo
  - 0-Įvadas: Dirbtuvių apžvalga ir nustatymas
  - 1-Pasirinkti-AI-Šabloną: Šablonų atradimo ir pasirinkimo procesas
  - 2-Patvirtinti-AI-Šabloną: Diegimo ir patvirtinimo procedūros
  - 3-Išskaidyti-AI-Šabloną: Šablono architektūros supratimas
  - 4-Konfigūruoti-AI-Šabloną: Konfigūravimas ir pritaikymas
  - 5-Pritaikyti-AI-Šabloną: Pažangūs pakeitimai ir iteracijos
  - 6-Infrastruktūros-Išardymas: Valymas ir resursų valdymas
  - 7-Uždarymas: Santrauka ir tolesni žingsniai
- **🛠️ Dirbtuvių įrankiai**: MkDocs konfigūracija su Material tema geresnei mokymosi patirčiai
- **🎯 Praktinis mokymosi kelias**: 3 žingsnių metodologija (Atradimas → Diegimas → Pritaikymas)
- **📱 GitHub Codespaces integracija**: Sklandi kūrimo aplinkos sąranka

#### Patobulinta
- **AI dirbtuvių laboratorija**: Išplėsta su išsamia 2-3 valandų struktūrizuota mokymosi patirtimi
- **Dirbtuvių dokumentacija**: Profesionalus pateikimas su navigacija ir vizualiniais elementais
- **Mokymosi progresija**: Aiškus žingsnis po žingsnio vadovavimas nuo šablono pasirinkimo iki diegimo gamyboje
- **Kūrėjų patirtis**: Integruoti įrankiai sklandžiai kūrimo darbo eigai

#### Pagerinta
- **Prieinamumas**: Naršyklėje veikianti sąsaja su paieška, kopijavimo funkcija ir temos perjungimu
- **Savarankiškas mokymasis**: Lanksti dirbtuvių struktūra, pritaikyta skirtingiems mokymosi tempams
- **Praktinis pritaikymas**: Realūs AI šablonų diegimo scenarijai
- **Bendruomenės integracija**: Discord integracija dirbtuvių palaikymui ir bendradarbiavimui

#### Dirbtuvių funkcijos
- **Integruota paieška**: Greitas raktinių žodžių ir pamokų atradimas
- **Kodo blokų kopijavimas**: Užvedus pelę, galima kopijuoti visus kodo pavyzdžius
- **Temos perjungimas**: Tamsios/šviesios temos palaikymas pagal skirtingus pageidavimus
- **Vizualiniai elementai**: Ekrano nuotraukos ir diagramos geresniam supratimui
- **Pagalbos integracija**: Tiesioginė prieiga prie Discord bendruomenės palaikymo
- **Turinio pateikimas**: Pašalinti dekoratyviniai elementai, siekiant aiškesnio ir profesionalaus formatavimo
- **Nuorodų struktūra**: Atnaujintos visos vidinės nuorodos, kad palaikytų naują navigacijos sistemą

#### Patobulinta
- **Prieinamumas**: Pašalintos priklausomybės nuo jaustukų, kad būtų geriau suderinama su ekrano skaitytuvais
- **Profesionalus įvaizdis**: Švarus, akademinio stiliaus pateikimas, tinkamas įmonių mokymams
- **Mokymosi patirtis**: Struktūruotas požiūris su aiškiais kiekvienos pamokos tikslais ir rezultatais
- **Turinio organizavimas**: Geresnis loginis srautas ir ryšys tarp susijusių temų

### [v1.0.0] - 2025-09-09

#### Pradinis leidimas - Išsamus AZD mokymosi šaltinis

#### Pridėta
- **Pagrindinė dokumentacijos struktūra**
  - Pilnas pradedančiųjų vadovų serijos rinkinys
  - Išsamūs diegimo ir paruošimo dokumentai
  - Detalūs trikčių šalinimo ištekliai ir diagnostikos vadovai
  - Prieš diegimą patikrinimo įrankiai ir procedūros

- **Pradedančiųjų modulis**
  - AZD pagrindai: pagrindinės sąvokos ir terminologija
  - Diegimo vadovas: platformai specifinės nustatymo instrukcijos
  - Konfigūracijos vadovas: aplinkos nustatymas ir autentifikacija
  - Pirmojo projekto pamoka: žingsnis po žingsnio praktinis mokymasis

- **Diegimo ir paruošimo modulis**
  - Diegimo vadovas: pilna darbo eiga dokumentacija
  - Paruošimo vadovas: infrastruktūra kaip kodas su Bicep
  - Geriausios praktikos gamybos diegimams
  - Daugiafunkcinės architektūros modeliai

- **Prieš diegimą patikrinimo modulis**
  - Pajėgumų planavimas: Azure resursų prieinamumo patikrinimas
  - SKU pasirinkimas: išsamios paslaugų lygio gairės
  - Prieš skrydį patikrinimai: automatiniai patikrinimo scenarijai (PowerShell ir Bash)
  - Kainų įvertinimo ir biudžeto planavimo įrankiai

- **Trikčių šalinimo modulis**
  - Dažnos problemos: dažniausiai pasitaikančios problemos ir jų sprendimai
  - Diagnostikos vadovas: sistemingas trikčių šalinimo metodas
  - Pažangios diagnostikos technikos ir įrankiai
  - Našumo stebėjimas ir optimizavimas

- **Ištekliai ir nuorodos**
  - Komandų atmintinė: greita nuoroda į pagrindines komandas
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
- **Daugiaplatforminis palaikymas**: Diegimo ir konfigūracijos vadovai Windows, macOS ir Linux
- **Skirtingi įgūdžių lygiai**: Turinys skirtas studentams ir profesionaliems programuotojams
- **Praktinis požiūris**: Praktiniai pavyzdžiai ir realaus pasaulio scenarijai
- **Išsamus aprėptis**: Nuo pagrindinių sąvokų iki pažangių įmonių modelių
- **Saugumo prioritetas**: Saugumo geriausios praktikos integruotos visame turinyje
- **Kainų optimizavimas**: Gairės ekonomiškiems diegimams ir resursų valdymui

#### Dokumentacijos kokybė
- **Detalūs kodo pavyzdžiai**: Praktiniai, išbandyti kodo pavyzdžiai
- **Žingsnis po žingsnio instrukcijos**: Aiškios, veiksmingos gairės
- **Išsamus klaidų tvarkymas**: Trikčių šalinimas dažniausiai pasitaikančioms problemoms
- **Geriausių praktikų integracija**: Pramonės standartai ir rekomendacijos
- **Versijų suderinamumas**: Naujausia informacija apie Azure paslaugas ir azd funkcijas

## Planuojami būsimi patobulinimai

### Versija 3.1.0 (Planuojama)
#### AI platformos plėtra
- **Daugiamodelinis palaikymas**: Integracijos modeliai Hugging Face, Azure Machine Learning ir individualiems modeliams
- **AI agentų karkasai**: Šablonai LangChain, Semantic Kernel ir AutoGen diegimams
- **Pažangūs RAG modeliai**: Vektorinės duomenų bazės galimybės už Azure AI Search ribų (Pinecone, Weaviate ir kt.)
- **AI stebėjimas**: Patobulintas modelių našumo, žetonų naudojimo ir atsakymų kokybės stebėjimas

#### Programuotojų patirtis
- **VS Code plėtinys**: Integruota AZD + AI Foundry kūrimo patirtis
- **GitHub Copilot integracija**: AI padedamas AZD šablonų generavimas
- **Interaktyvios pamokos**: Praktiniai kodavimo pratimai su automatiniu AI scenarijų patikrinimu
- **Vaizdo turinys**: Papildomos vaizdo pamokos vizualiems mokiniams, orientuotos į AI diegimus

### Versija 4.0.0 (Planuojama)
#### Įmonių AI modeliai
- **Valdymo karkasas**: AI modelių valdymas, atitiktis ir audito pėdsakai
- **Daugiaklientinis AI**: Modeliai, skirti aptarnauti kelis klientus su izoliuotomis AI paslaugomis
- **Edge AI diegimas**: Integracija su Azure IoT Edge ir konteinerių instancijomis
- **Hibridinis debesų AI**: Daugiadebesų ir hibridinio diegimo modeliai AI darbo krūviams

#### Pažangios funkcijos
- **AI vamzdynų automatizavimas**: MLOps integracija su Azure Machine Learning vamzdynais
- **Pažangus saugumas**: Zero-trust modeliai, privatūs galiniai taškai ir pažangi grėsmių apsauga
- **Našumo optimizavimas**: Pažangūs derinimo ir mastelio strategijos didelio našumo AI programoms
- **Globalus paskirstymas**: Turinio pristatymo ir kraštinių talpyklų modeliai AI programoms

### Versija 3.0.0 (Planuojama) - Pakeista dabartiniu leidimu
#### Siūlomi papildymai - Dabar įgyvendinti v3.0.0
- ✅ **AI orientuotas turinys**: Išsamus Azure AI Foundry integravimas (Įgyvendinta)
- ✅ **Interaktyvios pamokos**: Praktinis AI dirbtuvių laboratorijos darbas (Įgyvendinta)
- ✅ **Pažangus saugumo modulis**: AI specifiniai saugumo modeliai (Įgyvendinta)
- ✅ **Našumo optimizavimas**: AI darbo krūvio derinimo strategijos (Įgyvendinta)

### Versija 2.1.0 (Planuojama) - Iš dalies įgyvendinta v3.0.0
#### Maži patobulinimai - Kai kurie įgyvendinti dabartiniame leidime
- ✅ **Papildomi pavyzdžiai**: AI orientuoti diegimo scenarijai (Įgyvendinta)
- ✅ **Išplėstas DUK**: AI specifiniai klausimai ir trikčių šalinimas (Įgyvendinta)
- **Įrankių integracija**: Patobulintos IDE ir redaktoriaus integracijos gairės
- ✅ **Stebėjimo plėtra**: AI specifiniai stebėjimo ir įspėjimo modeliai (Įgyvendinta)

#### Vis dar planuojama būsimam leidimui
- **Mobiliesiems pritaikyta dokumentacija**: Reaguojantis dizainas mobiliesiems mokymams
- **Prieiga neprisijungus**: Atsisiunčiami dokumentacijos paketai
- **Patobulinta IDE integracija**: VS Code plėtinys AZD + AI darbo eigoms
- **Bendruomenės prietaisų skydelis**: Realaus laiko bendruomenės metrikos ir indėlio stebėjimas

## Prisidėjimas prie pakeitimų žurnalo

### Pakeitimų pranešimas
Prisidedant prie šio saugyklos, įsitikinkite, kad pakeitimų žurnalo įrašai apima:

1. **Versijos numerį**: Laikantis semantinio versijavimo (major.minor.patch)
2. **Data**: Leidimo arba atnaujinimo data YYYY-MM-DD formatu
3. **Kategorija**: Pridėta, Pakeista, Pasenusi, Pašalinta, Ištaisyta, Saugumas
4. **Aiškus aprašymas**: Trumpas aprašymas, kas pasikeitė
5. **Poveikio vertinimas**: Kaip pakeitimai veikia esamus vartotojus

### Pakeitimų kategorijos

#### Pridėta
- Naujos funkcijos, dokumentacijos skyriai ar galimybės
- Nauji pavyzdžiai, šablonai ar mokymosi ištekliai
- Papildomi įrankiai, scenarijai ar naudingos priemonės

#### Pakeista
- Esamos funkcionalumo ar dokumentacijos modifikacijos
- Atnaujinimai, siekiant pagerinti aiškumą ar tikslumą
- Turinio ar organizacijos pertvarkymas

#### Pasenusi
- Funkcijos ar metodai, kurie yra palaipsniui šalinami
- Dokumentacijos skyriai, numatyti pašalinimui
- Metodai, turintys geresnių alternatyvų

#### Pašalinta
- Funkcijos, dokumentacija ar pavyzdžiai, kurie nebėra aktualūs
- Pasenusi informacija ar pasenę metodai
- Perteklinis ar sujungtas turinys

#### Ištaisyta
- Dokumentacijos ar kodo klaidų taisymai
- Praneštų problemų ar trikčių sprendimas
- Tikslumo ar funkcionalumo patobulinimai

#### Saugumas
- Su saugumu susiję patobulinimai ar taisymai
- Saugumo geriausių praktikų atnaujinimai
- Saugumo pažeidžiamumų sprendimas

### Semantinio versijavimo gairės

#### Pagrindinė versija (X.0.0)
- Pakeitimai, kurie reikalauja vartotojo veiksmų
- Reikšmingas turinio ar organizacijos pertvarkymas
- Pakeitimai, keičiantys pagrindinį požiūrį ar metodiką

#### Mažesnė versija (X.Y.0)
- Naujos funkcijos ar turinio papildymai
- Patobulinimai, išlaikantys atgalinį suderinamumą
- Papildomi pavyzdžiai, įrankiai ar ištekliai

#### Taisymo versija (X.Y.Z)
- Klaidų taisymai ir pataisymai
- Nedideli patobulinimai esamam turiniui
- Paaiškinimai ir maži patobulinimai

## Bendruomenės atsiliepimai ir pasiūlymai

Aktyviai skatiname bendruomenės atsiliepimus, kad pagerintume šį mokymosi šaltinį:

### Kaip pateikti atsiliepimus
- **GitHub problemos**: Praneškite apie problemas arba siūlykite patobulinimus (AI specifinės problemos laukiamos)
- **Discord diskusijos**: Dalinkitės idėjomis ir bendraukite su Azure AI Foundry bendruomene
- **Pull Requests**: Prisidėkite tiesioginiais turinio patobulinimais, ypač AI šablonais ir vadovais
- **Azure AI Foundry Discord**: Dalyvaukite #Azure kanale AZD + AI diskusijoms
- **Bendruomenės forumai**: Dalyvaukite platesnėse Azure programuotojų diskusijose

### Atsiliepimų kategorijos
- **AI turinio tikslumas**: Pataisymai AI paslaugų integracijos ir diegimo informacijoje
- **Mokymosi patirtis**: Pasiūlymai, kaip pagerinti AI programuotojų mokymosi eigą
- **Trūkstamas AI turinys**: Prašymai dėl papildomų AI šablonų, modelių ar pavyzdžių
- **Prieinamumas**: Patobulinimai įvairiems mokymosi poreikiams
- **AI įrankių integracija**: Pasiūlymai geresnei AI kūrimo darbo eigos integracijai
- **Gamybos AI modeliai**: Įmonių AI diegimo modelių prašymai

### Atsakymo įsipareigojimas
- **Problemos atsakymas**: Per 48 valandas nuo praneštų problemų
- **Funkcijų prašymai**: Įvertinimas per vieną savaitę
- **Bendruomenės indėlis**: Peržiūra per vieną savaitę
- **Saugumo problemos**: Skubus prioritetas su pagreitintu atsakymu

## Priežiūros tvarkaraštis

### Reguliarūs atnaujinimai
- **Mėnesiniai peržiūros**: Turinio tikslumo ir nuorodų patikrinimas
- **Ketvirtiniai atnaujinimai**: Pagrindiniai turinio papildymai ir patobulinimai
- **Pusmetiniai peržiūros**: Išsamus pertvarkymas ir patobulinimas
- **Metiniai leidimai**: Pagrindiniai versijų atnaujinimai su reikšmingais patobulinimais

### Stebėjimas ir kokybės užtikrinimas
- **Automatiniai testai**: Reguliarus kodo pavyzdžių ir nuorodų patikrinimas
- **Bendruomenės atsiliepimų integracija**: Reguliarus vartotojų pasiūlymų įtraukimas
- **Technologijų atnaujinimai**: Suderinimas su naujausiomis Azure paslaugomis ir azd leidimais
- **Prieinamumo auditai**: Reguliarus peržiūrėjimas, siekiant įtraukti dizaino principus

## Versijų palaikymo politika

### Dabartinės versijos palaikymas
- **Naujausia pagrindinė versija**: Pilnas palaikymas su reguliariais atnaujinimais
- **Ankstesnė pagrindinė versija**: Saugumo atnaujinimai ir kritiniai pataisymai 12 mėnesių
- **Senos versijos**: Tik bendruomenės palaikymas, be oficialių atnaujinimų

### Migracijos gairės
Kai išleidžiamos pagrindinės versijos, mes teikiame:
- **Migracijos vadovus**: Žingsnis po žingsnio perėjimo instrukcijas
- **Suderinamumo pastabas**: Informacija apie esminius pakeitimus
- **Įrankių palaikymą**: Scenarijus ar priemones, padedančias migracijoje
- **Bendruomenės palaikymą**: Specialius forumus migracijos klausimams

---

**Navigacija**
- **Ankstesnė pamoka**: [Studijų vadovas](resources/study-guide.md)
- **Kita pamoka**: Grįžti į [Pagrindinį README](README.md)

**Sekite naujienas**: Stebėkite šį saugyklą, kad gautumėte pranešimus apie naujus leidimus ir svarbius mokymosi medžiagos atnaujinimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->