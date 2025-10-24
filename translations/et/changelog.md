<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T18:28:48+00:00",
  "source_file": "changelog.md",
  "language_code": "et"
}
-->
# Muudatuste logi - AZD Algajatele

## Sissejuhatus

See muudatuste logi dokumenteerib kõik olulised muudatused, uuendused ja täiustused AZD Algajatele repos. Järgime semantilise versioonimise põhimõtteid ja hoiame seda logi, et aidata kasutajatel mõista, mis on versioonide vahel muutunud.

## Õppimise eesmärgid

Selle muudatuste logi ülevaatamisega:
- Püsid kursis uute funktsioonide ja sisu lisandustega
- Mõistad olemasoleva dokumentatsiooni täiustusi
- Jälgid veaparandusi ja täpsustusi, et tagada täpsus
- Jälgid õppematerjalide arengut aja jooksul

## Õpitulemused

Pärast muudatuste logi ülevaatamist suudad:
- Tuvastada uusi õppematerjale ja ressursse
- Mõista, millised sektsioonid on uuendatud või täiustatud
- Planeerida oma õpiteekonda kõige ajakohasemate materjalide põhjal
- Anda tagasisidet ja ettepanekuid tulevasteks täiustusteks

## Versioonide ajalugu

### [v3.4.0] - 2025-10-24

#### Infrastruktuuri eelvaate ja valideerimise täiustused
**See versioon tutvustab ulatuslikku tuge uuele Azure Developer CLI eelvaate funktsioonile ja parandab töötubade kasutajakogemust.**

#### Lisatud
- **🧪 azd provision --preview funktsiooni dokumentatsioon**: Ulatuslik ülevaade uuest infrastruktuuri eelvaate võimalusest
  - Käskude viited ja kasutusnäited kiirjuhendis
  - Üksikasjalik integreerimine juurutamise juhendis koos kasutusjuhtude ja eelistega
  - Kontroll enne juurutamist turvalisema juurutamise valideerimiseks
  - Algajate juhendi uuendused turvalise juurutamise praktikatega
- **🚧 Töötuba staatuse bänner**: Professionaalne HTML-bänner, mis näitab töötuba arenduse staatust
  - Gradientdisain koos ehituse indikaatoritega selgeks kasutajate teavitamiseks
  - Viimase uuenduse ajatempli lisamine läbipaistvuse tagamiseks
  - Mobiilile kohanduv disain kõikidele seadmetüüpidele

#### Täiustatud
- **Infrastruktuuri turvalisus**: Eelvaate funktsionaalsus integreeritud kogu juurutamise dokumentatsiooni
- **Valideerimine enne juurutamist**: Automaatne skriptide testimine infrastruktuuri eelvaate funktsiooniga
- **Arendaja töövoog**: Uuendatud käskude järjestused, mis sisaldavad eelvaadet parima praktikaga
- **Töötuba kogemus**: Selged ootused kasutajatele sisu arenduse staatuse kohta

#### Muudetud
- **Juurutamise parimad praktikad**: Eelvaate-põhine töövoog nüüd soovitatav lähenemine
- **Dokumentatsiooni voog**: Infrastruktuuri valideerimine viidud õppimisprotsessis varasemaks
- **Töötuba esitlus**: Professionaalne staatuse kommunikatsioon selge arenduse ajajoonega

#### Parandatud
- **Turvalisuse esikohale seadmine**: Infrastruktuuri muudatusi saab nüüd valideerida enne juurutamist
- **Meeskonna koostöö**: Eelvaate tulemusi saab jagada ülevaatamiseks ja kinnitamiseks
- **Kulude teadlikkus**: Parem arusaam ressursside kuludest enne juurutamist
- **Riskide vähendamine**: Vähendatud juurutamise ebaõnnestumisi tänu eelnevale valideerimisele

