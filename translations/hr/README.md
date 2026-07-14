# AZD za početnike: Strukturirano putovanje učenja

![AZD-for-beginners](../../translated_images/hr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatski prijevodi (Uvijek ažurno)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](./README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Radije klonirati lokalno?**
>
> Ovaj repozitorij uključuje preko 50 prijevoda jezika što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda, koristite sparse checkout:
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
> Ovo vam daje sve što vam treba da završite tečaj s mnogo bržim preuzimanjem.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Što je novo u azd danas

> 📌 Ovaj tečaj je potvrđen za **`azd 1.27.1`** (srpanj 2026). Pokrenite `azd version` da provjerite svoju verziju i `azd upgrade` da dobijete najnoviju.

Azure Developer CLI je prerastao tradicionalne web aplikacije i API-je. Danas je azd jedini alat za implementaciju **bilo koje** aplikacije na Azure—uključujući AI-pokretane aplikacije i inteligentne agente.

Evo što to znači za vas:

- **AI agenti su sada primarni azd workloadi.** Možete inicijalizirati, implementirati i upravljati AI agent projektima koristeći isti `azd init` → `azd up` tijek rada koji već poznajete.
- **Potpuni životni ciklus agenta iz CLI-ja.** Ekstenzija `azure.ai.agents` sada pokriva cijelo putovanje—`azd ai agent init` za generiranje, `azd ai agent invoke` za testiranje (s izlazom vremena odgovora), `azd ai agent eval generate` i `azd ai agent optimize` za mjerenje i poboljšanje kvalitete, te `azd ai agent delete` za čišćenje.
- **Više AI građevnih blokova.** Nove preview ekstenzije—`azure.ai.skills` i `azure.ai.connections`—omogućuju upravljanje ponovo upotrebljivim agent vještinama i Foundry konekcijama direktno s azd.
- **Integracija Microsoft Foundry** donosi implementaciju modela, hosting agenata i konfiguraciju AI servisa izravno u azd ekosustav predložaka.
- **Gladak svakodnevni rad.** Nedavne verzije učinile su `azd init` idempotentnim (sigurnim za ponovni pokret), `azd auth login` automatski briše zastarjele tokene te su dodani prijateljski `azd tool` prompt za prvi pokret.
- **Glavni tijek rada nije se promijenio.** Bilo da implementirate todo aplikaciju, mikrouslugu ili rješenje s više AI agenata, naredbe su iste.

> **Napomena za Aspire korisnike:** Microsoft sada jednostavno naziva proizvod **Aspire** (ranije ".NET Aspire"). Podrška za Aspire u azd nije promijenjena—promijenjeno je samo ime.

Ako ste ranije koristili azd, AI podrška je prirodna nadogradnja—nije zaseban alat ili napredni smjer. Ako počinjete od nule, naučit ćete jedan tijek rada koji radi za sve.

---

## 🚀 Što je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je alat za komandnu liniju prilagođen programerima koji olakšava implementaciju aplikacija na Azure. Umjesto ručnog stvaranja i povezivanja desetaka Azure resursa, možete implementirati cijele aplikacije jednim naredbom.

### Čarolija `azd up`

```bash
# Ova jedna naredba radi sve:
# ✅ Stvara sve Azure resurse
# ✅ Konfigurira mrežu i sigurnost
# ✅ Gradi vaš aplikacijski kod
# ✅ Postavlja na Azure
# ✅ Daje vam radni URL
azd up
```

**To je to!** Nema klikanja u Azure portalu, nema potrebe učiti složene ARM predloške, nema ručne konfiguracije—samo funkcionalne aplikacije na Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Koja je razlika?

Ovo je najčešće pitanje koje početnici postavljaju. Evo jednostavnog odgovora:

| Značajka | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Svrha** | Upravljanje pojedinačnim Azure resursima | Implementacija kompletnih aplikacija |
| **Pristup** | Fokus na infrastrukturi | Fokus na aplikaciji |
| **Primjer** | `az webapp create --name myapp...` | `azd up` |
| **Krivulja učenja** | Potrebno poznavati Azure servise | Dovoljno poznavati svoju aplikaciju |
| **Najbolje za** | DevOps, Infrastruktura | Programere, Prototipiranje |

### Jednostavna analogija

- **Azure CLI** je kao imati sve alate za gradnju kuće — čekiće, pile, čavle. Možete izgraditi bilo što, ali morate znati građevinarstvo.
- **Azure Developer CLI** je kao unajmiti izvođača radova — vi opišete što želite, a on se brine o gradnji.

### Kada koristiti koji alat

| Scenarij | Koristite ovaj alat |
|----------|----------|
| "Želim brzo implementirati svoju web aplikaciju" | `azd up` |
| "Trebam samo stvoriti račun za pohranu" | `az storage account create` |
| "Gradim kompletnu AI aplikaciju" | `azd init --template azure-search-openai-demo` |
| "Trebam debugirati određeni Azure resurs" | `az resource show` |
| "Želim proizvodno spremnu implementaciju za nekoliko minuta" | `azd up --environment production` |

### Oni rade zajedno!

AZD koristi Azure CLI u pozadini. Možete koristiti oba:
```bash
# Postavite svoju aplikaciju s AZD
azd up

# Zatim fino podesite određene resurse pomoću Azure CLI-ja
az webapp config set --name myapp --always-on true
```

---

## 🌟 Pronađite predloške u Awesome AZD

Nemojte počinjati od nule! **Awesome AZD** je zajednički katalog predložaka spremnih za implementaciju:

| Resurs | Opis |
|----------|-------------|
| 🔗 [**Awesome AZD galerija**](https://azure.github.io/awesome-azd/) | Pregledajte 200+ predložaka s implementacijom jednim klikom |
| 🔗 [**Predajte predložak**](https://github.com/Azure/awesome-azd/issues) | Doprinite vlastitim predloškom zajednici |
| 🔗 [**GitHub repozitorij**](https://github.com/Azure/awesome-azd) | Stjecište i istražite izvorni kod |

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

Prije nego što počnete, provjerite je li vaša mašina spremna za predložak koji želite implementirati:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ako neka od potrebnih provjera ne prođe, najprije to popravite pa nastavite s brzim početkom.

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

### Korak 2: Autentificirajte se za AZD

```bash
# Opcionalno ako planirate koristiti Azure CLI naredbe izravno u ovom tečaju
az login

# Obavezno za AZD radne tijekove
azd auth login
```

Ako niste sigurni koji vam treba, pratite cijeli tijek postavljanja u [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Korak 3: Implementirajte svoju prvu aplikaciju

```bash
# Inicijaliziraj iz predloška
azd init --template todo-nodejs-mongo

# Postavi na Azure (stvara sve!)
azd up
```

**🎉 To je to!** Vaša aplikacija je sada uživo na Azure.

### Čišćenje (Nemojte zaboraviti!)

```bash
# Uklonite sve resurse nakon završetka eksperimentiranja
azd down --force --purge
```

---

## 📚 Kako koristiti ovaj tečaj

Ovaj tečaj je dizajniran za **postupno učenje** - počnite tamo gdje vam je ugodno i napredujte:

| Vaše iskustvo | Počnite ovdje |
|-----------------|------------|
| **Potpuni početnik u Azure-u** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Poznajem Azure, nov sam u AZD** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Želim implementirati AI aplikacije** | [Poglavlje 2: AI-prvi razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Želim praktični rad** | [🎓 Interaktivna radionica](workshop/README.md) - 3-4 sata vođenog laboratorija |
| **Trebam proizvodne obrasce** | [Poglavlje 8: Proizvodnja i poduzeće](#-chapter-8-production--enterprise-patterns) |

### Brzo postavljanje

1. **Forakirajte ovaj repozitorij**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Dobijte pomoć**: [Azure Discord zajednica](https://discord.com/invite/ByRwuEEgH4)

> **Radije klonirati lokalno?**

> Ovaj repozitorij uključuje preko 50 prijevoda jezika što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda, koristite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ovo vam daje sve što vam treba da završite tečaj s mnogo bržim preuzimanjem.


## Pregled tečaja

Ovladavajte Azure Developer CLI (azd) kroz strukturirana poglavlja dizajnirana za postupno učenje. **Poseban fokus na implementaciju AI aplikacija s Microsoft Foundry integracijom.**


### Zašto je ovaj tečaj bitan za suvremene programere

Na temelju uvida zajednice Microsoft Foundry Discord, **45% programera želi koristiti AZD za AI radne zadatke** ali nailaze na izazove s:
- Kompliciranim multi-servisnim AI arhitekturama
- Najboljim praksama za produkcijsko postavljanje AI
- Integracijom i konfiguracijom Azure AI servisa
- Optimizacijom troškova za AI radne zadatke
- Otklanjanjem problema specifičnih za AI postavljanje

### Ciljevi učenja

Završetkom ovog strukturiranog tečaja ćete:
- **Ovladati AZD osnovama**: ključni pojmovi, instalacija i konfiguracija
- **Postaviti AI aplikacije u produkciju**: koristiti AZD s Microsoft Foundry servisima
- **Uvesti infrastrukturu kao kod**: upravljati Azure resursima s Bicep predlošcima
- **Otklanjati probleme u postavljanju**: riješiti česte probleme i debugirati greške
- **Optimizirati za produkciju**: sigurnost, skaliranje, nadzor i upravljanje troškovima
- **Izgraditi višestruka agentna rješenja**: postaviti kompleksne AI arhitekture

## Prije nego što počnete: računi, pristup i pretpostavke

Prije nego što započnete Poglavlje 1, pobrinite se da imate sljedeće. Koraci instalacije u ovom vodiču pretpostavljaju da su ove osnove već zadovoljene.

- **Pretplatu na Azure**: Možete koristiti postojeću pretplatu s posla ili vlastiti račun, ili kreirati [besplatnu probnu verziju](https://aka.ms/azurefreetrial) da započnete.
- **Dozvolu za kreiranje Azure resursa**: Za većinu vježbi trebate imati barem pristup **Contributor** razine na ciljanoj pretplati ili grupi resursa. Neki dijelovi pretpostavljaju i da možete kreirati grupe resursa, upravljane identitete i RBAC dodjele.
- [**GitHub račun**](https://github.com): Koristan je za forkanje repozitorija, praćenje vlastitih promjena i korištenje GitHub Codespaces za radionicu.
- **Preduvjeti za izvođenje predložaka**: Neki predlošci zahtijevaju lokalne alate poput Node.js, Pythona, Jave ili Dockera. Pokrenite validator postavki prije početka kako biste na vrijeme uočili nedostajuće alate.
- **Osnovno poznavanje terminala**: Ne morate biti stručnjak, ali trebate se osjećati ugodno pri izvođenju naredbi poput `git clone`, `azd auth login` i `azd up`.

> **Radite u poslovnoj pretplati?**
> Ako vaš Azure okoliš upravlja administrator, prethodno provjerite možete li postavljati resurse u pretplati ili grupi resursa koju planirate koristiti. Ako ne, zatražite sandbox pretplatu ili pristup Contributor razine prije početka.

> **Novi ste u Azureu?**
> Započnite sa svojom besplatnom Azure probnom pretplatom ili plaćanjem prema potrošnji na https://aka.ms/azurefreetrial kako biste mogli završiti vježbe od početka do kraja bez čekanja na odobrenja na razini tenancyja.

## 🗺️ Karta tečaja: Brza navigacija po poglavljima

Svako poglavlje ima svoj README s ciljevima učenja, brzim početkom i vježbama:

| Poglavlje | Tema | Lekcije | Trajanje | Kompleksnost |
|---------|-------|---------|----------|------------|
| **[Poglavlje 1: Osnove](docs/chapter-01-foundation/README.md)** | Početak rada | [AZD osnove](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacija](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Poglavlje 2: AI razvoj](docs/chapter-02-ai-development/README.md)** | AI-prvo aplikacije | [Integracija Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Postavljanje modela](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 sata | ⭐⭐ |
| **[Poglavlje 3: Konfiguracija](docs/chapter-03-configuration/README.md)** | Autentikacija i sigurnost | [Konfiguracija](docs/chapter-03-configuration/configuration.md) &#124; [Autentikacija i sigurnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Poglavlje 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC i postavljanje | [Vodič za postavljanje](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 sati | ⭐⭐⭐ |
| **[Poglavlje 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI agent rješenja | [Scenarij za trgovinu](examples/retail-scenario.md) &#124; [Koordinacijski obrasci](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 sata | ⭐⭐⭐⭐ |
| **[Poglavlje 6: Pred postavljanje](docs/chapter-06-pre-deployment/README.md)** | Planiranje i validacija | [Preflight provjere](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Odabir SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 sat | ⭐⭐ |
| **[Poglavlje 7: Otklanjanje problema](docs/chapter-07-troubleshooting/README.md)** | Debugiranje i popravci | [Česti problemi](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problemi](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 sati | ⭐⭐ |
| **[Poglavlje 8: Produkcija](docs/chapter-08-production/README.md)** | Enterprise obrasci | [Produkcijske prakse](docs/chapter-08-production/production-ai-practices.md) | 2-3 sata | ⭐⭐⭐⭐ |
| **[🎓 Radionica](workshop/README.md)** | Praktični laboratorij | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Odabir](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Razlaganje](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagodba](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Rastavljanje](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključak](workshop/docs/instructions/7-Wrap-up.md) | 3-4 sata | ⭐⭐ |

**Ukupno trajanje tečaja:** ~10-14 sati | **Napredak vještina:** Početnik → Spreman za produkciju

---

## 📚 Poglavlja za učenje

*Odaberite svoj put učenja prema razini iskustva i ciljevima*

### 🚀 Poglavlje 1: Osnove i brzi početak
**Preduvjeti**: Azure pretplata, osnovno poznavanje komandne linije  
**Trajanje**: 30-45 minuta  
**Kompleksnost**: ⭐

#### Što ćete naučiti
- Razumijevanje osnovnih pojmova Azure Developer CLI
- Instalacija AZD na vašoj platformi
- Vaše prvo uspješno postavljanje

#### Resursi za učenje
- **🎯 Počnite ovdje**: [Što je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [AZD osnove](docs/chapter-01-foundation/azd-basics.md) - osnovni koncepti i terminologija
- **⚙️ Postavljanje**: [Instalacija i postavljanje](docs/chapter-01-foundation/installation.md) - vodiči prilagođeni platformi
- **🛠️ Praktično**: [Vaš prvi projekt](docs/chapter-01-foundation/first-project.md) - korak po korak tutorial
- **📋 Brzi pregled**: [Prečac naredbi](resources/cheat-sheet.md)

#### Praktične vježbe
```bash
# Brza provjera instalacije
azd version

# Postavite svoju prvu aplikaciju
azd init --template todo-nodejs-mongo
azd up
```

**💡 Ishod poglavlja**: Uspješno postaviti jednostavnu web aplikaciju na Azure korištenjem AZD

**✅ Potvrda uspjeha:**
```bash
# Nakon završetka Poglavlja 1, trebali biste moći:
azd version              # Prikazuje instaliranu verziju
azd init --template todo-nodejs-mongo  # Inicijalizira projekt
azd up                  # Postavlja na Azure
azd show                # Prikazuje URL aktivne aplikacije
# Aplikacija se otvara u pregledniku i radi
azd down --force --purge  # Čisti resurse
```

**📊 Vrijeme ulaganja:** 30-45 minuta  
**📈 Razina vještine nakon:** Može samostalno postavljati osnovne aplikacije
**📈 Razina vještine nakon:** Može samostalno postavljati osnovne aplikacije

---

### 🤖 Poglavlje 2: AI-prvi razvoj (Preporučeno za AI programere)
**Preduvjeti**: Završeno Poglavlje 1  
**Trajanje**: 1-2 sata  
**Kompleksnost**: ⭐⭐

#### Što ćete naučiti
- Integracija Microsoft Foundry s AZD
- Postavljanje AI-pokretanih aplikacija
- Razumijevanje konfiguracija AI servisa

#### Resursi za učenje
- **🎯 Počnite ovdje**: [Integracija Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Vodič za AI agente](docs/chapter-02-ai-development/agents.md) - Postavljanje inteligentnih agenata s AZD
- **📖 Obrasci**: [Postavljanje AI modela](docs/chapter-02-ai-development/ai-model-deployment.md) - Postavljanje i upravljanje AI modelima
- **🛠️ Radionica**: [AI Radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripremite svoja AI rješenja za AZD
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Učenje u pregledniku s MkDocs * DevContainer okruženjem
- **📋 Predlošci**: [Microsoft Foundry predlošci](#resursi-radionice)
- **📝 Primjeri**: [Primjeri postavljanja AZD](examples/README.md)

#### Praktične vježbe
```bash
# Postavite svoju prvu AI aplikaciju
azd init --template azure-search-openai-demo
azd up

# Isprobajte dodatne AI predloške
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Ishod poglavlja**: Postaviti i konfigurirati AI-pokretanu chat aplikaciju s RAG mogućnostima

**✅ Potvrda uspjeha:**
```bash
# Nakon Poglavlja 2, trebali biste moći:
azd init --template azure-search-openai-demo
azd up
# Testirati AI sučelje za chat
# Postavljati pitanja i dobivati AI podržane odgovore s izvorima
# Provjeriti radi li integracija pretraživanja
azd monitor  # Provjeriti prikazuje li Application Insights telemetriju
azd down --force --purge
```

**📊 Vrijeme ulaganja:** 1-2 sata  
**📈 Razina vještine nakon:** Može postaviti i konfigurirati AI aplikacije spremne za produkciju  
**💰 Svijest o troškovima:** Razumijevanje troškova $80-150/mj razvojnih, $300-3500/mj produkcijskih

#### 💰 Razmatranja troškova za AI postavljanje

**Razvojno okruženje (procijenjeno $80-150/mj):**
- Microsoft Foundry modeli (plaćanje po korištenju): $0-50/mj (ovisno o broju tokena)
- AI Search (osnovni nivo): $75/mj
- Container Apps (po potrošnji): $0-20/mj
- Pohrana (standardna): $1-5/mj

**Produkcijsko okruženje (procijenjeno $300-3500+/mj):**
- Microsoft Foundry modeli (PTU za konzistentne performanse): $3,000+/mj ILI plaćanje po potrošnji za velike količine
- AI Search (standardni nivo): $250/mj
- Container Apps (dedicated): $50-100/mj
- Application Insights: $5-50/mj
- Pohrana (premium): $10-50/mj

**💡 Savjeti za optimizaciju troškova:**
- Koristite **besplatne razine** Microsoft Foundry modela za učenje (uključeno Azure OpenAI 50,000 tokena/mj)
- Pokrenite `azd down` za de-alokaciju resursa kada ne razvijate aktivno
- Počnite s naplatom po potrošnji, pređite na PTU samo za produkciju
- Koristite `azd provision --preview` za procjenu troškova prije postavljanja
- Omogućite auto-skaliranje: plaćajte samo za stvarnu potrošnju

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
**Kompleksnost**: ⭐⭐

#### Što ćete naučiti
- Upravljanje i konfiguracija okruženja
- Najbolje prakse autentikacije i sigurnosti
- Imenovanje i organizacija resursa

#### Resursi za učenje
- **📖 Konfiguracija**: [Vodič za konfiguraciju](docs/chapter-03-configuration/configuration.md) - postavljanje okruženja
- **🔐 Sigurnost**: [Obrasci autentikacije i upravljani identitet](docs/chapter-03-configuration/authsecurity.md) - obrasci autentikacije
- **📝 Primjeri**: [Primjer aplikacije za bazu](examples/database-app/README.md) - AZD primjeri baza podataka

#### Praktične vježbe
- Konfigurirajte više okruženja (razvojno, testno, produkcijsko)
- Postavite autentikaciju upravljanim identitetom
- Implementirajte konfiguracije specifične za okruženja

**💡 Ishod poglavlja**: Upravljajte više okruženja s odgovarajućom autentikacijom i sigurnošću

---

### 🏗️ Poglavlje 4: Infrastruktura kao kod i postavljanje
**Preduvjeti**: Završena Poglavlja 1-3  
**Trajanje**: 1-1.5 sati  
**Kompleksnost**: ⭐⭐⭐

#### Što ćete naučiti
- Napredne strategije postavljanja
- Infrastruktura kao kod pomoću Bicep-a
- Strategije provisioning resursa

#### Resursi za učenje
- **📖 Postavljanje**: [Vodič za postavljanje](docs/chapter-04-infrastructure/deployment-guide.md) - kompletni radni tijekovi
- **🏗️ Provisioning**: [Provisioniranje resursa](docs/chapter-04-infrastructure/provisioning.md) - upravljanje Azure resursima
- **📝 Primjeri**: [Primjer container aplikacije](../../examples/container-app) - postavljanje u kontejnerima

#### Praktične vježbe
- Kreirajte prilagođene Bicep predloške
- Postavite multi-servisne aplikacije
- Implementirajte strategije blue-green postavljanja

**💡 Ishod poglavlja**: Postavite složene multi-servisne aplikacije koristeći prilagođene infrastrukturne predloške

---


### 🎯 Poglavlje 5: Višeagentna AI Rješenja (Napredno)
**Preduvjeti**: Završena poglavlja 1-2  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Obrasci višeagentne arhitekture
- Orkestracija i koordinacija agenata
- AI implementacije spremne za produkciju

#### Izvori za učenje
- **🤖 Istaknuti projekt**: [Višeagentno rješenje za maloprodaju](examples/retail-scenario.md) - Potpuna implementacija
- **🛠️ ARM predlošci**: [Paket ARM predložaka](../../examples/retail-multiagent-arm-template) - Implementacija jednim klikom
- **📖 Arhitektura**: [Obrasci koordinacije više agenata](docs/chapter-06-pre-deployment/coordination-patterns.md) - Obrasci

#### Praktične vježbe
```bash
# Implementirajte kompletno maloprodajno višestruko agentsko rješenje
cd examples/retail-multiagent-arm-template
./deploy.sh

# Istražite konfiguracije agenata
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Ishod poglavlja**: Implementirati i upravljati proizvodnim višeagentnim AI rješenjem s agentima za kupce i inventar

---

### 🔍 Poglavlje 6: Validacija i planiranje prije implementacije
**Preduvjeti**: Završeno poglavlje 4  
**Trajanje**: 1 sat  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Planiranje kapaciteta i validacija resursa
- Strategije odabira SKU-a
- Provjere prije implementacije i automatizacija

#### Izvori za učenje
- **📊 Planiranje**: [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) - Validacija resursa
- **💰 Odabir**: [Odabir SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Isplativi izbori
- **✅ Validacija**: [Provjere prije implementacije](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizirani skripti

#### Praktične vježbe
- Pokrenuti skripte za validaciju kapaciteta
- Optimizirati odabire SKU-a za troškove
- Implementirati automatizirane provjere prije implementacije

**💡 Ishod poglavlja**: Validirati i optimizirati implementacije prije izvršenja

---

### 🚨 Poglavlje 7: Otklanjanje poteškoća i ispravljanje pogrešaka
**Preduvjeti**: Završeno bilo koje poglavlje o implementaciji  
**Trajanje**: 1-1,5 sati  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Sistematski pristupi ispravljanju pogrešaka
- Česti problemi i rješenja
- Otklanjanje poteškoća specifičnih za AI

#### Izvori za učenje
- **🔧 Česti problemi**: [Česti problemi](docs/chapter-07-troubleshooting/common-issues.md) - Često postavljana pitanja i rješenja
- **🕵️ Ispravljanje pogrešaka**: [Vodič za ispravljanje pogrešaka](docs/chapter-07-troubleshooting/debugging.md) - Strategije korak po korak
- **🤖 AI problemi**: [Otklanjanje poteškoća za AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi AI servisa

#### Praktične vježbe
- Dijagnosticirati neuspjehe implementacije
- Riješiti probleme s autentifikacijom
- Otkloniti poteškoće u povezivanju AI servisa

**💡 Ishod poglavlja**: Samostalno dijagnosticirati i riješiti česte probleme implementacije

---

### 🏢 Poglavlje 8: Obrasci za produkciju i poslovne sustave
**Preduvjeti**: Završena poglavlja 1-4  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Strategije produkcijske implementacije
- Obrasci sigurnosti u poslovnim sustavima
- Praćenje i optimizacija troškova

#### Izvori za učenje
- **🏭 Produkcija**: [Najbolje prakse AI u produkciji](docs/chapter-08-production/production-ai-practices.md) - Obrasci za poslovne sustave
- **📝 Primjeri**: [Primjer mikroservisa](../../examples/microservices) - Složene arhitekture
- **📊 Praćenje**: [Integracija Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Praćenje

#### Praktične vježbe
- Implementirati obrasce sigurnosti za poslovne sustave
- Postaviti sveobuhvatno praćenje
- Implementirati produkcijsku verziju s odgovarajućim upravljanjem

**💡 Ishod poglavlja**: Implementirati aplikacije spremne za proizvodnju s potpunim produkcijskim kapacitetima

---

## 🎓 Pregled radionice: Interaktivno iskustvo učenja

> **⚠️ STATUS RADIONICE: Aktivni razvoj**  
> Materijali radionice su trenutno u fazi razvoja i dorade. Glavni moduli su funkcionalni, ali neka napredna poglavlja nisu kompletirana. Aktivno radimo na dovršetku sadržaja. [Pratite napredak →](workshop/README.md)

### Interaktivni materijali radionice
**Sveobuhvatno praktično učenje s alatima u pregledniku i vođenim vježbama**

Naši materijali radionice pružaju strukturirano, interaktivno iskustvo učenja koje nadopunjuje gore navedeni plan poglavlja. Radionica je dizajnirana za samostalno učenje i vođene instrukcije.

#### 🛠️ Značajke radionice
- **Sučelje u pregledniku**: Kompletna radionica temeljena na MkDocs s pretragom, kopiranjem i temama
- **Integracija GitHub Codespaces**: Jednim klikom postavljanje razvojne okoline
- **Strukturirani put učenja**: 8 modula vođenih vježbi (ukupno 3-4 sata)
- **Progresivna metodologija**: Uvod → Odabir → Validacija → Dekonstrukcija → Konfiguracija → Prilagodba → Čišćenje → Završetak
- **Interaktivno razvojno okruženje DevContainer**: Pre-konfigurirani alati i zavisnosti

#### 📚 Struktura modula radionice
Radionica slijedi **8-modulsku progresivnu metodologiju** koja vas vodi od otkrivanja do majstorstva u implementaciji:

| Modul | Tema | Što ćete raditi | Trajanje |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled radionice | Razumjeti ciljeve učenja, preduvjete i strukturu radionice | 15 min |
| **1. Odabir** | Otkrivanje predložaka | Istražiti AZD predloške i odabrati pravi AI predložak za vaš scenarij | 20 min |
| **2. Validacija** | Implementacija i provjera | Implementirati predložak pomoću `azd up` i potvrditi rad infrastrukture | 30 min |
| **3. Dekonstrukcija** | Razumijevanje strukture | Koristiti GitHub Copilot za istraživanje arhitekture predloška, Bicep datoteka i organizacije koda | 30 min |
| **4. Konfiguracija** | Detaljno o azure.yaml | Savladati konfiguraciju `azure.yaml`, hookove životnog ciklusa i varijable okoline | 30 min |
| **5. Prilagodba** | Prilagodite sebi | Omogućiti AI pretraživanje, praćenje, evaluaciju i prilagoditi za vaš scenarij | 45 min |
| **6. Čišćenje** | Očistite | Sigurno ukloniti resurse pomoću `azd down --purge` | 15 min |
| **7. Završetak** | Sljedeći koraci | Pregledati postignuća, ključne koncepte i nastaviti put učenja | 15 min |

**Tok radionice:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Početak radionice
```bash
# Opcija 1: GitHub Codespaces (Preporučeno)
# Kliknite "Code" → "Create codespace on main" u repozitoriju

# Opcija 2: Lokalni razvoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Slijedite upute za postavljanje u workshop/README.md
```

#### 🎯 Ishodi učenja radionice
Završetkom radionice sudionici će:
- **Implementirati produkcijske AI aplikacije**: Koristiti AZD s Microsoft Foundry uslugama
- **Savladati višeagentne arhitekture**: Implementirati koordinatorna AI agentna rješenja
- **Implementirati sigurnosne najbolje prakse**: Konfigurirati autentifikaciju i kontrolu pristupa
- **Optimizirati za skalabilnost**: Dizajnirati isplative i učinkovite implementacije
- **Otkloniti poteškoće u implementaciji**: Samostalno rješavati česte probleme

#### 📖 Resursi radionice
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Okruženje za učenje u pregledniku
- **📋 Upute po modulima**:
  - [0. Uvod](workshop/docs/instructions/0-Introduction.md) - Pregled radionice i ciljevi
  - [1. Odabir](workshop/docs/instructions/1-Select-AI-Template.md) - Pronalaženje i odabir AI predložaka
  - [2. Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementacija i verifikacija predložaka
  - [3. Dekonstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Istraživanje arhitekture predložaka
  - [4. Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Savladati azure.yaml
  - [5. Prilagodba](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagoditi za svoj scenarij
  - [6. Čišćenje](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Očistiti resurse
  - [7. Završetak](workshop/docs/instructions/7-Wrap-up.md) - Pregled i sljedeći koraci
- **🛠️ AI laboratorij radionice**: [AI laboratorij radionice](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI orijentirane vježbe
- **💡 Brzi početak**: [Vodič za postavljanje radionice](workshop/README.md#quick-start) - Konfiguracija okoline

**Idealan za**: Korporativne treninge, sveučilišne tečajeve, samostalno učenje i bootcampove za programere.

---

## 📖 Dubinsko proučavanje: AZD mogućnosti

Osim osnovnog, AZD pruža moćne značajke za produkcijske implementacije:

- **Implementacije temeljene na predlošcima** - Koristite unaprijed izrađene predloške za uobičajene obrasce aplikacija
- **Infrastruktura kao kod** - Upravljajte Azure resursima pomoću Bicep ili Terraforma  
- **Integrirani radni procesi** - Bez problema instalirajte, implementirajte i pratite aplikacije
- **Prijateljski za developere** - Optimizirano za produktivnost i iskustvo developera

### **AZD + Microsoft Foundry: Savršeno za AI implementacije**

**Zašto AZD za AI rješenja?** AZD rješava glavne izazove s kojima se AI developeri susreću:

- **Predlošci spremni za AI** - Prekonfigurirani predlošci za Microsoft Foundry modele, Azure AI usluge i ML zadatke
- **Sigurne AI implementacije** - Ugrađeni sigurnosni obrasci za AI usluge, API ključeve i točke pristupa modelima  
- **Produkcijski AI obrasci** - Najbolje prakse za skalabilne, isplative AI implementacije aplikacija
- **AI radni procesi od kraja do kraja** - Od razvoja modela do produkcijske implementacije s odgovarajućim praćenjem
- **Optimizacija troškova** - Pametna raspodjela resursa i skaliranje za AI zadatke
- **Integracija Microsoft Foundry** - Besprijekorna veza s katalogom Microsoft Foundry modela i točkama pristupa

---

## 🎯 Biblioteka predložaka i primjera

### Istaknuto: Microsoft Foundry predlošci
**Započnite ovdje ako implementirate AI aplikacije!**

> **Napomena:** Ovi predlošci prikazuju različite AI obrasce. Neki su vanjski Azure primjeri, drugi lokalne implementacije.

| Predložak | Poglavlje | Složenost | Usluge | Tip |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Vanjski |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavlje 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Vanjski |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Vanjski |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Vanjski |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Vanjski |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Vanjski |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalni** |

### Istaknuto: Kompletni scenariji učenja
**Predlošci aplikacija spremnih za produkciju povezani s obrazovnim poglavljima**

| Predložak | Obrazovno poglavlje | Složenost | Ključno učenje |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | Osnovni obrasci AI implementacije |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | Implementacija RAG s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavlje 4 | ⭐⭐ | Integracija inteligencije za dokumente |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | Okviri za agente i pozivanje funkcija |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐ | Orkestracija AI za poslovne sustave |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | Višeagentna arhitektura s agentima za kupce i inventar |

### Učenje prema tipu primjera

> **📌 Lokalni vs. vanjski primjeri:**  
> **Lokalni primjeri** (u ovom spremištu) = Spremni za upotrebu odmah  
> **Vanjski primjeri** (Azure primjeri) = Klonirati iz povezanih repozitorija

#### Lokalni primjeri (Spremni za upotrebu)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Potpuna implementacija spremna za produkciju s ARM predlošcima
  - Višeagentna arhitektura (agent za kupce + agent za inventar)
  - Sveobuhvatno praćenje i evaluacija
  - Implementacija jednim klikom putem ARM predloška

#### Lokalni primjeri - kontejnerske aplikacije (Poglavlja 2-5)
**Sveobuhvatni primjeri implementacije kontejnera u ovom spremištu:**

- [**Primjeri Container App**](examples/container-app/README.md) - Kompletan vodič za kontejnerizirane implementacije
  - [Jednostavni Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API sa skaliranjem do nule
  - [Mikroservisna arhitektura](../../examples/container-app/microservices) - Spremna za produkciju višeslužbena implementacija
  - Uzorci brzog početka, produkcije i napredne implementacije
  - Upute za nadzor, sigurnost i optimizaciju troškova

#### Vanjski primjeri - Jednostavne aplikacije (poglavlja 1-2)
**Klonirajte ove Azure Samples repozitorije za početak:**
- [Jednostavna web aplikacija - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni uzorci implementacije
- [Statistička web stranica - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementacija statičkog sadržaja
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementacija REST API-ja

#### Vanjski primjeri - Integracija baza podataka (poglavlja 3-4)  
- [Aplikacija baze podataka - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Uzorci povezivanja s bazom podataka
- [Funkcije + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Bešavna obrada podataka

#### Vanjski primjeri - Napredni scenariji (poglavlja 4-8)
- [Java mikroservisi](https://github.com/Azure-Samples/java-microservices-aca-lab) - Višeslužbena arhitektura
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Obrada u pozadini  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Spremni za produkciju ML uzorci

### Vanjske kolekcije predložaka
- [**Službeni AZD predložak galerija**](https://azure.github.io/awesome-azd/) - Kurirani skup službenih i zajedničkih predložaka
- [**Azure Developer CLI predlošci**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn dokumentacija predložaka
- [**Direktorij primjera**](examples/README.md) - Lokalni primjeri učenja s detaljnim objašnjenjima

---

## 📚 Resursi za učenje i reference

### Brze reference
- [**Kratka tablica naredbi**](resources/cheat-sheet.md) - Osnovne azd naredbe po poglavljima
- [**Rječnik**](resources/glossary.md) - Terminologija Azure i azd  
- [**Često postavljana pitanja**](resources/faq.md) - Uobičajena pitanja po poglavljima za učenje
- [**Vodič za učenje**](resources/study-guide.md) - Opširni praktični zadaci

### Praktične radionice
- [**AI radionica**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Omogućite svoje AI rješenja za AZD implementaciju (2-3 sata)
- [**Interaktivna radionica**](workshop/README.md) - 8-modulni vođeni zadaci s MkDocs i GitHub Codespaces
  - Slijedi: Uvod → Izbor → Validacija → Deconstruiranje → Konfiguracija → Prilagodba → Rasklapanje → Zaključak

### Vanjski resursi za učenje
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kalkulator cijena](https://azure.microsoft.com/pricing/calculator/)
- [Azure status](https://status.azure.com/)

### AI agent vještine za vaš uređivač
- [**Microsoft Azure vještine na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otvorenih AI agent vještina za Azure AI, Foundry, implementaciju, dijagnostiku, optimizaciju troškova i više. Instalirajte ih u GitHub Copilot, Cursor, Claude Code ili bilo koji podržani agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Brzi vodič za otklanjanje poteškoća

**Uobičajeni problemi koje početnici imaju i trenutna rješenja:**

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
<summary><strong>❌ "Nedovoljna kvota" ili "Kvota prekoračena"</strong></summary>

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
</details>

<details>
<summary><strong>❌ "azd up" ne uspijeva na pola puta</strong></summary>

```bash
# Opcija 1: Očisti i pokušaj ponovo
azd down --force --purge
azd up

# Opcija 2: Samo popravi infrastrukturu
azd provision

# Opcija 3: Provjeri detaljni status
azd show

# Opcija 4: Provjeri zapise u Azure Monitoru
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentikacija nije uspjela" ili "Token je istekao"</strong></summary>

```bash
# Ponovno se autentificirajte za AZD
azd auth logout
azd auth login

# Opcionalno: osvježite i Azure CLI ako izvršavate az naredbe
az logout
az login

# Provjerite autentifikaciju
az account show
```
</details>

<details>
<summary><strong>❌ "Resurs već postoji" ili sukobi u imenovanju</strong></summary>

```bash
# AZD generira jedinstvena imena, ali ako dođe do sukoba:
azd down --force --purge

# Onda pokušaj ponovno s novim okruženjem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implementacija predloška traje predugo</strong></summary>

**Normalno vrijeme čekanja:**
- Jednostavna web aplikacija: 5-10 minuta
- Aplikacija s bazom podataka: 10-15 minuta
- AI aplikacije: 15-25 minuta (Provisioniranje OpenAI sporo)

```bash
# Provjeri napredak
azd show

# Ako zapne više od 30 minuta, provjeri Azure Portal:
azd monitor --overview
# Potraži neuspjele implementacije
```
</details>

<details>
<summary><strong>❌ "Dozvola odbijena" ili "Zabranjeno"</strong></summary>

```bash
# Provjerite svoju Azure ulogu
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebna vam je najmanje uloga "Contributor"
# Zatražite od svog Azure administratora dodjelu:
# - Contributor (za resurse)
# - Administrator pristupa korisnicima (za dodjelu uloga)
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

### 📚 Cjeloviti resursi za otklanjanje poteškoća

- **Vodič za uobičajene probleme:** [Detaljna rješenja](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifični problemi:** [Otklanjanje poteškoća s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vodič za otklanjanje grešaka:** [Korak po korak](docs/chapter-07-troubleshooting/debugging.md)
- **Potraži pomoć:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Završetak tečaja i certifikacija

### Praćenje napretka
Pratite svoj napredak kroz svako poglavlje:

- [ ] **Poglavlje 1**: Osnove i Brzi početak ✅
- [ ] **Poglavlje 2**: AI-prvi razvoj ✅  
- [ ] **Poglavlje 3**: Konfiguracija i autentikacija ✅
- [ ] **Poglavlje 4**: Infrastruktura kao kod i implementacija ✅
- [ ] **Poglavlje 5**: Višestruka AI rješenja ✅
- [ ] **Poglavlje 6**: Validacija i planiranje prije implementacije ✅
- [ ] **Poglavlje 7**: Otklanjanje poteškoća i otklanjanje grešaka ✅
- [ ] **Poglavlje 8**: Produkcijski i Enterprise uzorci ✅

### Verifikacija znanja
Nakon završetka svakog poglavlja, provjerite svoje znanje:
1. **Praktična vježba**: Izvršite praktičnu implementaciju iz poglavlja
2. **Provjera znanja**: Pregledajte FAQ sekciju za svoje poglavlje
3. **Zajednica rasprava**: Podijelite svoja iskustva u Azure Discordu
4. **Sljedeće poglavlje**: Pređite na sljedeću razinu složenosti

### Prednosti završetka tečaja
Nakon završetka svih poglavlja dobit ćete:
- **Iskustvo u produkciji**: Implementirane stvarne AI aplikacije u Azure
- **Profesionalne vještine**: Spremnost za produkcijsku implementaciju
- **Prepoznavanje u zajednici**: Aktivni član zajednice Azure developera
- **Napredak u karijeri**: Tražena stručnost u AZD-u i AI implementacijama

---

## 🤝 Zajednica i podrška

### Potražite pomoć i podršku
- **Tehnički problemi**: [Prijavite greške i zatražite značajke](https://github.com/microsoft/azd-for-beginners/issues)
- **Pitanja za učenje**: [Microsoft Azure Discord zajednica](https://discord.gg/microsoft-azure) i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifična pomoć**: Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Službena Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Uvidi zajednice iz Microsoft Foundry Discorda

**Nedavni rezultati ankete na #Azure kanalu:**
- **45%** developera želi koristiti AZD za AI radne opterećenja
- **Glavni izazovi**: Višeslužbene implementacije, upravljanje vjerodajnicama, spremnost za produkciju  
- **Najtraženije**: AI-specifični predlošci, vodiči za otklanjanje poteškoća, najbolje prakse

**Pridružite nam se u zajednici da:**
- Podijelite svoja AZD + AI iskustva i zatražite pomoć
- Pristupite ranim verzijama novih AI predložaka
- Doprinesete najboljim praksama implementacije AI-ja
- Utječete na budući razvoj AI + AZD značajki

### Doprinos tečaju
Dobrodošli su doprinosi! Molimo pročitajte naš [Vodič za doprinose](CONTRIBUTING.md) za detalje o:
- **Poboljšanja sadržaja**: Unaprijedite postojeća poglavlja i primjere
- **Novi primjeri**: Dodajte stvarne scenarije i predloške  
- **Prijevodi**: Pomozite u održavanju podrške za više jezika
- **Izvještaji o greškama**: Unaprijedite točnost i jasnoću
- **Standardi zajednice**: Slijedite naše inkluzivne smjernice zajednice

---

## 📄 Informacije o tečaju

### Licenca
Ovaj projekt je licenciran pod MIT licencom - pogledajte datoteku [LICENSE](../../LICENSE) za detalje.

### Povezani Microsoft Learning resursi

Naš tim proizvodi druge obuhvatne tečajeve za učenje:

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
 
### Serija generativnog AI-ja
[![Generativni AI za početnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generativni AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![ML za početnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science za početnike](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI za početnike](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersigurnost za početnike](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web razvoj za početnike](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT za početnike](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR razvoj za početnike](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot serija
[![Copilot za AI programsko uparenje](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot za C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot avantura](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija tečajem

**🚀 Spremni za početak učenja?**

**Početnici**: Započnite s [Poglavlje 1: Osnove i brz početak](#-chapter-1-foundation--quick-start)  
**AI programeri**: Preskočite na [Poglavlje 2: AI-prvi razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Iskusni programeri**: Počnite s [Poglavlje 3: Konfiguracija i autentifikacija](#️-chapter-3-configuration--authentication)

**Sljedeći koraci**: [Počnite Poglavlje 1 - AZD osnove](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->