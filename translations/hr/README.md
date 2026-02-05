<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T15:28:57+00:00",
  "source_file": "README.md",
  "language_code": "hr"
}
-->
# AZD za početnike: Strukturirano putovanje učenjem

![AZD-for-beginners](../../../../translated_images/hr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Početak rada s ovim tečajem

Slijedite ove korake kako biste započeli svoje AZD učenje:

1. **Forkajte repozitorij**: Kliknite [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klona repozitorij**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Pridružite se zajednici**: [Azure Discord zajednice](https://discord.com/invite/ByRwuEEgH4) za stručnu podršku
4. **Odaberite svoj put učenja**: Izaberite poglavlje ispod koje odgovara vašem iskustvenom nivou

### Podrška za više jezika

#### Automatski prijevodi (Uvijek ažurirano)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](./README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Preferirate lokalno kloniranje?**

> Ovaj repozitorij uključuje 50+ prijevoda jezika što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda, koristite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ovo vam daje sve što trebate za završetak tečaja s mnogo bržim preuzimanjem.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Pregled tečaja

Ovladajte Azure Developer CLI-jem (azd) kroz strukturirane poglavlja dizajnirana za postupno učenje. **Posebna usredotočenost na implementaciju AI aplikacija s integracijom Microsoft Foundry.**

### Zašto je ovaj tečaj ključan za moderne developere

Temeljeno na uvidima Microsoft Foundry Discord zajednice, **45% developera želi koristiti AZD za AI radna opterećenja**, ali nailazi na probleme s:
- Složenim višeservisnim AI arhitekturama
- Najboljim praksama za implementaciju AI u proizvodnom okruženju  
- Integracijom i konfiguracijom Azure AI servisa
- Optimizacijom troškova AI radnih opterećenja
- Rješavanjem problema specifičnih za AI implementacije

### Ciljevi učenja

Završetkom ovog strukturiranog tečaja ćete:
- **Ovladati osnovama AZD-a**: Temeljni koncepti, instalacija i konfiguracija
- **Implementirati AI aplikacije**: Koristiti AZD s Microsoft Foundry servisima
- **Provoditi infrastrukturu kao kod**: Upravljati Azure resursima pomoću Bicep predložaka
- **Rješavati probleme implementacija**: Otklanjati uobičajene probleme i debugirati
- **Optimizirati za proizvodnju**: Sigurnost, skaliranje, nadzor i upravljanje troškovima
- **Graditi višeslojne AI sustave**: Implementirati složene AI arhitekture

## 📚 Poglavlja za učenje

*Odaberite svoj put učenja prema iskustvu i ciljevima*

### 🚀 Poglavlje 1: Osnove & Brzi početak
**Preduvjeti**: Azure pretplata, osnovno znanje naredbenog retka  
**Trajanje**: 30-45 minuta  
**Složenost**: ⭐

#### Što ćete naučiti
- Razumijevanje osnovnih koncepata Azure Developer CLI-ja
- Instalacija AZD na vašoj platformi
- Vaša prva uspješna implementacija

#### Resursi za učenje
- **🎯 Počnite ovdje**: [Što je Azure Developer CLI?](../..)
- **📖 Teorija**: [AZD Osnove](docs/getting-started/azd-basics.md) - Temeljni koncepti i terminologija
- **⚙️ Postavljanje**: [Instalacija i postavljanje](docs/getting-started/installation.md) - Vodiči za specifične platforme
- **🛠️ Praktično**: [Vaš prvi projekt](docs/getting-started/first-project.md) - Korak-po-korak vodič
- **📋 Brzi pregled**: [Prečaci naredbi](resources/cheat-sheet.md)

#### Praktične vježbe
```bash
# Brza provjera instalacije
azd version

# Postavite svoju prvu aplikaciju
azd init --template todo-nodejs-mongo
azd up
```

**💡 Rezultat poglavlja**: Uspješno implementirati jednostavnu web aplikaciju u Azure koristeći AZD

**✅ Provjera uspjeha:**
```bash
# Nakon dovršetka Poglavlja 1, trebali biste biti sposobni:
azd version              # Prikazuje instaliranu verziju
azd init --template todo-nodejs-mongo  # Inicijalizira projekt
azd up                  # Postavlja na Azure
azd show                # Prikazuje URL pokrenute aplikacije
# Aplikacija se otvara u pregledniku i radi
azd down --force --purge  # Čisti resurse
```

**📊 Uloženo vrijeme:** 30-45 minuta  
**📈 Razina vještine nakon:** Mogu samostalno implementirati osnovne aplikacije

**✅ Provjera uspjeha:**
```bash
# Nakon dovršetka Poglavlja 1, trebali biste moći:
azd version              # Prikazuje instaliranu verziju
azd init --template todo-nodejs-mongo  # Inicijalizira projekt
azd up                  # Postavlja na Azure
azd show                # Prikazuje URL pokrenute aplikacije
# Aplikacija se otvara u pregledniku i radi
azd down --force --purge  # Čisti resurse
```

**📊 Uloženo vrijeme:** 30-45 minuta  
**📈 Razina vještine nakon:** Mogu samostalno implementirati osnovne aplikacije

---

### 🤖 Poglavlje 2: AI-prvi razvoj (Preporučeno za AI developere)
**Preduvjeti**: Završeno poglavlje 1  
**Trajanje**: 1-2 sata  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Integracija Microsoft Foundry s AZD-om
- Implementacija AI aplikacija
- Razumijevanje konfiguracija AI servisa

#### Resursi za učenje
- **🎯 Počnite ovdje**: [Integracija Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Obrasci**: [Implementacija AI modela](docs/microsoft-foundry/ai-model-deployment.md) - Implementirajte i upravljajte AI modelima
- **🛠️ Radionica**: [AI radionica](docs/microsoft-foundry/ai-workshop-lab.md) - Pripremite AI rješenja za AZD
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Učenje u pregledniku s MkDocs * DevContainer okruženjem
- **📋 Predlošci**: [Microsoft Foundry predlošci](../..)
- **📝 Primjeri**: [Primjeri AZD implementacija](examples/README.md)

#### Praktične vježbe
```bash
# Objavite svoju prvu AI aplikaciju
azd init --template azure-search-openai-demo
azd up

# Isprobajte dodatne AI predloške
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Rezultat poglavlja**: Implementirati i konfigurirati AI chat aplikaciju s RAG mogućnostima

**✅ Provjera uspjeha:**
```bash
# Nakon Poglavlja 2, trebali biste moći:
azd init --template azure-search-openai-demo
azd up
# Testirati AI chat sučelje
# Postavljati pitanja i dobivati AI-potpomognute odgovore sa izvorima
# Provjeriti radi li integracija pretraživanja
azd monitor  # Provjeriti prikazuje li Application Insights telemetriju
azd down --force --purge
```

**📊 Uloženo vrijeme:** 1-2 sata  
**📈 Razina vještine nakon:** Mogu implementirati i konfigurirati AI aplikacije spremne za produkciju  
**💰 Svijest o troškovima:** Razumijevanje troškova razvoja $80-150/mj i produkcije $300-3500/mj

#### 💰 Troškovi razmatranja za AI implementacije

**Razvojno okruženje (procijenjeno $80-150/mj):**
- Azure OpenAI (plaćanje po korištenju): $0-50/mj ovisno o korištenju tokena
- AI Search (osnovni sloj): $75/mj
- Container Apps (potrošnja): $0-20/mj
- Pohrana (standardna): $1-5/mj

**Produkcijsko okruženje (procijenjeno $300-3500+/mj):**
- Azure OpenAI (PTU za konzistentne performanse): $3.000+/mj ILI plaćanje po korištenju s velikim volumenom
- AI Search (standardni sloj): $250/mj
- Container Apps (namjenski): $50-100/mj
- Application Insights: $5-50/mj
- Pohrana (premium): $10-50/mj

**💡 Savjeti za optimizaciju troškova:**
- Koristite **besplatni sloj** Azure OpenAI za učenje (uključuje 50.000 tokena/mj)
- Pokrenite `azd down` za oslobađanje resursa kad ne razvijate aktivno
- Počnite s naplatom po potrošnji, PTU koristite samo za produkciju
- Koristite `azd provision --preview` za procjenu troškova prije implementacije
- Omogućite automatsko skaliranje: plaćate samo za stvarnu potrošnju

**Praćenje troškova:**
```bash
# Provjerite procijenjene mjesečne troškove
azd provision --preview

# Pratite stvarne troškove u Azure portalu
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Poglavlje 3: Konfiguracija i autentifikacija
**Preduvjeti**: Završeno poglavlje 1  
**Trajanje**: 45-60 minuta  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Upravljanje i konfiguracija okruženja
- Autentifikacija i sigurnosne najbolje prakse
- Imenovanje i organizacija resursa

#### Resursi za učenje
- **📖 Konfiguracija**: [Vodič za konfiguraciju](docs/getting-started/configuration.md) - Postavljanje okruženja
- **🔐 Sigurnost**: [Obrasci autentifikacije i upravljane identitete](docs/getting-started/authsecurity.md)
- **📝 Primjeri**: [Primjer aplikacije s bazom podataka](examples/database-app/README.md) - AZD primjeri baza podataka

#### Praktične vježbe
- Konfigurirajte višestruka okruženja (dev, staging, prod)
- Postavite autentifikaciju s upravljanom identitetom
- Provedite konfiguracije specifične za okruženja

**💡 Rezultat poglavlja**: Upravljajte višestrukim okruženjima s odgovarajućom autentifikacijom i sigurnošću

---

### 🏗️ Poglavlje 4: Infrastruktura kao kod i implementacija
**Preduvjeti**: Završena poglavlja 1-3  
**Trajanje**: 1-1.5 sati  
**Složenost**: ⭐⭐⭐

#### Što ćete naučiti
- Napredni obrasci implementacije
- Infrastruktura kao kod pomoću Bicep
- Strategije provisioniranja resursa

#### Resursi za učenje
- **📖 Implementacija**: [Vodič za implementaciju](docs/deployment/deployment-guide.md) - Kompletni radni tokovi
- **🏗️ Provisioniranje**: [Provisioniranje resursa](docs/deployment/provisioning.md) - Upravljanje Azure resursima
- **📝 Primjeri**: [Primjer Container App](../../examples/container-app) - Implementacije u kontejnerima

#### Praktične vježbe
- Izradite prilagođene Bicep predloške
- Implementirajte višeservisne aplikacije
- Primijenite strategije blue-green implementacije

**💡 Rezultat poglavlja**: Implementirajte složene višeservisne aplikacije koristeći prilagođene infrastrukturne predloške

---

### 🎯 Poglavlje 5: Višeagentska AI rješenja (Napredno)
**Preduvjeti**: Završena poglavlja 1-2  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Obrasci arhitekture sa više agenata
- Orkestracija i koordinacija agenata
- Implementacije AI spremne za proizvodnju

#### Resursi za učenje
- **🤖 Istaknuti projekt**: [Rješenje za maloprodaju s više agenata](examples/retail-scenario.md) - Potpuna implementacija
- **🛠️ ARM predlošci**: [Paket ARM predložaka](../../examples/retail-multiagent-arm-template) - Implementacija jednim klikom
- **📖 Arhitektura**: [Uzorki koordinacije više agenata](/docs/pre-deployment/coordination-patterns.md) - Uzorci

#### Praktične vježbe
```bash
# Implementirati cjelovito maloprodajno višestruko agentsko rješenje
cd examples/retail-multiagent-arm-template
./deploy.sh

# Istražite konfiguracije agenata
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Ishod poglavlja**: Implementacija i upravljanje AI rješenjem s više agenata spremnim za proizvodnju sa agentima Kupca i Inventara

---

### 🔍 Poglavlje 6: Validacija i planiranje prije implementacije
**Preduvjeti**: Završeno Poglavlje 4  
**Trajanje**: 1 sat  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Planiranje kapaciteta i validacija resursa
- Strategije odabira SKU-a
- Prethodne provjere i automatizacija

#### Resursi za učenje
- **📊 Planiranje**: [Planiranje kapaciteta](docs/pre-deployment/capacity-planning.md) - Validacija resursa
- **💰 Odabir**: [Odabir SKU-a](docs/pre-deployment/sku-selection.md) - Troškovno učinkoviti izbori
- **✅ Validacija**: [Prethodne provjere](docs/pre-deployment/preflight-checks.md) - Automatski skripti

#### Praktične vježbe
- Pokrenite skripte za provjeru kapaciteta
- Optimizirajte odabir SKU-a za troškove
- Implementirajte automatizirane prethodne provjere

**💡 Ishod poglavlja**: Validirati i optimizirati implementacije prije izvođenja

---

### 🚨 Poglavlje 7: Otklanjanje poteškoća i ispravljanje pogrešaka
**Preduvjeti**: Završeno bilo koje poglavlje o implementaciji  
**Trajanje**: 1-1.5 sati  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Sistematski pristupi ispravljanju pogrešaka
- Uobičajeni problemi i rješenja
- Otklanjanje poteškoća specifičnih za AI

#### Resursi za učenje
- **🔧 Uobičajeni problemi**: [Uobičajeni problemi](docs/troubleshooting/common-issues.md) - FAQ i rješenja
- **🕵️ Ispravljanje pogrešaka**: [Vodič za ispravljanje pogrešaka](docs/troubleshooting/debugging.md) - Strategije korak po korak
- **🤖 AI problemi**: [Specifično otklanjanje poteškoća s AI](docs/troubleshooting/ai-troubleshooting.md) - Problemi AI servisa

#### Praktične vježbe
- Dijagnosticirajte neuspjehe implementacije
- Riješite probleme s autentifikacijom
- Otklonite probleme povezivanja s AI servisom

**💡 Ishod poglavlja**: Samostalno dijagnosticirati i riješiti uobičajene probleme prilikom implementacije

---

### 🏢 Poglavlje 8: Obrasci proizvodnje i poduzeća
**Preduvjeti**: Završena poglavlja 1-4  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Strategije implementacije u proizvodnju
- Obrasci sigurnosti za poduzeća
- Praćenje i optimizacija troškova

#### Resursi za učenje
- **🏭 Proizvodnja**: [Najbolje prakse za AI proizvodnju](docs/microsoft-foundry/production-ai-practices.md) - Obrasci za poduzeća
- **📝 Primjeri**: [Primjer mikroservisa](../../examples/microservices) - Složene arhitekture
- **📊 Praćenje**: [Integracija Application Insights](docs/pre-deployment/application-insights.md) - Praćenje

#### Praktične vježbe
- Implementirajte obrasce sigurnosti za poduzeća
- Postavite detaljno praćenje
- Implementirajte u proizvodnju uz ispravnu upravu

**💡 Ishod poglavlja**: Implementirati aplikacije spremne za poduzeća s punim proizvodnim mogućnostima

---

## 🎓 Pregled radionice: Praktično iskustvo učenja

> **⚠️ STATUS RADIONICE: Aktivni razvoj**  
> Materijali radionice trenutno se razvijaju i usavršavaju. Glavni moduli su funkcionalni, ali neki napredni dijelovi nisu dovršeni. Aktivno radimo na dovršetku cijelog sadržaja. [Pratite napredak →](workshop/README.md)

### Interaktivni materijali radionice
**Sveobuhvatno praktično učenje s alatima u pregledniku i vođenim vježbama**

Naši materijali za radionicu pružaju strukturirano, interaktivno iskustvo učenja koje nadopunjuje gore navedeni kurikulum po poglavljima. Radionica je dizajnirana za samostalno učenje ili pod vodstvom instruktora.

#### 🛠️ Značajke radionice
- **Sučelje u pregledniku**: Potpuna radionica pokretana MkDocs-om s funkcijama pretraživanja, kopiranja i teme
- **Integracija GitHub Codespaces**: Jednim klikom postavljanje razvojne okoline
- **Strukturirani put učenja**: 7 koraka vođenih vježbi (ukupno 3.5 sati)
- **Otkrivanje → Implementacija → Prilagodba**: Progresivna metodologija
- **Interaktivno DevContainer okruženje**: Pre-konfigurirani alati i ovisnosti

#### 📚 Struktura radionice
Radionica prati metodologiju **Otkrivanje → Implementacija → Prilagodba**:

1. **Faza otkrivanja** (45 min)
   - Istražite Microsoft Foundry predloške i servise
   - Razumite arhitekturu više agenata
   - Pregledajte zahtjeve i preduvjete za implementaciju

2. **Faza implementacije** (2 sata)
   - Praktična implementacija AI aplikacija s AZD-om
   - Konfiguriranje Azure AI servisa i krajnjih točaka
   - Implementacija sigurnosnih i autentifikacijskih obrazaca

3. **Faza prilagodbe** (45 min)
   - Prilagodba aplikacija za specifične slučajeve korištenja
   - Optimizacija za produkcijsku implementaciju
   - Implementacija praćenja i upravljanja troškovima

#### 🚀 Početak rada u radionici
```bash
# Opcija 1: GitHub Codespaces (Preporučeno)
# Kliknite "Code" → "Create codespace on main" u spremištu

# Opcija 2: Lokalni razvoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Slijedite upute za postavljanje u workshop/README.md
```

#### 🎯 Ishodi učenja radionice
Završetkom radionice, sudionici će:
- **Implementirati AI aplikacije spremne za proizvodnju**: Koristiti AZD s Microsoft Foundry servisima
- **Ovladati arhitekturom više agenata**: Implementirati koordinirane AI agentske sustave
- **Primijeniti najbolje sigurnosne prakse**: Konfigurirati autentifikaciju i kontrolu pristupa
- **Optimizirati za skaliranje**: Dizajnirati troškovno učinkovite i visoko-performantne implementacije
- **Otkloniti poteškoće prilikom implementacije**: Samostalno rješavati uobičajene probleme

#### 📖 Resursi radionice
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Okruženje za učenje u pregledniku
- **📋 Upute korak po korak**: [Vođene vježbe](../../workshop/docs/instructions) - Detaljni vodiči
- **🛠️ AI laboratorij radionice**: [AI laboratorij radionice](docs/microsoft-foundry/ai-workshop-lab.md) - Vježbe fokusirane na AI
- **💡 Brzi početak**: [Vodič za postavljanje radionice](workshop/README.md#quick-start) - Konfiguracija okoline

**Savršeno za**: Korporativne obuke, sveučilišne tečajeve, samostalno učenje i developere bootcampove.

---

## 📖 Što je Azure Developer CLI?

Azure Developer CLI (azd) je komandna linija usmjerena na developere koja ubrzava proces izrade i implementacije aplikacija u Azure. Pruža:

- **Implementacije temeljene na predlošcima** - Koristi unaprijed izrađene predloške za uobičajene obrasce aplikacija
- **Infrastruktura kao kod** - Upravljanje Azure resursima pomoću Bicep ili Terraform  
- **Integrirani radni tokovi** - Neprimjetno pokretanje, implementacija i praćenje aplikacija
- **Prilagođeno developerima** - Optimizirano za produktivnost i iskustvo developera

### **AZD + Microsoft Foundry: Savršeno za AI implementacije**

**Zašto AZD za AI rješenja?** AZD rješava glavne izazove s kojima se developeri AI-a suočavaju:

- **Predlošci spremni za AI** - Pre-konfigurirani predlošci za Azure OpenAI, Cognitive Services i ML opterećenja
- **Sigurne AI implementacije** - Ugrađeni sigurnosni obrasci za AI servise, API ključeve i krajnje točke modela  
- **Obrasci proizvodnje za AI** - Najbolje prakse za skalabilne i troškovno učinkovite AI aplikacije
- **End-to-end AI radni tokovi** - Od razvoja modela do produkcijske implementacije s pravilnim praćenjem
- **Optimizacija troškova** - Pametno raspoređivanje resursa i strategije skaliranja za AI opterećenja
- **Integracija Microsoft Foundryja** - Neprimjetna veza s katalogom modela i krajnjim točkama Microsoft Foundryja

---

## 🎯 Predlošci i biblioteka primjera

### Istaknuti: Microsoft Foundry predlošci
**Počnite ovdje ako implementirate AI aplikacije!**

> **Napomena:** Ovi predlošci pokazuju različite AI obrasce. Neki su vanjski Azure uzorci, drugi lokalne implementacije.

| Predložak | Poglavlje | Složenost | Servisi | Tip |
|----------|---------|------------|----------|------|
| [**Početak s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Vanjski |
| [**Početak s AI agentima**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavlje 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Vanjski |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Vanjski |
| [**Brzi početak OpenAI chat aplikacije**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Vanjski |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Vanjski |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Vanjski |
| [**Rješenje za maloprodaju s više agenata**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalno** |

### Istaknuti: Potpuni scenariji učenja
**Predlošci aplikacija spremnih za proizvodnju povezani s poglavljima za učenje**

| Predložak | Poglavlje za učenje | Složenost | Ključni aspekt učenja |
|----------|------------------|------------|-----------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | Osnovni obrasci AI implementacije |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | Implementacija RAG-a sa Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavlje 4 | ⭐⭐ | Integracija inteligencije dokumenata |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | Okvir za agente i pozivanje funkcija |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐ | Orkestracija AI za poduzeća |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | Arhitektura s više agenata s agentima Kupca i Inventara |

### Učenje po vrsti primjera

> **📌 Lokalni vs. Vanjski primjeri:**  
> **Lokalni primjeri** (u ovom repozitoriju) = Spremni za upotrebu odmah  
> **Vanjski primjeri** (Azure uzorci) = Klonirati iz povezanih repozitorija

#### Lokalni primjeri (spremni za upotrebu)
- [**Rješenje za maloprodaju s više agenata**](examples/retail-scenario.md) - Potpuna produkcijska implementacija s ARM predlošcima
  - Arhitektura s više agenata (Kupac + Inventar)
  - Sveobuhvatno praćenje i evaluacija
  - Implementacija jednim klikom preko ARM predloška

#### Lokalni primjeri - Container aplikacije (Poglavlja 2-5)
**Sveobuhvatni primjeri implementacije kontejnera u ovom repozitoriju:**
- [**Primjeri kontejnerskih aplikacija**](examples/container-app/README.md) - Potpuni vodič za kontejnerizirane implementacije
  - [Jednostavan Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API sa skaliranjem na nulu
  - [Arhitektura mikroservisa](../../examples/container-app/microservices) - Implementacija više servisa spremna za proizvodnju
  - Brzi početak, proizvodnja i napredni obrasci implementacije
  - Smjernice za praćenje, sigurnost i optimizaciju troškova

#### Vanjski primjeri - Jednostavne aplikacije (Poglavlja 1-2)
**Klonirajte ove Azure uzorke za početak:**
- Jednostavna web aplikacija - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni obrasci implementacije
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementacija statičkog sadržaja
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementacija REST API-ja

#### Vanjski primjeri - Integracija baza podataka (Poglavlja 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Obrasci povezivanja baze podataka
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless radni tokovi podataka

#### Vanjski primjeri - Napredni obrasci (Poglavlja 4-8)
- [Java mikroservisi](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitekture s više servisa
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Obrada u pozadini  
- [Enterprise ML pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkcijski ML obrasci

### Vanjske kolekcije predložaka
- [**Službena AZD galerija predložaka**](https://azure.github.io/awesome-azd/) - Kurirana zbirka službenih i zajedničkih predložaka
- [**Azure Developer CLI predlošci**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija predložaka Microsoft Learn
- [**Direktorij Primjeri**](examples/README.md) - Lokalni primjeri za učenje s detaljnim objašnjenjima

---

## 📚 Resursi za Učenje i Reference

### Brze Reference
- [**Prečac naredbi**](resources/cheat-sheet.md) - Osnovne azd naredbe organizirane po poglavljima
- [**Rječnik pojmova**](resources/glossary.md) - Terminologija za Azure i azd  
- [**Često postavljana pitanja (FAQ)**](resources/faq.md) - Česta pitanja organizirana po poglavljima za učenje
- [**Vodič za učenje**](resources/study-guide.md) - Sveobuhvatne vježbe za praksu

### Radionice s Praktičnim Radom
- [**AI laboratorijska radionica**](docs/microsoft-foundry/ai-workshop-lab.md) - Učinite svoje AI rješenja spremnima za AZD implementaciju (2-3 sata)
- [**Interaktivni vodič za radionicu**](workshop/README.md) - Radionica u pregledniku uz MkDocs i DevContainer okruženje
- [**Strukturirani put učenja**](../../workshop/docs/instructions) - 7-koraka vođene vježbe (Istraživanje → Implementacija → Prilagodba)
- [**AZD radionica za početnike**](workshop/README.md) - Kompletni materijali za radionicu s integracijom u GitHub Codespaces

### Vanjski Resursi za Učenje
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Centar za arhitekturu](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Kalkulator cijena](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Brzi Vodič za Rješavanje Problema

**Česti problemi s kojima se početnici susreću i trenutna rješenja:**

### ❌ "azd: naredba nije pronađena"

```bash
# Prvo instalirajte AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Provjerite instalaciju
azd version
```

### ❌ "Nema pretplate" ili "Pretplata nije postavljena"

```bash
# Prikaži dostupne pretplate
az account list --output table

# Postavi zadanu pretplatu
az account set --subscription "<subscription-id-or-name>"

# Postavi za AZD okruženje
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Provjeri
az account show
```

### ❌ "Nedovoljna kvota" ili "Kvota prekoračena"

```bash
# Isprobajte različitu Azure regiju
azd env set AZURE_LOCATION "westus2"
azd up

# Ili koristite manje SKU-ove u razvoju
# Uredite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" ne uspijeva usred izvođenja

```bash
# Opcija 1: Očisti i pokušaj ponovno
azd down --force --purge
azd up

# Opcija 2: Samo popravite infrastrukturu
azd provision

# Opcija 3: Provjeri detaljne zapise
azd show
azd logs
```

### ❌ "Autentikacija neuspjela" ili "Token je istekao"

```bash
# Ponovno se autentificirati
az logout
az login

azd auth logout
azd auth login

# Potvrditi autentikaciju
az account show
```

### ❌ "Resurs već postoji" ili sukobi u imenima

```bash
# AZD generira jedinstvena imena, ali ako dođe do sukoba:
azd down --force --purge

# Zatim pokušajte ponovno s novim okruženjem
azd env new dev-v2
azd up
```

### ❌ Implementacija predloška traje predugo

**Normalno vrijeme čekanja:**
- Jednostavna web-aplikacija: 5-10 minuta
- Aplikacija s bazom podataka: 10-15 minuta
- AI aplikacije: 15-25 minuta (OpenAI postavljanje je sporo)

```bash
# Provjerite napredak
azd show

# Ako je zastoj >30 minuta, provjerite Azure Portal:
azd monitor
# Potražite neuspjele implementacije
```

### ❌ "Dozvola odbijena" ili "Zabranjeno"

```bash
# Provjerite svoju Azure ulogu
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebna vam je barem uloga "Contributor"
# Zamolite svog Azure administratora da odobri:
# - Contributor (za resurse)
# - User Access Administrator (za dodjelu uloga)
```

### ❌ Ne mogu pronaći URL implementirane aplikacije

```bash
# Prikaži sve krajnje točke usluge
azd show

# Ili otvori Azure Portal
azd monitor

# Provjeri određenu uslugu
azd env get-values
# Potraži *_URL varijable
```

### 📚 Potpuni resursi za rješavanje problema

- **Vodič za česte probleme:** [Detaljna rješenja](docs/troubleshooting/common-issues.md)
- **Problemi specifični za AI:** [Rješavanje problema s AI](docs/troubleshooting/ai-troubleshooting.md)
- **Vodič za ispravljanje pogrešaka:** [Korak-po-korak otklanjanje pogrešaka](docs/troubleshooting/debugging.md)
- **Dobijte pomoć:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Brzi Vodič za Rješavanje Problema

**Česti problemi s kojima se početnici susreću i trenutna rješenja:**

<details>
<summary><strong>❌ "azd: naredba nije pronađena"</strong></summary>

```bash
# Prvo instalirajte AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Provjerite instalaciju
azd version
```
</details>

<details>
<summary><strong>❌ "Nema pretplate" ili "Pretplata nije postavljena"</strong></summary>

```bash
# Nabroji dostupne pretplate
az account list --output table

# Postavi zadanu pretplatu
az account set --subscription "<subscription-id-or-name>"

# Postavi za AZD okruženje
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verificiraj
az account show
```
</details>

<details>
<summary><strong>❌ "Nedovoljna kvota" ili "Kvota prekoračena"</strong></summary>

```bash
# Pokušajte drugu Azure regiju
azd env set AZURE_LOCATION "westus2"
azd up

# Ili koristite manje SKU-ove u razvoju
# Uredite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ne uspijeva usred izvođenja</strong></summary>

```bash
# Opcija 1: Očistiti i pokušati ponovo
azd down --force --purge
azd up

# Opcija 2: Samo popraviti infrastrukturu
azd provision

# Opcija 3: Provjeriti detaljne zapise
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Autentikacija neuspjela" ili "Token je istekao"</strong></summary>

```bash
# Ponovno se autentificirajte
az logout
az login

azd auth logout
azd auth login

# Potvrdite autentifikaciju
az account show
```
</details>

<details>
<summary><strong>❌ "Resurs već postoji" ili sukobi u imenima</strong></summary>

```bash
# AZD generira jedinstvena imena, ali ako dođe do sukoba:
azd down --force --purge

# Zatim pokušajte ponovno s novim okruženjem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implementacija predloška traje predugo</strong></summary>

**Normalno vrijeme čekanja:**
- Jednostavna web-aplikacija: 5-10 minuta
- Aplikacija s bazom podataka: 10-15 minuta
- AI aplikacije: 15-25 minuta (OpenAI postavljanje je sporo)

```bash
# Provjeri napredak
azd show

# Ako zapne >30 minuta, provjeri Azure portal:
azd monitor
# Potraži neuspjele implementacije
```
</details>

<details>
<summary><strong>❌ "Dozvola odbijena" ili "Zabranjeno"</strong></summary>

```bash
# Provjerite svoju Azure ulogu
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebna vam je najmanje uloga "Contributor"
# Zamolite svog Azure administratore da odobri:
# - Contributor (za resurse)
# - User Access Administrator (za dodjelu uloga)
```
</details>

<details>
<summary><strong>❌ Ne mogu pronaći URL implementirane aplikacije</strong></summary>

```bash
# Prikaži sve krajnje točke usluge
azd show

# Ili otvorite Azure portal
azd monitor

# Provjerite određenu uslugu
azd env get-values
# Potražite *_URL varijable
```
</details>

### 📚 Potpuni resursi za rješavanje problema

- **Vodič za česte probleme:** [Detaljna rješenja](docs/troubleshooting/common-issues.md)
- **Problemi specifični za AI:** [Rješavanje problema s AI](docs/troubleshooting/ai-troubleshooting.md)
- **Vodič za ispravljanje pogrešaka:** [Korak-po-korak otklanjanje pogrešaka](docs/troubleshooting/debugging.md)
- **Dobijte pomoć:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Završetak Tečaja i Certifikacija

### Praćenje Napretka
Pratite svoj napredak kroz svako poglavlje:

- [ ] **Poglavlje 1**: Osnove & Brzi početak ✅
- [ ] **Poglavlje 2**: AI-prvo razvoj ✅  
- [ ] **Poglavlje 3**: Konfiguracija & Autentikacija ✅
- [ ] **Poglavlje 4**: Infrastruktura kao kod & implementacija ✅
- [ ] **Poglavlje 5**: AI rješenja s više agenata ✅
- [ ] **Poglavlje 6**: Validacija i planiranje prije implementacije ✅
- [ ] **Poglavlje 7**: Rješavanje problema & otklanjanje pogrešaka ✅
- [ ] **Poglavlje 8**: Produkcijski i enterprise obrasci ✅

### Potvrda Znanja
Nakon završetka svakog poglavlja, provjerite svoje znanje kroz:
1. **Praktičnu vježbu**: Dovršite praktičnu implementaciju poglavlja
2. **Provjeru znanja**: Pregledajte FAQ za to poglavlje
3. **Zajedničku diskusiju**: Podijelite svoje iskustvo na Azure Discordu
4. **Sljedeće poglavlje**: Pristupite sljedećoj razini složenosti

### Prednosti Završetka Tečaja
Nakon završetka svih poglavlja imat ćete:
- **Iskustvo u produkciji**: Implementirane stvarne AI aplikacije u Azure
- **Profesionalne vještine**: Spremnost za enterprise implementaciju  
- **Priznanje u zajednici**: Aktivni član Azure developerske zajednice
- **Napredak u karijeri**: Tražene AZD i AI vještine za implementaciju

---

## 🤝 Zajednica i Podrška

### Dobijte Pomoć i Podršku
- **Tehnički problemi**: [Prijavite greške i zatražite značajke](https://github.com/microsoft/azd-for-beginners/issues)
- **Pitanja o učenju**: [Microsoft Azure Discord zajednica](https://discord.gg/microsoft-azure) i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoć specifična za AI**: Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Službena Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Uvidi zajednice iz Microsoft Foundry Discorda

**Najnoviji rezultati ankete na #Azure kanalu:**
- **45%** developera želi koristiti AZD za AI zadatke
- **Glavni izazovi**: Višeservisna implementacija, upravljanje vjerodajnicama, priprema za produkciju  
- **Najtraženije**: AI-specifični predlošci, vodiči za rješavanje problema, najbolje prakse

**Pridružite se našoj zajednici da:**
- Dijelite svoja AZD + AI iskustva i dobijete pomoć
- Pristupite ranim pregledima novih AI predložaka
- Doprinesete najboljim praksama za AI implementaciju
- Utječete na budući razvoj AI + AZD značajki

### Doprinos Tečaju
Dobrodošli su vaši doprinosi! Molimo pročitajte naš [Vodič za doprinos](CONTRIBUTING.md) za detalje o:
- **Poboljšanjima sadržaja**: Unaprijedite postojeća poglavlja i primjere
- **Novim primjerima**: Dodajte stvarne scenarije i predloške  
- **Prijevodu**: Pomozite održavati podršku za više jezika
- **Prijavama grešaka**: Poboljšajte točnost i jasnoću
- **Standardima zajednice**: Slijedite naše smjernice za uključivu zajednicu

---

## 📄 Informacije o Tečaju

### Licenca
Ovaj projekt je licenciran pod MIT licencom - pročitajte [LICENSE](../../LICENSE) za detalje.

### Povezani Microsoft resursi za učenje

Naš tim proizvodi i druge sveobuhvatne tečajeve za učenje:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j za početnike](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js za početnike](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agenti
[![AZD za početnike](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI za početnike](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP za početnike](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agenti za početnike](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Generativnog AI
[![Generativni AI za početnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![ML za početnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science za početnike](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI za početnike](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetička sigurnost za početnike](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web razvoj za početnike](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT za početnike](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR razvoj za početnike](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot serija
[![Copilot za AI upareno programiranje](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot za C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot avantura](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija kroz tečaj

**🚀 Spremni za početak učenja?**

**Početnici**: Započnite s [Poglavlje 1: Temelj & Brzi početak](../..)  
**AI programeri**: Preskočite na [Poglavlje 2: AI-prvi razvoj](../..)  
**Iskusni programeri**: Počnite s [Poglavlje 3: Konfiguracija & Autentikacija](../..)

**Sljedeći koraci**: [Započni Poglavlje 1 - AZD osnove](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj je dokument preveden korištenjem AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->