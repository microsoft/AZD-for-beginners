# AZD za početnike: Strukturirano učenje

![AZD-for-beginners](../../translated_images/hr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatski Prijevodi (Uvijek ažurirani)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arapski](../ar/README.md) | [Bengalski](../bn/README.md) | [Bugarski](../bg/README.md) | [Burmanski (Myanmar)](../my/README.md) | [Kineski (pojednostavljeni)](../zh-CN/README.md) | [Kineski (tradicionalni, Hong Kong)](../zh-HK/README.md) | [Kineski (tradicionalni, Makao)](../zh-MO/README.md) | [Kineski (tradicionalni, Tajvan)](../zh-TW/README.md) | [Hrvatski](./README.md) | [Češki](../cs/README.md) | [Danski](../da/README.md) | [Nizozemski](../nl/README.md) | [Estonski](../et/README.md) | [Finski](../fi/README.md) | [Francuski](../fr/README.md) | [Njemački](../de/README.md) | [Grčki](../el/README.md) | [Hebrejski](../he/README.md) | [Hindi](../hi/README.md) | [Mađarski](../hu/README.md) | [Indonezijski](../id/README.md) | [Talijanski](../it/README.md) | [Japanski](../ja/README.md) | [Kannada](../kn/README.md) | [Korejski](../ko/README.md) | [Litavski](../lt/README.md) | [Malaizijski](../ms/README.md) | [Malajalamski](../ml/README.md) | [Marati](../mr/README.md) | [Nepalski](../ne/README.md) | [Nigerijski pidgin](../pcm/README.md) | [Norveški](../no/README.md) | [Perzijski (Farsi)](../fa/README.md) | [Poljski](../pl/README.md) | [Portugalski (Brazil)](../pt-BR/README.md) | [Portugalski (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumunjski](../ro/README.md) | [Ruski](../ru/README.md) | [Srpski (ćirilica)](../sr/README.md) | [Slovački](../sk/README.md) | [Slovenski](../sl/README.md) | [Španjolski](../es/README.md) | [Svahili](../sw/README.md) | [Švedski](../sv/README.md) | [Tagalog (Filipinski)](../tl/README.md) | [Tamilski](../ta/README.md) | [Telugu](../te/README.md) | [Tajlandski](../th/README.md) | [Turski](../tr/README.md) | [Ukrajinski](../uk/README.md) | [Urdu](../ur/README.md) | [Vijetnamski](../vi/README.md)

> **Radije želite klonirati lokalno?**
>
> Ovaj repozitorij uključuje prijevode na više od 50 jezika, što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda, koristite sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Ovo vam daje sve što vam treba za dovršetak tečaja s mnogo bržim preuzimanjem.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Što je novo u azd danas

Azure Developer CLI je narastao izvan tradicionalnih web aplikacija i API-ja. Danas je azd jedini alat za implementaciju **bilo koje** aplikacije na Azure—uključujući AI-pokretane aplikacije i inteligentne agente.

Evo što to znači za vas:

- **AI agenti su sada nativni workloads u azd-u.** Možete inicijalizirati, implementirati i upravljati AI agent projektima koristeći isti `azd init` → `azd up` tijek rada koji već poznajete.
- **Integracija s Microsoft Foundry** donosi implementaciju modela, hostanje agenata i konfiguraciju AI servisa izravno u azd ekosustav predložaka.
- **Glavni tijek rada se nije promijenio.** Bilo da implementirate todo aplikaciju, mikroservis ili multi-agent AI rješenje, naredbe su iste.

Ako ste prije koristili azd, podrška za AI je prirodni dodatak—not zaseban alat ili napredni put. Ako počinjete iznova, naučit ćete jedan tijek rada koji radi za sve.

---

## 🚀 Što je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je CLI alat prilagođen developerima koji pojednostavljuje implementaciju aplikacija na Azure. Umjesto ručnog stvaranja i povezivanja desetaka Azure resursa, možete implementirati cijele aplikacije jednom naredbom.

### Čarolija `azd up`

```bash
# Ova jedina naredba obavlja sve:
# ✅ Stvara sve Azure resurse
# ✅ Konfigurira umrežavanje i sigurnost
# ✅ Gradi kod vaše aplikacije
# ✅ Raspoređuje na Azure
# ✅ Daje vam radni URL
azd up
```

**To je to!** Nema klikanja po Azure Portal-u, nema potrebe za učenjem složenih ARM predložaka, niti ručne konfiguracije – samo radeće aplikacije na Azure-u.

---

## ❓ Azure Developer CLI vs Azure CLI: Koja je razlika?

Ovo je najčešće pitanje koje početnici postavljaju. Evo jednostavnog odgovora:

| Značajka | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Svrha** | Upravljanje pojedinačnim Azure resursima | Implementacija cjelovitih aplikacija |
| **Pristup** | Fokus na infrastrukturu | Fokus na aplikacije |
| **Primjer** | `az webapp create --name myapp...` | `azd up` |
| **Krivulja učenja** | Potrebno poznavanje Azure servisa | Dovoljno poznavati svoju aplikaciju |
| **Najbolje za** | DevOps, infrastruktura | Developeri, prototipiranje |

### Jednostavna analogija

- **Azure CLI** je kao imati sve alate za izgradnju kuće – čekiće, pile, čavle. Možete napraviti bilo što, ali morate znati građevinu.
- **Azure Developer CLI** je kao unajmiti izvođača – opišete što želite, a on obavlja izgradnju.

### Kada koristiti koji

| Scenarij | Koristite ovo |
|----------|---------------|
| "Želim brzo postaviti web aplikaciju" | `azd up` |
| "Trebam samo napraviti storage account" | `az storage account create` |
| "Gradim kompletnu AI aplikaciju" | `azd init --template azure-search-openai-demo` |
| "Trebam debugirati specifičan Azure resurs" | `az resource show` |
| "Želim implementaciju spremnu za produkciju za nekoliko minuta" | `azd up --environment production` |

### Oni rade zajedno!

AZD koristi Azure CLI "ispod haube". Možete koristiti oba:
```bash
# Postavite svoju aplikaciju pomoću AZD
azd up

# Zatim fino podesite određene resurse pomoću Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Pronađite predloške u Awesome AZD

Nemojte počinjati od nule! **Awesome AZD** je zajednička kolekcija spremnih za implementaciju predložaka:

| Resurs | Opis |
|--------|------|
| 🔗 [**Awesome AZD galerija**](https://azure.github.io/awesome-azd/) | Pregledajte 200+ predložaka s implementacijom jednim klikom |
| 🔗 [**Pošaljite predložak**](https://github.com/Azure/awesome-azd/issues) | Doprinijeti vlastitim predloškom zajednici |
| 🔗 [**GitHub repozitorij**](https://github.com/Azure/awesome-azd) | Dajte zvjezdicu i istražite izvor |

### Popularni AI predlošci iz Awesome AZD

```bash
# RAG chat s Microsoft Foundry modelima + AI pretraživanje
azd init --template azure-search-openai-demo

# Brza AI chat aplikacija
azd init --template openai-chat-app-quickstart

# AI agenti s Foundry agentima
azd init --template get-started-with-ai-agents
```

---

## 🎯 Početak u 3 koraka

### Korak 1: Instalirajte AZD (2 minute)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Korak 2: Prijavite se u Azure

```bash
azd auth login
```

### Korak 3: Implementirajte prvu aplikaciju

```bash
# Inicijaliziraj iz predloška
azd init --template todo-nodejs-mongo

# Rasporedi na Azure (stvara sve!)
azd up
```

**🎉 To je to!** Vaša aplikacija je sada aktivna na Azureu.

### Očistite (ne zaboravite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kako koristiti ovaj tečaj

Ovaj tečaj je dizajniran za **postupno učenje** – počnite gdje vam je najudobnije i napredujte:

| Vaše iskustvo | Počnite ovdje |
|---------------|---------------|
| **Potpuni početnik za Azure** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Poznajete Azure, novi ste u AZD-u** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Želite implementirati AI aplikacije** | [Poglavlje 2: AI-prvi razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Želite praktičnu vježbu** | [🎓 Interaktivna radionica](workshop/README.md) - 3-4 sata vođenog labosa |
| **Trebate produkcijske obrasce** | [Poglavlje 8: Produkcija i Enterprise](#-chapter-8-production--enterprise-patterns) |

### Brza postava

1. **Forkajte ovaj repozitorij**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Potražite pomoć**: [Azure Discord zajednica](https://discord.com/invite/ByRwuEEgH4)

> **Radije želite klonirati lokalno?**

> Ovaj repozitorij uključuje preko 50 prijevoda jezika čime se znatno povećava veličina preuzimanja. Za kloniranje bez prijevoda, koristite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ovo vam daje sve potrebno za dovršetak tečaja s puno bržim preuzimanjem.


## Pregled tečaja

Savladajte Azure Developer CLI (azd) kroz strukturirane lekcije dizajnirane za postupno učenje. **Poseban fokus na implementaciju AI aplikacija s Microsoft Foundry integracijom.**

### Zašto je ovaj tečaj bitan za suvremene developere

Na temelju uvida zajednice Microsoft Foundry Discorda, **45% developera želi koristiti AZD za AI workloads** ali nailazi na izazove s:
- Složenim multi-servisnim AI arhitekturama
- Najboljim praksama za produkcijsku AI implementaciju  
- Integracijom i konfiguracijom Azure AI servisa
- Optimizacijom troškova za AI workloads
- Rješavanjem problema specifičnih za AI implementaciju

### Ciljevi učenja

Završetkom ovog strukturiranog tečaja ćete:
- **Savladati osnove AZD-a**: osnovni koncepti, instalacija i konfiguracija
- **Implementirati AI aplikacije**: koristiti AZD s Microsoft Foundry servisima
- **Primijeniti infrastrukturu kao kod**: upravljati Azure resursima s Bicep predlošcima
- **Rješavati probleme pri implementaciji**: dijagnosticirati i otklanjati uobičajene probleme
- **Optimizirati za produkciju**: sigurnost, skaliranje, praćenje i upravljanje troškovima
- **Graditi multi-agent rješenja**: implementacija složenih AI arhitektura

## 🗺️ Karta tečaja: Brza navigacija po poglavljima

Svako poglavlje ima posebni README sa ciljevima učenja, brzim uputama i vježbama:

| Poglavlje | Tema | Lekcije | Trajanje | Složenost |
|-----------|------|---------|----------|-----------|
| **[Pog 1: Osnove](docs/chapter-01-foundation/README.md)** | Početak rada | [Osnove AZD-a](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacija](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: Razvoj AI](docs/chapter-02-ai-development/README.md)** | AI-First aplikacije | [Integracija Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Implementacija modela](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 sata | ⭐⭐ |
| **[Ch 3: Konfiguracija](docs/chapter-03-configuration/README.md)** | Autentikacija i sigurnost | [Konfiguracija](docs/chapter-03-configuration/configuration.md) &#124; [Autentikacija i sigurnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC i Implementacija | [Vodič za implementaciju](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 sata | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Rješenja s AI agentima | [Scenario maloprodaje](examples/retail-scenario.md) &#124; [Koordinacijski obrasci](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 sata | ⭐⭐⭐⭐ |
| **[Ch 6: Pred implementaciju](docs/chapter-06-pre-deployment/README.md)** | Planiranje i validacija | [Provjere prije implementacije](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Izbor SKU-a](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 sat | ⭐⭐ |
| **[Ch 7: Rješavanje problema](docs/chapter-07-troubleshooting/README.md)** | Debug i popravak | [Česti problemi](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problemi](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 sata | ⭐⭐ |
| **[Ch 8: Produkcija](docs/chapter-08-production/README.md)** | Enterprise obrasci | [Prakse produkcije](docs/chapter-08-production/production-ai-practices.md) | 2-3 sata | ⭐⭐⭐⭐ |
| **[🎓 Radionica](workshop/README.md)** | Laboratorij s praktičnim radom | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Izbor](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagodba](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontaža](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključak](workshop/docs/instructions/7-Wrap-up.md) | 3-4 sata | ⭐⭐ |

**Ukupno trajanje tečaja:** ~10-14 sati | **Naprjedovanje vještina:** Početnik → Spreman za produkciju

---

## 📚 Poglavlja za učenje

*Odaberite svoj put učenja prema razini iskustva i ciljevima*

### 🚀 Poglavlje 1: Osnove i brzi početak
**Preduvjeti**: Pretplata na Azure, osnovno znanje komandne linije  
**Trajanje**: 30-45 minuta  
**Složnost**: ⭐

#### Što ćete naučiti
- Osnove Azure Developer CLI-a
- Instalacija AZD na vašu platformu
- Vaša prva uspješna implementacija

#### Resursi za učenje
- **🎯 Počnite ovdje**: [Što je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [Osnove AZD-a](docs/chapter-01-foundation/azd-basics.md) - Osnovni pojmovi i terminologija
- **⚙️ Postavljanje**: [Instalacija i postavljanje](docs/chapter-01-foundation/installation.md) - Vodiči za specifične platforme
- **🛠️ Praktični rad**: [Vaš prvi projekt](docs/chapter-01-foundation/first-project.md) - Vodič korak po korak
- **📋 Brzi pregled**: [Sažetak naredbi](resources/cheat-sheet.md)

#### Praktične vježbe
```bash
# Brza provjera instalacije
azd version

# Postavite svoju prvu aplikaciju
azd init --template todo-nodejs-mongo
azd up
```

**💡 Ishod poglavlja**: Uspješno implementirati jednostavnu web aplikaciju na Azure koristeći AZD

**✅ Provjera uspjeha:**
```bash
# Nakon završetka Poglavlja 1, trebali biste moći:
azd version              # Prikazuje instaliranu verziju
azd init --template todo-nodejs-mongo  # Inicijalizira projekt
azd up                  # Postavlja na Azure
azd show                # Prikazuje URL pokrenute aplikacije
# Aplikacija se otvara u pregledniku i radi
azd down --force --purge  # Čisti resurse
```

**📊 Uloženo vrijeme:** 30-45 minuta  
**📈 Razina vještine nakon:** Samostalno može implementirati osnovne aplikacije

---

### 🤖 Poglavlje 2: AI-First razvoj (preporučeno za AI developere)
**Preduvjeti**: Završeno Poglavlje 1  
**Trajanje**: 1-2 sata  
**Složnost**: ⭐⭐

#### Što ćete naučiti
- Integracija Microsoft Foundry s AZD-om
- Implementacija AI-pokretanih aplikacija
- Razumijevanje konfiguracija AI usluga

#### Resursi za učenje
- **🎯 Počnite ovdje**: [Integracija Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Vodič za AI agente](docs/chapter-02-ai-development/agents.md) - Implementirajte inteligentne agente s AZD-om
- **📖 Obrasci**: [Implementacija AI modela](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementirajte i upravljajte AI modelima
- **🛠️ Radionica**: [AI radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripremite AI rješenja za AZD
- **🎥 Interaktivni vodič**: [Materijali za radionicu](workshop/README.md) - Učenje putem preglednika s MkDocs * DevContainer okruženje
- **📋 Predlošci**: [Microsoft Foundry predlošci](#resursi-radionice)
- **📝 Primjeri**: [Primjeri implementacije AZD-a](examples/README.md)

#### Praktične vježbe
```bash
# Postavite svoju prvu AI aplikaciju
azd init --template azure-search-openai-demo
azd up

# Isprobajte dodatne AI predloške
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Ishod poglavlja**: Implementirati i konfigurirati AI-pokretanu chat aplikaciju s RAG mogućnostima

**✅ Provjera uspjeha:**
```bash
# Nakon Poglavlja 2, trebali biste moći:
azd init --template azure-search-openai-demo
azd up
# Testirati AI sučelje za chat
# Postavljati pitanja i dobivati odgovore koje pokreće AI s izvorima
# Provjeriti radi li integracija pretraživanja
azd monitor  # Provjeriti prikazuje li Application Insights telemetriju
azd down --force --purge
```

**📊 Uloženo vrijeme:** 1-2 sata  
**📈 Razina vještine nakon:** Može implementirati i konfigurirati AI aplikacije spremne za produkciju  
**💰 Svijest o troškovima:** Razumije troškove razvoja od $80-150/mjesečno, te troškove produkcije $300-3500/mjesečno

#### 💰 Troškovni prikaz za AI implementacije

**Razvojno okruženje (Procjena $80-150/mjesečno):**
- Microsoft Foundry modeli (plaćanje po korištenju): $0-50/mjesec (ovisno o korištenju tokena)
- AI pretraživanje (osnovni plan): $75/mjesec
- Container Apps (potrošnja): $0-20/mjesec
- Pohrana (standardna): $1-5/mjesec

**Produkcijsko okruženje (Procjena $300-3,500+/mjesec):**
- Microsoft Foundry modeli (PTU za konzistentne performanse): $3,000+/mjesec ILI plaćanje po korištenju za velike količine
- AI pretraživanje (standardni plan): $250/mjesec
- Container Apps (dedicirano): $50-100/mjesec
- Application Insights: $5-50/mjesec
- Pohrana (premium): $10-50/mjesec

**💡 Savjeti za optimizaciju troškova:**
- Koristite **Besplatni sloj** Microsoft Foundry modela za učenje (uključeno 50,000 tokena mjesečno za Azure OpenAI)
- Pokrenite `azd down` za deaktivaciju resursa kada ne razvijate
- Počnite s fakturiranjem po potrošnji, nadogradite na PTU samo za produkciju
- Koristite `azd provision --preview` za procjenu troškova prije implementacije
- Omogućite automatsko skaliranje: plaćate samo stvarnu potrošnju

**Praćenje troškova:**
```bash
# Provjerite procijenjene mjesečne troškove
azd provision --preview

# Pratite stvarne troškove u Azure Portalu
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Poglavlje 3: Konfiguracija i autentikacija
**Preduvjeti**: Završeno Poglavlje 1  
**Trajanje**: 45-60 minuta  
**Složnost**: ⭐⭐

#### Što ćete naučiti
- Konfiguracija i upravljanje okruženjima
- Najbolje prakse autentikacije i sigurnosti
- Imenovanje i organizacija resursa

#### Resursi za učenje
- **📖 Konfiguracija**: [Vodič za konfiguraciju](docs/chapter-03-configuration/configuration.md) - Postavljanje okruženja
- **🔐 Sigurnost**: [Obrasci autentikacije i managed identity](docs/chapter-03-configuration/authsecurity.md) - Obrasci autentikacije
- **📝 Primjeri**: [Primjer aplikacije za bazu podataka](examples/database-app/README.md) - AZD primjeri za bazu podataka

#### Praktične vježbe
- Konfigurirajte više okruženja (razvojno, testno, produkcijsko)
- Postavite autentikaciju sa managed identity
- Implementirajte konfiguracije specifične za okruženje

**💡 Ishod poglavlja**: Upravljajte više okruženja uz odgovarajuću autentikaciju i sigurnost

---

### 🏗️ Poglavlje 4: Infrastruktura kao kod i implementacija
**Preduvjeti**: Završena Poglavlja 1-3  
**Trajanje**: 1-1.5 sati  
**Složnost**: ⭐⭐⭐

#### Što ćete naučiti
- Napredni obrasci implementacije
- Infrastruktura kao kod uz Bicep
- Strategije provisioning resursa

#### Resursi za učenje
- **📖 Implementacija**: [Vodič za implementaciju](docs/chapter-04-infrastructure/deployment-guide.md) - Kompleti radni tokovi
- **🏗️ Provisioning**: [Provisioning resursa](docs/chapter-04-infrastructure/provisioning.md) - Upravljanje Azure resursima
- **📝 Primjeri**: [Primjer Container App](../../examples/container-app) - Implementacije s kontejnerima

#### Praktične vježbe
- Kreirajte prilagođene Bicep predloške
- Implementirajte višeservisne aplikacije
- Implementirajte blue-green strategije implementacije

**💡 Ishod poglavlja**: Implementirajte složene višeservisne aplikacije koristeći prilagođene infrastrukturne predloške

---

### 🎯 Poglavlje 5: AI rješenja s više agenata (napredno)
**Preduvjeti**: Završena Poglavlja 1-2  
**Trajanje**: 2-3 sata  
**Složnost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Arhitektura s više agenata
- Orkestracija i koordinacija agenata
- Implementacije AI spremne za produkciju

#### Resursi za učenje
- **🤖 Istaknuti projekt**: [Maloprodajni multi-agent sustav](examples/retail-scenario.md) - Kompletna implementacija
- **🛠️ ARM predlošci**: [Paket ARM predložaka za multi-agent](../../examples/retail-multiagent-arm-template) - Implementacija jednim klikom
- **📖 Arhitektura**: [Koordinacijski obrasci za multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Obrasci

#### Praktične vježbe
```bash
# Implementirajte cjelovito višeslojno maloprodajno rješenje
cd examples/retail-multiagent-arm-template
./deploy.sh

# Istražite konfiguracije agenata
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Ishod poglavlja**: Implementirati i upravljati produkcijski spremnim multi-agent AI rješenjem s agentima za kupce i inventar

---

### 🔍 Poglavlje 6: Validacija i planiranje prije implementacije
**Preduvjeti**: Završeno Poglavlje 4  
**Trajanje**: 1 sat  
**Složnost**: ⭐⭐

#### Što ćete naučiti
- Planiranje kapaciteta i validacija resursa
- Strategije izbora SKU-a
- Provjere prije implementacije i automatizacija

#### Resursi za učenje
- **📊 Planiranje**: [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) - Validacija resursa
- **💰 Izbor**: [Izbor SKU-a](docs/chapter-06-pre-deployment/sku-selection.md) - Ekonomične opcije
- **✅ Validacija**: [Provjere prije implementacije](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizirani skripti

#### Praktične vježbe
- Pokrenite skripte za validaciju kapaciteta
- Optimizirajte izbor SKU-a za smanjenje troškova
- Implementirajte automatizirane provjere prije implementacije

**💡 Ishod poglavlja**: Validirati i optimizirati implementacije prije izvršenja

---

### 🚨 Poglavlje 7: Otklanjanje poteškoća i debugiranje
**Preduvjeti**: Završeno bilo koje poglavlje o implementaciji  
**Trajanje**: 1-1.5 sati  
**Složnost**: ⭐⭐

#### Što ćete naučiti
- Sistematski pristupi debugiranju
- Česti problemi i rješenja
- Specifično rješavanje problema s AI-jem

#### Resursi za učenje
- **🔧 Česti problemi**: [Česti problemi](docs/chapter-07-troubleshooting/common-issues.md) - Često postavljana pitanja i rješenja
- **🕵️ Debugging**: [Vodič za debugiranje](docs/chapter-07-troubleshooting/debugging.md) - Strategije korak po korak
- **🤖 AI problemi**: [Rješavanje AI problema](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi AI usluga

#### Praktične vježbe
- Dijagnosticiranje neuspjelih implementacija
- Rješavanje problema s autentikacijom
- Debugiranje povezivanja AI usluga

**💡 Ishod poglavlja**: Samostalno dijagnosticirati i rješavati uobičajene probleme implementacije

---

### 🏢 Poglavlje 8: Produkcija i enterprise obrasci
**Preduvjeti**: Završena Poglavlja 1-4  
**Trajanje**: 2-3 sata  
**Složnost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Strategije produkcijske implementacije
- Enterprise sigurnosni obrasci
- Praćenje i optimizacija troškova

#### Resursi za učenje
- **🏭 Proizvodnja**: [Najbolje prakse za proizvodnju AI-a](docs/chapter-08-production/production-ai-practices.md) - Enterprise obrasci
- **📝 Primjeri**: [Primjer mikroservisa](../../examples/microservices) - Složene arhitekture
- **📊 Nadgledanje**: [Integracija Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Nadgledanje

#### Praktične vježbe
- Implementirajte obrasce sigurnosti na razini poduzeća
- Postavite sveobuhvatno nadgledanje
- Implementirajte u proizvodnju s pravilnim upravljanjem

**💡 Ishod poglavlja**: Implementirajte aplikacije spremne za proizvodnju s punim proizvodnim mogućnostima

---

## 🎓 Pregled radionice: Praktično iskustvo učenja

> **⚠️ STATUS RADIONICE: Aktivni razvoj**  
> Materijali radionice su trenutno u razvoju i doradi. Temeljni moduli su funkcionalni, ali su neki napredniji dijelovi nedovršeni. Aktivno radimo na dovršavanju cijelog sadržaja. [Pratite napredak →](workshop/README.md)

### Interaktivni materijali radionice
**Sveobuhvatno praktično učenje s alatima u pregledniku i vođenim vježbama**

Naši materijali radionice pružaju strukturirano, interaktivno iskustvo učenja koje nadopunjuje gore navedeni kurikulum po poglavljima. Radionica je osmišljena za samostalno učenje i vođene sesije s instruktorom.

#### 🛠️ Značajke radionice
- **Sučelje u pregledniku**: Potpuna radionica na bazi MkDocs-a s pretragom, kopiranjem i temama
- **Integracija GitHub Codespacesa**: Postavljanje razvojne okoline jednim klikom
- **Strukturirani put učenja**: 8 modula vođenih vježbi (ukupno 3-4 sata)
- **Progresivna metodologija**: Uvod → Odabir → Provjera → Rastavljanje → Konfiguracija → Prilagodba → Rastavljanje → Zaključak
- **Interaktivno DevContainer okruženje**: Predkonfigurirani alati i ovisnosti

#### 📚 Struktura modula radionice
Radionica slijedi **8-modulnu progresivnu metodologiju** koja vas vodi od otkrivanja do savladavanja implementacije:

| Modul | Tema | Što ćete raditi | Trajanje |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled radionice | Razumjeti ciljeve učenja, preduvjete i strukturu radionice | 15 min |
| **1. Odabir** | Otkrivanje predložaka | Istražite AZD predloške i odaberite pravi AI predložak za vaš scenarij | 20 min |
| **2. Provjera** | Implementacija i verifikacija | Implementirajte predložak pomoću `azd up` i potvrdite ispravnost infrastrukture | 30 min |
| **3. Rastavljanje** | Razumijevanje strukture | Koristite GitHub Copilot za istraživanje arhitekture predloška, Bicep datoteka i organizacije koda | 30 min |
| **4. Konfiguracija** | Detaljna obrada azure.yaml | Savladajte konfiguraciju `azure.yaml`, životne petlje i varijable okruženja | 30 min |
| **5. Prilagodba** | Prilagodite po svom | Omogućite AI Search, praćenje, evaluaciju i prilagodbu za vaš scenarij | 45 min |
| **6. Rastavljanje** | Čišćenje | Sigurno uklonite resurse s `azd down --purge` | 15 min |
| **7. Zaključak** | Sljedeći koraci | Pregledajte postignuća, ključne pojmove i nastavite svoj put učenja | 15 min |

**Tijek radionice:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 Početak s radionicom  
```bash
# Opcija 1: GitHub Codespaces (Preporučeno)
# Kliknite "Code" → "Create codespace on main" u repozitoriju

# Opcija 2: Lokalni razvoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Slijedite upute za postavljanje u workshop/README.md
```
  
#### 🎯 Ishodi učenja radionice  
Nakon završetka radionice, sudionici će:  
- **Implementirati AI aplikacije za proizvodnju**: Koristiti AZD s Microsoft Foundry uslugama  
- **Savladati višestruke agente**: Implementirati koordinirane AI agent rješenja  
- **Primijeniti najbolje sigurnosne prakse**: Konfigurirati autentifikaciju i kontrolu pristupa  
- **Optimizirati za skaliranje**: Dizajnirati isplative i učinkovite implementacije  
- **Otkloniti poteškoće u implementacijama**: Samostalno riješiti često pojavljene probleme  

#### 📖 Resursi radionice  
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Okruženje za učenje u pregledniku  
- **📋 Upute po modulima**:  
  - [0. Uvod](workshop/docs/instructions/0-Introduction.md) - Pregled radionice i ciljevi  
  - [1. Odabir](workshop/docs/instructions/1-Select-AI-Template.md) - Pronalaženje i odabir AI predložaka  
  - [2. Provjera](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementacija i potvrda predložaka  
  - [3. Rastavljanje](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Istraživanje arhitekture predložaka  
  - [4. Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Savladavanje azure.yaml  
  - [5. Prilagodba](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagodba za vaš scenarij  
  - [6. Rastavljanje](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Čišćenje resursa  
  - [7. Zaključak](workshop/docs/instructions/7-Wrap-up.md) - Pregled i sljedeći koraci  
- **🛠️ AI laboratorij radionice**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Vježbe fokusirane na AI  
- **💡 Brzi početak**: [Vodič za postavljanje radionice](workshop/README.md#quick-start) - Konfiguracija okruženja  

**Idealno za**: Korporativne treninge, sveučilišne tečajeve, samostalno učenje i bootcampove za programere.

---

## 📖 Detaljni pregled: AZD mogućnosti

Osim osnova, AZD nudi snažne značajke za proizvodne implementacije:

- **Implementacije temeljene na predlošcima** - Koristite unaprijed pripremljene predloške za uobičajene obrasce aplikacija  
- **Infrastruktura kao kod** - Upravljajte Azure resursima korištenjem Bicep-a ili Terraform-a  
- **Integrirani radni tokovi** - Besprijekorno postavljanje, implementacija i nadgledanje aplikacija  
- **Prijateljski za programere** - Optimizirano za razvijateljsku produktivnost i iskustvo  

### **AZD + Microsoft Foundry: Savršeno za AI implementacije**

**Zašto AZD za AI rješenja?** AZD rješava glavne izazove s kojima se suočavaju AI programeri:

- **AI-Pripremljeni predlošci** - Predkonfigurirani predlošci za Microsoft Foundry modele, Kognitivne usluge i ML zadatke  
- **Sigurne AI implementacije** - Ugrađeni sigurnosni obrasci za AI usluge, API ključeve i krajnje točke modela  
- **Proizvodni AI obrasci** - Najbolje prakse za skalabilne i isplative AI aplikacije  
- **AI radni tokovi od kraja do kraja** - Od razvoja modela do implementacije s odgovarajućim nadgledanjem  
- **Optimizacija troškova** - Pametno dodjeljivanje resursa i strategije skaliranja za AI radna opterećenja  
- **Integracija Microsoft Foundry-a** - Besprijekorna povezanost s katalogom Microsoft Foundry modela i krajnjim točkama  

---

## 🎯 Biblioteka predložaka i primjera

### Istaknuto: Microsoft Foundry predlošci  
**Počnite ovdje ako implementirate AI aplikacije!**

> **Napomena:** Ovi predlošci demonstriraju različite AI obrasce. Neki su vanjski Azure primjeri, dok su drugi lokalne implementacije.

| Predložak | Poglavlje | Kompleksnost | Usluge | Tip |
|----------|------------|--------------|---------|------|
| [**Početak rada s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Vanjski |
| [**Početak rada s AI agentima**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavlje 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Vanjski |
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Vanjski |
| [**Brzi početak OpenAI Chat aplikacije**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Vanjski |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Vanjski |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Vanjski |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalno** |

### Istaknuto: Kompleti scenarija za učenje  
**Predlošci aplikacija spremni za proizvodnju povezani s poglavljima za učenje**

| Predložak | Poglavlje za učenje | Kompleksnost | Ključno učenje |
|----------|---------------------|-------------|----------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | Osnovni obrasci implementacije AI-a |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | Implementacija RAG-a s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavlje 4 | ⭐⭐ | Integracija inteligencije dokumenata |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | Okvir agenata i pozivanje funkcija |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐ | Orkestracija AI-a na razini poduzeća |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | Arhitektura više agenata s agentima za kupce i inventar |

### Učenje po tipu primjera

> **📌 Lokalni vs. vanjski primjeri:**  
> **Lokalni primjeri** (u ovom repozitoriju) = Spremni za odmah korištenje  
> **Vanjski primjeri** (Azure primjeri) = Klonirajte sa povezanih repozitorija

#### Lokalni primjeri (Spremni za korištenje)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Potpuna implementacija spremna za proizvodnju s ARM predlošcima  
  - Arhitektura s više agenata (agent za kupce + agent za inventar)  
  - Sveobuhvatno nadgledanje i evaluacija  
  - Implementacija jednim klikom putem ARM predloška  

#### Lokalni primjeri - kontejnerske aplikacije (Poglavlja 2-5)  
**Sveobuhvatni primjeri implementacije kontejnera u ovom repozitoriju:**  
- [**Primjeri kontejnerskih aplikacija**](examples/container-app/README.md) - Potpuni vodič za implementaciju u kontejnere  
  - [Jednostavni Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API s scale-to-zero  
  - [Arhitektura mikroservisa](../../examples/container-app/microservices) - Implementacija više usluga spremna za proizvodnju  
  - Brzi početak, proizvodnja i napredni obrasci implementacije  
  - Upute za nadgledanje, sigurnost i optimizaciju troškova  

#### Vanjski primjeri - jednostavne aplikacije (Poglavlja 1-2)  
**Klonirajte ove Azure primjere za početak:**  
- [Jednostavna web aplikacija - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni obrasci implementacije  
- [Statistička web stranica - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementacija statičkog sadržaja  
- [Kontejnerska aplikacija - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementacija REST API-ja  

#### Vanjski primjeri - integracija baza podataka (Poglavlja 3-4)  
- [Aplikacija za baze podataka - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Obrasci povezivanja baza podataka  
- [Funkcije + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless obrada podataka  

#### Vanjski primjeri - napredni obrasci (Poglavlja 4-8)  
- [Java mikroservisi](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitekture s više usluga  
- [Zadaci Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Obrada u pozadini  
- [Enterprise ML pipeline](https://github.com/Azure-Samples/mlops-v2) - Obrasci spremni za proizvodnju ML-a  

### Vanjske kolekcije predložaka  
- [**Službena galerija AZD predložaka**](https://azure.github.io/awesome-azd/) - Kurirana zbirka službenih i zajedničkih predložaka  
- [**Azure Developer CLI predlošci**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija predložaka na Microsoft Learn  
- [**Direktorij primjera**](examples/README.md) - Lokalni primjeri za učenje s detaljnim objašnjenjima  

---

## 📚 Resursi za učenje i reference

### Brze reference  
- [**Kratki pregled naredbi**](resources/cheat-sheet.md) - Osnovne azd naredbe organizirane po poglavljima  
- [**Rječnik pojmova**](resources/glossary.md) - Terminologija Azure i azd-a  
- [**Često postavljana pitanja (FAQ)**](resources/faq.md) - Česta pitanja organizirana po poglavljima za učenje  
- [**Vodič za proučavanje**](resources/study-guide.md) - Sveobuhvatne praktične vježbe  

### Praktične radionice  
- [**AI laboratorij radionice**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Omogućite da su vaša AI rješenja spremna za AZD implementaciju (2-3 sata)  
- [**Interaktivna radionica**](workshop/README.md) - 8 modula vođenih vježbi s MkDocs i GitHub Codespaces  
  - Slijedi: Uvod → Odabir → Provjera → Rastavljanje → Konfiguracija → Prilagodba → Rastavljanje → Zaključak  

### Vanjski resursi za učenje
- [Dokumentacija za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kalkulator cijena](https://azure.microsoft.com/pricing/calculator/)
- [Azure status](https://status.azure.com/)

### Vještine AI agenta za vaš uređivač
- [**Microsoft Azure vještine na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otvorenih vještina agenta za Azure AI, Foundry, implementaciju, dijagnostiku, optimizaciju troškova i još mnogo toga. Instalirajte ih u GitHub Copilot, Cursor, Claude Code ili bilo koji podržani agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Brzi vodič za rješavanje problema

**Česti problemi s kojima se početnici susreću i brza rješenja:**

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
<summary><strong>❌ "Pretplata nije pronađena" ili "Pretplata nije postavljena"</strong></summary>

```bash
# Popis dostupnih pretplata
az account list --output table

# Postavi zadanu pretplatu
az account set --subscription "<subscription-id-or-name>"

# Postavi za AZD okruženje
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Provjeri
az account show
```
</details>

<details>
<summary><strong>❌ "Nedovoljna kvota" ili "Kvota je prekoračena"</strong></summary>

```bash
# Isprobajte drugu Azure regiju
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
<summary><strong>❌ "azd up" ne uspijeva na pola puta</strong></summary>

```bash
# Opcija 1: Očistite i pokušajte ponovo
azd down --force --purge
azd up

# Opcija 2: Samo popravite infrastrukturu
azd provision

# Opcija 3: Provjerite detaljni status
azd show

# Opcija 4: Provjerite zapise u Azure Monitoru
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentifikacija nije uspjela" ili "Token je istekao"</strong></summary>

```bash
# Ponovno se autentificirajte
az logout
az login

azd auth logout
azd auth login

# Provjerite autentifikaciju
az account show
```
</details>

<details>
<summary><strong>❌ "Resurs već postoji" ili sukobi u imenovanju</strong></summary>

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

**Uobičajena vremena čekanja:**
- Jednostavna web aplikacija: 5-10 minuta
- Aplikacija s bazom podataka: 10-15 minuta
- AI aplikacije: 15-25 minuta (provisioniranje OpenAI je sporo)

```bash
# Provjeri napredak
azd show

# Ako zapne više od 30 minuta, provjeri Azure Portal:
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
# Zamolite svog Azure administratora da vam dodijeli:
# - Contributor (za resurse)
# - User Access Administrator (za dodjelu uloga)
```
</details>

<details>
<summary><strong>❌ Ne mogu pronaći URL implementirane aplikacije</strong></summary>

```bash
# Prikaži sve krajnje točke usluge
azd show

# Ili otvori Azure Portal
azd monitor

# Provjeri specifičnu uslugu
azd env get-values
# Potraži *_URL varijable
```
</details>

### 📚 Potpuni resursi za rješavanje problema

- **Vodič za česte probleme:** [Detaljna rješenja](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemi specifični za AI:** [Rješavanje AI problema](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vodič za otklanjanje pogrešaka:** [Korak-po-korak otklanjanje pogrešaka](docs/chapter-07-troubleshooting/debugging.md)
- **Pomoć:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Završetak tečaja i certifikacija

### Praćenje napretka
Pratite svoj napredak kroz svaki poglavlje:

- [ ] **Poglavlje 1**: Osnove i Brzi početak ✅
- [ ] **Poglavlje 2**: AI-prvo programiranje ✅  
- [ ] **Poglavlje 3**: Konfiguracija i autentifikacija ✅
- [ ] **Poglavlje 4**: Infrastruktura kao kod i implementacija ✅
- [ ] **Poglavlje 5**: Rješenja višestrukih AI agenata ✅
- [ ] **Poglavlje 6**: Validacija i planiranje prije implementacije ✅
- [ ] **Poglavlje 7**: Rješavanje problema i otklanjanje pogrešaka ✅
- [ ] **Poglavlje 8**: Produkcijski i enterprise obrasci ✅

### Provjera usvojenog znanja
Nakon dovršetka svakog poglavlja, provjerite svoje znanje tako da:
1. **Praktična vježba**: Dovršite praktičnu implementaciju za poglavlje
2. **Provjera znanja**: Pregledajte FAQ sekciju za vaše poglavlje
3. **Rasprava u zajednici**: Podijelite svoje iskustvo na Azure Discordu
4. **Sljedeće poglavlje**: Prijeđite na sljedeću razinu složenosti

### Prednosti završetka tečaja
Nakon završetka svih poglavlja, imat ćete:
- **Iskustvo u produkciji**: Implementirane stvarne AI aplikacije na Azure
- **Profesionalne vještine**: Sposobnosti za enterprise implementacije  
- **Prepoznavanje u zajednici**: Aktivni član Azure developerske zajednice
- **Napredak u karijeri**: Tražene AZD i AI vještine implementacije

---

## 🤝 Zajednica i podrška

### Dobivanje pomoći i podrške
- **Tehnički problemi**: [Prijavite pogreške i zatražite značajke](https://github.com/microsoft/azd-for-beginners/issues)
- **Pitanja o učenju**: [Microsoft Azure Discord zajednica](https://discord.gg/microsoft-azure) i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoć specifična za AI**: Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Službena dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Uvidi iz Microsoft Foundry Discord zajednice

**Nedavni rezultati ankete s #Azure kanala:**
- **45%** programera želi koristiti AZD za AI zadatke
- **Glavni izazovi**: implementacije više servisa, upravljanje vjerodajnicama, spremnost za produkciju  
- **Najtraženije**: AI-specifični predlošci, vodiči za rješavanje problema, najbolje prakse

**Pridružite se našoj zajednici za:**
- Dijeljenje iskustava s AZD + AI i dobivanje pomoći
- Pristup ranim pregledima novih AI predložaka
- Doprinos najboljim praksama za AI implementacije
- Utjecaj na budući razvoj AI + AZD značajki

### Doprinos tečaju
Pozivamo vas na doprinos! Molimo pročitajte naš [Vodič za doprinos](CONTRIBUTING.md) za detalje o:
- **Poboljšanja sadržaja**: Unaprijedite postojeća poglavlja i primjere
- **Novi primjeri**: Dodajte stvarne scenarije i predloške  
- **Prevođenje**: Pomozite održavati podršku za više jezika
- **Prijave pogrešaka**: Poboljšajte točnost i jasnoću
- **Standardi zajednice**: Slijedite naša inkluzivna pravila zajednice

---

## 📄 Informacije o tečaju

### Licenca
Ovaj projekt je licenciran pod MIT licencom - pogledajte [LICENSE](../../LICENSE) datoteku za detalje.

### Povezani Microsoft Learning resursi

Naš tim stvara i druge opsežne tečajeve za učenje:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j za početnike](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js za početnike](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain za početnike](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agent
[![AZD za početnike](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI za početnike](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP za početnike](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agenti za početnike](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Generativnog AI-a
[![Generativni AI za početnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Temeljno učenje
[![ML za početnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science za početnike](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI za početnike](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kibernetička sigurnost za početnike](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web razvoj za početnike](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT za početnike](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR razvoj za početnike](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija tečajem

**🚀 Spremni za početak učenja?**

**Početnici**: Počnite s [Poglavlje 1: Osnove i Brzi početak](#-chapter-1-foundation--quick-start)  
**AI programeri**: Preskočite na [Poglavlje 2: AI-prvi razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Iskusni programeri**: Započnite s [Poglavlje 3: Konfiguracija i autentikacija](#️-chapter-3-configuration--authentication)

**Sljedeći koraci**: [Započni Poglavlje 1 - AZD osnove](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument preveden je korištenjem AI usluge za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporučuje se profesionalni ljudski prijevod. Ne odgovaramo za bilo kakva nesporazuma ili pogrešna tumačenja proizašla iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->