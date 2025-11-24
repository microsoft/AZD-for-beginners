<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b2e94dc30cab0675918a6ad34863b05d",
  "translation_date": "2025-11-24T12:27:55+00:00",
  "source_file": "README.md",
  "language_code": "et"
}
-->
# AZD Algajatele: Struktureeritud Õppeprogramm

![AZD-algajatele](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.et.png) 

[![GitHub jälgijad](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub harud](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub tähed](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Kursuse alustamine

Järgi neid samme, et alustada oma AZD õppe teekonda:

1. **Forki repositoorium**: Klõpsa [![GitHub harud](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klooni repositoorium**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Liitu kogukonnaga**: [Azure Discord kogukonnad](https://discord.com/invite/ByRwuEEgH4) ekspertide toetuseks
4. **Vali oma õppe tee**: Vali allpool peatükk, mis vastab sinu kogemustasemele

### Mitmekeelne tugi

#### Automaatne tõlge (alati ajakohane)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Araabia](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgaaria](../bg/README.md) | [Birma (Myanmar)](../my/README.md) | [Hiina (lihtsustatud)](../zh/README.md) | [Hiina (traditsiooniline, Hongkong)](../hk/README.md) | [Hiina (traditsiooniline, Macau)](../mo/README.md) | [Hiina (traditsiooniline, Taiwan)](../tw/README.md) | [Horvaatia](../hr/README.md) | [Tšehhi](../cs/README.md) | [Taani](../da/README.md) | [Hollandi](../nl/README.md) | [Eesti](./README.md) | [Soome](../fi/README.md) | [Prantsuse](../fr/README.md) | [Saksa](../de/README.md) | [Kreeka](../el/README.md) | [Heebrea](../he/README.md) | [Hindi](../hi/README.md) | [Ungari](../hu/README.md) | [Indoneesia](../id/README.md) | [Itaalia](../it/README.md) | [Jaapani](../ja/README.md) | [Korea](../ko/README.md) | [Leedu](../lt/README.md) | [Malai](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norra](../no/README.md) | [Pärsia (Farsi)](../fa/README.md) | [Poola](../pl/README.md) | [Portugali (Brasiilia)](../br/README.md) | [Portugali (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumeenia](../ro/README.md) | [Vene](../ru/README.md) | [Serbia (kirillitsa)](../sr/README.md) | [Slovaki](../sk/README.md) | [Sloveeni](../sl/README.md) | [Hispaania](../es/README.md) | [Suahiili](../sw/README.md) | [Rootsi](../sv/README.md) | [Tagalogi (Filipino)](../tl/README.md) | [Tamili](../ta/README.md) | [Tai](../th/README.md) | [Türgi](../tr/README.md) | [Ukraina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnami](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kursuse ülevaade

Õpi Azure Developer CLI (azd) struktureeritud peatükkide kaudu, mis on loodud järkjärguliseks õppimiseks. **Eriline fookus AI rakenduste juurutamisel Microsoft Foundry integratsiooniga.**

### Miks see kursus on oluline kaasaegsetele arendajatele

Microsoft Foundry Discord kogukonna andmetel **45% arendajatest soovib kasutada AZD-d AI töövoogude jaoks**, kuid nad seisavad silmitsi väljakutsetega:
- Keerukad mitme teenusega AI arhitektuurid
- Parimad praktikad AI juurutamiseks tootmises  
- Azure AI teenuste integreerimine ja seadistamine
- Kulude optimeerimine AI töövoogude jaoks
- AI-spetsiifiliste juurutusprobleemide lahendamine

### Õpieesmärgid

Selle struktureeritud kursuse läbimisega saavutad:
- **AZD põhialuste valdamine**: Põhimõtted, paigaldamine ja seadistamine
- **AI rakenduste juurutamine**: AZD kasutamine Microsoft Foundry teenustega
- **Infrastruktuuri kui koodi rakendamine**: Azure'i ressursside haldamine Bicep mallidega
- **Juurutuste tõrkeotsing**: Lahenda levinud probleemid ja veaotsing
- **Optimeerimine tootmiseks**: Turvalisus, skaleerimine, jälgimine ja kulude haldamine
- **Mitmeagendilised lahendused**: Keerukate AI arhitektuuride juurutamine

## 📚 Õppepeatükid

*Vali oma õppe tee vastavalt kogemustasemele ja eesmärkidele*

### 🚀 Peatükk 1: Põhitõed ja kiirstart
**Eeldused**: Azure'i tellimus, põhilised käsurea teadmised  
**Kestus**: 30-45 minutit  
**Keerukus**: ⭐

#### Mida õpid
- Azure Developer CLI põhialuste mõistmine
- AZD paigaldamine oma platvormile
- Esimene edukas juurutus

#### Õppematerjalid
- **🎯 Alusta siit**: [Mis on Azure Developer CLI?](../..)
- **📖 Teooria**: [AZD põhialused](docs/getting-started/azd-basics.md) - Põhimõtted ja terminoloogia
- **⚙️ Seadistamine**: [Paigaldamine ja seadistamine](docs/getting-started/installation.md) - Platvormispetsiifilised juhendid
- **🛠️ Praktiline töö**: [Sinu esimene projekt](docs/getting-started/first-project.md) - Samm-sammuline juhend
- **📋 Kiirviide**: [Käskude spikker](resources/cheat-sheet.md)

#### Praktilised harjutused
```bash
# Kiire paigalduskontroll
azd version

# Paigalda oma esimene rakendus
azd init --template todo-nodejs-mongo
azd up
```

**💡 Peatüki tulemus**: Edukas lihtsa veebirakenduse juurutamine Azure'i kasutades AZD-d

**✅ Edukuse kontroll:**
```bash
# Pärast 1. peatüki lõpetamist peaksite olema võimeline:
azd version              # Näitab paigaldatud versiooni
azd init --template todo-nodejs-mongo  # Initsialiseerib projekti
azd up                  # Paigaldab Azure'i
azd show                # Kuvab töötava rakenduse URL-i
# Rakendus avaneb brauseris ja töötab
azd down --force --purge  # Puhastab ressursid
```

**📊 Ajakulu:** 30-45 minutit  
**📈 Oskustase pärast:** Võimeline iseseisvalt lihtsaid rakendusi juurutama

**✅ Edukuse kontroll:**
```bash
# Pärast 1. peatüki lõpetamist peaksite olema võimeline:
azd version              # Näitab paigaldatud versiooni
azd init --template todo-nodejs-mongo  # Initsialiseerib projekti
azd up                  # Paigaldab Azure'i
azd show                # Kuvab töötava rakenduse URL-i
# Rakendus avaneb brauseris ja töötab
azd down --force --purge  # Puhastab ressursid
```

**📊 Ajakulu:** 30-45 minutit  
**📈 Oskustase pärast:** Võimeline iseseisvalt lihtsaid rakendusi juurutama

---

### 🤖 Peatükk 2: AI-keskne arendus (soovitatav AI arendajatele)
**Eeldused**: Peatükk 1 lõpetatud  
**Kestus**: 1-2 tundi  
**Keerukus**: ⭐⭐

#### Mida õpid
- Microsoft Foundry integratsioon AZD-ga
- AI-toega rakenduste juurutamine
- AI teenuste seadistuste mõistmine

#### Õppematerjalid
- **🎯 Alusta siit**: [Microsoft Foundry integratsioon](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mustrid**: [AI mudeli juurutamine](docs/microsoft-foundry/ai-model-deployment.md) - AI mudelite haldamine ja juurutamine
- **🛠️ Töötuba**: [AI töötuba](docs/microsoft-foundry/ai-workshop-lab.md) - Muuda oma AI lahendused AZD-valmis
- **🎥 Interaktiivne juhend**: [Töötoa materjalid](workshop/README.md) - Brauseripõhine õpe MkDocs * DevContainer keskkonnas
- **📋 Mallid**: [Microsoft Foundry mallid](../..)
- **📝 Näited**: [AZD juurutusnäited](examples/README.md)

#### Praktilised harjutused
```bash
# Paigalda oma esimene tehisintellekti rakendus
azd init --template azure-search-openai-demo
azd up

# Proovi täiendavaid tehisintellekti malle
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Peatüki tulemus**: AI-toega vestlusrakenduse juurutamine ja seadistamine RAG funktsioonidega

**✅ Edukuse kontroll:**
```bash
# Pärast 2. peatükki peaksite olema võimeline:
azd init --template azure-search-openai-demo
azd up
# Testima AI vestlusliidest
# Esitama küsimusi ja saama AI-põhiseid vastuseid koos allikatega
# Kontrollima, et otsingu integreerimine toimib
azd monitor  # Kontrollima, et Application Insights kuvab telemeetriat
azd down --force --purge
```

**📊 Ajakulu:** 1-2 tundi  
**📈 Oskustase pärast:** Võimeline juurutama ja seadistama tootmisvalmis AI rakendusi  
**💰 Kulude teadlikkus:** Mõista $80-150/kuus arenduskulusid, $300-3500/kuus tootmiskulusid

#### 💰 AI juurutuste kulude kaalutlused

**Arenduskeskkond (hinnanguliselt $80-150/kuus):**
- Azure OpenAI (Pay-as-you-go): $0-50/kuus (sõltuvalt tokenite kasutusest)
- AI otsing (Basic tase): $75/kuus
- Konteinerirakendused (tarbimispõhine): $0-20/kuus
- Salvestus (Standard): $1-5/kuus

**Tootmiskeskkond (hinnanguliselt $300-3,500+/kuus):**
- Azure OpenAI (PTU järjepidevaks jõudluseks): $3,000+/kuus VÕI Pay-as-go suure mahuga
- AI otsing (Standard tase): $250/kuus
- Konteinerirakendused (dedikeeritud): $50-100/kuus
- Rakenduse ülevaated: $5-50/kuus
- Salvestus (Premium): $10-50/kuus

**💡 Kulude optimeerimise näpunäited:**
- Kasuta **tasuta taset** Azure OpenAI õppimiseks (50,000 tokenit/kuus kaasas)
- Käivita `azd down`, et ressursid mitteaktiivse arenduse ajal deaktiveerida
- Alusta tarbimispõhise arveldusega, uuenda PTU-le ainult tootmiseks
- Kasuta `azd provision --preview`, et hinnata kulusid enne juurutamist
- Luba automaatne skaleerimine: maksa ainult tegeliku kasutuse eest

**Kulude jälgimine:**
```bash
# Kontrolli hinnangulisi igakuiseid kulusid
azd provision --preview

# Jälgi tegelikke kulusid Azure'i portaalis
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Peatükk 3: Konfiguratsioon ja autentimine
**Eeldused**: Peatükk 1 lõpetatud  
**Kestus**: 45-60 minutit  
**Keerukus**: ⭐⭐

#### Mida õpid
- Keskkonna konfiguratsioon ja haldamine
- Autentimise ja turvalisuse parimad praktikad
- Ressursside nimetamine ja organiseerimine

#### Õppematerjalid
- **📖 Konfiguratsioon**: [Konfiguratsiooni juhend](docs/getting-started/configuration.md) - Keskkonna seadistamine
- **🔐 Turvalisus**: [Autentimismustrid ja hallatud identiteet](docs/getting-started/authsecurity.md) - Autentimismustrid
- **📝 Näited**: [Andmebaasi rakenduse näide](examples/database-app/README.md) - AZD andmebaasi näited

#### Praktilised harjutused
- Konfigureeri mitu keskkonda (arendus, testimine, tootmine)
- Seadista hallatud identiteedi autentimine
- Rakenda keskkonnaspetsiifilisi konfiguratsioone

**💡 Peatüki tulemus**: Halda mitut keskkonda õige autentimise ja turvalisusega

---

### 🏗️ Peatükk 4: Infrastruktuur kui kood ja juurutamine
**Eeldused**: Peatükid 1-3 lõpetatud  
**Kestus**: 1-1.5 tundi  
**Keerukus**: ⭐⭐⭐

#### Mida õpid
- Täiustatud juurutusmustrid
- Infrastruktuur kui kood Bicepiga
- Ressursside hankimise strateegiad

#### Õppematerjalid
- **📖 Juurutamine**: [Juurutamise juhend](docs/deployment/deployment-guide.md) - Täielikud töövood
- **🏗️ Ressursside hankimine**: [Ressursside hankimine](docs/deployment/provisioning.md) - Azure'i ressursside haldamine
- **📝 Näited**: [Konteinerirakenduse näide](../../examples/container-app) - Konteineriseeritud juurutused

#### Praktilised harjutused
- Loo kohandatud Bicep mallid
- Juuruta mitme teenusega rakendusi
- Rakenda sinine-roheline juurutusstrateegia

**💡 Peatüki tulemus**: Juuruta keerukaid mitme teenusega rakendusi kasutades kohandatud infrastruktuuri malle

---

### 🎯 Peatükk 5: Mitmeagendilised AI lahendused (edasijõudnutele)
**Eeldused**: Peatükid 1-2 lõpetatud  
**Kestus**: 2-3 tundi  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Mitmeagendilised arhitektuurimustrid
- Agentide orkestreerimine ja koordineerimine
- Tootmisvalmis AI juurutused

#### Õppematerjalid
- **🤖 Esiletõstetud projekt**: [Jaemüügi mitmeagendiline lahendus](examples/retail-scenario.md) - Täielik rakendus
- **🛠️ ARM mallid**: [ARM mallipakett](../../examples/retail-multiagent-arm-template) - Ühe klõpsuga juurutamine
- **📖 Arhitektuur**: [Mitmeagendiline koordineerimismustrid](/docs/pre-deployment/coordination-patterns.md) - Mustrid

#### Praktilised harjutused
```bash
# Paigalda täielik jaemüügi mitmeagendi lahendus
cd examples/retail-multiagent-arm-template
./deploy.sh

# Uuri agendi konfiguratsioone
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Peatüki tulemus**: Juurutada ja hallata tootmiskõlblikku mitmeagendilist tehisintellekti lahendust koos kliendi- ja inventuuriagentidega

---

### 🔍 Peatükk 6: Eeljuurutuse valideerimine ja planeerimine
**Eeltingimused**: Peatükk 4 lõpetatud  
**Kestus**: 1 tund  
**Keerukus**: ⭐⭐

#### Mida õpid
- Mahu planeerimine ja ressursside valideerimine
- SKU valiku strateegiad
- Kontrollnimekirjad ja automatiseerimine

#### Õppematerjalid
- **📊 Planeerimine**: [Mahu planeerimine](docs/pre-deployment/capacity-planning.md) - Ressursside valideerimine
- **💰 Valik**: [SKU valik](docs/pre-deployment/sku-selection.md) - Kulutõhusad valikud
- **✅ Valideerimine**: [Kontrollnimekirjad](docs/pre-deployment/preflight-checks.md) - Automaatne skriptimine

#### Praktilised harjutused
- Käivita mahu valideerimise skriptid
- Optimeeri SKU valikud kulude vähendamiseks
- Rakenda automatiseeritud eeljuurutuse kontrollid

**💡 Peatüki tulemus**: Juurutuste valideerimine ja optimeerimine enne täitmist

---

### 🚨 Peatükk 7: Tõrkeotsing ja silumine
**Eeltingimused**: Mis tahes juurutuspeatükk lõpetatud  
**Kestus**: 1-1,5 tundi  
**Keerukus**: ⭐⭐

#### Mida õpid
- Süsteemne tõrkeotsingu lähenemine
- Levinud probleemid ja lahendused
- Tehisintellekti-spetsiifiline tõrkeotsing

#### Õppematerjalid
- **🔧 Levinud probleemid**: [Levinud probleemid](docs/troubleshooting/common-issues.md) - KKK ja lahendused
- **🕵️ Silumine**: [Silumisjuhend](docs/troubleshooting/debugging.md) - Samm-sammuline juhend
- **🤖 Tehisintellekti probleemid**: [Tehisintellekti tõrkeotsing](docs/troubleshooting/ai-troubleshooting.md) - Tehisintellekti teenuste probleemid

#### Praktilised harjutused
- Diagnoosi juurutuse tõrkeid
- Lahenda autentimisprobleeme
- Silu tehisintellekti teenuste ühenduvust

**💡 Peatüki tulemus**: Diagnoosida ja lahendada iseseisvalt levinud juurutusprobleeme

---

### 🏢 Peatükk 8: Tootmis- ja ettevõttemustrid
**Eeltingimused**: Peatükid 1-4 lõpetatud  
**Kestus**: 2-3 tundi  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Tootmise juurutusstrateegiad
- Ettevõtte turvalisuse mustrid
- Jälgimine ja kulude optimeerimine

#### Õppematerjalid
- **🏭 Tootmine**: [Tootmise parimad praktikad](docs/microsoft-foundry/production-ai-practices.md) - Ettevõttemustrid
- **📝 Näited**: [Mikroteenuste näide](../../examples/microservices) - Keerukad arhitektuurid
- **📊 Jälgimine**: [Application Insights integratsioon](docs/pre-deployment/application-insights.md) - Jälgimine

#### Praktilised harjutused
- Rakenda ettevõtte turvalisuse mustrid
- Seadista põhjalik jälgimine
- Juuruta tootmisesse koos nõuetekohase haldusega

**💡 Peatüki tulemus**: Juurutada ettevõtte tasemel rakendusi täielike tootmisvõimalustega

---

## 🎓 Töötoa ülevaade: Praktiline õpikogemus

> **⚠️ TÖÖTUBA STAATUS: Aktiivne arendus**  
> Töötoa materjalid on hetkel väljatöötamisel ja täiendamisel. Põhimoodulid on funktsionaalsed, kuid mõned edasijõudnud osad on veel lõpetamata. Töötame aktiivselt kogu sisu lõpuleviimise nimel. [Jälgi edenemist →](workshop/README.md)

### Interaktiivsed töötoa materjalid
**Struktureeritud, praktiline õpikogemus brauseripõhiste tööriistade ja juhendatud harjutustega**

Meie töötoa materjalid pakuvad struktureeritud ja interaktiivset õpikogemust, mis täiendab ülaltoodud peatükkidel põhinevat õppekava. Töötuba on mõeldud nii iseseisvaks õppimiseks kui ka juhendajaga sessioonideks.

#### 🛠️ Töötoa omadused
- **Brauseripõhine liides**: Täielik MkDocs-põhine töötuba otsingu, kopeerimise ja teemade funktsioonidega
- **GitHub Codespaces integratsioon**: Ühe klõpsuga arenduskeskkonna seadistamine
- **Struktureeritud õpitee**: 7-etapilised juhendatud harjutused (kokku 3,5 tundi)
- **Avastamine → Juurutamine → Kohandamine**: Progressiivne metoodika
- **Interaktiivne DevContainer keskkond**: Eelseadistatud tööriistad ja sõltuvused

#### 📚 Töötoa struktuur
Töötuba järgib metoodikat **Avastamine → Juurutamine → Kohandamine**:

1. **Avastamise faas** (45 min)
   - Uuri Microsoft Foundry malle ja teenuseid
   - Mõista mitmeagendilisi arhitektuurimustreid
   - Vaata üle juurutamise nõuded ja eeltingimused

2. **Juurutamise faas** (2 tundi)
   - Praktiline tehisintellekti rakenduste juurutamine AZD-ga
   - Seadista Azure AI teenused ja lõpp-punktid
   - Rakenda turvalisuse ja autentimise mustrid

3. **Kohandamise faas** (45 min)
   - Kohanda rakendusi konkreetsete kasutusjuhtude jaoks
   - Optimeeri tootmise juurutamiseks
   - Rakenda jälgimist ja kulude haldamist

#### 🚀 Töötoa alustamine
```bash
# Valik 1: GitHub Codespaces (Soovitatav)
# Klõpsa "Code" → "Create codespace on main" repositooriumis

# Valik 2: Kohalik arendus
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Järgi seadistusjuhiseid failis workshop/README.md
```

#### 🎯 Töötoa õpitulemused
Töötoa läbimisega osalejad:
- **Juurutavad tootmiskõlblikke tehisintellekti rakendusi**: Kasutades AZD-d ja Microsoft Foundry teenuseid
- **Valdavad mitmeagendilisi arhitektuure**: Rakendavad koordineeritud tehisintellekti agendilahendusi
- **Rakendavad turvalisuse parimaid tavasid**: Seadistavad autentimise ja juurdepääsukontrolli
- **Optimeerivad skaleerimiseks**: Kujundavad kulutõhusaid ja jõudlusele orienteeritud juurutusi
- **Lahendavad juurutusprobleeme**: Lahendavad levinud probleeme iseseisvalt

#### 📖 Töötoa ressursid
- **🎥 Interaktiivne juhend**: [Töötoa materjalid](workshop/README.md) - Brauseripõhine õpikeskkond
- **📋 Samm-sammult juhised**: [Juhendatud harjutused](../../workshop/docs/instructions) - Üksikasjalikud juhendid
- **🛠️ Tehisintellekti töötoa labor**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Tehisintellektile keskenduvad harjutused
- **💡 Kiirstart**: [Töötoa seadistamise juhend](workshop/README.md#quick-start) - Keskkonna seadistamine

**Sobib ideaalselt**: Ettevõtete koolitusteks, ülikoolikursusteks, iseseisvaks õppimiseks ja arendajate kiirkursusteks.

---

## 📖 Mis on Azure Developer CLI?

Azure Developer CLI (azd) on arendajakeskne käsurealiides, mis kiirendab rakenduste loomist ja juurutamist Azure'i. See pakub:

- **Mallipõhised juurutused** - Kasuta eelvalmistatud malle levinud rakendusmustrite jaoks
- **Infrastruktuur koodina** - Halda Azure'i ressursse Bicepi või Terraformi abil  
- **Integreeritud töövood** - Sujuv ressursside ettevalmistamine, juurutamine ja jälgimine
- **Arendajasõbralik** - Optimeeritud arendaja tootlikkuse ja kogemuse jaoks

### **AZD + Microsoft Foundry: Ideaalne tehisintellekti juurutamiseks**

**Miks AZD tehisintellekti lahenduste jaoks?** AZD lahendab peamised väljakutsed, millega tehisintellekti arendajad silmitsi seisavad:

- **Tehisintellekti-valmis mallid** - Eelseadistatud mallid Azure OpenAI, Cognitive Services ja ML töökoormuste jaoks
- **Turvalised tehisintellekti juurutused** - Sisseehitatud turvalisuse mustrid tehisintellekti teenuste, API võtmete ja mudeli lõpp-punktide jaoks  
- **Tootmise tehisintellekti mustrid** - Parimad tavad skaleeritavate ja kulutõhusate tehisintellekti rakenduste juurutamiseks
- **Lõpuni viidud tehisintellekti töövood** - Alates mudeli arendamisest kuni tootmise juurutamiseni koos nõuetekohase jälgimisega
- **Kulude optimeerimine** - Nutikad ressursside jaotamise ja skaleerimise strateegiad tehisintellekti töökoormuste jaoks
- **Microsoft Foundry integratsioon** - Sujuv ühendus Microsoft Foundry mudelikataloogi ja lõpp-punktidega

---

## 🎯 Mallide ja näidete raamatukogu

### Esiletõstetud: Microsoft Foundry mallid
**Alusta siit, kui juurutad tehisintellekti rakendusi!**

> **Märkus:** Need mallid demonstreerivad erinevaid tehisintellekti mustreid. Mõned on välised Azure'i näited, teised kohalikud rakendused.

| Mall | Peatükk | Keerukus | Teenused | Tüüp |
|------|---------|----------|----------|------|
| [**Alusta tehisintellekti vestlusega**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Väline |
| [**Alusta tehisintellekti agentidega**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Peatükk 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Väline |
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Väline |
| [**OpenAI vestlusrakenduse kiirstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Väline |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Väline |
| [**Contoso vestlus RAG**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Väline |
| [**Jaemüügi mitmeagendiline lahendus**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Kohalik** |

### Esiletõstetud: Täielikud õpistsenaariumid
**Tootmiskõlblike rakenduste mallid, mis on seotud õppepeatükkidega**

| Mall | Õppepeatükk | Keerukus | Põhiõpe |
|------|-------------|----------|---------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | Põhilised tehisintellekti juurutusmustrid |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | RAG rakendamine Azure AI Searchiga |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Peatükk 4 | ⭐⭐ | Dokumentide intelligentsuse integreerimine |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | Agendi raamistik ja funktsioonide kutsumine |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐ | Ettevõtte tehisintellekti orkestreerimine |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | Mitmeagendiline arhitektuur kliendi- ja inventuuriagentidega |

### Õppimine näidete järgi

> **📌 Kohalikud vs. välised näited:**  
> **Kohalikud näited** (selles repositooriumis) = Valmis kohe kasutamiseks  
> **Välised näited** (Azure Samples) = Klooni lingitud repositooriumidest

#### Kohalikud näited (valmis kasutamiseks)
- [**Jaemüügi mitmeagendiline lahendus**](examples/retail-scenario.md) - Täielik tootmiskõlblik rakendus ARM-mallidega
  - Mitmeagendiline arhitektuur (kliendi- ja inventuuriagendid)
  - Põhjalik jälgimine ja hindamine
  - Ühe klõpsuga juurutamine ARM-malli kaudu

#### Kohalikud näited - Konteinerirakendused (peatükid 2-5)
**Konteineripõhiste juurutuste täielikud näited selles repositooriumis:**
- [**Konteinerirakenduste näited**](examples/container-app/README.md) - Täielik juhend konteinerite juurutamiseks
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api) - Põhiline REST API koos nullini skaleerimisega
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices) - Tootmiskõlblik mitme teenuse juurutus
  - Kiirstart, tootmine ja edasijõudnud juurutusmustrid
  - Jälgimise, turvalisuse ja kulude optimeerimise juhised

#### Välised näited - Lihtsad rakendused (peatükid 1-2)
**Klooni need Azure Samples repositooriumid alustamiseks:**
- [Lihtne veebirakendus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Põhilised juurutusmustrid
- [Staatiline veebisait - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staatilise sisu juurutamine
- [Konteinerirakendus - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API juurutamine

#### Välised näited - Andmebaasi integreerimine (peatükid 3-4)  
- [Andmebaasirakendus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Andmebaasi ühenduvuse mustrid
- [Funktsioonid + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverivaba andmetöövoog

#### Välised näited - Edasijõudnud mustrid (peatükid 4-8)
- [Java mikroteenused](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mitme teenuse arhitektuurid
- [Konteinerirakenduste tööd](https://github.com/Azure-Samples/container-apps-jobs) - Tausttöötlus  
- [Ettevõtte ML torujuhe](https://github.com/Azure-Samples/mlops-v2) - Tootmiskõlblikud ML mustrid

### Välised mallikogud
- [**Ametlik AZD malligalerii**](https://azure.github.io/awesome-azd/) - Kureeritud ametlike ja kogukonna mallide kogu
- [**Azure Developer CLI mallid**](https://learn.microsoft.com/en-us/
### Praktilised töötoad
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Muuda oma AI lahendused AZD-ga juurutatavaks (2-3 tundi)
- [**Interaktiivne töötoa juhend**](workshop/README.md) - Brauseripõhine töötuba MkDocs ja DevContainer keskkonnaga
- [**Struktureeritud õpitee**](../../workshop/docs/instructions) - 7-etapilised juhendatud harjutused (Avastamine → Juurutamine → Kohandamine)
- [**AZD algajatele töötuba**](workshop/README.md) - Täielikud praktilised töötoa materjalid koos GitHub Codespaces integratsiooniga

### Välised õppematerjalid
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hinnakalkulaator](https://azure.microsoft.com/pricing/calculator/)
- [Azure olek](https://status.azure.com/)

---

## 🔧 Kiire tõrkeotsingu juhend

**Levinud probleemid ja kohesed lahendused algajatele:**

### ❌ "azd: käsku ei leitud"

```bash
# Installige esmalt AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Kontrollige installatsiooni
azd version
```

### ❌ "Tellimust ei leitud" või "Tellimus pole määratud"

```bash
# Loetle saadaval olevad tellimused
az account list --output table

# Määra vaikimisi tellimus
az account set --subscription "<subscription-id-or-name>"

# Määra AZD keskkonna jaoks
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Kinnita
az account show
```

### ❌ "Ebapiisav kvoot" või "Kvoot ületatud"

```bash
# Proovi erinevat Azure'i piirkonda
azd env set AZURE_LOCATION "westus2"
azd up

# Või kasuta arenduses väiksemaid SKU-sid
# Muuda infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" ebaõnnestub poole peal

```bash
# Valik 1: Puhasta ja proovi uuesti
azd down --force --purge
azd up

# Valik 2: Paranda ainult infrastruktuuri
azd provision

# Valik 3: Kontrolli üksikasjalikke logisid
azd show
azd logs
```

### ❌ "Autentimine ebaõnnestus" või "Token aegunud"

```bash
# Taasautendi
az logout
az login

azd auth logout
azd auth login

# Kinnita autentimine
az account show
```

### ❌ "Ressurss juba olemas" või nimede konfliktid

```bash
# AZD genereerib unikaalseid nimesid, kuid konflikti korral:
azd down --force --purge

# Proovi uuesti värske keskkonnaga
azd env new dev-v2
azd up
```

### ❌ Malli juurutamine võtab liiga kaua aega

**Tavalised ooteajad:**
- Lihtne veebirakendus: 5-10 minutit
- Rakendus koos andmebaasiga: 10-15 minutit
- AI rakendused: 15-25 minutit (OpenAI juurutamine on aeglane)

```bash
# Kontrolli edenemist
azd show

# Kui kinni >30 minutit, kontrolli Azure Portaalist:
azd monitor
# Otsi ebaõnnestunud juurutusi
```

### ❌ "Ligipääs keelatud" või "Keelatud"

```bash
# Kontrolli oma Azure'i rolli
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sul on vaja vähemalt "Kaastöötaja" rolli
# Palu oma Azure'i administraatoril anda:
# - Kaastöötaja (ressursside jaoks)
# - Kasutaja Juurdepääsu Administraator (rollide määramiseks)
```

### ❌ Ei leia juurutatud rakenduse URL-i

```bash
# Näita kõiki teenuse lõpp-punkte
azd show

# Või ava Azure'i portaal
azd monitor

# Kontrolli konkreetset teenust
azd env get-values
# Otsi *_URL muutujaid
```

### 📚 Täielikud tõrkeotsingu ressursid

- **Levinud probleemide juhend:** [Üksikasjalikud lahendused](docs/troubleshooting/common-issues.md)
- **AI-spetsiifilised probleemid:** [AI tõrkeotsing](docs/troubleshooting/ai-troubleshooting.md)
- **Silumise juhend:** [Samm-sammuline silumine](docs/troubleshooting/debugging.md)
- **Abi saamine:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Kiire tõrkeotsingu juhend

**Levinud probleemid ja kohesed lahendused algajatele:**

<details>
<summary><strong>❌ "azd: käsku ei leitud"</strong></summary>

```bash
# Installige esmalt AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Kontrollige paigaldust
azd version
```
</details>

<details>
<summary><strong>❌ "Tellimust ei leitud" või "Tellimus pole määratud"</strong></summary>

```bash
# Loetle saadaval olevad tellimused
az account list --output table

# Määra vaikimisi tellimus
az account set --subscription "<subscription-id-or-name>"

# Määra AZD keskkonna jaoks
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Kinnita
az account show
```
</details>

<details>
<summary><strong>❌ "Ebapiisav kvoot" või "Kvoot ületatud"</strong></summary>

```bash
# Proovi erinevat Azure'i piirkonda
azd env set AZURE_LOCATION "westus2"
azd up

# Või kasuta arenduses väiksemaid SKU-sid
# Muuda infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ebaõnnestub poole peal"</strong></summary>

```bash
# Valik 1: Puhasta ja proovi uuesti
azd down --force --purge
azd up

# Valik 2: Paranda ainult infrastruktuuri
azd provision

# Valik 3: Kontrolli üksikasjalikke logisid
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Autentimine ebaõnnestus" või "Token aegunud"</strong></summary>

```bash
# Taasautendi
az logout
az login

azd auth logout
azd auth login

# Kontrolli autentimist
az account show
```
</details>

<details>
<summary><strong>❌ "Ressurss juba olemas" või nimede konfliktid"</strong></summary>

```bash
# AZD genereerib unikaalseid nimesid, kuid konflikti korral:
azd down --force --purge

# Proovi uuesti värske keskkonnaga
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Malli juurutamine võtab liiga kaua aega"</strong></summary>

**Tavalised ooteajad:**
- Lihtne veebirakendus: 5-10 minutit
- Rakendus koos andmebaasiga: 10-15 minutit
- AI rakendused: 15-25 minutit (OpenAI juurutamine on aeglane)

```bash
# Kontrolli edenemist
azd show

# Kui kinni >30 minutit, kontrolli Azure Portaalist:
azd monitor
# Otsi ebaõnnestunud juurutusi
```
</details>

<details>
<summary><strong>❌ "Ligipääs keelatud" või "Keelatud"</strong></summary>

```bash
# Kontrolli oma Azure'i rolli
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sul on vaja vähemalt "Kaastöötaja" rolli
# Palu oma Azure'i administraatoril anda:
# - Kaastöötaja (ressursside jaoks)
# - Kasutaja juurdepääsu administraator (rollide määramiseks)
```
</details>

<details>
<summary><strong>❌ Ei leia juurutatud rakenduse URL-i"</strong></summary>

```bash
# Näita kõiki teenuse lõpp-punkte
azd show

# Või ava Azure portaal
azd monitor

# Kontrolli konkreetset teenust
azd env get-values
# Otsi *_URL muutujaid
```
</details>

### 📚 Täielikud tõrkeotsingu ressursid

- **Levinud probleemide juhend:** [Üksikasjalikud lahendused](docs/troubleshooting/common-issues.md)
- **AI-spetsiifilised probleemid:** [AI tõrkeotsing](docs/troubleshooting/ai-troubleshooting.md)
- **Silumise juhend:** [Samm-sammuline silumine](docs/troubleshooting/debugging.md)
- **Abi saamine:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursuse lõpetamine ja sertifikaat

### Edusammude jälgimine
Jälgi oma õppe edenemist iga peatüki kaudu:

- [ ] **Peatükk 1**: Alused ja kiire alustamine ✅
- [ ] **Peatükk 2**: AI-põhine arendus ✅  
- [ ] **Peatükk 3**: Konfiguratsioon ja autentimine ✅
- [ ] **Peatükk 4**: Infrastruktuur kui kood ja juurutamine ✅
- [ ] **Peatükk 5**: Mitmeagendilised AI lahendused ✅
- [ ] **Peatükk 6**: Eeljuurutamise valideerimine ja planeerimine ✅
- [ ] **Peatükk 7**: Tõrkeotsing ja silumine ✅
- [ ] **Peatükk 8**: Tootmine ja ettevõtte mustrid ✅

### Õppe kinnitamine
Pärast iga peatüki lõpetamist kinnita oma teadmised:
1. **Praktiline harjutus**: Lõpeta peatüki praktiline juurutamine
2. **Teadmiste kontroll**: Vaata peatüki KKK sektsiooni
3. **Kogukonna arutelu**: Jaga oma kogemusi Azure Discordis
4. **Järgmine peatükk**: Liigu järgmise keerukuse tasemele

### Kursuse lõpetamise eelised
Kõigi peatükkide läbimisel saad:
- **Tootmiskogemus**: Juurutatud reaalsed AI rakendused Azure'is
- **Professionaalsed oskused**: Ettevõtte tasemel juurutamise võimekus  
- **Kogukonna tunnustus**: Aktiivne liige Azure arendajate kogukonnas
- **Karjääri edendamine**: Nõutud AZD ja AI juurutamise ekspertiis

---

## 🤝 Kogukond ja tugi

### Abi ja tugi
- **Tehnilised probleemid**: [Teata vigadest ja esita funktsioonisoove](https://github.com/microsoft/azd-for-beginners/issues)
- **Õppimise küsimused**: [Microsoft Azure Discord kogukond](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spetsiifiline abi**: Liitu [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentatsioon**: [Ametlik Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Kogukonna ülevaated Microsoft Foundry Discordist

**Hiljutised küsitluse tulemused #Azure kanalilt:**
- **45%** arendajatest soovib kasutada AZD-d AI töökoormuste jaoks
- **Peamised väljakutsed**: Mitme teenuse juurutamine, mandaadihaldus, tootmisvalmidus  
- **Kõige rohkem soovitud**: AI-spetsiifilised mallid, tõrkeotsingu juhendid, parimad praktikad

**Liitu meie kogukonnaga, et:**
- Jagada oma AZD + AI kogemusi ja saada abi
- Juurdepääs uute AI mallide varajastele eelvaadetele
- Panustada AI juurutamise parimatesse praktikatesse
- Mõjutada tulevasi AI + AZD funktsioonide arendusi

### Kursusele panustamine
Ootame panustamist! Palun loe meie [Panustamise juhendit](CONTRIBUTING.md) detailide kohta:
- **Sisu täiustamine**: Paranda olemasolevaid peatükke ja näiteid
- **Uued näited**: Lisa reaalseid stsenaariume ja malle  
- **Tõlkimine**: Aita säilitada mitmekeelset tuge
- **Vigade aruandlus**: Paranda täpsust ja selgust
- **Kogukonna standardid**: Järgi meie kaasavaid kogukonna juhiseid

---

## 📄 Kursuse teave

### Litsents
See projekt on litsentseeritud MIT litsentsi alusel - vaata [LITSENTS](../../LICENSE) faili detailide jaoks.

### Seotud Microsofti õppematerjalid

Meie meeskond toodab teisi põhjalikke õppekursusi:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / Agendid
[![AZD algajatele](https://img.shields.io/badge/AZD%20algajatele-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI algajatele](https://img.shields.io/badge/Edge%20AI%20algajatele-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP algajatele](https://img.shields.io/badge/MCP%20algajatele-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agendid algajatele](https://img.shields.io/badge/AI%20agendid%20algajatele-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatiivse AI sari
[![Generatiivne AI algajatele](https://img.shields.io/badge/Generatiivne%20AI%20algajatele-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (.NET)](https://img.shields.io/badge/Generatiivne%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (Java)](https://img.shields.io/badge/Generatiivne%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (JavaScript)](https://img.shields.io/badge/Generatiivne%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Põhiõpe
[![ML algajatele](https://img.shields.io/badge/ML%20algajatele-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Andmeteadus algajatele](https://img.shields.io/badge/Andmeteadus%20algajatele-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI algajatele](https://img.shields.io/badge/AI%20algajatele-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Küberkaitse algajatele](https://img.shields.io/badge/K%C3%BCberkaitse%20algajatele-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Veebiarendus algajatele](https://img.shields.io/badge/Veebiarendus%20algajatele-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT algajatele](https://img.shields.io/badge/IoT%20algajatele-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
[![XR arendus algajatele](https://img.shields.io/badge/XR%20arendus%20algajatele-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Copilot sari  
[![Copilot AI paarisprogrammeerimiseks](https://img.shields.io/badge/Copilot%20AI%20paarisprogrammeerimiseks-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
[![Copilot C#/.NET jaoks](https://img.shields.io/badge/Copilot%20C%23/.NET%20jaoks-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
[![Copilot seiklus](https://img.shields.io/badge/Copilot%20seiklus-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursuse navigeerimine  

**🚀 Valmis õppima hakkama?**

**Algajad**: Alusta [1. peatükist: Alused ja kiirstart](../..)  
**AI arendajad**: Hüppa [2. peatükki: AI-põhine arendus](../..)  
**Kogenud arendajad**: Alusta [3. peatükist: Konfiguratsioon ja autentimine](../..)

**Järgmised sammud**: [Alusta 1. peatükiga - AZD põhialused](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->