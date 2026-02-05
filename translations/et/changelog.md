# Muudatuste logi - AZD Algajatele

## Sissejuhatus

See muudatuste logi dokumenteerib kõik olulised muudatused, uuendused ja täiustused AZD Algajatele repositooriumis. Järgime semantilise versioonimise põhimõtteid ja hoiame seda logi, et aidata kasutajatel mõista, mis on versioonide vahel muutunud.

## Õppimise eesmärgid

Selle muudatuste logi ülevaatamisega:
- Püsid kursis uute funktsioonide ja sisu lisandustega
- Mõistad olemasoleva dokumentatsiooni täiustusi
- Jälgid veaparandusi ja täpsuse tagamist
- Jälgid õppematerjalide arengut aja jooksul

## Õpitulemused

Pärast muudatuste logi kirjete ülevaatamist suudad:
- Tuvastada uusi õppematerjale ja ressursse
- Mõista, millised sektsioonid on uuendatud või täiustatud
- Planeerida oma õpiteekonda kõige ajakohasemate materjalide põhjal
- Anda tagasisidet ja ettepanekuid tulevaste täiustuste jaoks

## Versioonide ajalugu

### [v3.8.0] - 2025-11-19

#### Täiustatud dokumentatsioon: Jälgimine, turvalisus ja mitme agendi mustrid
**See versioon lisab põhjalikud A-kvaliteediga õppetunnid Application Insights integratsiooni, autentimismustrite ja mitme agendi koordineerimise kohta tootmises kasutamiseks.**

#### Lisatud
- **📊 Application Insights integratsiooni õppetund**: failis `docs/pre-deployment/application-insights.md`:
  - AZD-keskne juurutamine automaatse ettevalmistusega
  - Täielikud Bicep mallid Application Insights + Log Analytics jaoks
  - Töötavad Python rakendused kohandatud telemeetria (1200+ rida) abil
  - AI/LLM jälgimismustrid (Azure OpenAI tokeni/kulude jälgimine)
  - 6 Mermaid diagrammi (arhitektuur, hajutatud jälgimine, telemeetria voog)
  - 3 praktilist harjutust (hoiatused, juhtpaneelid, AI jälgimine)
  - Kusto päringute näited ja kulude optimeerimise strateegiad
  - Reaalajas metrikate voog ja otseveaotsing
  - 40-50 minutit õppimisaega tootmiskõlblike mustritega

- **🔐 Autentimise ja turvalisuse mustrite õppetund**: failis `docs/getting-started/authsecurity.md`:
  - 3 autentimismustrit (ühendusstringid, Key Vault, hallatud identiteet)
  - Täielikud Bicep infrastruktuuri mallid turvalisteks juurutusteks
  - Node.js rakenduse kood Azure SDK integratsiooniga
  - 3 täielikku harjutust (hallatud identiteedi lubamine, kasutaja määratud identiteet, Key Vault rotatsioon)
  - Turvalisuse parimad praktikad ja RBAC konfiguratsioonid
  - Tõrkeotsingu juhend ja kulude analüüs
  - Tootmiskõlblikud paroolivabad autentimismustrid

