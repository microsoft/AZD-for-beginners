<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T16:46:53+00:00",
  "source_file": "README.md",
  "language_code": "et"
}
-->
# AZD algajatele: struktureeritud õppimisreis

![AZD-for-beginners](../../../../translated_images/et/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Selle kursusega alustamine

Järgige neid samme, et alustada oma AZD õpiteekonda:

1. **Forkige hoidla**: Klõpsake [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonige hoidla**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Liituge kogukonnaga**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) ekspertabi saamiseks
4. **Valige oma õpitee**: Valige allolevatest peatükkidest see, mis sobib teie kogemustasemega

### Mitmekeelne tugi

#### Automaatne tõlge (alati ajakohane)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Araabia](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgaaria](../bg/README.md) | [Birmi (Myanmar)](../my/README.md) | [Hiina (lihtsustatud)](../zh/README.md) | [Hiina (traditsiooniline, Hongkong)](../hk/README.md) | [Hiina (traditsiooniline, Macau)](../mo/README.md) | [Hiina (traditsiooniline, Taiwan)](../tw/README.md) | [Horvaadi](../hr/README.md) | [Tšehhi](../cs/README.md) | [Taani](../da/README.md) | [Hollandi](../nl/README.md) | [Eesti](./README.md) | [Soome](../fi/README.md) | [Prantsuse](../fr/README.md) | [Saksa](../de/README.md) | [Kreeka](../el/README.md) | [Heebrea](../he/README.md) | [Hindi](../hi/README.md) | [Ungari](../hu/README.md) | [Indoneesia](../id/README.md) | [Itaalia](../it/README.md) | [Jaapani](../ja/README.md) | [Kannada](../kn/README.md) | [Korea](../ko/README.md) | [Leedu](../lt/README.md) | [Malei](../ms/README.md) | [Malajalami](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigeeria pidgin](../pcm/README.md) | [Norra](../no/README.md) | [Pärsia (Farsi)](../fa/README.md) | [Poola](../pl/README.md) | [Portugali (Brasiilia)](../br/README.md) | [Portugali (Portugal)](../pt/README.md) | [Pandžabi (Gurmukhi)](../pa/README.md) | [Rumeenia](../ro/README.md) | [Vene](../ru/README.md) | [Serbia (kirilitsas)](../sr/README.md) | [Slovaki](../sk/README.md) | [Sloveeni](../sl/README.md) | [Hispaania](../es/README.md) | [Suaheli](../sw/README.md) | [Rootsi](../sv/README.md) | [Tagalogi (Filipino)](../tl/README.md) | [Tamili](../ta/README.md) | [Telugu](../te/README.md) | [Tai](../th/README.md) | [Türgi](../tr/README.md) | [Ukraina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnami](../vi/README.md)

> **Eelistate kloonimist kohapeal?**

> See hoidla sisaldab üle 50 keele tõlkeid, mis suurendab oluliselt allalaaditava faili suurust. Tõlgeteta kloonimiseks kasutage spetsiifilist kliendipõhist laadimist:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> See annab teile kursuse läbimiseks vajaliku koos palju kiirem allalaadimine.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kursuse ülevaade

Saa Azure Developer CLI (azd) meistriks struktuursete peatükkide kaudu, mis on mõeldud järkjärguliseks õppimiseks. **Eriline rõhk AI rakenduste juurutamisel Microsoft Foundry integratsiooniga.**

### Miks see kursus on tänapäeva arendajatele oluline

Microsoft Foundry Discord kogukonna teadmiste põhjal soovib **45% arendajatest kasutada AZD-d AI töökoormuste jaoks**, kuid nad seisavad silmitsi järgmiste väljakutsetega:
- Keerulised mitme teenusega AI arhitektuurid
- Tootmise AI juurutamise parimad praktikad  
- Azure AI teenuste integreerimine ja konfigureerimine
- AI töökoormuste kulude optimeerimine
- AI-spetsiifiliste juurutamisprobleemide veaotsing

### Õpieesmärgid

Selle struktureeritud kursuse lõpetades oskad:
- **Valdad AZD põhialused**: Põhikontseptsioonid, paigaldus ja seadistamine
- **Juurutad AI rakendusi**: Kasuta AZD-d koos Microsoft Foundry teenustega
- **Rakenda infrastruktuur koodina**: Halda Azure ressursse Bicep mallidega
- **Tõrgi juurutused**: Lahenda sagedasi probleeme ja veaotsi
- **Optimeeri tootmiseks**: Turvalisus, skaleerimine, jälgimine ja kulude haldus
- **Loo mitme-agentiga lahendusi**: Juuruta keerukaid AI arhitektuure

## 📚 Õppepeatükid

*Vali oma õpitee kogemuse ja eesmärkide põhjal*

### 🚀 Peatükk 1: Alused ja kiire algus
**Eeldused**: Azure tellimus, baasteadmised käsureast  
**Kestus**: 30–45 minutit  
**Keerukus**: ⭐

#### Mida õpid
- Azure Developer CLI põhialuste mõistmine
- AZD paigaldamine oma platvormile
- Esimene edukas juurutus

#### Õppematerjalid
- **🎯 Alusta siit**: [Mis on Azure Developer CLI?](../..)
- **📖 Teooria**: [AZD põhialused](docs/getting-started/azd-basics.md) - Põhimõisted ja terminoloogia
- **⚙️ Seadistamine**: [Paigaldus ja seadistamine](docs/getting-started/installation.md) - Platvormipõhised juhendid
- **🛠️ Praktika**: [Sinu esimene projekt](docs/getting-started/first-project.md) - Samm-sammult juhend
- **📋 Kiirviide**: [Käskude kiirjuhend](resources/cheat-sheet.md)

#### Praktilised ülesanded
```bash
# Kiire installatsiooni kontroll
azd version

# Paigaldage oma esimene rakendus
azd init --template todo-nodejs-mongo
azd up
```

**💡 Peatüki tulemus**: Juurutada edukalt lihtne veebirakendus Azures AZD abil

**✅ Edukuse kinnitus:**
```bash
# Pärast peatüki 1 lõpetamist peaksid olema võimeline:
azd version              # Kuvab paigaldatud versiooni
azd init --template todo-nodejs-mongo  # Projekti initsialiseerib
azd up                  # Paigaldab Azure'i
azd show                # Kuvab töötava rakenduse URL-i
# Rakendus avatakse brauseris ja töötab
azd down --force --purge  # Ressursid puhastatakse
```

**📊 Ajainvesteering:** 30–45 minutit  
**📈 Oskustase pärast:** Saab iseseisvalt juurutada lihtsaid rakendusi

**✅ Edukuse kinnitus:**
```bash
# Pärast 1. peatüki lõpetamist peaksite suutma:
azd version              # Kuvab paigaldatud versiooni
azd init --template todo-nodejs-mongo  # Algatab projekti
azd up                  # Käivitab Azure'i juures
azd show                # Kuvab töötava rakenduse URL-i
# Rakendus avaneb brauseris ja töötab
azd down --force --purge  # Puhastab ressursid
```

**📊 Ajainvesteering:** 30–45 minutit  
**📈 Oskustase pärast:** Saab iseseisvalt juurutada lihtsaid rakendusi

---

### 🤖 Peatükk 2: AI-esmane arendus (Soovitatav AI arendajatele)
**Eeldused**: Peatükk 1 lõpetatud  
**Kestus**: 1–2 tundi  
**Keerukus**: ⭐⭐

#### Mida õpid
- Microsoft Foundry integratsioon AZD-ga
- AI-toega rakenduste juurutamine
- AI teenuste seadistuste mõistmine

#### Õppematerjalid
- **🎯 Alusta siit**: [Microsoft Foundry integratsioon](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Musterjooned**: [AI mudelite juurutamine](docs/microsoft-foundry/ai-model-deployment.md) - AI mudelite juurutamine ja haldamine
- **🛠️ Töötuba**: [AI töötuba](docs/microsoft-foundry/ai-workshop-lab.md) - Valmista oma AI lahendused AZD jaoks ette
- **🎥 Interaktiivne juhend**: [Töötuba materjalid](workshop/README.md) - Brauseripõhine õppimine MkDocs * DevContainer keskkonnas
- **📋 Mallid**: [Microsoft Foundry mallid](../..)
- **📝 Näited**: [AZD juurutuse näited](examples/README.md)

#### Praktilised ülesanded
```bash
# Käivitage oma esimene AI-rakendus
azd init --template azure-search-openai-demo
azd up

# Proovige täiendavaid AI-malle
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Peatüki tulemus**: Juuruta ja konfigureeri AI-toega vestlusrakendus koos RAG võimalustega

**✅ Edukuse kinnitus:**
```bash
# Pärast 2. peatükki peaksid sa suutma:
azd init --template azure-search-openai-demo
azd up
# Testida tehisintellekti vestluse liidest
# Esitada küsimusi ja saada tehisintellekti-põhiseid vastuseid koos allikatega
# Kontrollida otsingu integratsiooni toimimist
azd monitor  # Veenduda, et Application Insights kuvab telemeetriat
azd down --force --purge
```

**📊 Ajainvesteering:** 1–2 tundi  
**📈 Oskustase pärast:** Saab juurutada ja konfigureerida tootmisvalmis AI rakendusi  
**💰 Kulu teadlikkus:** Mõista arenduskulud $80-150/kuus, tootmiskulud $300-3500/kuus

#### 💰 Kulude kaalutlused AI juurutamisel

**Arenduskeskkond (hinnanguliselt $80-150/kuus):**
- Azure OpenAI (tasu kasutuse järgi): $0-50/kuus (sõltuvalt tokenite kasutusest)
- AI otsing (põhitase): $75/kuus
- Container Apps (tarbimispõhine): $0-20/kuus
- Salvestus (standard): $1-5/kuus

**Tootmiskeskkond (hinnanguliselt $300-3500+/kuus):**
- Azure OpenAI (PTU järjepideva jõudluse jaoks): $3000+/kuus VÕI kasutuspõhine suure mahuga
- AI otsing (standardtase): $250/kuus
- Container Apps (pühendatud): $50-100/kuus
- Application Insights: $5-50/kuus
- Salvestus (premium): $10-50/kuus

**💡 Kulude optimeerimise näpunäited:**
- Kasuta õppimiseks **Tasuta taset** Azure OpenAI-st (50 000 tokenit kuus kaasas)
- Käivita `azd down`, et ressursid vabastada, kui mitte aktiivselt arendamas
- Alusta tarbimispõhisest arvestusest, täienda PTU-ni vaid tootmises
- Kasuta `azd provision --preview`, et hinnata kulusid enne juurutamist
- Luba automaatne skaleerimine: maksa ainult tegeliku kasutuse eest

**Kulude jälgimine:**
```bash
# Kontrolli hinnangulisi kuu kulusid
azd provision --preview

# Jälgi tegelikke kulusid Azure'i portaalis
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Peatükk 3: Seadistamine ja autentimine
**Eeldused**: Peatükk 1 lõpetatud  
**Kestus**: 45–60 minutit  
**Keerukus**: ⭐⭐

#### Mida õpid
- Keskkonna seadistamine ja haldus
- Autentimise ja turvalisuse parimad meetodid
- Ressursside nimetamine ja organiseerimine

#### Õppematerjalid
- **📖 Seadistamine**: [Seadistamise juhend](docs/getting-started/configuration.md) - Keskkonna häälestamine
- **🔐 Turvalisus**: [Autentimise mustrid ja hallatav identiteet](docs/getting-started/authsecurity.md) - Autentimise mustrid
- **📝 Näited**: [Andmebaasi rakenduse näide](examples/database-app/README.md) - AZD andmebaasi näited

#### Praktilised ülesanded
- Konfigureeri mitu keskkonda (arendus, testimine, tootmine)
- Loo hallatava identiteediga autentimine
- Rakenda keskkonnaspetsiifilisi seadistusi

**💡 Peatüki tulemus**: Halda mitut keskkonda nõuetekohase autentimise ja turvalisusega

---

### 🏗️ Peatükk 4: Infrastruktuur koodina ja juurutamine
**Eeldused**: Peatükid 1–3 lõpetatud  
**Kestus**: 1–1,5 tundi  
**Keerukus**: ⭐⭐⭐

#### Mida õpid
- Täiustatud juurutusmustrid
- Infrastruktuur koodina Bicep abil
- Ressursside juurutamise strateegiad

#### Õppematerjalid
- **📖 Juurutamine**: [Juurutamise juhend](docs/deployment/deployment-guide.md) - Täielikud töövood
- **🏗️ Ressursside juurutamine**: [Ressursside haldus](docs/deployment/provisioning.md) - Azure ressursihaldus
- **📝 Näited**: [Container App näide](../../examples/container-app) - Konteinerlahendused juurutamisel

#### Praktilised ülesanded
- Loo kohandatud Bicep mallid
- Juuruta mitme teenusega rakendusi
- Rakenda sinine-roheline juurutusstrateegiaid

**💡 Peatüki tulemus**: Juuruta keerukaid mitme teenusega rakendusi kohandatud infrastruktuuri mallidega

---

### 🎯 Peatükk 5: Mitme-agendi AI lahendused (edasijõudnutele)
**Eeldused**: Peatükid 1–2 lõpetatud  
**Kestus**: 2–3 tundi  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Mitme-agendi arhitektuuri mustrid
- Agendi orkestreerimine ja koordinatsioon
- Toodangukõlbulikud AI juurutused

#### Õppematerjalid
- **🤖 Esiletõstetud projekt**: [Jaemüügi mitmeagendi lahendus](examples/retail-scenario.md) - Täielik teostus
- **🛠️ ARM mallid**: [ARM malli pakett](../../examples/retail-multiagent-arm-template) - Ühe klõpsuga juurutamine
- **📖 Arhitektuur**: [Mitme agendi koordinatsioonimustrid](/docs/pre-deployment/coordination-patterns.md) - Mustrid

#### Praktilised harjutused
```bash
# Hangi täielik jaemüügi mitmeagendi lahendus
cd examples/retail-multiagent-arm-template
./deploy.sh

# Uuri agentide konfiguratsioone
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Peatüki tulemus**: Juuruta ja halda tootmiskõlblikku mitme agendi AI lahendust kliendi ja laovarude agentidega

---

### 🔍 Peatükk 6: Eeljuurutuse valideerimine ja planeerimine
**Eeldused**: Peatükk 4 lõpetatud  
**Kestus**: 1 tund  
**Keerukus**: ⭐⭐

#### Mida õpid
- Võimsuse planeerimine ja ressursside valideerimine
- SKU valiku strateegiad
- Eelpäringud ja automatiseerimine

#### Õppematerjalid
- **📊 Planeerimine**: [Võimsuse planeerimine](docs/pre-deployment/capacity-planning.md) - Ressursside valideerimine
- **💰 Valik**: [SKU valik](docs/pre-deployment/sku-selection.md) - Kulutõhusad valikud
- **✅ Valideerimine**: [Eelkontrollid](docs/pre-deployment/preflight-checks.md) - Automatiseeritud skriptid

#### Praktilised harjutused
- Käivita võimsuse valideerimise skripte
- Optimeeri SKU valikuid kulude vähendamiseks
- Rakenda automaatsed eeljuurutuse kontrollid

**💡 Peatüki tulemus**: Valideeri ja optimeeri juurutusi enne täideviimist

---

### 🚨 Peatükk 7: Tõrkeotsing ja silumine
**Eeldused**: Mõni juurutuse peatükk lõpetatud  
**Kestus**: 1-1,5 tundi  
**Keerukus**: ⭐⭐

#### Mida õpid
- Süsteemsed silumismeetodid
- Levinud probleemid ja lahendused
- AI spetsiifiline tõrkeotsing

#### Õppematerjalid
- **🔧 Levinud probleemid**: [Levinud probleemid](docs/troubleshooting/common-issues.md) - KKK ja lahendused
- **🕵️ Silumine**: [Silumise juhend](docs/troubleshooting/debugging.md) - Samm-sammult strateegiad
- **🤖 AI probleemid**: [AI spetsiifiline tõrkeotsing](docs/troubleshooting/ai-troubleshooting.md) - AI teenuse probleemid

#### Praktilised harjutused
- Diagnostiseeri juurutuse tõrkeid
- Lahenda autentimisküsimusi
- Silu AI teenuse ühenduvust

**💡 Peatüki tulemus**: Tuvasta ja lahenda iseseisvalt levinud juurutuse probleemid

---

### 🏢 Peatükk 8: Tootmise ja ettevõtte mustrid
**Eeldused**: Peatükid 1-4 lõpetatud  
**Kestus**: 2-3 tundi  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Tootmise juurutuse strateegiad
- Ettevõtte turvamustrid
- Jälgimine ja kulude optimeerimine

#### Õppematerjalid
- **🏭 Tootmine**: [Tootmine AI parimad praktikad](docs/microsoft-foundry/production-ai-practices.md) - Ettevõtte mustrid
- **📝 Näited**: [Mikroteenuste näide](../../examples/microservices) - Keerukad arhitektuurid
- **📊 Jälgimine**: [Application Insights integratsioon](docs/pre-deployment/application-insights.md) - Jälgimine

#### Praktilised harjutused
- Rakenda ettevõtte turvamustreid
- Mõõda ja jälgi terviklikult
- Juuruta tootmisse sobival haldusega viisil

**💡 Peatüki tulemus**: Juuruta ettevõttevalmis rakendusi täispika tootmiskõlblikkusega

---

## 🎓 Töötuba Ülevaade: Praktiline Õppimiskogemus

> **⚠️ TÖÖTOA OLEK: Arenemisjärgus**  
> Töötuba materjalid on hetkel väljatöötamisel ja lihvimisel. Tuumamoodulid töötavad, kuid mõned keerukamad lõigud on lõpetamata. Töötame aktiivselt kogu sisu valmimise nimel. [Jälgi edenemist →](workshop/README.md)

### Interaktiivsed töötuba materjalid
**Kõikehõlmav praktiline õppimine sirvija abil koos juhendatud harjutustega**

Meie töötuba materjalid pakuvad struktureeritud, interaktiivset õppimiskogemust, mis täidab ülal toodud peatükkide õppekava. Töötuba on mõeldud nii iseseisvaks õppimiseks kui ka juhendatud sessioonideks.

#### 🛠️ Töötoa omadused
- **Sirvija-põhine liides**: Täielik MkDocs töötoa põhine keskkond koos otsingu, kopeerimise ja teemadega
- **GitHub Codespaces integratsioon**: Ühe klõpsuga arenduskeskkonna seadistus
- **Struktureeritud õppeprotsess**: 7-etapilised juhendatud harjutused (kokku 3,5 tundi)
- **Avastus → Juurutus → Kohandamine**: Järgnev metoodika
- **Interaktiivne DevContainer keskkond**: Eelseadistatud tööriistad ja sõltuvused

#### 📚 Töötoa struktuur
Töötuba järgib **Avastus → Juurutus → Kohandamine** metoodikat:

1. **Avastamise faas** (45 min)
   - Tutvu Microsoft Foundry mallide ja teenustega
   - Mõista mitme agendi arhitektuurimustreid
   - Vaata üle juurutuse nõuded ja eeldused

2. **Juurutuse faas** (2 tundi)
   - Praktikal AI rakenduste juurutamine AZD-ga
   - Azure AI teenuste ja lõpp-punktide seadistus
   - Turvalisuse ja autentimise mustrite rakendamine

3. **Kohandamise faas** (45 min)
   - Mõtle rakendusi spetsiifilisteks kasutusjuhtudeks
   - Tootmiskõlbliku juurutuse optimeerimine
   - Jälgimise ja kulude halduse rakendamine

#### 🚀 Töötuba alustamine
```bash
# Valik 1: GitHub Codespaces (Soovitatav)
# Klõpsa "Code" → "Create codespace on main" hoidlas

# Valik 2: Kohalik arendus
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Järgi juhiseid failis workshop/README.md
```

#### 🎯 Töötuba õpiväljundid
Töötuba läbinutel on võimalik:
- **Juurutada tootmiskõlblikke AI rakendusi**: Kasutada AZD-d Microsoft Foundry teenustega
- **Valdada mitme agendi arhitektuurid**: Rakendada koordineeritud AI agendi lahendusi
- **Rakendada turva parimaid praktikaid**: Konfigureerida autentimist ja juurdepääsu juhtimist
- **Optimeerida skaleerimiseks**: Kujundada kulutõhusaid ja jõudlusrikkaid juurutusi
- **Tõrkeotsingut teha**: Tuvastada ja lahendada levinud juurutuse probleeme iseseisvalt

#### 📖 Töötuba ressursid
- **🎥 Interaktiivne juhend**: [Töötoa materjalid](workshop/README.md) - Sirvijapõhine õppekeskkond
- **📋 Samm-sammult juhised**: [Juhendatud harjutused](../../workshop/docs/instructions) - Detailne läbivaatus
- **🛠️ AI töötuba labor**: [AI töötuba labor](docs/microsoft-foundry/ai-workshop-lab.md) - AI fookusega harjutused
- **💡 Kiire algus**: [Töötoa seadistusjuhend](workshop/README.md#quick-start) - Keskkonna konfigureerimine

**Sobib ideaalselt**: Ettevõtte koolitustele, ülikoolikursustele, iseseisvaks õppimiseks ja arendajate bootcampidele.

---

## 📖 Mis on Azure Developer CLI?

Azure Developer CLI (azd) on arenduskeskne käsurealiides, mis kiirendab rakenduste ehitamist ja juurutamist Azure’i platvormile. See pakub:

- **Mallipõhised juurutused** - Kasuta eelkokku pandud malle tavapäraste rakendusmustrite jaoks
- **Infrastruktuur koodina** - Halda Azure ressursse Bicepi või TerraFormi abil  
- **Integreeritud töövood** - Provisioneerimine, juurutamine ja jälgimine sujuvalt ühe lahendusena
- **Arendajasõbralik** - Optimeeritud arendaja tootlikkuse ja kogemuse jaoks

### **AZD + Microsoft Foundry: Täiuslik AI juurutusteks**

**Miks valida AZD AI lahenduste jaoks?** AZD lahendab AI arendajate peamised väljakutsed:

- **AI-valmis mallid** - Eelseadistatud mallid Azure OpenAI, Cognitive Services ja ML tööülesannete jaoks
- **Turvalised AI juurutused** - Sisseehitatud turvamustrid AI teenustele, API võtmetele ja mudeli lõpp-punktidele  
- **Tootmise AI mustrid** - Parimad praktikud skaleeritavate ja kulutõhusate AI rakenduste jaoks
- **Lõpp-lõpuni AI töövood** - Mudeli arendusest tootmisse juurutuseni koos nõuetekohase jälgimisega
- **Kuluoptimeerimine** - Nutikad ressursikasutuse ja skaleerimise strateegiad AI töökoormustele
- **Microsoft Foundry integratsioon** - Sujuv ühendus Microsoft Foundry mudelikaataloogi ja lõpp-punktidega

---

## 🎯 Mallide ja näidiste kogu

### Esiletõstetud: Microsoft Foundry mallid
**Alusta siit, kui juurutad AI rakendusi!**

> **Märkus:** Need mallid demonstreerivad erinevaid AI mustreid. Mõned on välised Azure näited, teised lokaalsed teostused.

| Mall | Peatükk | Keerukus | Teenused | Tüüp |
|----------|---------|------------|----------|------|
| [**Alusta AI vestlusega**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI mudeli ennustus API + Azure AI otsing + Azure konteinerirakendused + Application Insights | Välis |
| [**Alusta AI agentidega**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Peatükk 2 | ⭐⭐ | Azure AI agent teenus + AzureOpenAI + Azure AI otsing + Azure konteinerirakendused + Application Insights| Välis |
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | AzureOpenAI + Azure AI otsing + App Service + Storage | Välis |
| [**OpenAI vestluse rakenduse kiire algus**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | AzureOpenAI + konteinerirakendused + Application Insights | Välis |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | AzureOpenAI + Azure funktsioonid + Prompty | Välis |
| [**Contoso vestlus RAG**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Otsing + Cosmos DB + konteinerirakendused | Välis |
| [**Jaemüügi mitme-agendi lahendus**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Otsing + Storage + konteinerirakendused + Cosmos DB | **Local** |

### Esiletõstetud: Täielikud õppetsüklid
**Tootmiskõlbulike rakenduste mallid seotud õppepeatükkidega**

| Mall | Õppepeatükk | Keerukus | Peamine õppevaldkond |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Peatükk 2 | ⭐ | Põhilised AI juurutusmustrid |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Peatükk 2 | ⭐⭐ | RAG teostus Azure AI Otsinguga |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Peatükk 4 | ⭐⭐ | Dokumenditarkus integratsioon |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Peatükk 5 | ⭐⭐⭐ | Agendi raamistik ja funktsioonide kutsumine |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Peatükk 8 | ⭐⭐⭐ | Ettevõtte AI orkestreerimine |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Peatükk 5 | ⭐⭐⭐⭐ | Mitme-agendi arhitektuur kliendi ja laovaru agentidega |

### Õppimine näidiste tüübi järgi

> **📌 Kohalik vs Välised Näited:**  
> **Kohalikud näited** (selles hoidlas) = Koheseks kasutamiseks valmis  
> **Välised näited** (Azure näited) = Kloneeritud seotud hoidlatest

#### Kohalikud näited (valmis kasutamiseks)
- [**Jaemüügi mitme-agendi lahendus**](examples/retail-scenario.md) - Täielik tootmiskõlblik lahendus ARM mallidega
  - Mitme-agendi arhitektuur (klient + laovarude agent)
  - Ulatuslik jälgimine ja hindamine
  - Ühe klõpsuga juurutamine ARM malli kaudu

#### Kohalikud näited - konteinerirakendused (peatükid 2-5)
**Selles hoidlas põhjalikud konteinerite juurutamise näited:**
- [**Konteinerirakenduse näited**](examples/container-app/README.md) - Täielik juhend konteineripõhiste juurutuste kohta
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api) - Baas REST API skalaar-väärtusega nullini
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices) - Tootmiskõlblik mitme teenuse juurutus
  - Kiire algus, tootmine ja arenenud juurutusmustrid
  - Jälgimine, turvalisus ja kulude optimeerimise juhised

#### Välised näited - lihtsad rakendused (peatükid 1-2)
**Kloneeri need Azure näidiste hoidlad, et alustada:**
- [Lihtne veebirakendus - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Põhimustrid juurutamiseks
- [Staatiline veebisait - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staatilise sisu juurutus
- [Konteinerirakendus - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API juurutus

#### Välised näited - andmebaasi integratsioon (peatükid 3-4)  
- [Andmebaasi rakendus - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Andmebaasi ühenduvuse mustrid
- [Funktsioonid + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverivaba andmetöötlus

#### Välised näited - arenenud mustrid (peatükid 4-8)
- [Java mikroteenused](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mitme teenus arhitektuurid
- [Konteinerirakenduste tööd](https://github.com/Azure-Samples/container-apps-jobs) - Tausttöötlus  
- [Ettevõtte ML torujuhe](https://github.com/Azure-Samples/mlops-v2) - Tootmiskõlblikud ML mudelite mustrid

### Välised malli kogumikud
- [**Ametlik AZD malli galerii**](https://azure.github.io/awesome-azd/) - Kuraatoriga kogumik ametlikke ja kogukonna malle
- [**Azure Developer CLI mallid**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsofti Learn malli dokumentatsioon
- [**Näidiste kataloog**](examples/README.md) - Kohalikud õppimise näited koos üksikasjalike selgitustega

---

## 📚 Õppematerjalid ja Viited

### Kiire viited
- [**Käskude mäluraamat**](resources/cheat-sheet.md) - Olulised azd käsud peatükkide kaupa
- [**Glosaar**](resources/glossary.md) - Azure ja azd terminid  
- [**KKK**](resources/faq.md) - Levinumad küsimused peatükkide kaupa
- [**Õppejuhend**](resources/study-guide.md) - Põhjalikud harjutused

### Praktilised töötoad
- [**AI töötoa labor**](docs/microsoft-foundry/ai-workshop-lab.md) - Tee oma AI lahendused AZD-ga juurutatavaks (2-3 tundi)
- [**Interaktiivne töötoa juhend**](workshop/README.md) - Sirvijas toimuv töötoa juhend MkDocs ja DevContainer keskkonnaga
- [**Struktureeritud õppeprogramm**](../../workshop/docs/instructions) - 7-astmeline juhendatud harjutuste rada (Ava → Juuruta → Kohanda)
- [**AZD algajatele töötoa materjalid**](workshop/README.md) - Täielik praktiline töötoa sisu koos GitHub Codespaces integratsiooniga

### Välised õppematerjalid
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuuri keskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hinnakalkulaator](https://azure.microsoft.com/pricing/calculator/)
- [Azure oleku leht](https://status.azure.com/)

---

## 🔧 Kiire tõrkeotsingu juhend

**Algajatele sagedased probleemid ja kohesed lahendused:**

### ❌ "azd: käsku ei leitud"

```bash
# Installi esmalt AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Kontrolli installatsiooni
azd version
```

### ❌ "Tellimust ei leitud" või "Tellimus pole seatud"

```bash
# Kuvada saadaval tellimused
az account list --output table

# Määra vaikimisi tellimus
az account set --subscription "<subscription-id-or-name>"

# Määra AZD keskkonnaks
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Kontrolli
az account show
```

### ❌ "Piirang ületatud" või "Kvoot on otsas"

```bash
# Proovi erinevat Azure'i piirkonda
azd env set AZURE_LOCATION "westus2"
azd up

# Või kasuta arenduses väiksemaid SKU-sid
# Muuda infra/main.parameters.json faili:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" ebaõnnestus poolel teel

```bash
# Valik 1: Puhasta ja proovi uuesti
azd down --force --purge
azd up

# Valik 2: Paranda ainult taristu
azd provision

# Valik 3: Kontrolli üksikasjalikke logisid
azd show
azd logs
```

### ❌ "Autentimine ebaõnnestus" või "Märgis aegunud"

```bash
# Autentige uuesti
az logout
az login

azd auth logout
azd auth login

# Kontrolli autentimist
az account show
```

### ❌ "Resurss juba olemas" või nimekonfliktid

```bash
# AZD genereerib unikaalseid nimesid, kuid kui tekib konflikt:
azd down --force --purge

# Siis proovi uuesti värske keskkonnaga
azd env new dev-v2
azd up
```

### ❌ Malli juurutus võtab liiga kaua aega

**Tavalised ootamisajad:**
- Lihtne veebirakendus: 5-10 minutit
- Andmebaasiga rakendus: 10-15 minutit
- AI rakendused: 15-25 minutit (OpenAI ettevalmistus on aeglane)

```bash
# Kontrolli edenemist
azd show

# Kui takerdud rohkem kui 30 minutit, vaata Azure Portaali:
azd monitor
# Otsi ebaõnnestunud juurutusi
```

### ❌ "Õigusi pole" või "Keelatud"

```bash
# Kontrolli oma Azure rolli
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sul peab olema vähemalt "Contributor" roll
# Palu oma Azure administraatoril anda:
# - Contributor (ressursside jaoks)
# - User Access Administrator (rolli määramise jaoks)
```

### ❌ Ei leia juurutatud rakenduse URL-i

```bash
# Kuvada kõik teenuse lõpp-punktid
azd show

# Või avada Azure'i portaal
azd monitor

# Kontrolli konkreetset teenust
azd env get-values
# Otsi *_URL muutujaid
```

### 📚 Täielik tõrkeotsingu materjal

- **Levinud probleemide juhend:** [Üksikasjalikud lahendused](docs/troubleshooting/common-issues.md)
- **AI-spetsiifilised tõrked:** [AI tõrkeotsing](docs/troubleshooting/ai-troubleshooting.md)
- **Silumine samm-sammult:** [Juurdluse juhend](docs/troubleshooting/debugging.md)
- **Abi saamiseks:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Kiire tõrkeotsingu juhend

**Algajatele sagedased probleemid ja kohesed lahendused:**

<details>
<summary><strong>❌ "azd: käsku ei leitud"</strong></summary>

```bash
# Paigalda esmalt AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Kontrolli paigaldust
azd version
```
</details>

<details>
<summary><strong>❌ "Tellimust ei leitud" või "Tellimus pole seatud"</strong></summary>

```bash
# Loetle saadaolevad tellimused
az account list --output table

# Määra vaikimisi tellimus
az account set --subscription "<subscription-id-or-name>"

# Määra AZD keskkonnaks
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Kontrolli
az account show
```
</details>

<details>
<summary><strong>❌ "Piirang ületatud" või "Kvoot on otsas"</strong></summary>

```bash
# Proovi erinevat Azure'i piirkonda
azd env set AZURE_LOCATION "westus2"
azd up

# Või kasuta arenduses väiksemaid SKU-sid
# Muuda infra/main.parameters.json faili:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ebaõnnestus poolel teel</strong></summary>

```bash
# Valik 1: Puhasta ja proovi uuesti
azd down --force --purge
azd up

# Valik 2: Paranda ainult infrastruktuur
azd provision

# Valik 3: Kontrolli üksikasjalikke logisid
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Autentimine ebaõnnestus" või "Märgis aegunud"</strong></summary>

```bash
# Autendi uuesti
az logout
az login

azd auth logout
azd auth login

# Kontrolli autentimist
az account show
```
</details>

<details>
<summary><strong>❌ "Resurss juba olemas" või nimekonfliktid</strong></summary>

```bash
# AZD genereerib unikaalseid nimesid, kuid kui tekib konflikt:
azd down --force --purge

# Siis proovi uuesti uue keskkonnaga
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Malli juurutus võtab liiga kaua aega</strong></summary>

**Tavalised ootamisajad:**
- Lihtne veebirakendus: 5-10 minutit
- Andmebaasiga rakendus: 10-15 minutit
- AI rakendused: 15-25 minutit (OpenAI ettevalmistus on aeglane)

```bash
# Kontrolli edenemist
azd show

# Kui kinni >30 minutit, kontrolli Azure'i portaali:
azd monitor
# Otsi ebaõnnestunud juurutusi
```
</details>

<details>
<summary><strong>❌ "Õigusi pole" või "Keelatud"</strong></summary>

```bash
# Kontrolli oma Azure rolli
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sul peab olema vähemalt "Kaastöötaja" roll
# Palu oma Azure administraatoril anda:
# - Kaastöötaja (ressursside jaoks)
# - Kasutaja juurdepääsu administraator (rollide määramiseks)
```
</details>

<details>
<summary><strong>❌ Ei leia juurutatud rakenduse URL-i</strong></summary>

```bash
# Näita kõiki teenuse lõpp-punkte
azd show

# Või ava Azure portaal
azd monitor

# Kontrolli konkreetset teenust
azd env get-values
# Otsi *_URL muutujad
```
</details>

### 📚 Täielik tõrkeotsingu materjal

- **Levinud probleemide juhend:** [Üksikasjalikud lahendused](docs/troubleshooting/common-issues.md)
- **AI-spetsiifilised tõrked:** [AI tõrkeotsing](docs/troubleshooting/ai-troubleshooting.md)
- **Silumine samm-sammult:** [Juurdluse juhend](docs/troubleshooting/debugging.md)
- **Abi saamiseks:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursuse lõpetamine ja sertifitseerimine

### Edusammude jälgimine
Jälgi oma õppe edenemist iga peatüki kaupa:

- [ ] **Peatükk 1**: Alused & Kiire algus ✅
- [ ] **Peatükk 2**: AI-esmene arendus ✅  
- [ ] **Peatükk 3**: Konfiguratsioon & Autentimine ✅
- [ ] **Peatükk 4**: Infrastruktuur koodina & Juurutus ✅
- [ ] **Peatükk 5**: Mitme agendi AI lahendused ✅
- [ ] **Peatükk 6**: Eeljuurutuse valideerimine & planeerimine ✅
- [ ] **Peatükk 7**: Tõrkeotsing & silumine ✅
- [ ] **Peatükk 8**: Tootmine & ettevõtte mustrid ✅

### Õppimise kinnitamine
Pärast iga peatüki lõpetamist kontrolli oma teadmisi:

1. **Praktiline ülesanne**: Lõpeta peatüki praktiline juurutus
2. **Teadmiste kontroll**: Vaata oma peatüki KKK sektsioon
3. **Kogukonna arutelu**: Jaga oma kogemust Azure Discordis
4. **Järgmine peatükk**: Liigu järgmisele keerukuse tasemele

### Kursuse lõpetamise eelised
Kogu peatükkide läbimisel saad:

- **Tootmiskogemus**: Juurutasid reaalseid AI rakendusi Azure’i
- **Professionaalsed oskused**: Ettevõtte valmis juurutuse võimekus  
- **Kogukonna tunnustus**: Aktiivne Azure arendajate kogukonna liige
- **Karjääri edendamine**: Nõutud AZD ja AI juurutuse pädevus

---

## 🤝 Kogukond ja tugi

### Abi ja tugi
- **Tehnilised probleemid:** [Teata vigadest ja esita soove](https://github.com/microsoft/azd-for-beginners/issues)
- **Õppimise teemal küsimused:** [Microsoft Azure Discord kogukond](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spetsiifiline abi:** Liitu [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentatsioon:** [Ametlik Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Kogukonna sissevaated Microsoft Foundry Discordist

**Viimased küsitluse tulemused #Azure kanalist:**
- **45%** arendajatest soovivad kasutada AZD-d AI töökoormuste jaoks
- **Peamised väljakutsed**: Mitme teenuse juurutus, volituste haldus, tootmise valmisolek  
- **Kõige rohkem soovitud:** AI-spetsiifilised mallid, tõrkeotsingu juhendid, parimad tavad

**Liitu meie kogukonnaga, et:**
- Jagada oma AZD + AI kogemusi ja saada abi
- Saabuda uute AI mallide varajasi eelvaateid
- Panustada AI juurutuse parimasse praktikas
- Mõjutada tulevasi AI + AZD funktsiooniarendusi

### Panustamine kursusesse
Ootame panuseid! Loe palun meie [Panustamise juhendit](CONTRIBUTING.md), mis käsitleb:
- **Sisu täiustused:** Täienda olemasolevaid peatükke ja näiteid
- **Uued näited:** Lisa reaalseid stsenaariume ja malle  
- **Tõlkimine:** Aita mitmekeelse toe säilitamisel
- **Vigade teatamine:** Paranda täpsust ja selgust
- **Kogukonna reeglid:** Järgi kaasavat kogukonna käitumisjuhendit

---

## 📄 Kursuse info

### Litsents
See projekt on litsentseeritud MIT litsentsi alusel – vaata [LICENSE](../../LICENSE) faili üksikasjadeks.

### Seotud Microsofti õppematerjalid

Meie meeskond toodab teisi põhjalikke õppematerjale:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j algajatele](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js algajatele](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agendid
[![AZD algajatele](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI algajatele](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP algajatele](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agentide juhend algajatele](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatiivne AI sari
[![Generatiivne AI algajatele](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivne AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Tuumikõpe
[![ML algajatele](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Andmeteadus algajatele](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI algajatele](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Küberjulgeolek algajatele](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Veebiarendus algajatele](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![Asjade Internet algajatele](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR arendus algajatele](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copiloti sari
[![Copilot tehisintellekti paarisprogrammeerimiseks](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET jaoks](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot seiklused](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursuse navigeerimine

**🚀 Valmis õppima hakkama?**

**Algajatele**: Alusta [1. peatükk: Alus & Kiire stardiga](../..)  
**Tehisintellekti arendajatele**: Mine otse [2. peatükki: AI-Esimene arendus](../..)  
**Kogenud arendajatele**: Alusta [3. peatükist: Konfiguratsioon & Autentimine](../..)

**Järgmised sammud**: [Alusta 1. peatükist - AZD põhialused](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma algkeeles tuleks lugeda autoriteetseks allikaks. Tähtsa teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tingitud valesti arusaamiste või väärinterpreteerimiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->