#### Tehniline teostus
- **Mitme dokumendi integreerimine**: Eelvaate funktsioon dokumenteeritud 4 põhifailis
- **Käskude mustrid**: Järjepidev süntaks ja näited kogu dokumentatsioonis
- **Parimate praktikate integreerimine**: Eelvaade lisatud valideerimise töövoogudesse ja skriptidesse
- **Visuaalsed indikaatorid**: Selged UUS funktsiooni märgistused avastamise hõlbustamiseks

#### Töötuba infrastruktuur
- **Staatuse kommunikatsioon**: Professionaalne HTML-bänner gradientstiiliga
- **Kasutajakogemus**: Selge arenduse staatus väldib segadust
- **Professionaalne esitlus**: Säilitab repo usaldusväärsuse, samal ajal ootusi seades
- **Ajajoone läbipaistvus**: Oktoober 2025 viimase uuenduse ajatempli lisamine vastutuse tagamiseks

### [v3.3.0] - 2025-09-24

#### Täiustatud töötuba materjalid ja interaktiivne õppimiskogemus
**See versioon tutvustab ulatuslikke töötuba materjale koos brauseripõhiste interaktiivsete juhendite ja struktureeritud õppeteekondadega.**

#### Lisatud
- **🎥 Interaktiivne töötuba juhend**: Brauseripõhine töötuba kogemus MkDocs eelvaate võimalusega
- **📝 Struktureeritud töötuba juhised**: 7-etapiline juhendatud õppeteekond avastamisest kohandamiseni
  - 0-Sissejuhatus: Töötuba ülevaade ja seadistamine
  - 1-Vali-AI-Mall: Malli avastamise ja valiku protsess
  - 2-Valideeri-AI-Mall: Juurutamise ja valideerimise protseduurid
  - 3-Lahuta-AI-Mall: Malli arhitektuuri mõistmine
  - 4-Seadista-AI-Mall: Konfiguratsioon ja kohandamine
  - 5-Kohanda-AI-Mall: Täiustatud muudatused ja iteratsioonid
  - 6-Korista-Infrastruktuur: Puhastamine ja ressursside haldamine
  - 7-Kokkuvõte: Kokkuvõte ja järgmised sammud
- **🛠️ Töötuba tööriistad**: MkDocs konfiguratsioon Material teemaga parema õppimiskogemuse jaoks
- **🎯 Käed-külge õppeteekond**: 3-etapiline metoodika (Avastamine → Juurutamine → Kohandamine)
- **📱 GitHub Codespaces integratsioon**: Sujuv arenduskeskkonna seadistamine

#### Täiustatud
- **AI Töötuba Labor**: Laiendatud ulatusliku 2-3 tunni struktureeritud õppimiskogemusega
- **Töötuba dokumentatsioon**: Professionaalne esitlus koos navigeerimise ja visuaalsete abivahenditega
- **Õppimise progressioon**: Selge samm-sammuline juhend mallide valikust tootmise juurutamiseni
- **Arendaja kogemus**: Integreeritud tööriistad sujuvate arendustöövoogude jaoks

#### Parandatud
- **Juurdepääsetavus**: Brauseripõhine liides otsingu, kopeerimise funktsionaalsuse ja teema vahetamisega
- **Isetempoline õppimine**: Paindlik töötuba struktuur, mis sobib erinevate õppimiskiirustega
- **Praktiline rakendus**: Reaalsed AI mallide juurutamise stsenaariumid
- **Kogukonna integratsioon**: Discordi integratsioon töötuba toe ja koostöö jaoks

#### Töötuba funktsioonid
- **Sisseehitatud otsing**: Kiire märksõnade ja õppetundide avastamine
- **Kopeeri koodiplokid**: Hover-to-copy funktsionaalsus kõigi koodinäidete jaoks
- **Teema vahetus**: Tume/hele režiimi tugi erinevate eelistuste jaoks
- **Visuaalsed elemendid**: Ekraanipildid ja diagrammid parema mõistmise jaoks
- **Abi integratsioon**: Otsene Discordi juurdepääs kogukonna toetuseks

