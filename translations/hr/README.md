# AZD za početnike: Strukturirano putovanje učenjem

![AZD-for-beginners](../../translated_images/hr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatski prijevodi (Uvijek ažurirani)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](./README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Radije lokalno kloniranje?**
>
> Ovaj repozitorij uključuje prijevode na više od 50 jezika što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda koristite sparse checkout:
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
> Ovo vam daje sve što vam treba za dovršetak tečaja uz znatno brže preuzimanje.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Što je novo u azd danas

Azure Developer CLI je narastao izvan tradicionalnih web aplikacija i API-ja. Danas je azd jedini alat za implementaciju **bilo koje** aplikacije u Azure—uključujući aplikacije s AI pogonom i inteligentne agente.

Evo što to znači za vas:

- **AI agenti su sada punopravna azd radna opterećenja.** Možete inicijalizirati, implementirati i upravljati projektima AI agenata koristeći isti `azd init` → `azd up` tijek rada koji već poznajete.
- **Integracija s Microsoft Foundry** donosi implementaciju modela, hostiranje agenata i konfiguraciju AI usluga izravno u azd ekosustav predložaka.
- **Osnovni tijek rada se nije promijenio.** Bilo da implementirate aplikaciju za zadatke, mikrouslugu ili višestruke AI agente, naredbe su iste.

Ako ste već koristili azd, AI podrška je prirodni nastavak—nije poseban alat niti napredna staza. Ako počinjete iz početka, naučit ćete jedan tijek rada koji funkcionira za sve.

---

## 🚀 Što je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je korisnički prilagođen alat naredbenog retka koji olakšava implementaciju aplikacija u Azure. Umjesto ručnog kreiranja i povezivanja desetaka Azure resursa, možete implementirati cijele aplikacije jednom naredbom.

### Čarolija `azd up`

```bash
# Ova jedna naredba radi sve:
# ✅ Stvara sve Azure resurse
# ✅ Konfigurira umrežavanje i sigurnost
# ✅ Gradi kod vaše aplikacije
# ✅ Postavlja na Azure
# ✅ Daje vam funkcionalnu URL adresu
azd up
```

**To je to!** Nema klikanja po Azure portalu, nema potrebe za učenjem složenih ARM predložaka, nema ručne konfiguracije - samo radne aplikacije na Azureu.

---

## ❓ Azure Developer CLI vs Azure CLI: Koja je razlika?

Ovo je najčešće pitanje koje početnici postavljaju. Evo jednostavnog odgovora:

| Značajka | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Svrha** | Upravljanje pojedinačnim Azure resursima | Implementacija cjelovitih aplikacija |
| **Način razmišljanja** | Usmjeren na infrastrukturu | Usmjeren na aplikacije |
| **Primjer** | `az webapp create --name myapp...` | `azd up` |
| **Krivulja učenja** | Potrebno poznavati Azure usluge | Samo poznavati vašu aplikaciju |
| **Najbolje za** | DevOps, infrastrukturu | Programere, prototipove |

### Jednostavna analogija

- **Azure CLI** je kao da imate sve alate za izgradnju kuće - čekiće, pile, čavle. Možete izgraditi bilo što, ali morate znati gradnju.
- **Azure Developer CLI** je kao da unajmite izvođača radova - vi opišete što želite, a oni se brinu o izgradnji.

### Kada koristiti što

| Scenarij | Koristite ovo |
|----------|---------------|
| "Želim brzo implementirati svoju web aplikaciju" | `azd up` |
| "Trebam samo kreirati račun za pohranu" | `az storage account create` |
| "Razvijam punu AI aplikaciju" | `azd init --template azure-search-openai-demo` |
| "Trebam debugirati određeni Azure resurs" | `az resource show` |
| "Želim implementaciju spremnu za produkciju za nekoliko minuta" | `azd up --environment production` |

### Oni rade zajedno!

AZD koristi Azure CLI ispod haube. Možete koristiti oba:
```bash
# Postavite svoju aplikaciju pomoću AZD
azd up

# Zatim fino prilagodite određene resurse pomoću Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Pronađite predloške u Awesome AZD

Nemojte počinjati od nule! **Awesome AZD** je zajednička zbirka spremnih za implementaciju predložaka:

| Resurs | Opis |
|--------|-------|
| 🔗 [**Awesome AZD galerija**](https://azure.github.io/awesome-azd/) | Pregledajte 200+ predložaka s implementacijom jednim klikom |
| 🔗 [**Pošaljite predložak**](https://github.com/Azure/awesome-azd/issues) | Doprinesite vlastitim predloškom zajednici |
| 🔗 [**GitHub repozitorij**](https://github.com/Azure/awesome-azd) | Zvjezdajte i istražite izvorni kod |

### Popularni AI predlošci iz Awesome AZD

```bash
# RAG chat s Microsoft Foundry modelima + AI pretraživanjem
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

### Korak 3: Implementirajte svoju prvu aplikaciju

```bash
# Inicijaliziraj iz predloška
azd init --template todo-nodejs-mongo

# Rasporedi na Azure (stvara sve!)
azd up
```

**🎉 To je to!** Vaša je aplikacija sada uživo na Azureu.

### Čišćenje (Nemojte zaboraviti!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kako koristiti ovaj tečaj

Ovaj tečaj je dizajniran za **postupno učenje** - započnite gdje vam je ugodno i napredujte:

| Vaše iskustvo | Početak ovdje |
|---------------|---------------|
| **Potpuno novi u Azureu** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Poznajete Azure, novi ste u AZD-u** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Želite implementirati AI aplikacije** | [Poglavlje 2: Razvoj s AI-prvim pristupom](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Želite praktični rad** | [🎓 Interaktivna radionica](workshop/README.md) - 3-4 sata vođene prakse |
| **Trebate produkcijske obrasce** | [Poglavlje 8: Produkcija i poduzeće](#-chapter-8-production--enterprise-patterns) |

### Brza postava

1. **Forkajte ovaj repozitorij**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Potražite pomoć**: [Azure Discord zajednica](https://discord.com/invite/ByRwuEEgH4)

> **Radije lokalno kloniranje?**

> Ovaj repozitorij uključuje prijevode na više od 50 jezika što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda koristite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ovo vam daje sve što vam treba za dovršetak tečaja uz znatno brže preuzimanje.


## Pregled tečaja

Ovladate Azure Developer CLI (azd) kroz strukturirana poglavlja dizajnirana za postupno učenje. **Poseban naglasak na implementaciji AI aplikacija s integracijom Microsoft Foundryja.**

### Zašto je ovaj tečaj bitan za moderne programere

Temeljeno na uvidima iz Microsoft Foundry Discord zajednice, **45% programera želi koristiti AZD za AI radna opterećenja** ali nailaze na izazove s:
- Složenim AI arhitekturama s više usluga
- Najboljim praksama za produkcijsku implementaciju AI
- Integracijom i konfiguracijom Azure AI usluga
- Optimizacijom troškova AI radnih opterećenja
- Rješavanjem specifičnih problema prilikom implementacije AI

### Ciljevi učenja

Završetkom ovog strukturiranog tečaja, vi ćete:
- **Ovladati AZD osnovama**: osnovni koncepti, instalacija i konfiguracija
- **Implementirati AI aplikacije**: koristiti AZD s Microsoft Foundry uslugama
- **Implementirati Infrastructure as Code**: upravljati Azure resursima pomoću Bicep predložaka
- **Rješavati probleme implementacije**: otklanjati česte poteškoće i debugirati probleme
- **Optimizirati za produkciju**: sigurnost, skaliranje, nadzor i upravljanje troškovima
- **Graditi višestruke AI agente**: implementirati složene AI arhitekture

## 🗺️ Mapa tečaja: Brza navigacija po poglavljima

Svako poglavlje ima zaseban README s ciljevima učenja, brzim početkom i vježbama:

| Poglavlje | Tema | Lekcije | Trajanje | Kompleksnost |
|-----------|------|---------|----------|--------------|
| **[Poglavlje 1: Osnove](docs/chapter-01-foundation/README.md)** | Početak | [Osnove AZD-a](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacija](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: Razvoj AI](docs/chapter-02-ai-development/README.md)** | AI-prioritetne aplikacije | [Integracija Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Implementacija modela](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 sata | ⭐⭐ |
| **[Ch 3: Konfiguracija](docs/chapter-03-configuration/README.md)** | Autentifikacija i sigurnost | [Konfiguracija](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikacija i sigurnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 minuta | ⭐⭐ |
| **[Ch 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC i implementacija | [Vodič za implementaciju](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 sati | ⭐⭐⭐ |
| **[Ch 5: Više agenata](docs/chapter-05-multi-agent/README.md)** | AI agentna rješenja | [Scenarij maloprodaje](examples/retail-scenario.md) &#124; [Koordinacijski obrasci](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 sata | ⭐⭐⭐⭐ |
| **[Ch 6: Priprema za implementaciju](docs/chapter-06-pre-deployment/README.md)** | Planiranje i validacija | [Preflight provjere](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Izbor SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Pregled aplikacije](docs/chapter-06-pre-deployment/application-insights.md) | 1 sat | ⭐⭐ |
| **[Ch 7: Otklanjanje poteškoća](docs/chapter-07-troubleshooting/README.md)** | Debugiranje i popravak | [Uobičajeni problemi](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugiranje](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problemi](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 sati | ⭐⭐ |
| **[Ch 8: Proizvodnja](docs/chapter-08-production/README.md)** | Poslovni obrasci | [Prakse u produkciji](docs/chapter-08-production/production-ai-practices.md) | 2-3 sata | ⭐⭐⭐⭐ |
| **[🎓 Radionica](workshop/README.md)** | Praktični laboratorij | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Izbor](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Razlaganje](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagodba](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontaža](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključak](workshop/docs/instructions/7-Wrap-up.md) | 3-4 sata | ⭐⭐ |

**Ukupno trajanje tečaja:** ~10-14 sati | **Razina vještina:** Početnik → Spreman za proizvodnju

---

## 📚 Poglavlja za učenje

*Odaberite svoj put učenja temeljen na razini iskustva i ciljevima*

### 🚀 Poglavlje 1: Osnove i Brzi početak
**Preduvjeti**: Pretplata na Azure, osnovno znanje komandne linije  
**Trajanje**: 30-45 minuta  
**Složenost**: ⭐

#### Što ćete naučiti
- Osnove Azure Developer CLI-ja
- Instalacija AZD-a na vašoj platformi
- Vaša prva uspješna implementacija

#### Izvori za učenje
- **🎯 Početak ovdje**: [Što je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorija**: [Osnove AZD-a](docs/chapter-01-foundation/azd-basics.md) - Temeljni pojmovi i terminologija
- **⚙️ Postavljanje**: [Instalacija i postavljanje](docs/chapter-01-foundation/installation.md) - Vodiči po platformama
- **🛠️ Praktično**: [Vaš prvi projekt](docs/chapter-01-foundation/first-project.md) - Vodič korak-po-korak
- **📋 Brzi pregled**: [Prečaci naredbi](resources/cheat-sheet.md)

#### Praktične vježbe
```bash
# Brza provjera instalacije
azd version

# Postavite svoju prvu aplikaciju
azd init --template todo-nodejs-mongo
azd up
```

**💡 Ishod poglavlja**: Uspješno implementirajte jednostavnu web aplikaciju na Azure pomoću AZD-a

**✅ Potvrda uspjeha:**
```bash
# Nakon dovršetka Poglavlja 1 trebali biste moći:
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

### 🤖 Poglavlje 2: AI-prvi razvoj (Preporučeno za AI developere)
**Preduvjeti**: Završeno Poglavlje 1  
**Trajanje**: 1-2 sata  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Integracija Microsoft Foundry s AZD-om
- Implementacija AI-pokretanih aplikacija
- Razumijevanje konfiguracija AI servisa

#### Izvori za učenje
- **🎯 Početak ovdje**: [Integracija Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Vodič za AI agente](docs/chapter-02-ai-development/agents.md) - Implementirajte inteligentne agente s AZD-om
- **📖 Obrasci**: [Implementacija AI modela](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementirajte i upravljajte AI modelima
- **🛠️ Radionica**: [AI radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripremite svoja AI rješenja za AZD
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Učenje putem preglednika s MkDocs * DevContainer okruženje
- **📋 Predlošci**: [Microsoft Foundry predlošci](#resursi-radionice)
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

**💡 Ishod poglavlja**: Implementirajte i konfigurirajte AI-pokretanu chat aplikaciju s RAG mogućnostima

**✅ Potvrda uspjeha:**
```bash
# Nakon Poglavlja 2, trebali biste moći:
azd init --template azure-search-openai-demo
azd up
# Testirati AI sučelje za chat
# Postavljati pitanja i dobivati AI-pokretane odgovore s izvorima
# Provjeriti radi li integracija pretraživanja
azd monitor  # Provjeriti prikazuju li Application Insights telemetriju
azd down --force --purge
```

**📊 Uloženo vrijeme:** 1-2 sata  
**📈 Razina vještine nakon:** Može implementirati i konfigurirati AI aplikacije spremne za produkciju  
**💰 Svijest o troškovima:** Razumijevanje troškova razvoja $80-150/mjesečno, produkcijskih troškova $300-3500/mjesečno

#### 💰 Troškovi za AI implementacije

**Razvojno okruženje (procjena $80-150/mjesečno):**
- Microsoft Foundry modeli (Plaćanje prema korištenju): $0-50/mjesečno (ovisno o tokenima)
- AI pretraživanje (osnovni nivo): $75/mjesečno
- Container Apps (potrošnja): $0-20/mjesečno
- Pohrana (standardna): $1-5/mjesečno

**Produkcijsko okruženje (procjena $300-3,500+/mjesečno):**
- Microsoft Foundry modeli (PTU za konzistentne performanse): $3,000+/mjesečno ILI plaćanje po korištenju s velikim volumenom
- AI pretraživanje (standardni nivo): $250/mjesečno
- Container Apps (posvećeno): $50-100/mjesečno
- Application Insights: $5-50/mjesečno
- Pohrana (premium): $10-50/mjesečno

**💡 Savjeti za optimizaciju troškova:**
- Koristite **Besplatni sloj** Microsoft Foundry modela za učenje (uključeno 50,000 tokena/mjesečno za Azure OpenAI)
- Pokrenite `azd down` za oslobađanje resursa kada ne razvijate aktivno
- Počnite s modelom naplate po potrošnji, nadogradite na PTU samo za produkciju
- Koristite `azd provision --preview` za procjenu troškova prije implementacije
- Uključite auto-skaliranje: plaćajte samo za stvarnu potrošnju

**Praćenje troškova:**
```bash
# Provjerite procijenjene mjesečne troškove
azd provision --preview

# Nadgledajte stvarne troškove u Azure portalu
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Poglavlje 3: Konfiguracija i Autentifikacija
**Preduvjeti**: Završeno Poglavlje 1  
**Trajanje**: 45-60 minuta  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Postavljanje i upravljanje okruženjima
- Najbolje prakse autentifikacije i sigurnosti
- Imenovanje i organizacija resursa

#### Izvori za učenje
- **📖 Konfiguracija**: [Vodič za konfiguraciju](docs/chapter-03-configuration/configuration.md) - Postavljanje okruženja
- **🔐 Sigurnost**: [Obrasci autentifikacije i upravljane identitete](docs/chapter-03-configuration/authsecurity.md) - Obrasci autentifikacije
- **📝 Primjeri**: [Primjer aplikacije baze podataka](examples/database-app/README.md) - Primjeri baza podataka s AZD-om

#### Praktične vježbe
- Konfigurirajte više okruženja (dev, staging, prod)
- Postavite autentifikaciju s upravljanom identitetom
- Implementirajte konfiguracije specifične za okruženje

**💡 Ishod poglavlja**: Upravljajte višestrukim okruženjima s pravilnom autentifikacijom i sigurnošću

---

### 🏗️ Poglavlje 4: Infrastruktura kao kod i implementacija
**Preduvjeti**: Završena poglavlja 1-3  
**Trajanje**: 1-1.5 sati  
**Složenost**: ⭐⭐⭐

#### Što ćete naučiti
- Napredni obrasci implementacije
- Infrastruktura kao kod s Bicepom
- Strategije za provisioning resursa

#### Izvori za učenje
- **📖 Implementacija**: [Vodič za implementaciju](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletni tijekovi rada
- **🏗️ Provisioning**: [Provisioning resursa](docs/chapter-04-infrastructure/provisioning.md) - Upravljanje Azure resursima
- **📝 Primjeri**: [Primjer Container App-a](../../examples/container-app) - Implementacije u kontejnerima

#### Praktične vježbe
- Kreirajte vlastite Bicep predloške
- Implementirajte aplikacije sa više servisa
- Primijenite blue-green strategije implementacije

**💡 Ishod poglavlja**: Implementirajte složene aplikacije sa više servisa koristeći prilagođene infrastrukturne predloške

---

### 🎯 Poglavlje 5: AI rješenja s više agenata (Napredno)
**Preduvjeti**: Završena Poglavlja 1-2  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Obrasci arhitekture za više agenata
- Orkestracija i koordinacija agenata
- AI implementacije spremne za proizvodnju

#### Izvori za učenje
- **🤖 Istaknuti projekt**: [Rješenje za više agenata u maloprodaji](examples/retail-scenario.md) - Kompletna implementacija
- **🛠️ ARM predlošci**: [ARM paket predložaka](../../examples/retail-multiagent-arm-template) - Implementacija jednim klikom
- **📖 Arhitektura**: [Koordinacijski obrasci za više agenata](docs/chapter-06-pre-deployment/coordination-patterns.md) - Obrasci

#### Praktične vježbe
```bash
# Implementirajte kompletnu maloprodajnu višeslojnu agentsku soluciju
cd examples/retail-multiagent-arm-template
./deploy.sh

# Istražite konfiguracije agenata
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Ishod poglavlja**: Implementirajte i upravljajte proizvodnim AI rješenjem s više agenata s agentima za kupce i inventar

---

### 🔍 Poglavlje 6: Validacija i planiranje prije implementacije
**Preduvjeti**: Završeno Poglavlje 4  
**Trajanje**: 1 sat  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Planiranje kapaciteta i validacija resursa
- Strategije izbora SKU-a
- Pre-flight provjere i automatizacija

#### Izvori za učenje
- **📊 Planiranje**: [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) - Validacija resursa
- **💰 Izbor**: [Izbor SKU-a](docs/chapter-06-pre-deployment/sku-selection.md) - Financijski učinkovite opcije
- **✅ Validacija**: [Pre-flight provjere](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizirani skripti

#### Praktične vježbe
- Pokrenite skripte za validaciju kapaciteta
- Optimizirajte odabir SKU-a za troškove
- Implementirajte automatizirane pre-flight provjere

**💡 Ishod poglavlja**: Validirajte i optimizirajte implementacije prije izvršenja

---

### 🚨 Poglavlje 7: Otklanjanje poteškoća i debugiranje
**Preduvjeti**: Završeno bilo koje poglavlje o implementaciji  
**Trajanje**: 1-1.5 sati  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Sistematski pristupi otklanjanju poteškoća
- Uobičajeni problemi i njihova rješenja
- Specifični AI problemi i rješenja

#### Izvori za učenje
- **🔧 Uobičajeni problemi**: [Uobičajeni problemi i rješenja](docs/chapter-07-troubleshooting/common-issues.md)
- **🕵️ Debugiranje**: [Vodič za debugiranje](docs/chapter-07-troubleshooting/debugging.md) - Strategije korak-po-korak
- **🤖 AI problemi**: [AI-specifični problemi](docs/chapter-07-troubleshooting/ai-troubleshooting.md)

#### Praktične vježbe
- Dijagnosticirajte neuspjele implementacije
- Riješite probleme s autentifikacijom
- Debugirajte probleme s povezivošću AI servisa

**💡 Ishod poglavlja**: Samostalno dijagnosticirajte i riješite uobičajene probleme implementacije

---

### 🏢 Poglavlje 8: Proizvodnja i poslovni obrasci
**Preduvjeti**: Završena Poglavlja 1-4  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Strategije proizvodnih implementacija
- Poslovni obrasci za sigurnost
- Praćenje i optimizacija troškova

#### Izvori za učenje
- **🏭 Proizvodnja**: [Najbolje prakse za AI u proizvodnji](docs/chapter-08-production/production-ai-practices.md) - Enterprise obrasci
- **📝 Primjeri**: [Primjer mikroservisa](../../examples/microservices) - Složene arhitekture
- **📊 Praćenje**: [Integracija Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Praćenje

#### Praktične vježbe
- Implementirajte enterprise sigurnosne obrasce
- Postavite sveobuhvatno praćenje
- Deployajte u produkciju s odgovarajućim upravljanjem

**💡 Ishod poglavlja**: Deployajte aplikacije spremne za proizvodnju s punim proizvodnim mogućnostima

---

## 🎓 Pregled radionice: Praktično učenje

> **⚠️ STATUS RADIONICE: Aktivni razvoj**  
> Materijali za radionicu su trenutno u razvoju i doradi. Glavni moduli su funkcionalni, ali neki napredni dijelovi nisu dovršeni. Aktivno radimo na dovršetku svih sadržaja. [Pratite napredak →](workshop/README.md)

### Interaktivni materijali radionice
**Sveobuhvatno praktično učenje s alatima u pregledniku i vođenim vježbama**

Naši materijali radionice pružaju strukturirano, interaktivno iskustvo učenja koje nadopunjuje gore navedeni kurikulum podijeljen po poglavljima. Radionica je dizajnirana za samostalno učenje i vođene sesije.

#### 🛠️ Značajke radionice
- **Sučelje u pregledniku**: Kompletna radionica pokretana MkDocs-om s tražilicom, kopiranjem i temama
- **Integracija GitHub Codespaces**: Postavljanje razvojne okoline jednim klikom
- **Strukturirani put učenja**: 8 vođenih modula (ukupno 3-4 sata)
- **Postupna metodologija**: Uvod → Izbor → Validacija → Dekonstrukcija → Konfiguracija → Prilagodba → Obris → Zaključak
- **Interaktivno DevContainer okruženje**: Prekonfigurirani alati i ovisnosti

#### 📚 Struktura modula radionice
Radionica slijedi **8-modulnu progresivnu metodologiju** koja vas vodi od otkrivanja do majstorstva u produkciji:

| Modul | Tema | Što ćete raditi | Trajanje |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled radionice | Razumjeti ciljeve učenja, preduvjete i strukturu radionice | 15 min |
| **1. Izbor** | Otkrivanje predložaka | Istražiti AZD predloške i odabrati pravi AI predložak za vaš scenarij | 20 min |
| **2. Validacija** | Deploy i provjera | Deployati predložak s `azd up` i potvrditi rad infrastrukture | 30 min |
| **3. Dekonstrukcija** | Razumjeti strukturu | Koristiti GitHub Copilot za istraživanje arhitekture predloška, Bicep datoteka i organizaciju koda | 30 min |
| **4. Konfiguracija** | dubinski pregled azure.yaml | Savladati konfiguraciju `azure.yaml`, lifecycle hookove i varijable okoline | 30 min |
| **5. Prilagodba** | Prilagodite si | Omogućiti AI Search, praćenje, evaluaciju i prilagoditi za svoj scenarij | 45 min |
| **6. Obris** | Čišćenje | Sigurno obrisati resurse koristeći `azd down --purge` | 15 min |
| **7. Zaključak** | Sljedeći koraci | Pregled postignuća, ključnih koncepata i nastavak učenja | 15 min |

**Tijek radionice:**
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
- **Deployati AI aplikacije za proizvodnju**: Koristiti AZD s Microsoft Foundry uslugama
- **Savladati višekagentne arhitekture**: Implementirati koordinirane AI agent rješenja
- **Primijeniti sigurnosne najbolje prakse**: Konfigurirati autentikaciju i kontrolu pristupa
- **Optimizirati za skaliranje**: Dizajnirati isplative i učinkovite deploy-e
- **Rješavati probleme deploya**: Samostalno rješavati uobičajene probleme

#### 📖 Resursi radionice
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Okruženje za učenje u pregledniku
- **📋 Upute po modulima**:
  - [0. Uvod](workshop/docs/instructions/0-Introduction.md) - Pregled i ciljevi radionice
  - [1. Izbor](workshop/docs/instructions/1-Select-AI-Template.md) - Pronađi i odaberi AI predloške
  - [2. Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) - Deployaj i verificiraj predloške
  - [3. Dekonstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Istraži arhitekturu predloška
  - [4. Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Savladaj azure.yaml
  - [5. Prilagodba](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagodi za svoj scenarij
  - [6. Obris](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Očisti resurse
  - [7. Zaključak](workshop/docs/instructions/7-Wrap-up.md) - Pregled i daljnji koraci
- **🛠️ AI radionica laboratorij**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI usmjerene vježbe
- **💡 Brzi početak**: [Vodič za postavljanje radionice](workshop/README.md#quick-start) - Konfiguracija okoline

**Savršeno za**: Korporativnu edukaciju, fakultetske tečajeve, samostalno učenje i developerske bootcampove.

---

## 📖 Detaljan pregled: AZD mogućnosti

Osim osnovnog, AZD pruža moćne značajke za produkcijske deploy-e:

- **Deploy-e temeljeni na predlošcima** - Koristite unaprijed izrađene predloške za uobičajene obrasce aplikacija
- **Infrastruktura kao kod** - Upravljajte Azure resursima koristeći Bicep ili Terraform  
- **Integrirani tijekovi rada** - Besprijekorno provisioniranje, deploy i nadzor aplikacija
- **Prijateljski za developere** - Optimizirano za produktivnost i iskustvo programera

### **AZD + Microsoft Foundry: Savršeno za AI deploy-e**

**Zašto AZD za AI rješenja?** AZD rješava najveće izazove AI developera:

- **AI-pripremljeni predlošci** - Prekonfigurirani predlošci za Microsoft Foundry modele, Cognitive Services i ML radna opterećenja
- **Sigurni AI deploy-evi** - Ugrađeni sigurnosni obrasci za AI usluge, API ključeve i modele  
- **Produkcijski AI obrasci** - Najbolje prakse za skalabilne i isplative AI deploy-e aplikacija
- **End-to-end AI tijekovi rada** - Od razvoja modela do produkcijskog deploya s odgovarajućim nadzorom
- **Optimizacija troškova** - Pametno dodjeljivanje resursa i strategije skaliranja za AI radna opterećenja
- **Integracija s Microsoft Foundry** - Besprijekorna veza s Microsoft Foundry katalogom modela i endpointima

---

## 🎯 Predlošci i biblioteka primjera

### Istaknuto: Microsoft Foundry predlošci
**Počnite ovdje ako deployate AI aplikacije!**

> **Napomena:** Ovi predlošci demonstriraju različite AI obrasce. Neki su vanjski Azure primjeri, drugi lokalne implementacije.

| Predložak | Poglavlje | Kompleksnost | Usluge | Tip |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Vanjski |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavlje 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Vanjski |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Vanjski |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Vanjski |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Vanjski |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Vanjski |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalno** |

### Istaknuto: Kompleti scenarija učenja
**Produkcijski spremni predlošci povezanih s poglavljima za učenje**

| Predložak | Poglavlje učenja | Kompleksnost | Ključno učenje |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | Osnovni AI obrasci deploya |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | RAG implementacija s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavlje 4 | ⭐⭐ | Integracija inteligencije dokumenata |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | Framework za agente i pozivanje funkcija |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐ | Enterprise AI orkestracija |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | Višekagentna arhitektura s agentima za kupce i inventar |

### Učenje po tipu primjera

> **📌 Lokalne vs. vanjske primjere:**  
> **Lokalni primjeri** (u ovom repozitoriju) = Spremni za odmah korištenje  
> **Vanjski primjeri** (Azure Samples) = Klonirajte iz povezanih repozitorija

#### Lokalni primjeri (spremni za korištenje)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletna produkcijska implementacija s ARM predlošcima
  - Višekagentna arhitektura (agent Kupac + agent Inventar)
  - Sveobuhvatno praćenje i evaluacija
  - Jednim klikom deploy putem ARM predloška

#### Lokalni primjeri - Container aplikacije (poglavlja 2-5)
**Sveobuhvatni primjeri deploya kontejnera u ovom repozitoriju:**
- [**Primjeri Container aplikacija**](examples/container-app/README.md) - Potpuni vodič za deploye kontejneriziranih aplikacija
  - [Jednostavan Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API sa skaliranjem na nulu
  - [Arhitektura mikroservisa](../../examples/container-app/microservices) - Produkcijski multi-servis deploy
  - Uzorci brzog starta, produkcije i napredni deployi
  - Upute za praćenje, sigurnost i optimizaciju troškova

#### Vanjski primjeri - Jednostavne aplikacije (poglavlja 1-2)
**Klonirajte ove Azure primjere da započnete:**
- [Jednostavna web aplikacija - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni obrasci deploya
- [Statistička web stranica - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deploy statičkog sadržaja
- [Container app - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deploy REST API-ja

#### Vanjski primjeri - Integracija baze podataka (poglavlja 3-4)  
- [Baza podataka app - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Obrasci povezivanja s bazom
- [Funkcije + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless obrada podataka

#### Vanjski primjeri - Napredni obrasci (poglavlja 4-8)
- [Java mikroservisi](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-servisne arhitekture
- [Container Apps poslovi](https://github.com/Azure-Samples/container-apps-jobs) - Pozadinska obrada  
- [Enterprise ML pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkcijski ML obrasci

### Vanjske kolekcije predložaka
- [**Službeni AZD gallery predložaka**](https://azure.github.io/awesome-azd/) - Kurirana kolekcija službenih i community predložaka
- [**AZD predlošci za developere**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn dokumentacija predložaka
- [**Direktorij primjera**](examples/README.md) - Lokalni primjeri za učenje s detaljnim objašnjenjima

---

## 📚 Resursi za učenje i reference

### Brze reference
- [**Kratki pregled komandi**](resources/cheat-sheet.md) - Osnovne azd komande organizirane po poglavljima
- [**Rječnik**](resources/glossary.md) - Terminologija Azure i azd  
- [**Često postavljana pitanja (FAQ)**](resources/faq.md) - Uobičajena pitanja po obrazovnim poglavljima
- [**Vodič za učenje**](resources/study-guide.md) - Sveobuhvatne vježbe

### Praktične radionice
- [**AI radionica laboratorij**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Omogućite svoje AI rješenja za AZD deploy (2-3 sata)
- [**Interaktivna radionica**](workshop/README.md) - 8 modulnih vođenih vježbi s MkDocs i GitHub Codespaces
  - Slijedi: Uvod → Izbor → Validacija → Dekonstrukcija → Konfiguracija → Prilagodba → Obris → Zaključak

### Vanjski resursi za učenje
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulator cijena Azure](https://azure.microsoft.com/pricing/calculator/)
- [Azure status](https://status.azure.com/)

### Vještine AI agenata za vaš uređivač
- [**Microsoft Azure vještine na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otvorenih vještina agenata za Azure AI, Foundry, implementaciju, dijagnostiku, optimizaciju troškova i još mnogo toga. Instalirajte ih u GitHub Copilot, Cursor, Claude Code ili bilo kojem podržanom agentu:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Brzi vodič za rješavanje problema

**Uobičajeni problemi s kojima se početnici susreću i odmah primjenjiva rješenja:**

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
<summary><strong>❌ "Nije pronađena pretplata" ili "Pretplata nije postavljena"</strong></summary>

```bash
# Nabroji dostupne pretplate
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
<summary><strong>❌ "Nedovoljna kvota" ili "Kvota premašena"</strong></summary>

```bash
# Isprobajte različite Azure regije
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
<summary><strong>❌ "Neuspjela autentifikacija" ili "Token je istekao"</strong></summary>

```bash
# Ponovno provjerite autentičnost
az logout
az login

azd auth logout
azd auth login

# Potvrdite autentifikaciju
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
<summary><strong>❌ Izrada predloška traje predugo</strong></summary>

**Normalno vrijeme čekanja:**
- Jednostavna web aplikacija: 5-10 minuta
- Aplikacija s bazom podataka: 10-15 minuta
- AI aplikacije: 15-25 minuta (Provisioniranje OpenAI je sporo)

```bash
# Provjeri napredak
azd show

# Ako je zapelo više od 30 minuta, provjeri Azure Portal:
azd monitor
# Potraži neuspjele implementacije
```
</details>

<details>
<summary><strong>❌ "Pristup odbijen" ili "Zabranjeno"</strong></summary>

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
<summary><strong>❌ Ne može se pronaći URL implementirane aplikacije</strong></summary>

```bash
# Prikaži sve krajnje točke usluge
azd show

# Ili otvori Azure portal
azd monitor

# Provjeri određenu uslugu
azd env get-values
# Potraži *_URL varijable
```
</details>

### 📚 Potpuni resursi za rješavanje problema

- **Vodič za uobičajene probleme:** [Detaljna rješenja](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemi specifični za AI:** [Rješavanje problema AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vodič za otklanjanje pogrešaka:** [Korak po korak otklanjanje pogrešaka](docs/chapter-07-troubleshooting/debugging.md)
- **Pomoć:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Završetak tečaja i certifikacija

### Praćenje napretka
Pratite svoj napredak u učenju kroz svaki poglavlje:

- [ ] **Poglavlje 1**: Osnove i brzi početak ✅
- [ ] **Poglavlje 2**: AI-prvi razvoj ✅  
- [ ] **Poglavlje 3**: Konfiguracija i autentifikacija ✅
- [ ] **Poglavlje 4**: Infrastruktura kao kod i implementacija ✅
- [ ] **Poglavlje 5**: Višeagentna AI rješenja ✅
- [ ] **Poglavlje 6**: Validacija i planiranje prije implementacije ✅
- [ ] **Poglavlje 7**: Rješavanje problema i otklanjanje pogrešaka ✅
- [ ] **Poglavlje 8**: Produkcijski i enterprise obrasci ✅

### Provjera znanja
Nakon završetka svakog poglavlja, provjerite svoje znanje tako da:
1. **Praktična vježba**: Završite praktičnu implementaciju poglavlja
2. **Provjera znanja**: Pregledajte FAQ odjeljak za vaše poglavlje
3. **Zajednički razgovor**: Podijelite svoje iskustvo u Azure Discord zajednici
4. **Sljedeće poglavlje**: Pređite na sljedeću razinu složenosti

### Prednosti završetka tečaja
Nakon završetka svih poglavlja, imat ćete:
- **Iskustvo u produkciji**: Implementirane stvarne AI aplikacije u Azure
- **Profesionalne vještine**: Sposobnost implementacije spremna za enterprise  
- **Priznanje zajednice**: Aktivni član Azure razvojne zajednice
- **Napredak u karijeri**: Tražena ekspertiza u AZD i AI implementaciji

---

## 🤝 Zajednica i podrška

### Dobivanje pomoći i podrške
- **Tehnički problemi**: [Prijavite greške i zatražite dodatke](https://github.com/microsoft/azd-for-beginners/issues)
- **Pitanja o učenju**: [Microsoft Azure Discord zajednica](https://discord.gg/microsoft-azure) i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoć specifična za AI**: Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Službena dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Uvidi zajednice iz Microsoft Foundry Discorda

**Nedavni rezultati ankete iz #Azure kanala:**
- **45%** developera želi koristiti AZD za AI radne zadatke
- **Glavni izazovi**: Višeservisne implementacije, upravljanje vjerodajnicama, spremnost za produkciju  
- **Najtraženije**: AI-specifični predlošci, vodiči za rješavanje problema, najbolje prakse

**Pridružite se našoj zajednici da:**
- Podijelite svoja AZD + AI iskustva i dobijete pomoć
- Pristupate ranim pregledima novih AI predložaka
- Sudjelujete u razvoju najboljih praksi za AI implementaciju
- Utječete na budući razvoj AI + AZD značajki

### Sudjelovanje u tečaju
Dobrodošli su doprinosi! Molimo pročitajte naš [Vodič za doprinos](CONTRIBUTING.md) za detalje o:
- **Poboljšanju sadržaja**: Unaprijedite postojeća poglavlja i primjere
- **Novi primjeri**: Dodajte stvarne scenarije i predloške  
- **Prijevodu**: Pomozite održavati podršku za više jezika
- **Prijavi grešaka**: Poboljšajte točnost i jasnost
- **Standardima zajednice**: Slijedite naše inkluzivne smjernice zajednice

---

## 📄 Informacije o tečaju

### Licenca
Ovaj projekt je licenciran pod MIT licencom - pogledajte datoteku [LICENSE](../../LICENSE) za detalje.

### Povezani Microsoft resursi za učenje

Naš tim proizvodi i druge cjelovite tečajeve:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j za početnike](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js za početnike](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain za početnike](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenti
[![AZD za početnike](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI za početnike](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP za početnike](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agenti za početnike](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Generativni AI
[![Generativni AI za početnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![ML za početnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science za početnike](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI za početnike](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity za početnike](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev za početnike](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT za početnike](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR razvoj za početnike](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija Kroz Tečaj

**🚀 Spremni za Početak Učenja?**

**Početnici**: Započnite s [Poglavlje 1: Osnove i Brzi Početak](#-chapter-1-foundation--quick-start)  
**AI Razvijatelji**: Preskočite na [Poglavlje 2: AI-prvo Razvijanje](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Iskusni Razvijatelji**: Počnite s [Poglavlje 3: Konfiguracija i Autentifikacija](#️-chapter-3-configuration--authentication)

**Sljedeći Koraci**: [Započni Poglavlje 1 - AZD Osnove](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj je dokument preveden korištenjem AI usluge prevođenja [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, molimo imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne odgovaramo za bilo kakve nesporazume ili nerazumijevanja proizašla iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->