<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T15:37:17+00:00",
  "source_file": "README.md",
  "language_code": "sl"
}
-->
# AZD za začetnike: Strukturirana učna pot

![AZD-za-začetnike](../../../../translated_images/sl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub opazovalci](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forki](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub zvezdice](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Začetek s tem tečajem

Sledite tem korakom, da začnete svojo učno pot z AZD:

1. **Razmnožite repozitorij**: Kliknite [![GitHub forki](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte repozitorij**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Pridružite se skupnosti**: [Azure Discord skupnosti](https://discord.com/invite/ByRwuEEgH4) za strokovno podporo
4. **Izberite svojo učno pot**: Izberite poglavje spodaj, ki ustreza vaši ravni izkušenj

### Podpora za več jezikov

#### Avtomatizirani prevodi (vedno posodobljeni)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabščina](../ar/README.md) | [Bengalščina](../bn/README.md) | [Bolgarščina](../bg/README.md) | [Burmanščina (Mjanmar)](../my/README.md) | [Poenostavljena kitajščina](../zh/README.md) | [Tradicionalna kitajščina (Hong Kong)](../hk/README.md) | [Tradicionalna kitajščina (Macao)](../mo/README.md) | [Tradicionalna kitajščina (Tajvan)](../tw/README.md) | [Hrvaščina](../hr/README.md) | [Češčina](../cs/README.md) | [Danščina](../da/README.md) | [Nizozemščina](../nl/README.md) | [Estonščina](../et/README.md) | [Finščina](../fi/README.md) | [Francoščina](../fr/README.md) | [Nemščina](../de/README.md) | [Grščina](../el/README.md) | [Hebrejščina](../he/README.md) | [Hindijščina](../hi/README.md) | [Madžarščina](../hu/README.md) | [Indonezijščina](../id/README.md) | [Italijanščina](../it/README.md) | [Japonščina](../ja/README.md) | [Kannada](../kn/README.md) | [Korejščina](../ko/README.md) | [Litovščina](../lt/README.md) | [Malajščina](../ms/README.md) | [Malajalščina](../ml/README.md) | [Maratščina](../mr/README.md) | [Nepalščina](../ne/README.md) | [Nigerijski pidžin](../pcm/README.md) | [Norveščina](../no/README.md) | [Perzijščina (Farsi)](../fa/README.md) | [Poljščina](../pl/README.md) | [Portugalščina (Brazilija)](../br/README.md) | [Portugalščina (Portugalska)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romunščina](../ro/README.md) | [Ruščina](../ru/README.md) | [Srbščina (cirilica)](../sr/README.md) | [Slovaščina](../sk/README.md) | [Slovenščina](./README.md) | [Španščina](../es/README.md) | [Svahili](../sw/README.md) | [Švedščina](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamilščina](../ta/README.md) | [Telugu](../te/README.md) | [Tajščina](../th/README.md) | [Turščina](../tr/README.md) | [Ukrajinščina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamščina](../vi/README.md)

> **Raje klonirate lokalno?**

> Ta repozitorij vključuje prevode v več kot 50 jezikih, kar znatno poveča velikost prenosa. Če želite klonirati brez prevodov, uporabite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tako dobite vse, kar potrebujete za dokončanje tečaja z veliko hitrejšim prenosom.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Pregled tečaja

Obvladajte Azure Developer CLI (azd) skozi strukturirana poglavja, zasnovana za postopno učenje. **Poseben poudarek na uvajanju aplikacij z umetno inteligenco z integracijo Microsoft Foundry.**

### Zakaj je ta tečaj ključen za sodobne razvijalce

Glede na vpoglede skupnosti Microsoft Foundry Discord, **45 % razvijalcev želi uporabljati AZD za AI delovne obremenitve**, a se sooča z izzivi pri:
- Zapletenih večstorih AI arhitekturah
- Najboljših praksah uvajanja AI v produkcijsko okolje  
- Integraciji in konfiguraciji Azure AI storitev
- Optimizaciji stroškov za AI delovne obremenitve
- Reševanju težav specifičnih za uvajanje AI

### Cilji učenja

S končanjem tega strukturiranega tečaja boste:
- **Obvladali osnove AZD**: osnovni koncepti, namestitev in konfiguracija
- **Uvajali AI aplikacije**: uporaba AZD z Microsoft Foundry storitvami
- **Izvajali infrastrukturo kot kodo**: upravljanje Azure virov z Bicep predlogami
- **Reševali težave pri uvajanju**: odpravljanje pogostih napak in odpravljanje napak
- **Optimizirali za produkcijo**: varnost, skaliranje, nadzor in upravljanje stroškov
- **Gradili rešitve z več agenti**: uvajanje zapletenih AI arhitektur

## 📚 Učna poglavja

*Izberite svojo učno pot glede na raven izkušenj in cilje*

### 🚀 Poglavje 1: Osnove in hiter začetek
**Pogoji za začetek**: naročnina na Azure, osnovno znanje ukazne vrstice  
**Trajanje**: 30-45 minut  
**Zapletenost**: ⭐

#### Kaj se boste naučili
- Razumevanje osnov Azure Developer CLI
- Namestitev AZD na vaši platformi
- Vaš prvi uspešen uvod

#### Učni viri
- **🎯 Začnite tukaj**: [Kaj je Azure Developer CLI?](../..)
- **📖 Teorija**: [Osnove AZD](docs/getting-started/azd-basics.md) - osnovni koncepti in terminologija
- **⚙️ Namestitev**: [Namestitev in nastavitev](docs/getting-started/installation.md) - vodniki po platformah
- **🛠️ Praktično**: [Vaš prvi projekt](docs/getting-started/first-project.md) - vodič korak za korakom
- **📋 Hitra referenca**: [Seznam ukazov](resources/cheat-sheet.md)

#### Praktične vaje
```bash
# Hiter pregled namestitve
azd version

# Namestite svojo prvo aplikacijo
azd init --template todo-nodejs-mongo
azd up
```

**💡 Izid poglavja**: Uspešno uvajanje preproste spletne aplikacije v Azure z uporabo AZD

**✅ Preverjanje uspeha:**
```bash
# Po zaključku 1. poglavja bi morali biti sposobni:
azd version              # Prikaže nameščeno različico
azd init --template todo-nodejs-mongo  # Inicializira projekt
azd up                  # Izvedi namestitev na Azure
azd show                # Prikazuje URL aplikacije, ki teče
# Aplikacija se odpre v brskalniku in deluje
azd down --force --purge  # Očisti vire
```

**📊 Časovna investicija:** 30-45 minut  
**📈 Raven veščin po:** Lahko samostojno uvaja osnovne aplikacije

**✅ Preverjanje uspeha:**
```bash
# Po zaključku 1. poglavja bi morali znati:
azd version              # Prikaže nameščeno različico
azd init --template todo-nodejs-mongo  # Inicializira projekt
azd up                  # Razporedi na Azure
azd show                # Prikaže URL zagnane aplikacije
# Aplikacija se odpre v brskalniku in deluje
azd down --force --purge  # Počisti vire
```

**📊 Časovna investicija:** 30-45 minut  
**📈 Raven veščin po:** Lahko samostojno uvaja osnovne aplikacije

---

### 🤖 Poglavje 2: AI-prvo razvijanje (priporočeno za AI razvijalce)
**Pogoji za začetek**: Poglavje 1 zaključeno  
**Trajanje**: 1-2 uri  
**Zapletenost**: ⭐⭐

#### Kaj se boste naučili
- Integracija Microsoft Foundry z AZD
- Uvajanje aplikacij, podprtih z AI
- Razumevanje konfiguracij AI storitev

#### Učni viri
- **🎯 Začnite tukaj**: [Integracija Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Vzorce**: [Uvajanje AI modelov](docs/microsoft-foundry/ai-model-deployment.md) - uvajanje in upravljanje AI modelov
- **🛠️ Delavnica**: [AI delavnica](docs/microsoft-foundry/ai-workshop-lab.md) - naredite vaše AI rešitve pripravljene za AZD
- **🎥 Interaktivni vodič**: [Delavnica materiali](workshop/README.md) - učenje v brskalniku z MkDocs * DevContainer okoljem
- **📋 Predloge**: [Microsoft Foundry predloge](../..)
- **📝 Primeri**: [Primeri uvajanja z AZD](examples/README.md)

#### Praktične vaje
```bash
# Namestite svojo prvo AI aplikacijo
azd init --template azure-search-openai-demo
azd up

# Preizkusite dodatne AI predloge
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Izid poglavja**: Uvedba in konfiguracija AI-poganjane klepetalne aplikacije z zmožnostmi RAG

**✅ Preverjanje uspeha:**
```bash
# Po poglavju 2 bi morali biti sposobni:
azd init --template azure-search-openai-demo
azd up
# Preizkusiti vmesnik klepeta z AI
# Postavljati vprašanja in dobiti odgovore, poganjane z AI, z viri
# Preveriti, ali integracija iskanja deluje
azd monitor  # Preveriti, ali Application Insights prikazuje telemetrijo
azd down --force --purge
```

**📊 Časovna investicija:** 1-2 uri  
**📈 Raven veščin po:** Lahko uvaja in konfigurira produkcijsko pripravljene AI aplikacije  
**💰 Ozaveščenost o stroških:** Razumevanje stroškov razvoja $80-150/mesec, stroškov produkcije $300-3500/mesec

#### 💰 Stroški za uvajanje AI aplikacij

**Razvojno okolje (ocenjeno $80-150/mesec):**
- Azure OpenAI (plačilo po porabi): $0-50/mesec (glede na uporabo tokenov)
- AI Search (osnovni nivo): $75/mesec
- Container Apps (poraba): $0-20/mesec
- Shramba (standardna): $1-5/mesec

**Produkcijsko okolje (ocenjeno $300-3500+ / mesec):**
- Azure OpenAI (PTU za konsistentno zmogljivost): $3000+/mesec ALI plačilo po porabi z velikim obsegom
- AI Search (standardni nivo): $250/mesec
- Container Apps (namenski): $50-100/mesec
- Application Insights: $5-50/mesec
- Shramba (premium): $10-50/mesec

**💡 Nasveti za optimizacijo stroškov:**
- Uporabljajte **Brezplačni nivo** Azure OpenAI za učenje (vključeno 50.000 tokenov/mesec)
- Za zaustavitev virov uporabite `azd down`, ko niste aktivno v razvoju
- Začnite z obračunavanjem po porabi, PTU nadgradite le za produkcijo
- Za oceno stroškov pred uvajanjem uporabite `azd provision --preview`
- Omogočite avtomatsko skaliranje: plačujte le za dejansko uporabo

**Nadzor stroškov:**
```bash
# Preverite ocenjene mesečne stroške
azd provision --preview

# Spremljajte dejanske stroške v portalu Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Poglavje 3: Konfiguracija in avtentikacija
**Pogoji za začetek**: Poglavje 1 zaključeno  
**Trajanje**: 45-60 minut  
**Zapletenost**: ⭐⭐

#### Kaj se boste naučili
- Upravljanje in konfiguracija okolij
- Najboljše prakse avtentikacije in varnosti
- Poimenovanje in organizacija virov

#### Učni viri
- **📖 Konfiguracija**: [Vodnik za konfiguracijo](docs/getting-started/configuration.md) - nastavitev okolja
- **🔐 Varnost**: [Vzorce avtentikacije in upravljane identitete](docs/getting-started/authsecurity.md) - vzorci avtentikacije
- **📝 Primeri**: [Primer baza podatkov aplikacije](examples/database-app/README.md) - primeri AZD baz podatkov

#### Praktične vaje
- Konfigurirajte več okolij (dev, staging, prod)
- Nastavite avtentikacijo z upravljano identiteto
- Izvedite konfiguracije, specifične za okolje

**💡 Izid poglavja**: Upravljanje več okolij z ustrezno avtentikacijo in varnostjo

---

### 🏗️ Poglavje 4: Infrastruktura kot koda in uvajanje
**Pogoji za začetek**: Poglavja 1-3 zaključena  
**Trajanje**: 1-1,5 ure  
**Zapletenost**: ⭐⭐⭐

#### Kaj se boste naučili
- Napredni vzorci uvajanja
- Infrastruktura kot koda z Bicep
- Strategije zagotavljanja virov

#### Učni viri
- **📖 Uvajanje**: [Vodnik uvajanja](docs/deployment/deployment-guide.md) - popolni delovni tokovi
- **🏗️ Zagotavljanje virov**: [Zagotavljanje Azure virov](docs/deployment/provisioning.md) - upravljanje Azure virov
- **📝 Primeri**: [Primer Container App](../../examples/container-app) - uvajanja z vsebnikom

#### Praktične vaje
- Ustvarite lastne Bicep predloge
- Uvajajte aplikacije z več storitvami
- Izvedite strategije modro-zelene implementacije

**💡 Izid poglavja**: Uvajanje zapletenih večstornih aplikacij z lastnimi predlogami infrastrukture

---

### 🎯 Poglavje 5: Več-agentne AI rešitve (napredno)
**Pogoji za začetek**: Poglavji 1-2 zaključena  
**Trajanje**: 2-3 ure  
**Zapletenost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Vzorce več-agentne arhitekture
- Orkestracija in koordinacija agentov  
- Vzpostavitev umetne inteligence pripravljenih za produkcijo  

#### Viri za učenje  
- **🤖 Izpostavljen projekt**: [Rešitev za trg z več agenti](examples/retail-scenario.md) - Celovita implementacija  
- **🛠️ ARM predloge**: [Paket ARM predlog](../../examples/retail-multiagent-arm-template) - Namestitev z enim klikom  
- **📖 Arhitektura**: [Vzorec koordinacije več agentov](/docs/pre-deployment/coordination-patterns.md) - Vzorci  

#### Praktične vaje  
```bash
# Namestite popolno maloprodajno večagentno rešitev
cd examples/retail-multiagent-arm-template
./deploy.sh

# Raziskujte konfiguracije agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Rezultat poglavja**: Namestite in upravljajte rešitev z več agenti umetne inteligence, pripravljeno za produkcijo, z agenti za stranke in zaloge  

---

### 🔍 Poglavje 6: Preverjanje in načrtovanje pred namestitvijo  
**Predpogoji**: Dokončano poglavje 4  
**Trajanje**: 1 ura  
**Stopnja zahtevnosti**: ⭐⭐  

#### Kaj se boste naučili  
- Načrtovanje zmogljivosti in preverjanje virov  
- Strategije izbire SKU  
- Preverjanja pred namestitvijo in avtomatizacija  

#### Viri za učenje  
- **📊 Načrtovanje**: [Načrtovanje zmogljivosti](docs/pre-deployment/capacity-planning.md) - Preverjanje virov  
- **💰 Izbira**: [Izbira SKU](docs/pre-deployment/sku-selection.md) - Stroškovno učinkovite odločitve  
- **✅ Preverjanje**: [Preverjanja pred namestitvijo](docs/pre-deployment/preflight-checks.md) - Avtomatizirani skripti  

#### Praktične vaje  
- Zaženite skripte za preverjanje zmogljivosti  
- Optimizirajte izbiro SKU glede na stroške  
- Izvedite avtomatizirana preverjanja pred namestitvijo  

**💡 Rezultat poglavja**: Preverite in optimizirajte namestitve pred izvajanjem  

---

### 🚨 Poglavje 7: Odpravljanje težav in razhroščevanje  
**Predpogoji**: Dokončano katero koli poglavje o namestitvi  
**Trajanje**: 1-1,5 ure  
**Stopnja zahtevnosti**: ⭐⭐  

#### Kaj se boste naučili  
- Sistematični pristopi k razhroščevanju  
- Pogoste težave in rešitve  
- Odpravljanje težav specifičnih za AI  

#### Viri za učenje  
- **🔧 Pogoste težave**: [Pogoste težave](docs/troubleshooting/common-issues.md) - Pogosta vprašanja in rešitve  
- **🕵️ Razhroščevanje**: [Vodnik za razhroščevanje](docs/troubleshooting/debugging.md) - Strategije po korakih  
- **🤖 AI težave**: [Odpravljanje težav z AI](docs/troubleshooting/ai-troubleshooting.md) - Težave pri AI storitvah  

#### Praktične vaje  
- Diagnosticirajte neuspehe namestitev  
- Odpravite težave z avtentikacijo  
- Razhroščujte povezljivost do AI storitev  

**💡 Rezultat poglavja**: Samostojno diagnosticirajte in odpravite pogoste težave pri nameščanju  

---

### 🏢 Poglavje 8: Produkcijski in podjetniški vzorci  
**Predpogoji**: Dokončana poglavja 1-4  
**Trajanje**: 2-3 ure  
**Stopnja zahtevnosti**: ⭐⭐⭐⭐  

#### Kaj se boste naučili  
- Strategije produkcijske namestitve  
- Podjetniški varnostni vzorci  
- Nadzor in optimizacija stroškov  

#### Viri za učenje  
- **🏭 Produkcija**: [Najboljše prakse za produkcijsko AI](docs/microsoft-foundry/production-ai-practices.md) - Podjetniški vzorci  
- **📝 Primeri**: [Primer mikro storitev](../../examples/microservices) - Kompleksne arhitekture  
- **📊 Nadzor**: [Integracija Application Insights](docs/pre-deployment/application-insights.md) - Nadzor  

#### Praktične vaje  
- Uvedite varnostne vzorce za podjetja  
- Nastavite celovit nadzor  
- Namestitev v produkcijo z ustreznim upravljanjem  

**💡 Rezultat poglavja**: Namestite aplikacije, pripravljene za podjetja, s polnimi produkcijskimi zmogljivostmi  

---

## 🎓 Pregled delavnice: Praktična izkušnja učenja  

> **⚠️ STATUS DELAVNICE: Aktivni razvoj**  
> Gradiva delavnice so trenutno v razvoju in izpopolnjevanju. Temeljni moduli so funkcionalni, nekateri napredni deli pa še niso dokončani. Aktivno delamo na dokončanju vsebine. [Spremljajte napredek →](workshop/README.md)  

### Interaktivna gradiva za delavnico  
**Celovito praktično učenje z orodji v brskalniku in vodenimi vajami**  

Naša gradiva za delavnico zagotavljajo strukturirano, interaktivno izkušnjo učenja, ki dopolnjuje zgornji kurikulum, razdeljen na poglavja. Delavnica je namenjena tako samostojnemu učenju kot sejmom z inštruktorjem.  

#### 🛠️ Značilnosti delavnice  
- **Vmesnik v brskalniku**: Celovita delavnica MkDocs z zmogljivostmi iskanja, kopiranja in tem  
- **Integracija GitHub Codespaces**: Namestitev razvojnega okolja z enim klikom  
- **Strukturirana učna pot**: 7-stopenjske vodene vaje (skupaj 3,5 ure)  
- **Metodologija Odkritje → Namestitev → Prilagoditev**  
- **Interaktivno okolje DevContainer**: Vnaprej konfigurirana orodja in odvisnosti  

#### 📚 Struktura delavnice  
Delavnica sledi metodologiji **Odkritje → Namestitev → Prilagoditev**:  

1. **Faza odkritja** (45 min)  
   - Raziskovanje Microsoft Foundry predlog in storitev  
   - Razumevanje arhitekturnih vzorcev z več agenti  
   - Pregled zahtev in predpogojev za namestitev  

2. **Faza namestitve** (2 uri)  
   - Praktična namestitev AI aplikacij z AZD  
   - Konfiguracija Azure AI storitev in končnih točk  
   - Uvedba varnostnih in avtentikacijskih vzorcev  

3. **Faza prilagoditve** (45 min)  
   - Prilagoditev aplikacij za specifične primere uporabe  
   - Optimizacija za produkcijsko namestitev  
   - Uvedba nadzora in upravljanja stroškov  

#### 🚀 Začetek z delavnico  
```bash
# Možnost 1: GitHub Codespaces (priporočeno)
# Kliknite "Code" → "Create codespace on main" v repozitoriju

# Možnost 2: Lokalni razvoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sledite navodilom za namestitev v workshop/README.md
```
  
#### 🎯 Cilji učenja delavnice  
Z dokončanjem delavnice bodo udeleženci:  
- **Namestili produkcijske AI aplikacije**: Uporaba AZD z Microsoft Foundry storitvami  
- **Obvladali arhitekture z več agenti**: Uvedba koordiniranih rešitev AI agentov  
- **Uvedli najboljše varnostne prakse**: Konfiguracija avtentikacije in nadzora dostopa  
- **Optimizirali za obseg**: Načrtovanje stroškovno učinkovitih in zmogljivih namestitev  
- **Odpravljali težave z namestitvijo**: Samostojno reševanje pogostih težav  

#### 📖 Viri delavnice  
- **🎥 Interaktivni vodič**: [Gradiva delavnice](workshop/README.md) - Učno okolje v brskalniku  
- **📋 Navodila korak za korakom**: [Vodene vaje](../../workshop/docs/instructions) - Podrobna navodila  
- **🛠️ AI laboratorij delavnice**: [AI laboratorij delavnice](docs/microsoft-foundry/ai-workshop-lab.md) - Vaje osredotočene na AI  
- **💡 Hitri začetek**: [Vodnik za nastavitev delavnice](workshop/README.md#quick-start) - Konfiguracija okolja  

**Primerno za**: Usposabljanje zaposlenih, univerzitetne tečaje, samostojno učenje in razvojne bootcampe.  

---

## 📖 Kaj je Azure Developer CLI?  

Azure Developer CLI (azd) je ukazna vrstica, osredotočena na razvijalce, ki pospešuje proces gradnje in nameščanja aplikacij v Azure. Ponuja:  

- **Namestitve na osnovi predlog** - Uporaba vnaprej pripravljenih predlog za pogoste aplikacijske vzorce  
- **Infrastruktura kot koda** - Upravljanje Azure virov z Bicep ali Terraform  
- **Integrirani poteki dela** - Neovirano zagotavljanje, nameščanje in nadzorovanje aplikacij  
- **Prijaznost do razvijalca** - Optimizirano za produktivnost in izkušnjo razvijalca  

### **AZD + Microsoft Foundry: Popolno za AI namestitve**  

**Zakaj AZD za AI rešitve?** AZD naslavlja glavne izzive AI razvijalcev:  

- **Predloge pripravljene za AI** - Vnaprej konfigurirane predloge za Azure OpenAI, Kognitivne storitve in ML naloge  
- **Varnostne AI namestitve** - Vgrajeni varnostni vzorci za AI storitve, API ključe in končne točke modelov  
- **Produkijski AI vzorci** - Najboljše prakse za skalabilne in stroškovno učinkovite AI aplikacije  
- **Celostni AI poteki dela** - Od razvoja modelov do produkcijske namestitve z ustreznim nadzorom  
- **Optimizacija stroškov** - Pametno dodeljevanje virov in strategije prilagajanja za AI naloge  
- **Integracija Microsoft Foundry** - Neovirana povezava s katalogom modelov in končnimi točkami Microsoft Foundry  

---

## 🎯 Knjižnica predlog in primerov  

### Izpostavljeno: Microsoft Foundry predloge  
**Začnite tukaj, če nameščate AI aplikacije!**  

> **Opomba:** Te predloge prikazujejo različne AI vzorce. Nekatere so zunanje Azure vzorci, druge lokalne implementacije.  

| Predloga | Poglavje | Zahtevnost | Storitve | Tip |  
|----------|----------|------------|----------|-----|  
| [**Začetek z AI klepetom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Zunanje |  
| [**Začetek z AI agenti**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavje 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Zunanje |  
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Zunanje |  
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Zunanje |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Zunanje |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Zunanje |  
| [**Rešitev za trg z več agenti**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalno** |  

### Izpostavljeno: Popolni učni scenariji  
**Predloge aplikacij, pripravljene za produkcijo, vezane na učna poglavja**  

| Predloga | Učno poglavje | Zahtevnost | Glavni učni cilj |  
|----------|---------------|------------|------------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavje 2 | ⭐ | Osnovni vzorci namestitve AI |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavje 2 | ⭐⭐ | Implementacija RAG z Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavje 4 | ⭐⭐ | Integracija inteligence dokumentov |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavje 5 | ⭐⭐⭐ | Okvir agentov in klic funkcij |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavje 8 | ⭐⭐⭐ | Podjetniška orkestracija AI |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavje 5 | ⭐⭐⭐⭐ | Arhitektura z več agenti, agenti za stranke in zaloge |  

### Učenje po vrsti primerov  

> **📌 Lokalni proti zunanjim primerom:**  
> **Lokalni primeri** (v tem repozitoriju) = Takoj za uporabo  
> **Zunanji primeri** (Azure vzorci) = Klonirajte iz povezanih repozitorijev  

#### Lokalni primeri (takoj za uporabo)  
- [**Rešitev za trg z več agenti**](examples/retail-scenario.md) - Celovita implementacija, pripravljena za produkcijo, z ARM predlogami  
  - Arhitektura z več agenti (agent za stranke + agent za zaloge)  
  - Celovit nadzor in ocena  
  - Namestitev z enim klikom prek ARM predloge  

#### Lokalni primeri - aplikacije v vsebnikih (poglavja 2-5)  
**Celoviti primeri nameščanja kontejnerjev v tem repozitoriju:**  
- [**Primeri aplikacij v vsebnikih**](examples/container-app/README.md) - Celovit vodič za nameščanje kontejnerjev  
  - [Preprost Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API s scalingom do ničle  
  - [Mikrostoritvena arhitektura](../../examples/container-app/microservices) - Produkcijska namestitev z več storitvami  
  - Hitri začetek, produkcijski in napredni vzorci namestitve  
  - Navodila za nadzor, varnost in optimizacijo stroškov  

#### Zunanji primeri - preproste aplikacije (poglavja 1-2)  
**Klonirajte te Azure vzorčne repozitorije za začetek:**  
- [Preprosta spletna aplikacija - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni vzorci namestitve  
- [Statistična stran - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Namestitev statične vsebine  
- [Aplikacija v vsebniku - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Namestitev REST API  

#### Zunanji primeri - integracija z bazo (poglavja 3-4)  
- [Aplikacija z bazo - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzorci povezovanja z bazo  
- [Funkcije + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Brezstrežni poteki za podatke  

#### Zunanji primeri - napredni vzorci (poglavja 4-8)  
- [Java mikro storitve](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitekture z več storitvami  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Procesiranje v ozadju  
- [Podjetniški ML potek](https://github.com/Azure-Samples/mlops-v2) - Produkcijski ML vzorci  

### Zbirke zunanjih predlog  
- [**Uradna galerija AZD predlog**](https://azure.github.io/awesome-azd/) - Izbrana zbirka uradnih in skupnostnih predlog  
- [**Azure Developer CLI predloge**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija predlog Microsoft Learn  
- [**Primeri mapa**](examples/README.md) - Lokalni učni primeri z podrobnimi razlagami

---

## 📚 Učni viri in reference

### Hitre reference
- [**Ukazni prevarant**](resources/cheat-sheet.md) - Osnovni ukazi azd organizirani po poglavjih
- [**Slovar**](resources/glossary.md) - Terminologija Azure in azd  
- [**Pogosta vprašanja (FAQ)**](resources/faq.md) - Pogosta vprašanja organizirana po učnih poglavjih
- [**Študijski vodič**](resources/study-guide.md) - Celovite vaje za prakso

### Delavnice z vajo
- [**AI delavnica laboratorij**](docs/microsoft-foundry/ai-workshop-lab.md) - Naredite svoje AI rešitve združljive z AZD (2-3 ure)
- [**Interaktivni vodič za delavnico**](workshop/README.md) - Delavnica v brskalniku z MkDocs in DevContainer okoljem
- [**Strukturirana učna pot**](../../workshop/docs/instructions) - 7-stopenjskih vodene vaje (Odkritje → Namestitev → Prilagoditev)
- [**AZD delavnica za začetnike**](workshop/README.md) - Celotne delavnice z integracijo GitHub Codespaces

### Zunanji učni viri
- [Azure Developer CLI Dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Center za arhitekturo](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kalkulator cen](https://azure.microsoft.com/pricing/calculator/)
- [Azure status](https://status.azure.com/)

---

## 🔧 Hitri vodič za odpravljanje težav

**Pogoste težave, s katerimi se srečujejo začetniki, in takojšnje rešitve:**

### ❌ "azd: ukaz ni najden"

```bash
# Najprej namestite AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Preverite namestitev
azd version
```

### ❌ "Naročnina ni najdena" ali "Naročnina ni nastavljena"

```bash
# Naštej razpoložljive naročnine
az account list --output table

# Nastavi privzeto naročnino
az account set --subscription "<subscription-id-or-name>"

# Nastavi za AZD okolje
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Preveri
az account show
```

### ❌ "InsufficientQuota" ali "Prekoračena kvota"

```bash
# Poskusite z drugo regijo Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ali uporabite manjše SKU-je v razvoju
# Uredite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" spodleti na polovici procesa

```bash
# Možnost 1: Počisti in poskusi znova
azd down --force --purge
azd up

# Možnost 2: Samo popravi infrastrukturo
azd provision

# Možnost 3: Preveri podrobne zapise
azd show
azd logs
```

### ❌ "Avtentikacija ni uspela" ali "Žeton je potekel"

```bash
# Ponovno overi
az logout
az login

azd auth logout
azd auth login

# Preveri overitev
az account show
```

### ❌ "Viri že obstajajo" ali konflikti imen

```bash
# AZD ustvari edinstvena imena, vendar če pride do konflikta:
azd down --force --purge

# Nato poskusi znova z novo okolje
azd env new dev-v2
azd up
```

### ❌ Predloga za namestitev traja predolgo

**Normalni časi čakanja:**
- Preprosta spletna aplikacija: 5-10 minut
- Aplikacija z bazo podatkov: 10-15 minut
- AI aplikacije: 15-25 minut (OpenAI zagotavljanje je počasno)

```bash
# Preveri napredek
azd show

# Če si zataknjen več kot 30 minut, preveri Azure Portal:
azd monitor
# Poišči neuspešne implementacije
```

### ❌ "Dostop zavrnjen" ali "Prepovedano"

```bash
# Preverite svojo vlogo v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete vsaj vlogo "Sodelavec"
# Prosite svojega Azure administratorja, da podeli:
# - Sodelavec (za vire)
# - Administrator uporabniškega dostopa (za dodelitve vlog)
```

### ❌ URL nameščene aplikacije ni mogoče najti

```bash
# Prikaži vse končne točke storitev
azd show

# Ali odpri Azure Portal
azd monitor

# Preveri določeno storitev
azd env get-values
# Poišči spremenljivke *_URL
```

### 📚 Celoviti viri za odpravljanje težav

- **Vodič za pogoste težave:** [Podrobne rešitve](docs/troubleshooting/common-issues.md)
- **Težave specifične za AI:** [Odpravljanje težav z AI](docs/troubleshooting/ai-troubleshooting.md)
- **Vodič za razhroščevanje:** [Razhroščevanje korak za korakom](docs/troubleshooting/debugging.md)
- **Pridobi pomoč:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Hitri vodič za odpravljanje težav

**Pogoste težave, s katerimi se srečujejo začetniki, in takojšnje rešitve:**

<details>
<summary><strong>❌ "azd: ukaz ni najden"</strong></summary>

```bash
# Najprej namestite AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Preverite namestitev
azd version
```
</details>

<details>
<summary><strong>❌ "Naročnina ni najdena" ali "Naročnina ni nastavljena"</strong></summary>

```bash
# Našteti razpoložljive naročnine
az account list --output table

# Nastavi privzeto naročnino
az account set --subscription "<subscription-id-or-name>"

# Nastavi za AZD okolje
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Preveri
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" ali "Prekoračena kvota"</strong></summary>

```bash
# Poskusite drugo regijo Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ali uporabljajte manjše SKU-je v razvoju
# Uredite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" spodleti na polovici procesa</strong></summary>

```bash
# Možnost 1: Očisti in poskusi znova
azd down --force --purge
azd up

# Možnost 2: Samo popravi infrastrukturo
azd provision

# Možnost 3: Preveri podrobne dnevnike
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Avtentikacija ni uspela" ali "Žeton je potekel"</strong></summary>

```bash
# Ponovno overi
az logout
az login

azd auth logout
azd auth login

# Preveri overjanje
az account show
```
</details>

<details>
<summary><strong>❌ "Viri že obstajajo" ali konflikti imen</strong></summary>

```bash
# AZD ustvarja edinstvena imena, vendar v primeru konflikta:
azd down --force --purge

# Poskusi znova z novim okoljem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Predloga za namestitev traja predolgo</strong></summary>

**Normalni časi čakanja:**
- Preprosta spletna aplikacija: 5-10 minut
- Aplikacija z bazo podatkov: 10-15 minut
- AI aplikacije: 15-25 minut (OpenAI zagotavljanje je počasno)

```bash
# Preveri napredek
azd show

# Če je zataknjeno več kot 30 minut, preveri Azure Portal:
azd monitor
# Poišči neuspešne namestitve
```
</details>

<details>
<summary><strong>❌ "Dostop zavrnjen" ali "Prepovedano"</strong></summary>

```bash
# Preverite svojo Azure vlogo
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete vsaj vlogo "Contributor"
# Prosite svojega Azure skrbnika, naj dodeli:
# - Contributor (za vire)
# - Administrator dostopa uporabnikov (za dodelitve vlog)
```
</details>

<details>
<summary><strong>❌ URL nameščene aplikacije ni mogoče najti</strong></summary>

```bash
# Prikaži vse končne točke storitev
azd show

# Ali odpri Azure Portal
azd monitor

# Preveri določeno storitev
azd env get-values
# Poišči spremenljivke *_URL
```
</details>

### 📚 Celoviti viri za odpravljanje težav

- **Vodič za pogoste težave:** [Podrobne rešitve](docs/troubleshooting/common-issues.md)
- **Težave specifične za AI:** [Odpravljanje težav z AI](docs/troubleshooting/ai-troubleshooting.md)
- **Vodič za razhroščevanje:** [Razhroščevanje korak za korakom](docs/troubleshooting/debugging.md)
- **Pridobi pomoč:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Zaključek tečaja in potrdilo

### Spremljanje napredka
Spremljajte svoj učni napredek v vsakem poglavju:

- [ ] **Poglavje 1**: Osnove in hiter začetek ✅
- [ ] **Poglavje 2**: AI-prvi razvoj ✅  
- [ ] **Poglavje 3**: Konfiguracija in avtentikacija ✅
- [ ] **Poglavje 4**: Infrastruktura kot koda in nameščanje ✅
- [ ] **Poglavje 5**: Večagentne AI rešitve ✅
- [ ] **Poglavje 6**: Prednamestitvena validacija in načrtovanje ✅
- [ ] **Poglavje 7**: Odpravljanje težav in razhroščevanje ✅
- [ ] **Poglavje 8**: Produkcijski in enterprise vzorci ✅

### Preverjanje znanja
Po zaključku vsakega poglavja preverite svoje znanje z:
1. **Praktična vaja**: Dokončajte poglavje z namestitvijo v praksi
2. **Preverjanje znanja**: Preglejte poglavje FAQ
3. **Skupnostna razprava**: Delite svojo izkušnjo v Azure Discordu
4. **Naslednje poglavje**: Premaknite se na naslednjo raven zahtevnosti

### Prednosti zaključka tečaja
Po zaključku vseh poglavij boste imeli:
- **Izkušnje v produkciji**: Dejansko nameščene AI aplikacije v Azure
- **Strokovne veščine**: Zmožnost nameščanja na enterprise ravni  
- **Priznanje skupnosti**: Aktivni član Azure razvijalske skupnosti
- **Napredovanje kariere**: Želeno znanje AZD in AI nameščanja

---

## 🤝 Skupnost in podpora

### Pridobite pomoč in podporo
- **Tehnične težave:** [Prijava napak in zahteve za funkcije](https://github.com/microsoft/azd-for-beginners/issues)
- **Vprašanja o učenju:** [Microsoft Azure Discord skupnost](https://discord.gg/microsoft-azure) in [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoč specifična za AI:** Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija:** [Uradna dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Skupnostni vpogledi iz Microsoft Foundry Discord

**Nedavne rezultate ankete na kanalu #Azure:**
- **45%** razvijalcev želi uporabljati AZD za AI delovne obremenitve
- **Glavni izzivi**: Namestitve več storitev, upravljanje poverilnic, pripravljenost za produkcijo  
- **Najbolj zahtevano**: AI-specifične predloge, vodiči za odpravljanje težav, najboljše prakse

**Pridružite se naši skupnosti, da:**
- Delite svoje izkušnje z AZD + AI in pridobite pomoč
- Dostopate do zgodnjih predogledov novih AI predlog
- Prispevate k najboljšim praksam AI nameščanja
- Vplivate na prihodnji razvoj funkcij AI + AZD

### Sodelovanje pri tečaju
Prispevke veselo sprejemamo! Prosimo, preberite naš [Vodič za sodelovanje](CONTRIBUTING.md) za podrobnosti o:
- **Izboljšavah vsebine**: Izboljšajte obstoječa poglavja in primere
- **Novi primeri**: Dodajte realne scenarije in predloge  
- **Prevajanje**: Pomagajte vzdrževati podporo za več jezikov
- **Prijava napak**: Izboljšajte točnost in jasnost
- **Skupnostni standardi**: Sledite našim vključujočim smernicam skupnosti

---

## 📄 Informacije o tečaju

### Licenca
Ta projekt je licenciran pod licenco MIT - za podrobnosti glejte datoteko [LICENSE](../../LICENSE).

### Povezani Microsoft učni viri

Naša ekipa izdeluje tudi druge celovite učne tečaje:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j za začetnike](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js za začetnike](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Rob / MCP / Agenti
[![AZD za začetnike](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Roboten AI za začetnike](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP za začetnike](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agenti za začetnike](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generativni AI serija
[![Generativen AI za začetnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativen AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativen AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativen AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![ML za začetnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science za začetnike](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![UI za začetnike](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetska varnost za začetnike](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Spletni razvoj za začetnike](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT za začetnike](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Razvoj XR za začetnike](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Serija Copilot
[![Copilot za AI programiranje v paru](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot za C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Avantura](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP PREVAJALEC DRUGE TEČAJE KONČAJ -->

---

## 🗺️ Navigacija po tečaju

**🚀 Pripravljeni za začetek učenja?**

**Začetniki**: Začnite s [Poglavje 1: Osnove in hiter začetek](../..)  
**Razvijalci AI**: Preskočite na [Poglavje 2: AI-prvi razvoj](../..)  
**Izkušeni razvijalci**: Začnite s [Poglavje 3: Konfiguracija in overjanje](../..)

**Naslednji koraki**: [Začni Poglavje 1 - Osnove AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za avtomatski prevod AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za uradni vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za kakršne koli nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->