### [v3.2.0] - 2025-09-17

#### Suur navigeerimise ümberstruktureerimine ja peatükkidepõhine õppimissüsteem
**See versioon tutvustab ulatuslikku peatükkidepõhist õppimisstruktuuri koos täiustatud navigeerimisega kogu repos.**

#### Lisatud
- **📚 Peatükkidepõhine õppimissüsteem**: Kogu kursus restruktureeritud 8 progressiivseks õppimispeatükiks
  - Peatükk 1: Alused ja kiirstart (⭐ - 30-45 min)
  - Peatükk 2: AI-Esimene arendus (⭐⭐ - 1-2 tundi)
  - Peatükk 3: Konfiguratsioon ja autentimine (⭐⭐ - 45-60 min)
  - Peatükk 4: Infrastruktuur kui kood ja juurutamine (⭐⭐⭐ - 1-1.5 tundi)
  - Peatükk 5: Multi-agent AI lahendused (⭐⭐⭐⭐ - 2-3 tundi)
  - Peatükk 6: Valideerimine ja planeerimine enne juurutamist (⭐⭐ - 1 tund)
  - Peatükk 7: Tõrkeotsing ja silumine (⭐⭐ - 1-1.5 tundi)
  - Peatükk 8: Tootmine ja ettevõtte mustrid (⭐⭐⭐⭐ - 2-3 tundi)
- **📚 Ulatuslik navigeerimissüsteem**: Järjepidevad navigeerimise päised ja jalused kogu dokumentatsioonis
- **🎯 Progressi jälgimine**: Kursuse lõpetamise kontrollnimekiri ja õppimise verifitseerimise süsteem
- **🗺️ Õppeteekonna juhendamine**: Selged alguspunktid erinevate kogemustasemetega ja eesmärkidega
- **🔗 Ristviited navigeerimisel**: Seotud peatükid ja eeldused selgelt lingitud

#### Täiustatud
- **README struktuur**: Muudetud struktureeritud õppimisplatvormiks peatükkidepõhise organisatsiooniga
- **Dokumentatsiooni navigeerimine**: Iga leht sisaldab nüüd peatüki konteksti ja progressiooni juhendamist
- **Mallide organisatsioon**: Näited ja mallid kaardistatud vastavatele õppimispeatükkidele
- **Ressursside integratsioon**: Kiirjuhendid, KKK-d ja õppejuhendid seotud vastavate peatükkidega
- **Töötuba integratsioon**: Käed-külge laborid kaardistatud mitme peatüki õppimise eesmärkidele

#### Muudetud
- **Õppimise progressioon**: Lihtsustatud dokumentatsioonist paindlikuks peatükkidepõhiseks õppimiseks
- **Konfiguratsiooni paigutus**: Konfiguratsiooni juhend viidud 3. peatükiks parema õppimisvoo jaoks
- **AI sisu integratsioon**: Parem AI-spetsiifilise sisu integreerimine kogu õppeteekonna jooksul
- **Tootmise sisu**: Täiustatud mustrid konsolideeritud 8. peatükis ettevõtte õppijatele

#### Parandatud
- **Kasutajakogemus**: Selged navigeerimise leivapuru ja peatüki progressiooni indikaatorid
- **Juurdepääsetavus**: Järjepidevad navigeerimise mustrid lihtsamaks kursuse läbimiseks
- **Professionaalne esitlus**: Ülikooli stiilis kursuse struktuur sobilik akadeemiliseks ja ettevõtte koolituseks
- **Õppimise efektiivsus**: Vähenenud aeg asjakohase sisu leidmiseks tänu paremale organisatsioonile

