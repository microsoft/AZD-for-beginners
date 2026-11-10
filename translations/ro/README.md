# AZD Pentru Începători: O Călătorie de Învățare Structurată

![AZD-pentru-incepatori](../../translated_images/ro/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduceri automate (Întotdeauna la zi)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabă](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgară](../bg/README.md) | [Birmană (Myanmar)](../my/README.md) | [Chineză (Simplificată)](../zh-CN/README.md) | [Chineză (Tradițională, Hong Kong)](../zh-HK/README.md) | [Chineză (Tradițională, Macau)](../zh-MO/README.md) | [Chineză (Tradițională, Taiwan)](../zh-TW/README.md) | [Croată](../hr/README.md) | [Cehă](../cs/README.md) | [Daneză](../da/README.md) | [Olandeză](../nl/README.md) | [Estonă](../et/README.md) | [Finlandeză](../fi/README.md) | [Franceză](../fr/README.md) | [Germană](../de/README.md) | [Greacă](../el/README.md) | [Ebraică](../he/README.md) | [Hindi](../hi/README.md) | [Maghiară](../hu/README.md) | [Indoneziană](../id/README.md) | [Italiană](../it/README.md) | [Japoneză](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Coreeană](../ko/README.md) | [Lituaniană](../lt/README.md) | [Malaysiană](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepaleză](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norvegiană](../no/README.md) | [Persană (Farsi)](../fa/README.md) | [Poloneză](../pl/README.md) | [Portugheză (Brazilia)](../pt-BR/README.md) | [Portugheză (Portugalia)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Română](./README.md) | [Rusă](../ru/README.md) | [Sârbă (Chirilică)](../sr/README.md) | [Slovacă](../sk/README.md) | [Slovenă](../sl/README.md) | [Spaniolă](../es/README.md) | [Swahili](../sw/README.md) | [Suedeză](../sv/README.md) | [Tagalog (Filipineză)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailandeză](../th/README.md) | [Turcă](../tr/README.md) | [Ucraineană](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnameză](../vi/README.md)

> **Preferi să clonezi local?**
>
> Acest depozit include traduceri în peste 50 de limbi, ceea ce crește semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
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
> Acest lucru îți oferă tot ce ai nevoie pentru a finaliza cursul cu o descărcare mult mai rapidă.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Ce este nou în azd astăzi