- **🤖 Mitme agendi koordineerimise mustrite õppetund**: failis `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineerimismustrit (järjestikune, paralleelne, hierarhiline, sündmuspõhine, konsensus)
  - Täielik orkestreerimisteenuse rakendus (Python/Flask, 1500+ rida)
  - 3 spetsialiseeritud agendi rakendust (Teadlane, Kirjutaja, Toimetaja)
  - Service Bus integratsioon sõnumite järjekorra haldamiseks
  - Cosmos DB oleku haldamine hajutatud süsteemide jaoks
  - 6 Mermaid diagrammi, mis näitavad agentide interaktsioone
  - 3 täiustatud harjutust (aja ületamise käsitlemine, uuesti proovimine, voolukatkesti loogika)
  - Kulude jaotus ($240-565/kuus) koos optimeerimisstrateegiatega
  - Application Insights integratsioon jälgimiseks

#### Täiustatud
- **Eeljuurutamise peatükk**: Nüüd sisaldab põhjalikke jälgimis- ja koordineerimismustreid
- **Alustamise peatükk**: Täiustatud professionaalsete autentimismustritega
- **Tootmisvalmidus**: Täielik katvus turvalisusest jälgitavuseni
- **Kursuse ülevaade**: Uuendatud viitama uutele õppetundidele peatükkides 3 ja 6

#### Muudetud
- **Õppimise progressioon**: Parem turvalisuse ja jälgimise integreerimine kogu kursuse jooksul
- **Dokumentatsiooni kvaliteet**: Järjekindel A-kvaliteet (95-97%) uutes õppetundides
- **Tootmismustrid**: Täielik katvus ettevõtte juurutuste jaoks

#### Parandatud
- **Arendaja kogemus**: Selge tee arendusest tootmise jälgimiseni
- **Turvalisuse standardid**: Professionaalsed mustrid autentimise ja saladuste haldamiseks
- **Jälgitavus**: Täielik Application Insights integratsioon AZD-ga
- **AI töökoormused**: Spetsialiseeritud jälgimine Azure OpenAI ja mitme agendi süsteemide jaoks

#### Kontrollitud
- ✅ Kõik õppetunnid sisaldavad täielikku töötavat koodi (mitte ainult fragmente)
- ✅ Mermaid diagrammid visuaalseks õppimiseks (kokku 19 kolme õppetunni jooksul)
- ✅ Praktilised harjutused koos kontrollsammudega (kokku 9)
- ✅ Tootmiskõlblikud Bicep mallid juurutatavad `azd up` abil
- ✅ Kulude analüüs ja optimeerimisstrateegiad
- ✅ Tõrkeotsingu juhendid ja parimad praktikad
- ✅ Teadmiste kontrollpunktid koos kontrollkäskudega

#### Dokumentatsiooni hindamistulemused
- **docs/pre-deployment/application-insights.md**: - Põhjalik jälgimisjuhend
- **docs/getting-started/authsecurity.md**: - Professionaalsed turvalisuse mustrid
- **docs/pre-deployment/coordination-patterns.md**: - Täiustatud mitme agendi arhitektuurid
- **Üldine uus sisu**: - Järjekindel kõrge kvaliteedi standard

#### Tehniline teostus
- **Application Insights**: Log Analytics + kohandatud telemeetria + hajutatud jälgimine
- **Autentimine**: Hallatud identiteet + Key Vault + RBAC mustrid
- **Mitme agent**: Service Bus + Cosmos DB + Container Apps + orkestreerimine
- **Jälgimine**: Reaalajas metrikad + Kusto päringud + hoiatused + juhtpaneelid
- **Kulude haldamine**: Proovivõtu strateegiad, säilituspoliitikad, eelarve kontroll

### [v3.7.0] - 2025-11-19

#### Dokumentatsiooni kvaliteedi täiustused ja uus Azure OpenAI näide
**See versioon täiustab dokumentatsiooni kvaliteeti kogu repositooriumis ja lisab täieliku Azure OpenAI juurutamise näite GPT-4 vestlusliidesega.**

#### Lisatud
- **🤖 Azure OpenAI vestlusnäide**: Täielik GPT-4 juurutamine töötava rakendusega `examples/azure-openai-chat/`:
  - Täielik Azure OpenAI infrastruktuur (GPT-4 mudeli juurutamine)
  - Python käsurea vestlusliides vestluste ajalooga
  - Key Vault integratsioon API võtme turvaliseks salvestamiseks
  - Tokeni kasutuse jälgimine ja kulude hindamine
  - Kiiruse piiramine ja veakäsitlus
  - Põhjalik README 35-45 minutilise juurutusjuhendiga
  - 11 tootmiskõlblikku faili (Bicep mallid, Python rakendus, konfiguratsioon)
- **📚 Dokumentatsiooni harjutused**: Lisatud praktilised harjutused konfiguratsioonijuhendisse:
  - Harjutus 1: Mitme keskkonna konfiguratsioon (15 minutit)
  - Harjutus 2: Saladuste haldamise praktika (10 minutit)
  - Selged edukriteeriumid ja kontrollsammud
- **✅ Juurutamise kontroll**: Lisatud kontrollsektsioon juurutusjuhendisse:
  - Tervisekontrolli protseduurid
  - Edukriteeriumide kontrollnimekiri
  - Oodatavad väljundid kõigile juurutuskäskudele
  - Kiire tõrkeotsingu viide

#### Täiustatud
- **examples/README.md**: Uuendatud A-kvaliteedile (93%):
  - Lisatud azure-openai-chat kõigisse asjakohastesse sektsioonidesse
  - Kohalike näidete arv uuendatud 3-lt 4-le
  - Lisatud AI rakenduste näidete tabelisse
  - Integreeritud vahekasutajate kiirstarti
  - Lisatud Microsoft Foundry Azure AI mallide sektsiooni
  - Uuendatud võrdlusmaatriks ja tehnoloogia leidmise sektsioonid
- **Dokumentatsiooni kvaliteet**: Parandatud B+ (87%) → A- (92%) kogu docs kaustas:
  - Lisatud oodatavad väljundid kriitiliste käskude näidetele
  - Kaasatud kontrollsammud konfiguratsioonimuudatuste jaoks
  - Täiustatud praktilist õppimist praktiliste harjutustega

#### Muudetud
- **Õppimise progressioon**: Parem AI näidete integreerimine vahekasutajatele
- **Dokumentatsiooni struktuur**: Rohkem tegevuspõhiseid harjutusi selgete tulemustega
- **Kontrolliprotsess**: Selged edukriteeriumid lisatud võtmevoogudele

#### Parandatud
- **Arendaja kogemus**: Azure OpenAI juurutamine võtab nüüd 35-45 minutit (vs 60-90 keerukate alternatiivide puhul)
- **Kulude läbipaistvus**: Selged kuluhinnangud ($50-200/kuus) Azure OpenAI näite jaoks
- **Õppimise tee**: AI arendajatel on selge alguspunkt azure-openai-chat näitega
- **Dokumentatsiooni standardid**: Järjekindlad oodatavad väljundid ja kontrollsammud

#### Kontrollitud
- ✅ Azure OpenAI näide täielikult funktsionaalne `azd up` abil
- ✅ Kõik 11 rakendusfaili süntaktiliselt korrektsed
- ✅ README juhised vastavad tegelikule juurutuskogemusele
- ✅ Dokumentatsiooni lingid uuendatud 8+ asukohas
- ✅ Näidete indeks kajastab täpselt 4 kohalikku näidet
- ✅ Tabelites pole dubleeritud välislinke
- ✅ Kõik navigeerimisviited korrektsed

#### Tehniline teostus
- **Azure OpenAI arhitektuur**: GPT-4 + Key Vault + Container Apps muster
- **Turvalisus**: Hallatud identiteet valmis, saladused Key Vaultis
- **Jälgimine**: Application Insights integratsioon
- **Kulude haldamine**: Tokeni jälgimine ja kasutuse optimeerimine
- **Juurutamine**: Üks `azd up` käsk täielikuks seadistuseks

### [v3.6.0] - 2025-11-19

#### Suur uuendus: konteinerirakenduste juurutamise näited
**See versioon tutvustab põhjalikke, tootmiskõlblikke konteinerirakenduste juurutamise näiteid Azure Developer CLI (AZD) abil, koos täieliku dokumentatsiooni ja integreerimisega õppeteekonda.**

#### Lisatud
- **🚀 Konteinerirakenduste näited**: Uued kohalikud näited `examples/container-app/`:
  - [Peajuhend](examples/container-app/README.md): Täielik ülevaade konteineriseeritud juurutustest, kiirstart, tootmine ja täiustatud mustrid
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api): Algajasõbralik REST API nullini skaleerimise, tervisekontrollide, jälgimise ja tõrkeotsinguga
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices): Tootmiskõlblik mitmeteenuse juurutus (API Gateway, Product, Order, User, Notification), asünkroonne sõnumside, Service Bus, Cosmos DB, Azure SQL, hajutatud jälgimine, sinine-roheline/kanaari juurutus
- **Parimad praktikad**: Turvalisus, jälgimine, kulude optimeerimine ja CI/CD juhised konteineriseeritud töökoormuste jaoks
- **Koodinäited**: Täielik `azure.yaml`, Bicep mallid ja mitmekeelsed teenuse rakendused (Python, Node.js, C#, Go)
- **Testimine ja tõrkeotsing**: Lõpuni teststsenaariumid, jälgimiskäsud, tõrkeotsingu juhised

#### Muudetud
- **README.md**: Uuendatud, et esile tuua ja linkida uusi konteinerirakenduste näiteid "Kohalikud näited - Konteinerirakendused" all
- **examples/README.md**: Uuendatud, et rõhutada konteinerirakenduste näiteid, lisada võrdlusmaatriksi kirjed ja uuendada tehnoloogia/arhitektuuri viiteid
- **Kursuse ülevaade ja õpijuhend**: Uuendatud, et viidata uutele konteinerirakenduste näidetele ja juurutusmustritele asjakohastes peatükkides

#### Kontrollitud
- ✅ Kõik uued näited juurutatavad `azd up` abil ja järgivad parimaid praktikaid
- ✅ Dokumentatsiooni ristviited ja navigeerimine uuendatud
- ✅ Näited katavad algaja kuni täiustatud stsenaariume, sealhulgas tootmismikroteenused

#### Märkused
- **Ulatus**: Ainult ingliskeelne dokumentatsioon ja näited
- **Järgmised sammud**: Laiendada täiendavate täiustatud konteinerimustrite ja CI/CD automatiseerimisega tulevastes versioonides

### [v3.5.0] - 2025-11-19

#### Toote ümberbrändimine: Microsoft Foundry
**See versioon rakendab ulatusliku tootenime muutuse "Azure AI Foundry" → "Microsoft Foundry" kõigis ingliskeelsetes dokumentides, kajastades Microsofti ametlikku ümberbrändimist.**

#### Muudetud
- **🔄 Toote nime uuendus**: Täielik ümberbrändimine "Azure AI Foundry" → "Microsoft Foundry"
  - Uuendatud kõik viited ingliskeelses dokumentatsioonis `docs/` kaustas
  - Kausta ümbernimetamine: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Faili ümbernimetamine: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kokku: 23 sisuviidet uuendatud 7 dokumentatsioonifailis

- **📁 Kaustastruktuuri muudatused**:
  - `docs/ai-foundry/` ümber nimetatud `docs/microsoft-foundry/`
  - Kõik ristviited uuendatud, et kajastada uut kaustastruktuuri
  - Navigeerimislingid kontrollitud kogu dokumentatsioonis

- **📄 Failide ümbernimetused**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kõik sisemised lingid uuendatud, et viidata uuele failinimele

#### Uuendatud failid
- **Peatüki dokumentatsioon** (7 faili):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigeerimislingi uuendust
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tootenime viite uuendust
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Juba kasutab Microsoft Foundry (varasematest uuendustest)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 viite uuendust (ülevaade, kogukonna tagasiside, dokumentatsioon)
  - `docs/getting-started/azd-basics.md` - 4 ristviite lingi uuendust
  - `docs/getting-started/first-project.md` - 2 peatüki navigeerimislingi uuendust
  - `docs/getting-started/installation.md` - 2 järgmise peatüki lingi uuendust
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 viite uuendust (navigeerimine, Discord kogukond)
  - `docs/troubleshooting/common-issues.md` - 
- **Töötuba**: Töötuba materjalid (`workshop/`) ei ole selles versioonis uuendatud
- **Näited**: Näidiste failid võivad endiselt viidata vananenud nimetustele (lahendatakse tulevases uuenduses)
- **Välised lingid**: Välised URL-id ja GitHubi repo viited jäävad muutmata

#### Üleminekujuhend panustajatele
Kui teil on kohalikud harud või dokumentatsioon, mis viitab vanale struktuurile:
1. Uuendage kaustaviited: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uuendage failiviited: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Asendage tootenimi: "Azure AI Foundry" → "Microsoft Foundry"
4. Kontrollige, et kõik sisemised dokumentatsiooni lingid töötaksid endiselt

---

### [v3.4.0] - 2025-10-24

#### Infrastruktuuri eelvaate ja valideerimise täiustused
**See versioon tutvustab ulatuslikku tuge uuele Azure Developer CLI eelvaate funktsioonile ja parandab töötoa kasutajakogemust.**

#### Lisatud
- **🧪 azd provision --preview funktsiooni dokumentatsioon**: Ulatuslik katvus uue infrastruktuuri eelvaate võimekuse kohta
  - Käskude viited ja kasutusnäited kiirjuhendis
  - Üksikasjalik integreerimine ettevalmistusjuhendisse koos kasutusjuhtude ja eelistega
  - Kontroll enne käivitamist turvalisema juurutamise valideerimiseks
  - Algajate juhendi uuendused turvalise juurutamise praktikatega
- **🚧 Töötoa oleku bänner**: Professionaalne HTML bänner, mis näitab töötoa arenduse olekut
  - Gradient disain koos ehituse indikaatoritega selgeks kasutajate teavitamiseks
  - Viimati uuendatud ajatempli lisamine läbipaistvuse tagamiseks
  - Mobiilile kohanduv disain kõikidele seadmetüüpidele

#### Täiustatud
- **Infrastruktuuri turvalisus**: Eelvaate funktsionaalsus integreeritud kogu juurutamise dokumentatsiooni
- **Enne juurutamist valideerimine**: Automaatne skriptide integreerimine infrastruktuuri eelvaate testimiseks
- **Arendaja töövoog**: Uuendatud käskude järjestused, mis sisaldavad eelvaadet parima praktikana
- **Töötoa kogemus**: Selged ootused kasutajatele sisu arenduse oleku kohta

#### Muudetud
- **Juurutamise parimad praktikad**: Eelvaate-esimene töövoog nüüd soovitatav lähenemine
- **Dokumentatsiooni voog**: Infrastruktuuri valideerimine viidud õppimisprotsessi varasemasse etappi
- **Töötoa esitlus**: Professionaalne oleku kommunikatsioon selge arenduse ajajoonega

#### Parandatud
- **Turvalisuse esikohale seadmine**: Infrastruktuuri muudatusi saab nüüd valideerida enne juurutamist
- **Meeskonna koostöö**: Eelvaate tulemusi saab jagada ülevaatamiseks ja kinnitamiseks
- **Kulude teadlikkus**: Parem arusaam ressursside kuludest enne ettevalmistust
- **Riskide vähendamine**: Vähendatud juurutamise ebaõnnestumisi tänu eelnevale valideerimisele

#### Tehniline teostus
- **Mitme dokumendi integreerimine**: Eelvaate funktsioon dokumenteeritud 4 põhifailis
- **Käskude mustrid**: Järjepidev süntaks ja näited kogu dokumentatsioonis
- **Parimate praktikate integreerimine**: Eelvaade lisatud valideerimise töövoogudesse ja skriptidesse
- **Visuaalsed indikaatorid**: Selged UUS funktsiooni märgistused avastatavuse parandamiseks

#### Töötoa infrastruktuur
- **Oleku kommunikatsioon**: Professionaalne HTML bänner gradient stiiliga
- **Kasutajakogemus**: Selge arenduse olek väldib segadust
- **Professionaalne esitlus**: Säilitab repo usaldusväärsuse, samal ajal ootusi seades
- **Ajajoone läbipaistvus**: Oktoober 2025 viimati uuendatud ajatempli lisamine vastutuse tagamiseks

### [v3.3.0] - 2025-09-24

#### Täiustatud töötoa materjalid ja interaktiivne õppimiskogemus
**See versioon tutvustab ulatuslikke töötoa materjale koos brauseripõhiste interaktiivsete juhendite ja struktureeritud õpiteedega.**

#### Lisatud
- **🎥 Interaktiivne töötoa juhend**: Brauseripõhine töötoa kogemus MkDocs eelvaate võimekusega
- **📝 Struktureeritud töötoa juhised**: 7-etapiline juhendatud õpitee avastamisest kohandamiseni
  - 0-Sissejuhatus: Töötoa ülevaade ja seadistamine
  - 1-Vali-AI-Mall: Malli avastamise ja valimise protsess
  - 2-Valideeri-AI-Mall: Juurutamise ja valideerimise protseduurid
  - 3-Lahuta-AI-Mall: Malli arhitektuuri mõistmine
  - 4-Seadista-AI-Mall: Konfiguratsioon ja kohandamine
  - 5-Kohanda-AI-Mall: Täiustatud muudatused ja iteratsioonid
  - 6-Infrastruktuuri lammutamine: Puhastamine ja ressursside haldamine
  - 7-Kokkuvõte: Kokkuvõte ja järgmised sammud
- **🛠️ Töötoa tööriistad**: MkDocs konfiguratsioon Material teemaga täiustatud õppimiskogemuse jaoks
- **🎯 Praktiline õpitee**: 3-etapiline metoodika (Avastamine → Juurutamine → Kohandamine)
- **📱 GitHub Codespaces integratsioon**: Sujuv arenduskeskkonna seadistamine

#### Täiustatud
- **AI Töötoa labor**: Laiendatud ulatusliku 2-3 tunni struktureeritud õpikogemusega
- **Töötoa dokumentatsioon**: Professionaalne esitlus koos navigeerimise ja visuaalsete abivahenditega
- **Õppimise progressioon**: Selge samm-sammuline juhend mallide valikust tootmise juurutamiseni
- **Arendaja kogemus**: Integreeritud tööriistad sujuvate arendustöövoogude jaoks

#### Parandatud
- **Juurdepääsetavus**: Brauseripõhine liides otsingu, kopeerimise funktsionaalsuse ja teema vahetamisega
- **Isetempoline õppimine**: Paindlik töötoa struktuur, mis arvestab erinevaid õppimiskiirusi
- **Praktiline rakendus**: Reaalsed AI mallide juurutamise stsenaariumid
- **Kogukonna integratsioon**: Discordi integratsioon töötoa toe ja koostöö jaoks

#### Töötoa funktsioonid
- **Sisseehitatud otsing**: Kiire märksõnade ja õppetundide avastamine
- **Kopeeri koodiplokid**: Hover-to-copy funktsionaalsus kõigi koodinäidete jaoks
- **Teema vahetus**: Tume/hele režiimi tugi erinevate eelistuste jaoks
- **Visuaalsed elemendid**: Ekraanipildid ja diagrammid parema mõistmise jaoks
- **Abi integratsioon**: Otsene Discordi juurdepääs kogukonna toetuseks

### [v3.2.0] - 2025-09-17

#### Suur navigeerimise ümberstruktureerimine ja peatükkidel põhinev õppimissüsteem
**See versioon tutvustab ulatuslikku peatükkidel põhinevat õppimisstruktuuri koos täiustatud navigeerimisega kogu repo ulatuses.**

#### Lisatud
- **📚 Peatükkidel põhinev õppimissüsteem**: Kogu kursus ümberstruktureeritud 8 progressiivseks õppepeatükiks
  - Peatükk 1: Alused ja kiire algus (⭐ - 30-45 min)
  - Peatükk 2: AI-Esimene arendus (⭐⭐ - 1-2 tundi)
  - Peatükk 3: Konfiguratsioon ja autentimine (⭐⭐ - 45-60 min)
  - Peatükk 4: Infrastruktuur kui kood ja juurutamine (⭐⭐⭐ - 1-1.5 tundi)
  - Peatükk 5: Multi-agent AI lahendused (⭐⭐⭐⭐ - 2-3 tundi)
  - Peatükk 6: Enne juurutamist valideerimine ja planeerimine (⭐⭐ - 1 tund)
  - Peatükk 7: Tõrkeotsing ja silumine (⭐⭐ - 1-1.5 tundi)
  - Peatükk 8: Tootmine ja ettevõtte mustrid (⭐⭐⭐⭐ - 2-3 tundi)
- **📚 Ulatuslik navigeerimissüsteem**: Järjepidevad navigeerimise päised ja jalused kogu dokumentatsioonis
- **🎯 Progressi jälgimine**: Kursuse lõpetamise kontrollnimekiri ja õppe kinnitamise süsteem
- **🗺️ Õppimise tee juhendamine**: Selged alguspunktid erinevate kogemustasemetega ja eesmärkidega
- **🔗 Ristviited navigeerimisel**: Seotud peatükid ja eeltingimused selgelt lingitud

#### Täiustatud
- **README struktuur**: Muudetud struktureeritud õppeplatvormiks peatükkidel põhineva organisatsiooniga
- **Dokumentatsiooni navigeerimine**: Iga leht sisaldab nüüd peatüki konteksti ja progressiooni juhendamist
- **Mallide organisatsioon**: Näited ja mallid kaardistatud vastavatele õppepeatükkidele
- **Ressursside integratsioon**: Kiirjuhendid, KKK-d ja õppejuhendid seotud vastavate peatükkidega
- **Töötoa integratsioon**: Praktilised laborid kaardistatud mitme peatüki õppeeesmärkidega

#### Muudetud
- **Õppimise progressioon**: Liikunud lineaarse dokumentatsiooni juurest paindliku peatükkidel põhineva õppimise juurde
- **Konfiguratsiooni paigutus**: Konfiguratsiooni juhend ümber paigutatud peatükiks 3 parema õppevoo jaoks
- **AI sisu integratsioon**: Parem AI-spetsiifilise sisu integreerimine kogu õppeprotsessi jooksul
- **Tootmise sisu**: Täiustatud mustrid konsolideeritud peatükiks 8 ettevõtte õppijatele

#### Parandatud
- **Kasutajakogemus**: Selged navigeerimise leivapuru ja peatüki progressiooni indikaatorid
- **Juurdepääsetavus**: Järjepidevad navigeerimise mustrid lihtsamaks kursuse läbimiseks
- **Professionaalne esitlus**: Ülikooli stiilis kursuse struktuur sobilik akadeemiliseks ja ettevõtte koolituseks
- **Õppimise efektiivsus**: Vähenenud aeg asjakohase sisu leidmiseks tänu paremale organisatsioonile

#### Tehniline teostus
- **Navigeerimise päised**: Standardiseeritud peatükkide navigeerimine üle 40+ dokumentatsioonifaili
- **Jaluse navigeerimine**: Järjepidev progressiooni juhendamine ja peatüki lõpetamise indikaatorid
- **Ristlinkimine**: Ulatuslik sisemine linkimissüsteem, mis ühendab seotud kontseptsioone
- **Peatükkide kaardistamine**: Mallid ja näited selgelt seotud õppeeesmärkidega

#### Õppejuhendi täiustamine
- **📚 Ulatuslikud õppeeesmärgid**: Õppejuhend ümberstruktureeritud vastavalt 8-peatüki süsteemile
- **🎯 Peatükkidel põhinev hindamine**: Iga peatükk sisaldab konkreetseid õppeeesmärke ja praktilisi harjutusi
- **📋 Progressi jälgimine**: Nädalane õppeplaan mõõdetavate tulemuste ja lõpetamise kontrollnimekirjadega
- **❓ Hindamisküsimused**: Teadmiste valideerimise küsimused iga peatüki kohta professionaalsete tulemustega
- **🛠️ Praktilised harjutused**: Käed-külge tegevused reaalse juurutamise stsenaariumide ja tõrkeotsinguga
- **📊 Oskuste progressioon**: Selge edasiminek põhimõistetest ettevõtte mustriteni karjääriarengu fookusega
- **🎓 Sertifitseerimise raamistik**: Professionaalsed arengutulemused ja kogukonna tunnustamise süsteem
- **⏱️ Ajajoone haldamine**: Struktureeritud 10-nädalane õppeplaan koos verstapostide valideerimisega

### [v3.1.0] - 2025-09-17

#### Täiustatud multi-agent AI lahendused
**See versioon täiustab multi-agent jaemüügi lahendust paremate agentide nimetuste ja täiustatud dokumentatsiooniga.**

#### Muudetud
- **Multi-agent terminoloogia**: Asendatud "Cora agent" "Kliendi agent" kogu jaemüügi multi-agent lahenduses selguse parandamiseks
- **Agentide arhitektuur**: Uuendatud kogu dokumentatsioon, ARM mallid ja koodinäited, et kasutada järjepidevat "Kliendi agent" nimetust
- **Konfiguratsiooni näited**: Moderniseeritud agentide konfiguratsiooni mustrid uuendatud nimetustega
- **Dokumentatsiooni järjepidevus**: Tagatud, et kõik viited kasutavad professionaalseid, kirjeldavaid agentide nimetusi

#### Täiustatud
- **ARM mallipakett**: Uuendatud jaemüügi-multiagent-ARM-mall Kliendi agent viidetega
- **Arhitektuuri diagrammid**: Värskendatud Mermaid diagrammid uuendatud agentide nimetustega
- **Koodinäited**: Python klassid ja rakenduse näited nüüd kasutavad CustomerAgent nimetust
- **Keskkonnamuutujad**: Uuendatud kõik juurutamise skriptid CUSTOMER_AGENT_NAME konventsioonide kasutamiseks

#### Parandatud
- **Arendaja kogemus**: Selgemad agentide rollid ja vastutused dokumentatsioonis
- **Tootmise valmisolek**: Parem vastavus ettevõtte nimetuste konventsioonidele
- **Õppematerjalid**: Intuitiivsem agentide nimetamine hariduslikel eesmärkidel
- **Mallide kasutatavus**: Lihtsustatud arusaam agentide funktsioonidest ja juurutamise mustritest

#### Tehnilised detailid
- Uuendatud Mermaid arhitektuuri diagrammid CustomerAgent viidetega
- Asendatud CoraAgent klassinimed CustomerAgent'iga Python näidetes
- Muudetud ARM mallide JSON konfiguratsioonid "kliendi" agent tüübi kasutamiseks
- Uuendatud keskkonnamuutujad CORA_AGENT_*'ist CUSTOMER_AGENT_* mustriteks
- Värskendatud kõik juurutamise käsud ja konteinerite konfiguratsioonid

### [v3.0.0] - 2025-09-12

#### Suured muudatused - AI arendaja fookus ja Azure AI Foundry integratsioon
**See versioon muudab repo ulatuslikuks AI-fookusega õpperessursiks koos Azure AI Foundry integratsiooniga.**

#### Lisatud
- **🤖 AI-Esimene õpitee**: Täielik ümberstruktureerimine, mis prioriteerib AI arendajaid ja insenere
- **Azure AI Foundry integratsiooni juhend**: Ulatuslik dokumentatsioon AZD ühendamiseks Azure AI Foundry teenustega
- **AI mudeli juurutamise mustrid**: Üksikasjalik juhend, mis hõlmab mudeli valikut, konfiguratsiooni ja tootmise juurutamise strateegiaid
- **AI Töötoa labor**: 2-3 tunni käed-külge töötuba AI rakenduste AZD-le juurutatavateks lahendusteks muutmiseks
- **Tootmise AI parimad praktikad**: Ettevõtte valmis mustrid AI töökoormuste skaleerimiseks, jälgimiseks ja turvamiseks
- **AI-spetsiifiline tõrkeotsingu juhend**: Ulatuslik tõrkeotsing Azure OpenAI, Cognitive Services ja AI juurutamise probleemide jaoks
- **AI Mallide galerii**: Esiletõstetud Azure AI Foundry mallide kollektsioon keerukuse hinnangutega
- **Töötoa materjalid**: Täielik töötoa struktuur koos käed-külge laborite ja viitematerjalidega


- **Sisu esitlus**: Eemaldatud dekoratiivsed elemendid selge ja professionaalse vormingu kasuks
- **Lingistruktuur**: Kõik sisemised lingid uuendatud, et toetada uut navigeerimissüsteemi

#### Parandatud
- **Juurdepääsetavus**: Eemaldatud emotikonide sõltuvus, et parandada ekraanilugejate ühilduvust
- **Professionaalne välimus**: Puhas, akadeemilise stiiliga esitlus, mis sobib ettevõtete õppimiseks
- **Õppimiskogemus**: Struktureeritud lähenemine selgete eesmärkide ja tulemuste määratlemisega iga õppetunni jaoks
- **Sisu organiseerimine**: Parem loogiline voog ja seosed seotud teemade vahel

### [v1.0.0] - 2025-09-09

#### Esmane väljalase - Ulatuslik AZD õppematerjalide hoidla

#### Lisatud
- **Põhidokumentatsiooni struktuur**
  - Täielik alustamise juhendite seeria
  - Ulatuslik juurutamise ja ettevalmistamise dokumentatsioon
  - Üksikasjalikud tõrkeotsingu ressursid ja silumisjuhendid
  - Eeljuurutamise valideerimise tööriistad ja protseduurid

- **Alustamise moodul**
  - AZD põhialused: Põhimõisted ja terminoloogia
  - Paigaldusjuhend: Platvormispetsiifilised seadistusjuhised
  - Konfiguratsioonijuhend: Keskkonna seadistamine ja autentimine
  - Esimese projekti õpetus: Samm-sammuline praktiline õppimine

- **Juurutamise ja ettevalmistamise moodul**
  - Juurutamisjuhend: Täielik töövoo dokumentatsioon
  - Ettevalmistamise juhend: Infrastruktuur kui kood Bicepiga
  - Parimad tavad tootmises juurutamiseks
  - Mitme teenuse arhitektuuri mustrid

- **Eeljuurutamise valideerimise moodul**
  - Mahu planeerimine: Azure'i ressursside saadavuse valideerimine
  - SKU valik: Ulatuslik teenustaseme juhend
  - Eelkontrollid: Automaatsete valideerimisskriptide (PowerShell ja Bash) kasutamine
  - Kulude hindamise ja eelarve planeerimise tööriistad

- **Tõrkeotsingu moodul**
  - Levinud probleemid: Sagedamini esinevad probleemid ja lahendused
  - Silumisjuhend: Süsteemne tõrkeotsingu metoodika
  - Täiustatud diagnostikatehnikad ja tööriistad
  - Jõudluse jälgimine ja optimeerimine

- **Ressursid ja viited**
  - Käskude spikker: Kiirviide olulistele käskudele
  - Sõnastik: Ulatuslik terminoloogia ja lühendite definitsioonid
  - KKK: Üksikasjalikud vastused levinud küsimustele
  - Väliste ressursside lingid ja kogukonna ühendused

- **Näited ja mallid**
  - Lihtsa veebirakenduse näide
  - Staatilise veebisaidi juurutamise mall
  - Konteinerirakenduse konfiguratsioon
  - Andmebaasi integreerimise mustrid
  - Mikroteenuste arhitektuuri näited
  - Serverivaba funktsiooni rakendused

#### Funktsioonid
- **Mitme platvormi tugi**: Paigaldus- ja konfiguratsioonijuhendid Windowsile, macOS-ile ja Linuxile
- **Mitme oskustaseme jaoks**: Sisu, mis on mõeldud nii õpilastele kui ka professionaalsetele arendajatele
- **Praktiline fookus**: Praktilised näited ja reaalsed stsenaariumid
- **Ulatuslik katvus**: Alates põhimõistetest kuni keerukate ettevõtte mustriteni
- **Turvalisuse esikohale seadmine**: Turvalisuse parimad tavad integreeritud kogu sisusse
- **Kulude optimeerimine**: Juhised kulutõhusate juurutuste ja ressursside haldamiseks

#### Dokumentatsiooni kvaliteet
- **Üksikasjalikud koodinäited**: Praktilised, testitud koodinäited
- **Samm-sammulised juhised**: Selged ja rakendatavad juhised
- **Ulatuslik tõrkehaldus**: Tõrkeotsing levinud probleemide jaoks
- **Parimate tavade integreerimine**: Tööstusstandardid ja soovitused
- **Versioonide ühilduvus**: Ajakohane uusimate Azure'i teenuste ja azd funktsioonidega

## Plaanitud tulevased täiustused

### Versioon 3.1.0 (Plaanitud)
#### AI platvormi laiendamine
- **Mitme mudeli tugi**: Integreerimismustrid Hugging Face'i, Azure Machine Learningu ja kohandatud mudelite jaoks
- **AI agentide raamistikud**: Mallid LangChaini, Semantic Kerneli ja AutoGeni juurutamiseks
- **Täiustatud RAG mustrid**: Vektori andmebaasi valikud peale Azure AI Searchi (Pinecone, Weaviate jne)
- **AI jälgitavus**: Täiustatud jälgimine mudelite jõudluse, tokenite kasutamise ja vastuste kvaliteedi jaoks

#### Arendajakogemus
- **VS Code laiendus**: Integreeritud AZD + AI Foundry arenduskogemus
- **GitHub Copilot integratsioon**: AI abil AZD mallide genereerimine
- **Interaktiivsed õpetused**: Praktilised kodeerimisharjutused koos AI stsenaariumide automaatse valideerimisega
- **Videomaterjalid**: Täiendavad videokoolitused visuaalsetele õppijatele, keskendudes AI juurutustele

### Versioon 4.0.0 (Plaanitud)
#### Ettevõtte AI mustrid
- **Haldusraamistik**: AI mudelite haldus, vastavus ja auditeerimisjäljed
- **Mitme rentniku AI**: Mustrid mitme kliendi teenindamiseks isoleeritud AI teenustega
- **Edge AI juurutamine**: Integreerimine Azure IoT Edge'i ja konteinerite eksemplaridega
- **Hübriidpilve AI**: Mitme pilve ja hübriidjuurutuse mustrid AI töökoormuste jaoks

#### Täiustatud funktsioonid
- **AI torujuhtme automatiseerimine**: MLOps integratsioon Azure Machine Learningu torujuhtmetega
- **Täiustatud turvalisus**: Nullusalduse mustrid, privaatvõrgupunktid ja täiustatud ohutõrje
- **Jõudluse optimeerimine**: Täiustatud häälestus- ja skaleerimisstrateegiad suure läbilaskevõimega AI rakenduste jaoks
- **Globaalne jaotus**: Sisu edastamise ja serva vahemällu salvestamise mustrid AI rakenduste jaoks

### Versioon 3.0.0 (Plaanitud) - Asendatud praeguse väljalaskega
#### Kavandatud lisad - Nüüd rakendatud versioonis 3.0.0
- ✅ **AI-keskne sisu**: Ulatuslik Azure AI Foundry integratsioon (Lõpetatud)
- ✅ **Interaktiivsed õpetused**: Praktiline AI töötoa labor (Lõpetatud)
- ✅ **Täiustatud turvalisuse moodul**: AI-spetsiifilised turvalisuse mustrid (Lõpetatud)
- ✅ **Jõudluse optimeerimine**: AI töökoormuste häälestamise strateegiad (Lõpetatud)

### Versioon 2.1.0 (Plaanitud) - Osaliselt rakendatud versioonis 3.0.0
#### Väikesed täiustused - Mõned rakendatud praeguses väljalaskes
- ✅ **Täiendavad näited**: AI-keskse juurutuse stsenaariumid (Lõpetatud)
- ✅ **Laiendatud KKK**: AI-spetsiifilised küsimused ja tõrkeotsing (Lõpetatud)
- **Tööriistade integratsioon**: Täiustatud IDE ja redaktori integratsiooni juhendid
- ✅ **Jälgimise laiendamine**: AI-spetsiifilised jälgimise ja hoiatamise mustrid (Lõpetatud)

#### Endiselt plaanitud tulevasteks väljalaseteks
- **Mobiilisõbralik dokumentatsioon**: Kohanduv disain mobiilseks õppimiseks
- **Võrguühenduseta juurdepääs**: Allalaaditavad dokumentatsioonipaketid
- **Täiustatud IDE integratsioon**: VS Code laiendus AZD + AI töövoogude jaoks
- **Kogukonna armatuurlaud**: Reaalajas kogukonna mõõdikud ja panuste jälgimine

## Muudatuste logisse panustamine

### Muudatuste teatamine
Sellesse hoidlas panustades veenduge, et muudatuste logi kirjed sisaldavad:

1. **Versiooninumber**: Järgides semantilist versioonimist (major.minor.patch)
2. **Kuupäev**: Väljalaske või uuenduse kuupäev formaadis AAAA-KK-PP
3. **Kategooria**: Lisatud, Muudetud, Aegunud, Eemaldatud, Parandatud, Turvalisus
4. **Selge kirjeldus**: Lühike kirjeldus muudatustest
5. **Mõju hindamine**: Kuidas muudatused mõjutavad olemasolevaid kasutajaid

### Muudatuste kategooriad

#### Lisatud
- Uued funktsioonid, dokumentatsiooni osad või võimalused
- Uued näited, mallid või õppematerjalid
- Täiendavad tööriistad, skriptid või utiliidid

#### Muudetud
- Olemasoleva funktsionaalsuse või dokumentatsiooni muudatused
- Uuendused selguse või täpsuse parandamiseks
- Sisu või struktuuri ümberkorraldamine

#### Aegunud
- Funktsioonid või lähenemised, mida hakatakse järk-järgult eemaldama
- Dokumentatsiooni osad, mis on plaanitud eemaldamiseks
- Meetodid, millel on paremad alternatiivid

#### Eemaldatud
- Funktsioonid, dokumentatsioon või näited, mis pole enam asjakohased
- Aegunud teave või aegunud lähenemised
- Liigne või konsolideeritud sisu

#### Parandatud
- Dokumentatsiooni või koodi vigade parandused
- Teatatud probleemide või vigade lahendused
- Täpsuse või funktsionaalsuse parandused

#### Turvalisus
- Turvalisusega seotud täiustused või parandused
- Uuendused turvalisuse parimate tavade osas
- Turvahaavatavuste lahendused

### Semantilise versioonimise juhised

#### Suur versioon (X.0.0)
- Muudatused, mis nõuavad kasutajatepoolset tegevust
- Sisu või struktuuri oluline ümberkorraldamine
- Muudatused, mis muudavad põhilist lähenemist või metoodikat

#### Väike versioon (X.Y.0)
- Uued funktsioonid või sisu lisamised
- Täiustused, mis säilitavad tagasiühilduvuse
- Täiendavad näited, tööriistad või ressursid

#### Parandusversioon (X.Y.Z)
- Vigade parandused ja parandused
- Väikesed täiustused olemasolevas sisus
- Selgitused ja väikesed täiustused

## Kogukonna tagasiside ja ettepanekud

Me julgustame aktiivselt kogukonna tagasisidet, et parandada seda õppematerjali:

### Kuidas tagasisidet anda
- **GitHubi probleemid**: Teatage probleemidest või tehke ettepanekuid parandusteks (AI-spetsiifilised probleemid on teretulnud)
- **Discordi arutelud**: Jagage ideid ja osalege Azure AI Foundry kogukonnas
- **Pull Requestid**: Panustage otseselt sisu täiustamisse, eriti AI mallide ja juhendite osas
- **Azure AI Foundry Discord**: Osalege #Azure kanalil AZD + AI aruteludes
- **Kogukonna foorumid**: Osalege laiemates Azure'i arendajate aruteludes

### Tagasiside kategooriad
- **AI sisu täpsus**: Parandused AI teenuste integreerimise ja juurutamise teabele
- **Õppimiskogemus**: Ettepanekud AI arendajate õppimisvoo parandamiseks
- **Puuduv AI sisu**: Taotlused täiendavate AI mallide, mustrite või näidete jaoks
- **Juurdepääsetavus**: Parandused mitmekesiste õppimisvajaduste jaoks
- **AI tööriistade integratsioon**: Ettepanekud AI arendustöövoogude parema integreerimise jaoks
- **Tootmise AI mustrid**: Ettevõtte AI juurutusmustrite taotlused

### Reageerimiskohustus
- **Probleemidele vastamine**: 48 tunni jooksul teatatud probleemide korral
- **Funktsioonitaotlused**: Hindamine ühe nädala jooksul
- **Kogukonna panused**: Ülevaade ühe nädala jooksul
- **Turvaprobleemid**: Kohene prioriteet ja kiirendatud vastus

## Hoolduskava

### Regulaarne uuendamine
- **Igakuised ülevaated**: Sisu täpsuse ja linkide valideerimine
- **Kvartaliuuendused**: Suuremad sisu lisamised ja täiustused
- **Poolaasta ülevaated**: Ulatuslik ümberkorraldamine ja täiustamine
- **Aastased väljalasked**: Suuremad versiooniuuendused oluliste täiustustega

### Jälgimine ja kvaliteedi tagamine
- **Automatiseeritud testimine**: Regulaarne koodinäidete ja linkide valideerimine
- **Kogukonna tagasiside integreerimine**: Kasutajate ettepanekute regulaarne kaasamine
- **Tehnoloogia uuendused**: Kooskõla uusimate Azure'i teenuste ja azd väljalasketega
- **Juurdepääsetavuse auditid**: Regulaarne ülevaade kaasava disaini põhimõtete osas

## Versioonitoe poliitika

### Praeguse versiooni tugi
- **Viimane suur versioon**: Täielik tugi regulaarsete uuendustega
- **Eelmine suur versioon**: Turvauuendused ja kriitilised parandused 12 kuu jooksul
- **Pärandversioonid**: Ainult kogukonna tugi, ametlikke uuendusi pole

### Ülemineku juhised
Kui avaldatakse suuri versioone, pakume:
- **Ülemineku juhendid**: Samm-sammulised ülemineku juhised
- **Ühilduvusmärkused**: Üksikasjad oluliste muudatuste kohta
- **Tööriistade tugi**: Skriptid või utiliidid ülemineku hõlbustamiseks
- **Kogukonna tugi**: Pühendatud foorumid üleminekuküsimuste jaoks

---

**Navigeerimine**
- **Eelmine õppetund**: [Õppematerjalide juhend](resources/study-guide.md)
- **Järgmine õppetund**: Tagasi [Peamenüüle](README.md)

**Püsige kursis**: Jälgige seda hoidlat, et saada teateid uute väljalasete ja oluliste õppematerjalide uuenduste kohta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->