#### Tehniline teostus
- **Navigeerimise päised**: Standardiseeritud peatükkide navigeerimine 40+ dokumentatsioonifailis
- **Jaluse navigeerimine**: Järjepidev progressiooni juhendamine ja peatüki lõpetamise indikaatorid
- **Ristlinkimine**: Ulatuslik sisemine linkimissüsteem, mis ühendab seotud kontseptsioone
- **Peatükkide kaardistamine**: Mallid ja näited selgelt seotud õppimise eesmärkidega

#### Õppejuhendi täiustamine
- **📚 Ulatuslikud õppimise eesmärgid**: Õppejuhend restruktureeritud vastavalt 8-peatüki süsteemile
- **🎯 Peatükkidepõhine hindamine**: Iga peatükk sisaldab konkreetseid õppimise eesmärke ja praktilisi harjutusi
- **📋 Progressi jälgimine**: Nädalane õppimise ajakava mõõdetavate tulemuste ja lõpetamise kontrollnimekirjadega
- **❓ Hindamisküsimused**: Teadmiste valideerimise küsimused iga peatüki kohta professionaalsete tulemustega
- **🛠️ Praktilised harjutused**: Käed-külge tegevused reaalse juurutamise stsenaariumide ja tõrkeotsinguga
- **📊 Oskuste progressioon**: Selge edasiminek põhimõistetest ettevõtte mustriteni karjääriarengu fookusega
- **🎓 Sertifitseerimise raamistik**: Professionaalsed arengutulemused ja kogukonna tunnustamise süsteem
- **⏱️ Ajajoone haldamine**: Struktureeritud 10-nädalane õppimisplaan koos verstapostide valideerimisega

### [v3.1.0] - 2025-09-17

#### Täiustatud Multi-Agent AI lahendused
**See versioon täiustab multi-agent jaemüügi lahendust paremate agentide nimetuste ja täiustatud dokumentatsiooniga.**

#### Muudetud
- **Multi-agent terminoloogia**: Asendatud "Cora agent" "Kliendi agent" nimetusega kogu jaemüügi multi-agent lahenduses selguse tagamiseks
- **Agentide arhitektuur**: Uuendatud kogu dokumentatsioon, ARM mallid ja koodinäited, et kasutada järjepidevalt "Kliendi agent" nimetust
- **Konfiguratsiooni näited**: Moderniseeritud agentide konfiguratsiooni mustrid uuendatud nimetustega
- **Dokumentatsiooni järjepidevus**: Tagatud, et kõik viited kasutavad professionaalseid ja kirjeldavaid agentide nimetusi

#### Täiustatud
- **ARM mallipakett**: Uuendatud jaemüügi-multiagent-arm-template Kliendi agent viidetega
- **Arhitektuuri diagrammid**: Värskendatud Mermaid diagrammid uuendatud agentide nimetustega
- **Koodinäited**: Python klassid ja rakenduse näited nüüd kasutavad CustomerAgent nimetust
- **Keskkonnamuutujad**: Uuendatud kõik juurutamise skriptid CUSTOMER_AGENT_NAME konventsioonidega

#### Parandatud
- **Arendaja kogemus**: Selgemad agentide rollid ja vastutused dokumentatsioonis
- **Tootmise valmisolek**: Parem vastavus ettevõtte nimetuste konventsioonidega
- **Õppematerjalid**: Intuitiivsem agentide nimetamine hariduslikel eesmärkidel
- **Mallide kasutatavus**: Lihtsustatud agentide funktsioonide ja juurutamise mustrite mõistmine

#### Tehnilised detailid
- Uuendatud Mermaid arhitektuuri diagrammid CustomerAgent viidetega
- Asendatud CoraAgent klassinimed CustomerAgent'iga Python näidetes
- Muudetud ARM mallide JSON konfiguratsioonid "customer" agent tüübi kasutamiseks
- Uuendatud keskkonnamuutujad CORA_AGENT_* CUSTOMER_AGENT_* mustriteks
- Värskendatud kõik juurutamise käsud ja konteinerite konfiguratsioonid

### [v3.0.0] - 2025-09-12