> 📌 **Recenzie lansare AI CLI (2026-11-04):** Ghidarea a fost verificată în raport cu documentația/sursa publicată pentru **`azd 1.37.2`**, **agenți `1.0.0-beta.23`** și **evaluări `1.0.0-beta.2`**. Folosește `azd >= 1.37.0` pentru fluxul de lucru combinat. Rulează `azd version` și [actualizează CLI-ul de bază](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) înainte de extensii. Vezi [modificările și corecturile versiunii](docs/chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Aceasta nu este o validare live a întregului curs.

Azure Developer CLI suportă multe tipuri de aplicații, inclusiv aplicații web, API-uri și agenți AI, prin gazde, șabloane și extensii suportate.

Iată ce înseamnă asta pentru tine:

- **Agenții AI sunt acum încărcări azd de primă clasă.** Poți inițializa, implementa și gestiona proiectele cu agenți AI folosind același flux de lucru `azd init` → `azd up` pe care deja îl cunoști.
- **Un ciclu de viață al agentului prin două extensii.** Folosește `azure.ai.agents` pentru a inițializa, invoca, optimiza și retrage agenții. Instalează **`azure.ai.evaluations`** separat pentru `azd ai eval init`, `generate` și `run start`. Agenți beta.22 a înlocuit fluxul de lucru vechi de evaluare și a schimbat configurația de optimizare; urmează [ghidul de migrare](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Mai multe blocuri de construcție AI.** Noi extensii în previzualizare—`azure.ai.skills` și `azure.ai.connections`—îți permit să gestionezi direct cu azd abilitățile reutilizabile ale agenților și conexiunile Foundry.
- **Integrarea Microsoft Foundry** aduce implementarea modelelor, găzduirea agenților și configurarea serviciilor AI direct în ecosistemul șabloanelor azd.
- **Bazele de zi cu zi mai fluide.** Lansările recente au făcut `azd init` idempotent (sigur pentru rerulare), au făcut `azd auth login` să curețe automat token-urile vechi și au adăugat un mesaj de configurare prietenos `azd tool` la prima rulare.
- **Fluxul de lucru principal nu s-a schimbat.** Indiferent dacă implementezi o aplicație todo, un microserviciu sau o soluție AI cu mai mulți agenți, comenzile sunt aceleași.

> **Notă pentru utilizatorii Aspire:** Microsoft se referă acum la produs simplu ca **Aspire** (fostul ".NET Aspire"). Suportul azd pentru Aspire este neschimbat—numai numele a fost actualizat.

Dacă ai folosit azd înainte, suportul AI este o extensie naturală—nu un instrument separat sau o cale avansată. Dacă începi de la zero, vei învăța un singur flux de lucru care funcționează pentru orice.

---

## 🚀 Ce este Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** este un instrument prietenos pentru dezvoltatori, bazat pe linia de comandă, care face simplă implementarea aplicațiilor în Azure. În loc să creezi și să conectezi manual zeci de resurse Azure, poți implementa aplicații complete cu o singură comandă.

### Magia `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

Șablonul furnizează configurația aplicației și a infrastructurii. Implementarea de succes necesită în continuare servicii/ modelele suportate, cotă și permisiuni suficiente, intrări corecte și verificarea aplicației implementate. `azd up` nu face automat un șablon sigur, conform, sau gata pentru producție.

---

## ❓ Azure Developer CLI vs Azure CLI: Care este diferența?

Aceasta este cea mai frecventă întrebare a începătorilor. Iată răspunsul simplu:

| Caracteristică | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Scop** | Gestionarea resurselor Azure individuale | Implementarea aplicațiilor complete |
| **Mentalitate** | Axat pe infrastructură | Axat pe aplicație |
| **Exemplu** | `az webapp create --name myapp...` | `azd up` |
| **Curba de învățare** | Trebuie să cunoști serviciile Azure | Trebuie doar să-ți cunoști aplicația |
| **Cea mai bună utilizare** | DevOps, Infrastructură | Dezvoltatori, Prototipare |

### O analogie simplă

- **Azure CLI** este ca și cum ai avea toate uneltele pentru a construi o casă - ciocane, ferăstraie, cuie. Poți construi orice, dar trebuie să cunoști construcțiile.
- **Azure Developer CLI** este ca și cum ai angaja un antreprenor - descrii ce vrei și ei se ocupă de construcție.

### Când să folosești fiecare

| Scenariu | Folosește asta |
|----------|----------|
| "Vreau să implementez rapid aplicația web" | `azd up` |
| "Trebuie să creez doar un cont de stocare" | `az storage account create` |
| "Construiesc o aplicație AI completă" | `azd init --template azure-search-openai-demo` |
| "Trebuie să depaneze o resursă specifică Azure" | `az resource show` |
| "Vreau să implementez în mediul meu de producție configurat" | Revizuiește configurația, accesul, costurile și condițiile operaționale înainte de `azd up --environment production` |

### Lucrează împreună!

AZD și Azure CLI au autentificări și configurații separate. Folosește `azd auth login` pentru AZD, și `az login` când o comandă hook sau de diagnostic necesită explicit Azure CLI. Poți folosi ambele:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Găsește șabloane în Awesome AZD

Nu începe de la zero! **Awesome AZD** este colecția comunității de șabloane gata de implementare:

| Resursă | Descriere |
|----------|-------------|
| 🔗 [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) | Răsfoiește peste 200 de șabloane cu implementare cu un singur clic |
| 🔗 [**Trimite un șablon**](https://github.com/Azure/awesome-azd/issues) | Contribuie cu propriul șablon comunității |
| 🔗 [**Depozitul GitHub**](https://github.com/Azure/awesome-azd) | Dă stea și explorează sursa |

### Șabloane AI populare din Awesome AZD

Alege un șablon într-un director gol propriu; comenzile de mai jos sunt alternative. Comanda finală `.` inițializează acel director.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Începe în 3 pași

Înainte să începi, asigură-te că mașina ta este pregătită pentru șablonul pe care vrei să îl implementezi:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Dacă oricare verificare necesară eșuează, repară-o mai întâi, apoi continuă cu începutul rapid.

### Pasul 1: Instalează AZD (2 minute)

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

### Pasul 2: Autentifică-te pentru AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Dacă nu ești sigur care îți trebuie, urmează fluxul complet de configurare la [Instalare & Configurare](docs/chapter-01-foundation/installation.md#authentication-setup).

### Pasul 3: Implementează prima ta aplicație

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Gata!** Aplicația ta este acum live pe Azure.

### Curățare (Nu uita!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cum să folosești acest curs

Acest curs este proiectat pentru **învățare progresivă** - începe de unde te simți confortabil și urcă pe măsură ce progresezi:

| Experiența ta | Începe aici |
|-----------------|------------|
| **Începător total în Azure** | [Capitolul 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Cunoști Azure, nou la AZD** | [Capitolul 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Vrei să implementezi aplicații AI** | [Capitolul 2: Dezvoltare AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vrei să exersezi practic** | [🎓 Atelier Interactiv](workshop/README.md) - laborator ghidat 3-4 ore |
| **Ai nevoie de modele de producție** | [Capitolul 8: Producție & Companie](#-chapter-8-production--enterprise-patterns) |

### Configurare rapidă

1. **Fă fork acestui depozit**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonează-l**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Primește ajutor**: [Comunitatea Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Preferi să clonezi local?**

> Acest depozit include traduceri în peste 50 de limbi, ceea ce crește semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Acest lucru îți oferă tot ce ai nevoie pentru a finaliza cursul cu o descărcare mult mai rapidă.


## Prezentare generală a cursului

Stăpânește Azure Developer CLI (azd) prin capitole structurate, concepute pentru învățare progresivă. **Accent special pe implementarea aplicațiilor AI cu integrarea Microsoft Foundry.**

### De ce este acest curs esențial pentru dezvoltatorii moderni

Dezvoltatorii care implementează sarcini AI au de regulă nevoie de îndrumare în:
- Arhitecturi AI complexe cu servicii multiple
- Cele mai bune practici pentru implementarea AI în producție  
- Integrarea și configurarea serviciilor Azure AI
- Optimizarea costurilor pentru sarcini AI
- Depanarea problemelor specifice implementărilor AI

### Obiectivele de învățare

Prin finalizarea acestui curs structurat, vei:
- **Stăpâni Bazele AZD**: Concepute fundamentale, instalare și configurare
- **Implementa Aplicații AI**: Folosește AZD cu serviciile Microsoft Foundry
- **Implementa Infrastructură ca și Cod**: Gestionează resurse Azure cu șabloane Bicep
- **Depanare Implementări**: Rezolvă probleme comune și debug
- **Optimizează pentru Producție**: Securitate, scalare, monitorizare și management costuri
- **Construiește Soluții Multi-Agent**: Implementează arhitecturi AI complexe

## Înainte să începi: Conturi, Acces și Presupuneri

Înainte de a începe Capitolul 1, asigură-te că ai următoarele pregătite. Pașii de instalare din acest ghid presupun că aceste elemente de bază sunt deja rezolvate.

- **Un abonament Azure**: Poți folosi un abonament existent de la serviciu sau propriul cont, sau poți crea un [trial gratuit](https://aka.ms/azurefreetrial) pentru a începe.
- **Permisiuni pentru crearea resurselor Azure**: Pentru majoritatea exercițiilor, ar trebui să ai cel puțin acces **Contributor** pe abonamentul sau grupul țintă de resurse. Unele capitole pot presupune că poți crea grupuri de resurse, identități gestionate și atribuiri RBAC.
- [**Un cont GitHub**](https://github.com): Este util pentru a crea fork-uri ale depozitului, urmărirea propriilor modificări și folosirea GitHub Codespaces pentru atelier.
- **Prerechizite pentru rularea șabloanelor**: Unele șabloane necesită instrumente locale precum Node.js, Python, Java sau Docker. Rulează validatorul de configurare înainte de a începe pentru a identifica din timp instrumentele lipsă.
- **Familiaritate de bază cu terminalul**: Nu trebuie să fii expert, însă ar trebui să te simți confortabil să rulezi comenzi precum `git clone`, `azd auth login` și `azd up`.

> **Lucrezi într-un abonament enterprise?**
> Dacă mediul tău Azure este administrat de un administrator, confirmă din timp că poți implementa resurse în abonamentul sau grupul țintă. Dacă nu, cere un abonament-sandbox sau acces Contributor înainte de a începe.

> **Ești nou pe Azure?**
> Începe cu propriul trial Azure sau abonament pay-as-you-go la https://aka.ms/azurefreetrial pentru a putea parcurge exercițiile complet fără să aștepți aprobări la nivel de tenant.

## 🗺️ Harta Cursului: Navigare Rapidă pe Capitole

Fiecare capitol are un README dedicat cu obiective de învățare, start rapid și exerciții:

| Capitol | Subiect | Lecții | Durată | Complexitate |
|---------|---------|---------|----------|------------|
| **[Cap 1: Fundament](docs/chapter-01-foundation/README.md)** | Început Rapid | [Bazele AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalare](docs/chapter-01-foundation/installation.md) &#124; [Primul Proiect](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Dezvoltare AI](docs/chapter-02-ai-development/README.md)** | Aplicații AI-First | [Integrare Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenți AI](docs/chapter-02-ai-development/agents.md) &#124; [Implementare Model](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atelier](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ore | ⭐⭐ |
| **[Cap 3: Configurare](docs/chapter-03-configuration/README.md)** | Autentificare & Securitate | [Configurare](docs/chapter-03-configuration/configuration.md) &#124; [Autentificare & Securitate](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infrastructură](docs/chapter-04-infrastructure/README.md)** | IaC & Implementare | [Ghid Implementare](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionare](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ore | ⭐⭐⭐ |
| **[Cap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Soluții Agenți AI | [Scenariu Retail](examples/retail-scenario.md) &#124; [Modele de Coordonare](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[Cap 6: Pre-Implementare](docs/chapter-06-pre-deployment/README.md)** | Planificare & Validare | [Verificări Preliminare](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planificare Capacitate](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selecția SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 oră | ⭐⭐ |
| **[Cap 7: Depanare](docs/chapter-07-troubleshooting/README.md)** | Debug & Remediere | [Probleme Comune](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depanare](docs/chapter-07-troubleshooting/debugging.md) &#124; [Probleme AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ore | ⭐⭐ |
| **[Cap 8: Producție](docs/chapter-08-production/README.md)** | Modele Enterprise | [Practicile de Producție](docs/chapter-08-production/production-ai-practices.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[🎓 Atelier](workshop/README.md)** | Laborator Practic | [Introducere](workshop/docs/instructions/0-Introduction.md) &#124; [Selecție](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validare](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dezasamblare](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontare](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Încheiere](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ore | ⭐⭐ |

**Durata Totală a Cursului:** ~10-14 ore | **Nivel de Competență:** Începător → Gata pentru Producție

---

## 📚 Capitole de Învățare

*Selectează-ți traseul de învățare în funcție de nivelul de experiență și obiective*

### 🚀 Capitolul 1: Fundament & Început Rapid
**Prerechizite**: Abonament Azure, cunoștințe de bază linie de comandă  
**Durată**: 30-45 minute  
**Complexitate**: ⭐

#### Ce Vei Învăța
- Înțelegerea fundamentelor Azure Developer CLI
- Instalarea AZD pe platforma ta
- Prima ta implementare de succes

#### Resurse de Învățare
- **🎯 Pornește de aici**: [Ce este Azure Developer CLI?](#-what-is-azure-developer-cli-azd)
- **📖 Teorie**: [Bazele AZD](docs/chapter-01-foundation/azd-basics.md) - Concepte cheie și terminologie
- **⚙️ Configurare**: [Instalare & Configurare](docs/chapter-01-foundation/installation.md) - Ghiduri specifice platformei
- **🛠️ Practic**: [Primul tău Proiect](docs/chapter-01-foundation/first-project.md) - Tutorial pas cu pas
- **📋 Referință Rapidă**: [Fișă de Comenzi](resources/cheat-sheet.md)

#### Exerciții Practice
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Rezultat Capitol**: Implementează cu succes o aplicație web simplă pe Azure cu AZD

**✅ Verificare Succes:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Durată estimată:** 30-45 minute  
**📈 Nivel de competență după:** Poate implementa aplicații de bază independent

---

### 🤖 Capitolul 2: Dezvoltare AI-First (Recomandat pentru Dezvoltatori AI)
**Prerechizite**: Capitolul 1 finalizat  
**Durată**: 1-2 ore  
**Complexitate**: ⭐⭐

#### Ce Vei Învăța
- Integrarea Microsoft Foundry cu AZD
- Implementarea aplicațiilor AI-powered
- Înțelegerea configurărilor serviciilor AI

#### Resurse de Învățare
- **🎯 Pornește de aici**: [Integrare Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenți AI**: [Ghid Agenți AI](docs/chapter-02-ai-development/agents.md) - Implementează agenți inteligenți cu AZD
- **📖 Modele**: [Implementare Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementare și gestionare modele AI
- **🛠️ Atelier**: [Laborator AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pregătește soluțiile AI pentru AZD
- **🎥 Ghid Interactiv**: [Materiale Atelier](workshop/README.md) - Învățare în browser cu MkDocs * Mediu DevContainer
- **📋 Șabloane**: [Șabloane Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Exemple**: [Exemple Implementare AZD](examples/README.md)

#### Exerciții Practice
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Rezultat Capitol**: Implementarea și configurarea unei aplicații chat AI cu capabilități RAG

**✅ Verificare Succes:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo .
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Durată estimată:** 1-2 ore  
**📈 Nivel de competență după:** Poate implementa aplicații AI de învățare și identifica cerințe suplimentare pentru producție
**💰 Conștientizare Costuri:** Înțelege costuri de dezvoltare $80-150/lună, costuri producție $300-3500/lună

#### 💰 Considerații privind Costurile pentru Implementările AI

**Mediu de Dezvoltare (estimativ $80-150/lună):**
- Modele Microsoft Foundry (plata pe consum): $0-50/lună (în funcție de utilizarea token-urilor)
- AI Search (nivel de bază): $75/lună
- Container Apps (consum): $0-20/lună
- Storage (standard): $1-5/lună

**Mediu de Producție (estimativ $300-3,500+/lună):**
- Modele Microsoft Foundry (PTU pentru performanță constantă): $3,000+/lună SAU plata pe consum la volum mare
- AI Search (nivel standard): $250/lună
- Container Apps (dedicate): $50-100/lună
- Application Insights: $5-50/lună
- Storage (premium): $10-50/lună

**💡 Sfaturi pentru Optimizarea Costurilor:**
- Verifică prețurile pentru inferența modelelor și creditele specifice contului; Azure OpenAI nu include o alocație gratuită universală de 50,000 token-uri lunar
- Rulează `azd down` pentru a șterge resurse când nu mai sunt necesare, după revizuirea mediului selectat
- Începe cu facturare pe consum, treci la PTU doar pentru producție
- Folosește `azd provision --preview` pentru a inspecta infrastructura planificată, apoi estimează prețurile resurselor cu Azure Pricing Calculator
- Activează auto-scalare: plătești doar pentru utilizarea efectivă

**Monitorizare Costuri:**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capitolul 3: Configurare & Autentificare
**Prerechizite**: Capitolul 1 finalizat  
**Durată**: 45-60 minute  
**Complexitate**: ⭐⭐

#### Ce Vei Învăța
- Configurarea și gestionarea mediului
- Cele mai bune practici pentru autentificare și securitate
- Denumirea și organizarea resurselor

#### Resurse de Învățare
- **📖 Configurare**: [Ghid Configurare](docs/chapter-03-configuration/configuration.md) - Setarea mediului
- **🔐 Securitate**: [Modele de Autentificare și Identitate Gestionată](docs/chapter-03-configuration/authsecurity.md) - Modele autentificare
- **📝 Exemple**: [Exemplu Aplicație Bază de Date](examples/database-app/README.md) - Exemple AZD baze de date

#### Exerciții Practice
- Configurează mai multe medii (dev, staging, prod)
- Configurează autentificarea cu identitate gestionată
- Implementează configurări specifice mediului

**💡 Rezultat Capitol**: Gestionează multiple medii cu autentificare și securitate adecvată

---

### 🏗️ Capitolul 4: Infrastructură ca și Cod & Implementare
**Prerechizite**: Capitolele 1-3 finalizate  
**Durată**: 1-1.5 ore  
**Complexitate**: ⭐⭐⭐

#### Ce Vei Învăța
- Modele avansate de implementare
- Infrastructură ca Cod cu Bicep
- Strategii de provisionare a resurselor

#### Resurse de Învățare
- **📖 Implementare**: [Ghid Implementare](docs/chapter-04-infrastructure/deployment-guide.md) - Fluxuri complete de lucru
- **🏗️ Provisionare**: [Provisionare Resurse](docs/chapter-04-infrastructure/provisioning.md) - Gestionare resurse Azure
- **📝 Exemple**: [Exemplu Container App](../../examples/container-app) - Implementări containerizate

#### Exerciții Practice
- Creează șabloane Bicep personalizate
- Implementează aplicații cu servicii multiple
- Implementează strategii blue-green de lansare

**💡 Rezultat Capitol**: Implementează aplicații complexe multi-serviciu folosind șabloane infrastructură personalizate

---

### 🎯 Capitolul 5: Soluții AI Multi-Agent (Avansat)
**Prerechizite**: Capitolele 1-2 finalizate  
**Durată**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce Vei Învăța
- Modele arhitecturale multi-agent
- Orchestrarea și coordonarea agenților
- Implementări AI gata pentru producție

#### Resurse de Învățare
- **🤖 Design Recomandat**: [Soluție Multi-Agent Retail](examples/retail-scenario.md) - Plan arhitectură, nu o aplicație completă
- **🛠️ Șabloane ARM**: [Pachet șabloane ARM](../../examples/retail-multiagent-arm-template) - Schelet de infrastructură; revizuiește prerechizitele și componentele lipsă ale aplicației  
- **📖 Arhitectură**: [Tipare de coordonare multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Tipare  

#### Exerciții practice  
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Rezultatul capitolului**: Înțelege designul multi-agent și identifică implementarea, validarea și munca operațională necesară dincolo de un schelet de infrastructură  

---

### 🔍 Capitolul 6: Validarea pre-implementare și planificare  
**Prerechizite**: Capitolul 4 finalizat  
**Durata**: 1 oră  
**Complexitate**: ⭐⭐  

#### Ce vei învăța  
- Planificarea capacității și validarea resurselor  
- Strategii de selecție SKU  
- Verificări prealabile și automatizare  

#### Resurse de învățare  
- **📊 Planificare**: [Planificarea capacității](docs/chapter-06-pre-deployment/capacity-planning.md) - Validarea resurselor  
- **💰 Selecție**: [Selecția SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Alegeri eficiente din punct de vedere al costurilor  
- **✅ Validare**: [Verificări prealabile](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripturi automate  

#### Exerciții practice  
- Rulează scripturi de validare a capacității  
- Optimizează selecția SKU pentru cost  
- Implementează verificări automate pre-implementare  

**💡 Rezultatul capitolului**: Validează și optimizează implementările înainte de execuție  

---

### 🚨 Capitolul 7: Depanare și depanare  
**Prerechizite**: Orice capitol de implementare finalizat  
**Durata**: 1-1.5 ore  
**Complexitate**: ⭐⭐  

#### Ce vei învăța  
- Abordări sistematice de depanare  
- Probleme comune și soluții  
- Depanare specifică AI  

#### Resurse de învățare  
- **🔧 Probleme comune**: [Probleme comune](docs/chapter-07-troubleshooting/common-issues.md) - Întrebări frecvente și soluții  
- **🕵️ Depanare**: [Ghid de depanare](docs/chapter-07-troubleshooting/debugging.md) - Strategii pas cu pas  
- **🤖 Probleme AI**: [Depanare specifică AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Probleme cu serviciile AI  

#### Exerciții practice  
- Diagnostichează eșecurile de implementare  
- Rezolvă probleme de autentificare  
- Depanează conectivitatea serviciului AI  

**💡 Rezultatul capitolului**: Diagnostică și rezolvă independent probleme comune de implementare  

---

### 🏢 Capitolul 8: Tipare pentru producție și întreprinderi  
**Prerechizite**: Capitolele 1-4 finalizate  
**Durata**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐  

#### Ce vei învăța  
- Strategii de implementare în producție  
- Tipare de securitate pentru întreprinderi  
- Monitorizare și optimizare a costurilor  

#### Resurse de învățare  
- **🏭 Producție**: [Cele mai bune practici AI pentru producție](docs/chapter-08-production/production-ai-practices.md) - Tipare pentru întreprinderi  
- **📝 Exemple**: [Exemplu microservicii](../../examples/microservices) - Arhitecturi complexe  
- **📊 Monitorizare**: [Integrare Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorizare  

#### Exerciții practice  
- Implementează tipare de securitate pentru întreprinderi  
- Configurează monitorizarea completă  
- Fă implementarea în producție cu guvernanță adecvată  

**💡 Rezultatul capitolului**: Implementează aplicații gata pentru întreprinderi cu capabilități complete de producție  

---

## 🎓 Prezentarea atelierului: Experiență practică de învățare  

> **⚠️ STAȚIUNE ATELIER: Dezvoltare activă**  
> Materialele atelierului sunt în curs de dezvoltare și perfecționare. Modulele de bază sunt funcționale, dar unele secțiuni avansate sunt incomplete. Lucrăm activ pentru completarea întregului conținut. [Urmărește progresul →](workshop/README.md)  

### Materiale interactive pentru atelier  
**Învățare practică cu instrumente în browser și exerciții ghidate**  

Materialele noastre oferă o experiență de învățare structurată și interactivă care completează curriculumul bazat pe capitole de mai sus. Atelierul este conceput atât pentru învățare autogestionată, cât și pentru sesiuni conduse de instructor.  

#### 🛠️ Caracteristici ale atelierului  
- **Interfață în browser**: Atelier complet alimentat de MkDocs cu funcții de căutare, copiere și temă  
- **Integrare GitHub Codespaces**: Configurare mediu de dezvoltare cu un singur clic  
- **Cale de învățare structurată**: Exerciții ghidate în 8 module (3-4 ore în total)  
- **Metodologie progresivă**: Introducere → Selecție → Validare → Deconstruire → Configurare → Personalizare → Curățare → Încheiere  
- **Mediu DevContainer interactiv**: Instrumente și dependențe preconfigurate  

#### 📚 Structura modulelor atelierului  
Atelierul urmează o **metodologie progresivă în 8 module** care te duce de la descoperire la stăpânirea implementării:  

| Modul | Subiect | Ce vei face | Durata |  
|--------|-------|----------------|----------|  
| **0. Introducere** | Prezentarea atelierului | Înțelege obiectivele, prerechizitele și structura atelierului | 15 min |  
| **1. Selecție** | Descoperirea șabloanelor | Explorează șabloanele AZD și selectează șablonul AI potrivit pentru scenariul tău | 20 min |  
| **2. Validare** | Implementare și verificare | Implementează șablonul cu `azd up` și validează funcționalitatea infrastructurii | 30 min |  
| **3. Deconstruire** | Înțelege structura | Folosește GitHub Copilot pentru a explora arhitectura șablonului, fișierele Bicep și organizarea codului | 30 min |  
| **4. Configurare** | Explorare aprofundată azure.yaml | Stăpânește configurarea `azure.yaml`, ciclul de viață și variabilele de mediu | 30 min |  
| **5. Personalizare** | Fă-l al tău | Activează AI Search, trasabilitate, evaluare și personalizează pentru scenariul tău | 45 min |  
| **6. Curățare** | Curăță mediul | Dezactivează și dezalocă în siguranță resursele cu `azd down --purge` | 15 min |  
| **7. Încheiere** | Pași următori | Recapitulează realizările, conceptele cheie și continuă parcursul de învățare | 15 min |  

**Fluxul atelierului:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 Începe atelierul  
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```
  
#### 🎯 Rezultatele învățării în atelier  
Prin finalizarea atelierului, participanții vor:  
- **Implementa aplicații AI în producție**: Folosește AZD cu serviciile Microsoft Foundry  
- **Stăpâni arhitecturi multi-agent**: Implementează soluții AI coordonate cu agenți  
- **Aplică cele mai bune practici de securitate**: Configurează autentificarea și controlul accesului  
- **Optimizează pentru scalabilitate**: Proiectează implementări eficiente din punct de vedere al costului și performanței  
- **Depanează implementările**: Rezolvă independent problemele comune  

#### 📖 Resurse pentru atelier  
- **🎥 Ghid interactiv**: [Materiale Atelier](workshop/README.md) - Mediu de învățare în browser  
- **📋 Instrucțiuni modul cu modul**:  
  - [0. Introducere](workshop/docs/instructions/0-Introduction.md) - Prezentare și obiective atelier  
  - [1. Selecție](workshop/docs/instructions/1-Select-AI-Template.md) - Găsește și selectează șabloanele AI  
  - [2. Validare](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementează și verifică șabloanele  
  - [3. Deconstruire](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorează arhitectura șablonului  
  - [4. Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) - Stăpânește azure.yaml  
  - [5. Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizează pentru scenariul tău  
  - [6. Curățare](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Curăță resursele  
  - [7. Încheiere](workshop/docs/instructions/7-Wrap-up.md) - Recapitulare și pași următori  
- **🛠️ Laborator Atelier AI**: [Laborator Atelier AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exerciții axate pe AI  
- **💡 Pornire rapidă**: [Ghid configurare atelier](workshop/README.md#browser-based-guide) - Configurarea mediului  

**Perfect pentru**: training corporativ, cursuri universitare, învățare independentă și bootcampuri pentru dezvoltatori.  

---

## 📖 Explorare aprofundată: Capabilitățile AZD  

Dincolo de elementele de bază, AZD oferă funcționalități puternice pentru implementări în producție:  

- **Implementări bazate pe șabloane** - Folosește șabloane pre-construite pentru tipare comune de aplicații  
- **Infrastructură ca și cod** - Gestionează resurse Azure cu Bicep sau Terraform  
- **Fluxuri de lucru integrate** - Provozi, implementezi și monitorizezi aplicațiile fără întreruperi  
- **Prietenos cu dezvoltatorii** - Optimizat pentru productivitatea și experiența dezvoltatorului  

### **AZD + Microsoft Foundry: Perfect pentru implementări AI**  

**De ce AZD pentru soluții AI?** AZD abordează principalele provocări cu care se confruntă dezvoltatorii AI:  

- **Șabloane pregătite pentru AI** - Șabloane pre-configurate pentru modelele Microsoft Foundry, serviciile Azure AI și sarcini ML  
- **Implementări AI securizate** - Tipare de securitate integrate pentru servicii AI, chei API și puncte finale de model  
- **Tipare AI pentru producție** - Cele mai bune practici pentru implementări AI scalabile și eficiente din punct de vedere al costului  
- **Fluxuri AI end-to-end** - De la dezvoltarea modelului până la implementarea în producție cu monitorizare adecvată  
- **Optimizare a costurilor** - Alocare inteligentă a resurselor și strategii de scalare pentru sarcini AI  
- **Integrare Microsoft Foundry** - Conexiune fără întreruperi la catalogul de modele și puncte finale Microsoft Foundry  

---

## 🎯 Biblioteca de șabloane și exemple  

### Recomandate: Șabloane Microsoft Foundry  
**Începe aici dacă implementezi aplicații AI!**  

> **Notă:** Aceste șabloane demonstrează diferite tipare AI. Unele sunt exemple externe Azure, altele implementări locale.  

| Șablon | Capitol | Complexitate | Servicii | Tip |  
|----------|---------|------------|----------|------|  
| [**Începe cu chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |  
| [**Începe cu agenți AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolul 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Extern |  
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolul 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (implicit) + Storage | Extern |  
| [**Start rapid OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolul 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolul 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolul 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |  
| [**Soluție multi-agent Retail**](examples/retail-scenario.md) | Capitolul 5 | ⭐⭐⭐⭐ | Arhitectură propusă și schelet de infrastructură; este necesară implementarea aplicației | **Plan local** |  

### Recomandate: Scenarii complete de învățare  
**Șabloane de aplicații gata pentru producție mapate capitolelor de învățare**  

| Șablon | Capitol de învățare | Complexitate | Învățare cheie |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolul 2 | ⭐ | Tipare de bază de implementare AI |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolul 2 | ⭐⭐ | Implementare RAG cu Azure AI Search |  
| [**get-started-with-ai-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolul 2 | ⭐⭐ | Chat susținut de agenți și teste de evaluare specifice |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolul 5 | ⭐⭐⭐ | Cadru agent și apelare funcții |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolul 8 | ⭐⭐⭐ | Orchestrare AI enterprise |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolul 5 | ⭐⭐⭐⭐ | Arhitectură multi-agent cu agenți pentru client și inventar |  

### Învățare prin tipul exemplului  

> **📌 Exemple locale vs. externe:**  
> **Exemple locale** (în acest repo) = Consultă README-ul exemplului pentru statusul implementării și prerechizite  
> **Exemple externe** (Azure Samples) = Clonează din depozitele linkate  

#### Exemple locale (gata de utilizare)  
- [**Soluția multi-agent pentru retail**](examples/retail-scenario.md) - Plan arhitectură cu schelet ARM pentru infrastructură  
  - Roluri propuse pentru agenți Clienți și Inventar  
  - Trebuie implementat și verificat codul aplicației, monitorizare și evaluare  
  - Simplă alocare a resurselor nu creează o aplicație retail funcțională  

#### Exemple locale - Aplicații containerizate (Capitolele 2-5)  
**Exemple cuprinzătoare de implementare a containerelor în acest depozit:**  
- [**Exemple aplicații container**](examples/container-app/README.md) - Ghid complet pentru implementări containerizate  
  - [API simplu Flask](../../examples/container-app/simple-flask-api) - API REST de bază cu scalare la zero  
  - [Arhitectură microservicii](../../examples/container-app/microservices) - Eșantion de învățare cu două servicii; întărirea pentru producție este muncă suplimentară  
  - Tipare rapide de start, producție și avansate de implementare  
  - Îndrumări de monitorizare, securitate și optimizare costuri  

#### Exemple externe - Aplicații simple (Capitolele 1-2)  
**Clonează aceste depozite Azure Samples pentru a începe:**  
- [Aplicație web simplă - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Tipare de bază pentru implementare  
- [Website static - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementare conținut static  
- [Aplicație container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementare API REST  

#### Exemple externe - Integrare baze de date (Capitolul 3-4)  
- [Aplicație Bază de Date - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Modele de conectivitate la baza de date
- [Funcții + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flux de lucru a datelor fără server

#### Exemple Externe - Modele Avansate (Capitole 4-8)
- [Microservicii Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitecturi multi-servicii
- [Joburi Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Procesare în fundal  
- [Pipelină ML Enterprise](https://github.com/Azure/mlops-v2) - Modele de referință MLOps; nu este un șablon AZD gata de utilizare

### Colecții de Șabloane Externe
- [**Galeria Oficială de Șabloane AZD**](https://azure.github.io/awesome-azd/) - Colecție selectată de șabloane oficiale și comunitare
- [**Șabloane Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentație pentru șabloanele Microsoft Learn
- [**Directorul Exemplelor**](examples/README.md) - Exemple locale de învățare cu explicații detaliate

---

## 📚 Resurse de Învățare & Referințe

### Referințe Rapide
- [**Fișă de Comenzi**](resources/cheat-sheet.md) - Comenzi azd esențiale organizate după capitol
- [**Glosar**](resources/glossary.md) - Terminologie Azure și azd  
- [**Întrebări frecvente**](resources/faq.md) - Întrebări comune organizate pe capitole de învățare
- [**Ghid de studiu**](resources/study-guide.md) - Exerciții practice cuprinzătoare

### Ateliere practice
- [**Laborator AI Workshop**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fă-ți soluțiile AI deployabile cu AZD (2-3 ore)
- [**Atelier interactiv**](workshop/README.md) - Exerciții ghidate în 8 module cu MkDocs și GitHub Codespaces
  - Urmărește: Introducere → Selecție → Validare → Deconstrucție → Configurare → Personalizare → Închidere → Recapitulare

### Resurse externe de învățare
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrul de arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculatoare Azure Pricing](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### Competențe AI Agent pentru editorul tău
- [**Competențele Microsoft Azure pe skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 de competențe agent open pentru Azure AI, Foundry, deployment, diagnosticare, optimizarea costurilor și altele. Instalează-le în GitHub Copilot, Cursor, Claude Code sau orice agent suportat:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Ghid rapid de depanare

**Probleme comune întâmpinate de începători și soluții imediate:**

<details>
<summary><strong>❌ "azd: comandă negăsită"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Nu s-a găsit niciun abonament" sau "Abonamentul nu este setat"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" sau "Cota depășită"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" eșuează la jumătatea procesului</strong></summary>

```bash
# Option 1: Inspect the error and retry after correcting its cause
azd show
azd up --debug

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentificarea a eșuat" sau "Token expirat"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Resursa există deja" sau conflicte de denumire</strong></summary>

```bash
# Inspect the conflicting resource before changing or deleting anything.
# For an isolated new deployment, create a separate environment:
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implementarea șablonului durează prea mult</strong></summary>

**Timpuri normale de așteptare:**
- Aplicație web simplă: 5-10 minute
- Aplicație cu bază de date: 10-15 minute
- Aplicații AI: 15-25 minute (provisionarea OpenAI este lentă)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Permisiune refuzată" sau "Interzis"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Nu se găsește URL-ul aplicației implementate</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Resurse complete de depanare

- **Ghid probleme comune:** [Soluții detaliate](docs/chapter-07-troubleshooting/common-issues.md)
- **Probleme specifice AI:** [Depanare AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Ghid de depanare:** [Depanare pas cu pas](docs/chapter-07-troubleshooting/debugging.md)
- **Obține ajutor:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Finalizarea cursului și certificarea

### Urmărirea progresului
Monitorizează progresul învățării pe fiecare capitol:

- [ ] **Capitolul 1**: Fundamente & Start rapid ✅
- [ ] **Capitolul 2**: Dezvoltare AI-First ✅  
- [ ] **Capitolul 3**: Configurare & Autentificare ✅
- [ ] **Capitolul 4**: Infrastructură ca Cod & Implementare ✅
- [ ] **Capitolul 5**: Soluții AI Multi-Agent ✅
- [ ] **Capitolul 6**: Validare & Planificare Pre-Implementare ✅
- [ ] **Capitolul 7**: Depanare & Debugging ✅
- [ ] **Capitolul 8**: Modele Production & Enterprise ✅

### Verificarea învățării
După finalizarea fiecărui capitol, verifică-ți cunoștințele prin:
1. **Exercițiu practic**: Completează implementarea practică din capitol
2. **Verificarea cunoștințelor**: Consultă secțiunea de Întrebări frecvente pentru capitolul tău
3. **Discuții în comunitate**: Împărtășește experiența ta în Azure Discord
4. **Capitolul următor**: Treci la următorul nivel de complexitate

### Beneficiile finalizării cursului
După ce finalizezi toate capitolele, vei avea:
- **Experiență în producție**: Aplicații AI implementate real în Azure
- **Competențe profesionale**: Capacități de implementare pentru mediul enterprise  
- **Recunoaștere în comunitate**: Membru activ al comunității dezvoltatorilor Azure
- **Avansare în carieră**: Expertiză cerută în AZD și implementare AI

---

## 🤝 Comunitate & Suport

### Obține ajutor & suport
- **Probleme tehnice**: [Raportează bug-uri și cere funcționalități](https://github.com/microsoft/azd-for-beginners/issues)
- **Întrebări de învățare**: [Comunitatea Microsoft Azure Discord](https://discord.gg/microsoft-azure) și [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajutor specific AI**: Alătură-te [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentație**: [Documentația oficială Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Perspective din comunitate pe Microsoft Foundry Discord

**Subiecte discutate de comunitate:**
- Implementări multi-serviciu, managementul credențialelor și pregătirea pentru producție
- Șabloane specifice AI, ghiduri de depanare și cele mai bune practici

**Alătură-te comunității pentru a:**
- Împărtăși experiențele AZD + AI și a primi ajutor
- Accesa previzualizări timpurii ale noilor șabloane AI
- Contribui la cele mai bune practici de implementare AI
- Influența dezvoltarea viitoare a functionalităților AI + AZD

### Contribuția la curs
Suntem deschiși contribuțiilor! Te rugăm să citești [Ghidul de contribuție](CONTRIBUTING.md) pentru detalii despre:
- **Îmbunătățiri de conținut**: Perfecționează capitole și exemple existente
- **Exemple noi**: Adaugă scenarii reale și șabloane  
- **Traduceri**: Ajută la menținerea suportului multi-limbă
- **Raportări bug-uri**: Îmbunătățește acuratețea și claritatea
- **Standardele comunității**: Urmează ghidurile noastre de incluziune

---

## 📄 Informații despre curs

### Licență
Acest proiect este licențiat sub Licența MIT - vezi fișierul [LICENSE](../../LICENSE) pentru detalii.

### Resurse Microsoft Learning asociate

Echipa noastră produce și alte cursuri cuprinzătoare de învățare:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pentru începători](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pentru începători](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain pentru începători](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenți
[![AZD pentru începători](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI pentru începători](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pentru începători](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agenți AI pentru începători](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria Generative AI
[![Generative AI pentru începători](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Învățare de bază
[![ML pentru începători](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science pentru începători](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pentru începători](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Securitate cibernetică pentru începători](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Dezvoltare web pentru începători](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pentru începători](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Dezvoltare XR pentru începători](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria Copilot
[![Copilot pentru programare AI în echipă](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pentru C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigarea prin curs

**🚀 Pregătit să începi să înveți?**

**Începători**: Începe cu [Capitolul 1: Fundamente și start rapid](#-chapter-1-foundation--quick-start)  
**Dezvoltatori AI**: Trece direct la [Capitolul 2: Dezvoltare AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Dezvoltatori experimentați**: Începe cu [Capitolul 3: Configurare și autentificare](#️-chapter-3-configuration--authentication)

**Pașii următori**: [Începe Capitolul 1 - Bazele AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->