#### Suured muudatused - AI arendaja fookus ja Azure AI Foundry integratsioon
**See versioon muudab repo ulatuslikuks AI-fookusega õppimisressursiks koos Azure AI Foundry integratsiooniga.**

#### Lisatud
- **🤖 AI-Esimene õppeteekond**: Täielik restruktureerimine, mis prioriteerib AI arendajaid ja insenere
- **Azure AI Foundry integratsiooni juhend**: Ulatuslik dokumentatsioon AZD ühendamiseks Azure AI Foundry teenustega
- **AI mudeli juurutamise mustrid**: Üksikasjalik juhend, mis hõlmab mudeli valikut, konfiguratsiooni ja tootmise juurutamise strateegiaid
- **AI Töötuba Labor**: 2-3 tunni käed-külge töötuba AI rakenduste AZD-le juurutamiseks
- **Tootmise AI parimad praktikad**: Ettevõtte tasemel mustrid AI töökoormuste skaleerimiseks, jälgimiseks ja turvamiseks
- **AI-spetsiifiline tõrkeotsingu juhend**: Ulatuslik tõrkeotsing Azure OpenAI, Cognitive Services ja AI juurutamise probleemide jaoks
- **AI Mallide galerii**: Esiletõstetud Azure AI Foundry mallide kollektsioon keerukuse hinnangutega
- **Dokumentatsiooni formaat**: Standardiseeritud kogu dokumentatsioon ühtse õppimisele keskenduva struktuuriga
- **Navigeerimisvoog**: Rakendatud loogiline järjestus kõigi õppematerjalide läbimiseks
- **Sisu esitlus**: Eemaldatud dekoratiivsed elemendid selge ja professionaalse vormingu kasuks
- **Lingistruktuur**: Uuendatud kõik sisemised lingid, et toetada uut navigeerimissüsteemi

#### Parandatud
- **Juurdepääsetavus**: Eemaldatud emotikonide sõltuvus ekraanilugejate parema ühilduvuse tagamiseks
- **Professionaalne välimus**: Puhas, akadeemiline stiil, mis sobib ettevõtete õppimiseks
- **Õppimiskogemus**: Struktureeritud lähenemine selgete eesmärkide ja tulemuste määratlemisega iga õppetunni jaoks
- **Sisu organiseerimine**: Parem loogiline voog ja seos seotud teemade vahel

### [v1.0.0] - 2025-09-09

#### Esialgne väljalase - Põhjalik AZD õppematerjalide kogu

#### Lisatud
- **Põhidokumentatsiooni struktuur**
  - Täielik juhend alustamiseks
  - Põhjalik juurutamise ja ettevalmistamise dokumentatsioon
  - Üksikasjalikud tõrkeotsingu ressursid ja veaparanduse juhendid
  - Ettevalmistuse kontrollimise tööriistad ja protseduurid

- **Alustamise moodul**
  - AZD põhialused: Põhimõisted ja terminoloogia
  - Paigaldusjuhend: Platvormispetsiifilised seadistusjuhised
  - Konfiguratsioonijuhend: Keskkonna seadistamine ja autentimine
  - Esimese projekti õpetus: Samm-sammuline praktiline õppimine

- **Juurutamise ja ettevalmistamise moodul**
  - Juurutamise juhend: Täielik töövoo dokumentatsioon
  - Ettevalmistamise juhend: Infrastruktuur kui kood Bicepiga
  - Parimad tavad tootmises juurutamiseks
  - Mitme teenuse arhitektuuri mustrid

- **Ettevalmistuse kontrollimise moodul**
  - Mahu planeerimine: Azure'i ressursside saadavuse kontroll
  - SKU valik: Põhjalikud teenuse taseme juhised
  - Kontrollskriptid: Automaatne valideerimine (PowerShell ja Bash)
  - Kulude hindamise ja eelarve planeerimise tööriistad

- **Tõrkeotsingu moodul**
  - Levinud probleemid: Sagedasti esinevad probleemid ja lahendused
  - Veaparanduse juhend: Süsteemne tõrkeotsingu metoodika
  - Täiustatud diagnostikatehnikad ja tööriistad
  - Jõudluse jälgimine ja optimeerimine

- **Ressursid ja viited**
  - Käskude spikker: Kiirviide olulistele käskudele
  - Sõnastik: Põhjalikud terminite ja lühendite definitsioonid
  - KKK: Üksikasjalikud vastused levinud küsimustele
  - Välised ressursilingid ja kogukonna ühendused

- **Näited ja mallid**
  - Lihtsa veebirakenduse näide
  - Staatilise veebisaidi juurutamise mall
  - Konteinerirakenduse konfiguratsioon
  - Andmebaasi integreerimise mustrid
  - Mikroteenuste arhitektuuri näited
  - Serverivaba funktsiooni rakendused

#### Funktsioonid
- **Mitme platvormi tugi**: Paigaldus- ja konfiguratsioonijuhendid Windowsi, macOS-i ja Linuxi jaoks
- **Erinevad oskustasemed**: Sisu, mis sobib nii õpilastele kui ka professionaalsetele arendajatele
- **Praktiline fookus**: Praktilised näited ja reaalsed stsenaariumid
- **Põhjalik katvus**: Alates põhimõistetest kuni keerukate ettevõtte mustriteni
- **Turvalisus ennekõike**: Turvalisuse parimad tavad integreeritud kogu sisusse
- **Kulude optimeerimine**: Juhised kulutõhusate juurutuste ja ressursside haldamiseks

#### Dokumentatsiooni kvaliteet
- **Üksikasjalikud koodinäited**: Praktilised, testitud koodinäited
- **Samm-sammulised juhised**: Selged ja rakendatavad juhised
- **Põhjalik veaparandus**: Tõrkeotsing levinud probleemide korral
- **Parimate tavade integreerimine**: Tööstusstandardid ja soovitused
- **Versioonide ühilduvus**: Ajakohane uusimate Azure'i teenuste ja AZD funktsioonidega

## Planeeritud tulevased täiustused

### Versioon 3.1.0 (Planeeritud)
#### AI platvormi laiendamine
- **Mitme mudeli tugi**: Integreerimismustrid Hugging Face'i, Azure Machine Learningu ja kohandatud mudelite jaoks
- **AI agentide raamistikud**: Mallid LangChaini, Semantic Kernel'i ja AutoGen'i juurutamiseks
- **Täiustatud RAG mustrid**: Vektori andmebaasi valikud peale Azure AI Searchi (Pinecone, Weaviate jne)
- **AI jälgitavus**: Täiustatud jälgimine mudeli jõudluse, tokenite kasutamise ja vastuste kvaliteedi jaoks

#### Arendaja kogemus
- **VS Code laiendus**: Integreeritud AZD + AI Foundry arenduskogemus
- **GitHub Copilot integratsioon**: AI abil AZD mallide genereerimine
- **Interaktiivsed õpetused**: Praktilised kodeerimisharjutused automaatse valideerimisega AI stsenaariumide jaoks
- **Videomaterjalid**: Täiendavad videokoolitused visuaalsetele õppijatele, keskendudes AI juurutustele

### Versioon 4.0.0 (Planeeritud)
#### Ettevõtte AI mustrid
- **Juhtimisraamistik**: AI mudelite juhtimine, vastavus ja auditeerimisjäljed
- **Mitme rentniku AI**: Mustrid mitme kliendi teenindamiseks eraldatud AI teenustega
- **Edge AI juurutamine**: Integreerimine Azure IoT Edge'i ja konteinerite instantsidega
- **Hübriidpilve AI**: Mitme pilve ja hübriidjuurutuse mustrid AI töökoormuste jaoks

#### Täiustatud funktsioonid
- **AI torujuhtme automatiseerimine**: MLOps integratsioon Azure Machine Learningu torujuhtmetega
- **Täiustatud turvalisus**: Null-usaldusmustrid, privaatne ühendus ja täiustatud ohutõrje
- **Jõudluse optimeerimine**: Täiustatud häälestus- ja skaleerimisstrateegiad suure läbilaskevõimega AI rakenduste jaoks
- **Globaalne jaotus**: Sisu edastamise ja serva vahemällu salvestamise mustrid AI rakenduste jaoks

### Versioon 3.0.0 (Planeeritud) - Asendatud praeguse väljalaskega
#### Kavandatud täiendused - Nüüd rakendatud v3.0.0-s
- ✅ **AI-keskne sisu**: Põhjalik Azure AI Foundry integratsioon (Lõpetatud)
- ✅ **Interaktiivsed õpetused**: Praktiline AI töötoa labor (Lõpetatud)
- ✅ **Täiustatud turvalisuse moodul**: AI-spetsiifilised turvalisuse mustrid (Lõpetatud)
- ✅ **Jõudluse optimeerimine**: AI töökoormuste häälestusstrateegiad (Lõpetatud)

### Versioon 2.1.0 (Planeeritud) - Osaliselt rakendatud v3.0.0-s
#### Väikesed täiustused - Osa rakendatud praeguses väljalaskes
- ✅ **Täiendavad näited**: AI-keskse juurutuse stsenaariumid (Lõpetatud)
- ✅ **Laiendatud KKK**: AI-spetsiifilised küsimused ja tõrkeotsing (Lõpetatud)
- **Tööriistade integreerimine**: Täiustatud IDE ja redaktori integreerimise juhendid
- ✅ **Jälgimise laiendamine**: AI-spetsiifilised jälgimise ja hoiatuste mustrid (Lõpetatud)

#### Veel planeeritud tulevaseks väljalaskeks
- **Mobiilisõbralik dokumentatsioon**: Kohanduv disain mobiilseks õppimiseks
- **Võrguühenduseta juurdepääs**: Allalaaditavad dokumentatsioonipaketid
- **Täiustatud IDE integratsioon**: VS Code laiendus AZD + AI töövoogude jaoks
- **Kogukonna armatuurlaud**: Reaalajas kogukonna mõõdikud ja panuste jälgimine

## Muudatuste logi täiendamine

### Muudatuste raporteerimine
Sellesse repositooriumisse panustades veenduge, et muudatuste logi kirjed sisaldavad:

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
- Sisu või organisatsiooni ümberstruktureerimine

#### Aegunud
- Funktsioonid või lähenemised, mis on järk-järgult eemaldamisel
- Dokumentatsiooni osad, mis on kavandatud eemaldamiseks
- Meetodid, millel on paremad alternatiivid

#### Eemaldatud
- Funktsioonid, dokumentatsioon või näited, mis pole enam asjakohased
- Aegunud teave või aegunud lähenemised
- Üleliigne või konsolideeritud sisu

#### Parandatud
- Dokumentatsiooni või koodi vigade parandused
- Lahendused teatatud probleemidele või vigadele
- Täpsuse või funktsionaalsuse parandused

#### Turvalisus
- Turvalisusega seotud täiustused või parandused
- Uuendused turvalisuse parimate tavade osas
- Turvavigade lahendamine

### Semantilise versioonimise juhised

#### Suur versioon (X.0.0)
- Muudatused, mis nõuavad kasutaja tegevust
- Sisu või organisatsiooni oluline ümberstruktureerimine
- Muudatused, mis muudavad põhimõttelist lähenemist või metoodikat

#### Väike versioon (X.Y.0)
- Uued funktsioonid või sisu lisamised
- Täiendused, mis säilitavad tagurpidi ühilduvuse
- Täiendavad näited, tööriistad või ressursid

#### Paranduse versioon (X.Y.Z)
- Vigade parandused ja täpsustused
- Väikesed täiustused olemasolevale sisule
- Selgitused ja väikesed täiustused

## Kogukonna tagasiside ja ettepanekud

Me julgustame aktiivselt kogukonna tagasisidet, et parandada seda õppematerjali:

### Kuidas anda tagasisidet
- **GitHubi probleemid**: Teatage probleemidest või tehke ettepanekuid (AI-spetsiifilised probleemid on teretulnud)
- **Discordi arutelud**: Jagage ideid ja suhelge Azure AI Foundry kogukonnaga
- **Pull Requestid**: Panustage otseselt sisu täiustamisse, eriti AI mallide ja juhendite osas
- **Azure AI Foundry Discord**: Osalege #Azure kanalil AZD + AI aruteludes
- **Kogukonna foorumid**: Osalege laiemates Azure'i arendajate aruteludes

### Tagasiside kategooriad
- **AI sisu täpsus**: Parandused AI teenuste integreerimise ja juurutamise teabe osas
- **Õppimiskogemus**: Ettepanekud AI arendaja õppimisvoo parandamiseks
- **Puuduv AI sisu**: Taotlused täiendavate AI mallide, mustrite või näidete jaoks
- **Juurdepääsetavus**: Täiustused mitmekesiste õppimisvajaduste jaoks
- **AI tööriistade integreerimine**: Ettepanekud AI arendamise töövoo parema integreerimise jaoks
- **Tootmise AI mustrid**: Ettevõtte AI juurutamise mustrite taotlused

### Vastuse kohustus
- **Probleemide vastus**: 48 tunni jooksul teatatud probleemide korral
- **Funktsioonide taotlused**: Hindamine ühe nädala jooksul
- **Kogukonna panused**: Ülevaade ühe nädala jooksul
- **Turvalisuse probleemid**: Kohene prioriteet kiirendatud vastusega

## Hoolduskava

### Regulaarne uuendamine
- **Igakuised ülevaated**: Sisu täpsuse ja linkide valideerimine
- **Kvartaliuuendused**: Suured sisu lisamised ja täiustused
- **Poolaasta ülevaated**: Põhjalik ümberstruktureerimine ja täiustamine
- **Aastased väljalasked**: Suured versiooniuuendused oluliste täiustustega

### Jälgimine ja kvaliteedikontroll
- **Automaatne testimine**: Regulaarne koodinäidete ja linkide valideerimine
- **Kogukonna tagasiside integreerimine**: Kasutajate ettepanekute regulaarne kaasamine
- **Tehnoloogia uuendused**: Kooskõlastamine uusimate Azure'i teenuste ja AZD väljalaskega
- **Juurdepääsetavuse auditid**: Regulaarne ülevaade kaasava disaini põhimõtete osas

## Versioonitoe poliitika

### Praeguse versiooni tugi
- **Viimane suur versioon**: Täielik tugi regulaarsete uuendustega
- **Eelmine suur versioon**: Turvauuendused ja kriitilised parandused 12 kuu jooksul
- **Pärandversioonid**: Ainult kogukonna tugi, ametlikke uuendusi ei tehta

### Ülemineku juhised
Kui suured versioonid välja antakse, pakume:
- **Ülemineku juhendid**: Samm-sammulised üleminekujuhised
- **Ühilduvusmärkused**: Üksikasjad oluliste muudatuste kohta
- **Tööriistade tugi**: Skriptid või utiliidid ülemineku abistamiseks
- **Kogukonna tugi**: Pühendatud foorumid ülemineku küsimuste jaoks

---

**Navigeerimine**
- **Eelmine õppetund**: [Õppejuhend](resources/study-guide.md)
- **Järgmine õppetund**: Tagasi [Peamine README](README.md)

**Püsige kursis**: Jälgige seda repositooriumi, et saada teateid uute väljalasete ja oluliste uuenduste kohta õppematerjalides.

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta arusaamatuste või valede tõlgenduste eest, mis võivad tekkida selle tõlke kasutamise tõttu.