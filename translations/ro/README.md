# AZD Pentru Începători: O Călătorie Structurată de Învățare

![AZD-for-beginners](../../translated_images/ro/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduceri Automate (Întotdeauna Actualizate)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](./README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Preferi să Clonezi Local?**
>
> Acest depozit include peste 50 de traduceri de limbi, ceea ce crește semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
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

## 🆕 Noutăți în azd Astăzi

> 📌 Acest curs este validat pentru **`azd 1.25.6`** (iunie 2026). Rulează `azd version` pentru a verifica versiunea ta, și `azd upgrade` pentru a obține cea mai recentă actualizare.

Azure Developer CLI a depășit aplicațiile web și API-urile tradiționale. Astăzi, azd este unicul instrument pentru implementarea **oricărei** aplicații pe Azure — inclusiv aplicații alimentate de AI și agenți inteligenți.

Ce înseamnă asta pentru tine:

- **Agenții AI sunt acum sarcini azd de primă clasă.** Poți inițializa, implementa și gestiona proiecte de agenți AI folosind același flux de lucru `azd init` → `azd up` pe care îl cunoști deja.
- **Un ciclu complet de viață al agentului din CLI.** Extensia `azure.ai.agents` acoperă acum întregul parcurs — `azd ai agent init` pentru a genera scheletul, `azd ai agent invoke` pentru a testa (cu afișarea timpului de răspuns), `azd ai agent eval generate` și `azd ai agent optimize` pentru a măsura și îmbunătăți calitatea, și `azd ai agent delete` pentru curățare.
- **Mai multe blocuri de construcție AI.** Noile extensii în previzualizare — `azure.ai.skills` și `azure.ai.connections` — îți permit să gestionezi direct cu azd abilități reutilizabile pentru agenți și conexiuni Foundry.
- **Integrare Microsoft Foundry** aduce implementarea modelelor, găzduirea agenților și configurarea serviciilor AI direct în ecosistemul de template-uri azd.
- **Funcții de bază mai fluide.** Versiunile recente au făcut `azd init` idempotent (sigur de rulat din nou), `azd auth login` șterge automat tokenuri vechi, și a adăugat un prompt de configurare prietenos la prima rulare `azd tool`.
- **Fluxul principal nu s-a schimbat.** Indiferent dacă implementezi o aplicație todo, un microserviciu sau o soluție AI cu agenți multipli, comenzile sunt aceleași.

> **Notă pentru utilizatorii Aspire:** Microsoft se referă acum la produs simplu ca **Aspire** (fost ".NET Aspire"). Suportul azd pentru Aspire rămâne neschimbat — doar numele a fost actualizat.

Dacă ai folosit azd înainte, suportul AI este o extensie naturală — nu un instrument separat sau o cale avansată. Dacă ești începător, vei învăța un singur flux de lucru care funcționează pentru toate.

---

## 🚀 Ce este Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** este un instrument prietenos pentru dezvoltatori, din linia de comandă, care simplifică implementarea aplicațiilor pe Azure. În loc să creezi și să conectezi manual zeci de resurse Azure, poți implementa aplicații complete cu o singură comandă.

### Magia lui `azd up`

```bash
# Această singură comandă face totul:
# ✅ Creează toate resursele Azure
# ✅ Configurează rețeaua și securitatea
# ✅ Construiește codul aplicației tale
# ✅ Publică în Azure
# ✅ Îți oferă o adresă URL funcțională
azd up
```

**Asta este!** Niciun click în Azure Portal, niciun sablon ARM complex de învățat, nicio configurare manuală — doar aplicații funcționale pe Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Care este Diferența?

Aceasta este întrebarea cea mai frecventă a începătorilor. Iată răspunsul simplu:

| Caracteristică | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Scop** | Gestionarea resurselor individuale Azure | Implementarea aplicațiilor complete |
| **Mentalitate** | Orientat pe infrastructură | Orientat pe aplicație |
| **Exemplu** | `az webapp create --name myapp...` | `azd up` |
| **Curba de învățare** | Trebuie să cunoști serviciile Azure | Trebuie să-ți cunoști aplicația |
| **Cine îl folosește** | DevOps, Infrastructură | Dezvoltatori, Prototipare |

### O Analogii Simplă

- **Azure CLI** este ca și cum ai avea toate uneltele pentru a construi o casă - ciocane, fierăstraie, cuie. Poți construi orice, dar trebuie să cunoști construcții.
- **Azure Developer CLI** este ca și cum ai angaja un antreprenor - descrii ce vrei și el se ocupă de construcție.

### Când Să Folosești Fiecare

| Scenariu | Folosește Aceasta |
|----------|----------|
| "Vreau să implementez rapid aplicația mea web" | `azd up` |
| "Trebuie să creez doar un cont de stocare" | `az storage account create` |
| "Construiesc o aplicație completă AI" | `azd init --template azure-search-openai-demo` |
| "Trebuie să depaneze o resursă Azure specifică" | `az resource show` |
| "Vreau implementare gata pentru producție în câteva minute" | `azd up --environment production` |

### Ele Lucrează Împreună!

AZD folosește Azure CLI în fundal. Poți folosi ambele:
```bash
# Desfășurați aplicația cu AZD
azd up

# Apoi ajustați fin resursele specifice cu Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Găsește Template-uri în Awesome AZD

Nu începe de la zero! **Awesome AZD** este colecția comunității cu template-uri gata de implementare:

| Resursă | Descriere |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Răsfoiește 200+ template-uri cu implementare dintr-un click |
| 🔗 [**Trimite un Template**](https://github.com/Azure/awesome-azd/issues) | Contribuie cu propriul tău template comunității |
| 🔗 [**Depozitul GitHub**](https://github.com/Azure/awesome-azd) | Apasă star și explorează sursa |

### Template-uri AI Populare din Awesome AZD

```bash
# Chat RAG cu modelele Microsoft Foundry + Căutare AI
azd init --template azure-search-openai-demo

# Aplicație rapidă de chat AI
azd init --template openai-chat-app-quickstart

# Agenți AI cu agenți Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Începe în 3 Pași

Înainte să începi, asigură-te că mașina ta este pregătită pentru template-ul pe care vrei să-l implementezi:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Dacă orice verificare necesară eșuează, repară-o mai întâi, apoi continuă cu începutul rapid.

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
# Opțional dacă intenționați să utilizați comenzile Azure CLI direct în acest curs
az login

# Necesar pentru fluxurile de lucru AZD
azd auth login
```

Dacă nu ești sigur ce ai nevoie, urmează întregul flux de configurare în [Instalare & Configurare](docs/chapter-01-foundation/installation.md#authentication-setup).

### Pasul 3: Implementează Prima Ta Aplicație

```bash
# Inițializează dintr-un șablon
azd init --template todo-nodejs-mongo

# Desfășoară în Azure (creează totul!)
azd up
```

**🎉 Gata!** Aplicația ta este acum live pe Azure.

### Curățare (Nu uita!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cum Să Folosești Acest Curs

Acest curs este proiectat pentru **învățare progresivă** - începe de unde te simți confortabil și urcă treptat:

| Experiența Ta | Începe Aici |
|-----------------|------------|
| **Nou în Azure** | [Capitolul 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Cunoști Azure, nou în AZD** | [Capitolul 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Vrei să implementezi aplicații AI** | [Capitolul 2: Dezvoltare AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vrei practică hands-on** | [🎓 Atelier Interactiv](workshop/README.md) - laborator ghidat 3-4 ore |
| **Ai nevoie de pattern-uri de producție** | [Capitolul 8: Producție & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configurare Rapidă

1. **Fă un Fork la Acest Depozit**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonează-l**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Cere Ajutor**: [Comunitatea Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Preferi să Clonezi Local?**

> Acest depozit include peste 50 de traduceri de limbi, ceea ce crește semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Acest lucru îți oferă tot ce ai nevoie pentru a finaliza cursul cu o descărcare mult mai rapidă.


## Prezentare Generală a Cursului

Stăpânește Azure Developer CLI (azd) prin capitole structurate concepute pentru învățare progresivă. **Focalizare specială pe implementarea aplicațiilor AI cu integrare Microsoft Foundry.**
### De ce este acest curs esențial pentru dezvoltatorii moderni

Bazat pe informațiile comunității Microsoft Foundry Discord, **45% dintre dezvoltatori doresc să folosească AZD pentru sarcini AI** dar întâmpină provocări cu:
- Arhitecturi AI complexe cu mai multe servicii
- Cele mai bune practici pentru implementarea AI în producție  
- Integrarea și configurarea serviciilor Azure AI
- Optimizarea costurilor pentru sarcinile AI
- Depanarea problemelor specifice implementărilor AI

### Obiective de învățare

Prin finalizarea acestui curs structurat, vei:
- **Stăpâni Bazele AZD**: concepte de bază, instalare și configurare
- **Implementa Aplicații AI**: folosi AZD cu serviciile Microsoft Foundry
- **Implementa Infrastructura ca și Cod**: gestiona resurse Azure cu șabloane Bicep
- **Depana Implementările**: rezolva probleme comune și depana erori
- **Optimiza pentru Producție**: securitate, scalare, monitorizare și gestionarea costurilor
- **Construi Soluții Multi-Agent**: implementa arhitecturi AI complexe

## Înainte să începi: Conturi, Acces și Presupuneri

Înainte de a începe Capitolul 1, asigură-te că ai următoarele pregătite. Pașii de instalare din acest ghid presupun că aceste elemente de bază sunt deja gestionate.

- **Un abonament Azure**: Poți folosi un abonament existent de la serviciu sau cont personal, sau să creezi un [trial gratuit](https://aka.ms/azurefreetrial) pentru a începe.
- **Permisiunea de a crea resurse Azure**: Pentru majoritatea exercițiilor, ar trebui să ai cel puțin acces de **Contributor** pe abonamentul sau grupul țintă. Unele capitole pot presupune și că poți crea grupuri de resurse, identități gestionate și atribuiri RBAC.
- [**Un cont GitHub**](https://github.com): Util pentru a face fork la repository, a urmări propriile modificări și pentru a folosi GitHub Codespaces în cadrul workshop-ului.
- **Prerechizite pentru rularea șabloanelor**: Unele șabloane au nevoie de instrumente locale precum Node.js, Python, Java sau Docker. Rulează validatorul de setup înainte de a începe pentru a preveni lipsa uneltelor.
- **Familiaritate de bază cu terminalul**: Nu trebuie să fii expert, dar trebuie să te simți confortabil folosind comenzi precum `git clone`, `azd auth login` și `azd up`.

> **Lucrezi într-un abonament enterprise?**  
> Dacă mediul tău Azure este gestionat de un administrator, confirmă din timp că poți implementa resurse în abonamentul sau grupul de resurse pe care intenționezi să îl folosești. Dacă nu, cere un abonament sandbox sau acces Contributor înainte de a începe.

> **Nou pe Azure?**  
> Începe cu propriul trial Azure sau abonament pay-as-you-go la https://aka.ms/azurefreetrial pentru a putea finaliza exercițiile de la început până la sfârșit fără a aștepta aprobări la nivel de tenant.

## 🗺️ Harta cursului: Navigare rapidă pe capitole

Fiecare capitol are un README dedicat cu obiective de învățare, starturi rapide și exerciții:

| Capitol | Subiect | Lecții | Durată | Complexitate |
|---------|---------|---------|----------|------------|
| **[Cap 1: Fundamental](docs/chapter-01-foundation/README.md)** | Început rapid | [Bazele AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalare](docs/chapter-01-foundation/installation.md) &#124; [Primul proiect](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Dezvoltare AI](docs/chapter-02-ai-development/README.md)** | Aplicații AI-First | [Integrare Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenți AI](docs/chapter-02-ai-development/agents.md) &#124; [Implementare Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ore | ⭐⭐ |
| **[Cap 3: Configurare](docs/chapter-03-configuration/README.md)** | Autentificare & Securitate | [Configurare](docs/chapter-03-configuration/configuration.md) &#124; [Autentificare & Securitate](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infrastructură](docs/chapter-04-infrastructure/README.md)** | IaC & Implementare | [Ghid De Implementare](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionare](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ore | ⭐⭐⭐ |
| **[Cap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Soluții Agenți AI | [Scenariu Retail](examples/retail-scenario.md) &#124; [Modele de coordonare](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[Cap 6: Pre-Implementare](docs/chapter-06-pre-deployment/README.md)** | Planificare & Validare | [Verificări Preliminare](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planificare Capacitate](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selecție SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 oră | ⭐⭐ |
| **[Cap 7: Depanare](docs/chapter-07-troubleshooting/README.md)** | Debug & Remediere | [Probleme Comune](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depanare](docs/chapter-07-troubleshooting/debugging.md) &#124; [Probleme AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ore | ⭐⭐ |
| **[Cap 8: Producție](docs/chapter-08-production/README.md)** | Modele Enterprise | [Practici pentru producție](docs/chapter-08-production/production-ai-practices.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laborator practic | [Introducere](workshop/docs/instructions/0-Introduction.md) &#124; [Selecție](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validare](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstrucție](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontare](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Concluzie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ore | ⭐⭐ |

**Durata totală estimată:** ~10-14 ore | **Progres al abilităților:** Începător → Pregătit pentru producție

---

## 📚 Capitole de învățare

*Alege-ți traseul de învățare în funcție de nivelul de experiență și obiective*

### 🚀 Capitolul 1: Fundament și Începere Rapidă
**Prerechizite**: abonament Azure, cunoștințe de bază de linie de comandă  
**Durată**: 30-45 minute  
**Complexitate**: ⭐

#### Ce vei învăța
- Înțelegerea bazelor Azure Developer CLI
- Instalarea AZD pe platforma ta
- Prima ta implementare reușită

#### Resurse de învățare
- **🎯 Începe aici**: [Ce este Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorie**: [Bazele AZD](docs/chapter-01-foundation/azd-basics.md) - concepte și terminologie
- **⚙️ Setup**: [Instalare & Configurare](docs/chapter-01-foundation/installation.md) - ghiduri specifice platformei
- **🛠️ Practic**: [Primul tău proiect](docs/chapter-01-foundation/first-project.md) - tutorial pas cu pas
- **📋 Referință rapidă**: [Fișă de comenzi](resources/cheat-sheet.md)

#### Exerciții practice
```bash
# Verificare rapidă a instalării
azd version

# Lansați prima dvs. aplicație
azd init --template todo-nodejs-mongo
azd up
```

**💡 Rezultat capitol**: Implementarea cu succes a unei aplicații web simple în Azure folosind AZD

**✅ Validarea succesului:**  
```bash
# După ce ați terminat Capitolul 1, ar trebui să puteți:
azd version              # Arată versiunea instalată
azd init --template todo-nodejs-mongo  # Inițializează proiectul
azd up                  # Publică pe Azure
azd show                # Afișează URL-ul aplicației în funcțiune
# Aplicația se deschide în browser și funcționează
azd down --force --purge  # Curăță resursele
```
  
**📊 Timp de investiție:** 30-45 minute  
**📈 Nivel de abilități după:** Poate implementa aplicații de bază independent

---

### 🤖 Capitolul 2: Dezvoltare AI-First (Recomandat pentru dezvoltatorii AI)
**Prerechizite**: Capitoul 1 finalizat  
**Durată**: 1-2 ore  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Integrarea Microsoft Foundry cu AZD
- Implementarea aplicațiilor bazate pe AI
- Înțelegerea configurațiilor serviciilor AI

#### Resurse de învățare
- **🎯 Începe aici**: [Integrare Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 Agenți AI**: [Ghid Agenți AI](docs/chapter-02-ai-development/agents.md) - Implementarea agenților inteligenți cu AZD  
- **📖 Modele**: [Implementare Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementarea și gestionarea modelelor AI  
- **🛠️ Workshop**: [Laborator AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pregătește soluțiile tale AI pentru AZD  
- **🎥 Ghid Interactiv**: [Materiale Workshop](workshop/README.md) - Învățare browser-based cu MkDocs * Mediu DevContainer  
- **📋 Șabloane**: [Șabloane Microsoft Foundry](#resursele-atelierului)  
- **📝 Exemple**: [Exemple Implementare AZD](examples/README.md)  

#### Exerciții practice  
```bash
# Lansează prima ta aplicație AI
azd init --template azure-search-openai-demo
azd up

# Încearcă șabloane AI suplimentare
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Rezultat capitol**: Implementarea și configurarea unei aplicații de chat AI cu capacități RAG

**✅ Validarea succesului:**  
```bash
# După Capitolul 2, ar trebui să puteți:
azd init --template azure-search-openai-demo
azd up
# Testa interfața de chat AI
# Pune întrebări și primi răspunsuri alimentate de AI cu surse
# Verificați că integrarea căutării funcționează
azd monitor  # Verificați că Application Insights afișează telemetria
azd down --force --purge
```
  
**📊 Timp de investiție:** 1-2 ore  
**📈 Nivel de abilități după:** Poate implementa și configura aplicații AI pregătite pentru producție  
**💰 Conștientizare costuri:** Înțelege costuri de dezvoltare de $80-150/lună, costuri de producție de $300-3500/lună

#### 💰 Considerații privind costurile pentru implementările AI

**Mediul de dezvoltare (Estimativ $80-150/lună):**  
- Modele Microsoft Foundry (plată pe utilizare): $0-50/lună (în funcție de utilizarea tokenilor)  
- AI Search (nivel Basic): $75/lună  
- Container Apps (consum): $0-20/lună  
- Stocare (Standard): $1-5/lună

**Mediul de producție (Estimativ $300-3.500+/lună):**  
- Modele Microsoft Foundry (PTU pentru performanță constantă): $3.000+/lună SAU plata după utilizare cu volum mare  
- AI Search (nivel Standard): $250/lună  
- Container Apps (dedicat): $50-100/lună  
- Application Insights: $5-50/lună  
- Stocare (Premium): $10-50/lună

**💡 Sfaturi pentru optimizarea costurilor:**  
- Folosește Modelele Microsoft Foundry **Free Tier** pentru învățare (Azure OpenAI include 50.000 tokeni/lună)  
- Rulează `azd down` pentru a dezaloca resurse când nu dezvolți activ  
- Începe cu facturarea pe consum, upgradează la PTU doar pentru producție  
- Folosește `azd provision --preview` pentru a estima costurile înainte de implementare  
- Activează auto-scalare: plătești doar pentru resursele utilizate efectiv

**Monitorizarea costurilor:**  
```bash
# Verificați costurile lunare estimate
azd provision --preview

# Monitorizați costurile reale în Azure Portal
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ Capitolul 3: Configurare & Autentificare
**Prerechizite**: Capitolul 1 finalizat  
**Durată**: 45-60 minute  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Configurarea și gestionarea mediului
- Autentificare și cele mai bune practici de securitate
- Denumirea și organizarea resurselor

#### Resurse de învățare
- **📖 Configurare**: [Ghid Configurare](docs/chapter-03-configuration/configuration.md) - Setup mediu  
- **🔐 Securitate**: [Modele autentificare și identitate gestionată](docs/chapter-03-configuration/authsecurity.md) - Modele de autentificare  
- **📝 Exemple**: [Exemplu aplicație bază de date](examples/database-app/README.md) - Exemple AZD Database

#### Exerciții practice  
- Configurează medii multiple (dev, staging, prod)  
- Activează autentificarea cu identitate gestionată  
- Implementază configurații specifice fiecărui mediu

**💡 Rezultat capitol**: Gestionează medii multiple cu autentificare și securitate adecvată

---

### 🏗️ Capitolul 4: Infrastructura ca și Cod & Implementare
**Prerechizite**: Capitolele 1-3 finalizate  
**Durată**: 1-1.5 ore  
**Complexitate**: ⭐⭐⭐

#### Ce vei învăța
- Modele avansate de implementare
- Infrastructura ca și Cod cu Bicep
- Strategii de provisionare a resurselor

#### Resurse de învățare
- **📖 Implementare**: [Ghid de implementare](docs/chapter-04-infrastructure/deployment-guide.md) - Fluxuri de lucru complete  
- **🏗️ Provisionare**: [Provisionarea resurselor](docs/chapter-04-infrastructure/provisioning.md) - Management resurse Azure  
- **📝 Exemple**: [Exemplu aplicație container](../../examples/container-app) - Implementări containerizate

#### Exerciții practice  
- Creează șabloane Bicep personalizate  
- Implementează aplicații cu mai multe servicii  
- Aplică strategii de implementare blue-green

**💡 Rezultat capitol**: Implementează aplicații complexe multi-serviciu folosind șabloane personalizate de infrastructură

---
### 🎯 Capitolul 5: Soluții AI Multi-Agent (Avansat)
**Prerechizite**: Capitolele 1-2 finalizate  
**Durată**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce vei învăța
- Modele de arhitectură multi-agent
- Orchestrarea și coordonarea agenților
- Implementări AI pregătite pentru producție

#### Resurse de învățare
- **🤖 Proiect prezentat**: [Soluție Multi-Agent pentru Retail](examples/retail-scenario.md) - Implementare completă
- **🛠️ Template-uri ARM**: [Pachet Template ARM](../../examples/retail-multiagent-arm-template) - Implementare cu un singur clic
- **📖 Arhitectură**: [Modele de coordonare multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modele

#### Exerciții practice
```bash
# Implementați soluția completă multi-agent pentru retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorați configurațiile agenților
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Rezultatul capitolului**: Implementați și administrați o soluție AI multi-agent pregătită pentru producție cu agenți pentru Client și Inventar

---

### 🔍 Capitolul 6: Validare & Planificare Pre-Implementare
**Prerechizite**: Capitolul 4 finalizat  
**Durată**: 1 oră  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Planificarea capacității și validarea resurselor
- Strategii pentru selecția SKU-urilor
- Verificări înainte de implementare și automatizare

#### Resurse de învățare
- **📊 Planificare**: [Planificarea capacității](docs/chapter-06-pre-deployment/capacity-planning.md) - Validarea resurselor
- **💰 Selecție**: [Selecția SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Alegeri cost-eficiente
- **✅ Validare**: [Verificări pre-flight](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripturi automate

#### Exerciții practice
- Rulați scripturi pentru validarea capacității
- Optimizați selecțiile SKU pentru cost
- Implementați verificări automate pre-implementare

**💡 Rezultatul capitolului**: Validarea și optimizarea implementărilor înainte de execuție

---

### 🚨 Capitolul 7: Depanare & Debugging
**Prerechizite**: Orice capitol de implementare finalizat  
**Durată**: 1-1.5 ore  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Abordări sistematice de depanare
- Probleme comune și soluții
- Depanare specifică AI

#### Resurse de învățare
- **🔧 Probleme comune**: [Probleme comune](docs/chapter-07-troubleshooting/common-issues.md) - Întrebări frecvente și soluții
- **🕵️ Depanare**: [Ghid de depanare](docs/chapter-07-troubleshooting/debugging.md) - Strategii pas cu pas
- **🤖 Probleme AI**: [Depanare specifică AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Probleme servicii AI

#### Exerciții practice
- Diagnosticați eșecurile de implementare
- Rezolvați problemele de autentificare
- Depanați conectivitatea serviciilor AI

**💡 Rezultatul capitolului**: Diagnosticarea și rezolvarea independentă a problemelor comune de implementare

---

### 🏢 Capitolul 8: Modele de Producție & Enterprise
**Prerechizite**: Capitolele 1-4 finalizate  
**Durată**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce vei învăța
- Strategii de implementare în producție
- Modele de securitate enterprise
- Monitorizare și optimizare a costurilor

#### Resurse de învățare
- **🏭 Producție**: [Cele mai bune practici AI pentru producție](docs/chapter-08-production/production-ai-practices.md) - Modele enterprise
- **📝 Exemple**: [Exemplu microservicii](../../examples/microservices) - Arhitecturi complexe
- **📊 Monitorizare**: [Integrare Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorizare

#### Exerciții practice
- Implementați modele de securitate enterprise
- Configurați monitorizare completă
- Implementați în producție cu guvernanță corespunzătoare

**💡 Rezultatul capitolului**: Implementați aplicații pregătite pentru mediul enterprise cu capabilități complete de producție

---

## 🎓 Prezentare generală a atelierului: Experiență de învățare practică

> **⚠️ STATUS ATELIER: Dezvoltare activă**  
> Materialele atelierului sunt în curs de dezvoltare și rafinare. Modulele de bază sunt funcționale, dar unele secțiuni avansate sunt incomplete. Lucrăm activ pentru finalizarea întregului conținut. [Urmărește progresul →](workshop/README.md)

### Materiale interactive pentru atelier
**Învățare practică completă cu instrumente în browser și exerciții ghidate**

Materialele atelierului oferă o experiență de învățare structurată și interactivă care completează curricula pe capitole de mai sus. Atelierul este conceput atât pentru învățare autodidactă, cât și pentru sesiuni conduse de instructori.

#### 🛠️ Funcționalități ale atelierului
- **Interfață browser-based**: Atelier complet MkDocs cu căutare, copiere și teme
- **Integrare GitHub Codespaces**: Configurare mediu de dezvoltare cu un singur clic
- **Parcours de învățare structurat**: 8 module cu exerciții ghidate (3-4 ore în total)
- **Metodologie progresivă**: Introducere → Selecție → Validare → Deconstrucție → Configurare → Personalizare → Curățare → Încheiere
- **Mediu DevContainer interactiv**: Instrumente și dependențe preconfigurate

#### 📚 Structura modulului atelierului
Atelierul urmează o **metodologie progresivă cu 8 module** ce te conduce de la descoperire la stăpânirea implementării:

| Modul | Subiect | Ce vei face | Durată |
|--------|---------|-------------|---------|
| **0. Introducere** | Prezentare atelier | Înțelege obiectivele, prerechizitele și structura atelierului | 15 min |
| **1. Selecție** | Descoperirea template-urilor | Explorează template-urile AZD și selectează template-ul AI potrivit scenariului tău | 20 min |
| **2. Validare** | Implementare & verificare | Implementează template-ul cu `azd up` și validează funcționalitatea infrastructurii | 30 min |
| **3. Deconstrucție** | Înțelegerea structurii | Folosește GitHub Copilot pentru a explora arhitectura template-ului, fișiere Bicep și organizarea codului | 30 min |
| **4. Configurare** | Analiză aprofundată azure.yaml | Stăpânește configurarea `azure.yaml`, hook-urile de ciclul de viață și variabilele de mediu | 30 min |
| **5. Personalizare** | Fă-l al tău | Activează AI Search, tracing, evaluare și personalizează pentru scenariul tău | 45 min |
| **6. Curățare** | Curățare după utilizare | Dezactivează resursele în siguranță cu `azd down --purge` | 15 min |
| **7. Încheiere** | Pași următori | Revizuiește realizările, conceptele-cheie și continuă-ți parcursul de învățare | 15 min |

**Fluxul atelierului:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Începerea atelierului
```bash
# Opțiunea 1: GitHub Codespaces (Recomandat)
# Apasă pe "Code" → "Create codespace on main" în depozit

# Opțiunea 2: Dezvoltare locală
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Urmează instrucțiunile de configurare din workshop/README.md
```

#### 🎯 Rezultatele învățării din atelier
Prin finalizarea atelierului, participanții vor:
- **Implementa aplicații AI pentru producție**: Folosind AZD cu serviciile Microsoft Foundry  
- **Stăpâni arhitecturi multi-agent**: Implementa soluții AI coordonate cu mai mulți agenți  
- **Implementa cele mai bune practici de securitate**: Configurarea autentificării și controlului accesului  
- **Optimizare pentru scalare**: Proiectarea unor implementări eficiente din punct de vedere al costului și performanței  
- **Depanare a implementărilor**: Rezolvare independentă a problemelor comune

#### 📖 Resursele atelierului
- **🎥 Ghid interactiv**: [Materiale atelier](workshop/README.md) - Mediu de învățare în browser  
- **📋 Instrucțiuni modul cu modul**:
  - [0. Introducere](workshop/docs/instructions/0-Introduction.md) - Prezentare și obiective atelier  
  - [1. Selecție](workshop/docs/instructions/1-Select-AI-Template.md) - Găsește și selectează template-uri AI  
  - [2. Validare](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementează și verifică template-uri  
  - [3. Deconstrucție](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorează arhitectura template-ului  
  - [4. Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) - Stăpânește azure.yaml  
  - [5. Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizează pentru scenariul tău  
  - [6. Curățare](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Curăță resursele  
  - [7. Încheiere](workshop/docs/instructions/7-Wrap-up.md) - Recapitulare și pași următori  
- **🛠️ Laborator AI Workshop**: [Laborator AI Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exerciții axate pe AI  
- **💡 Start rapid**: [Ghid de configurare atelier](workshop/README.md#quick-start) - Configurarea mediului

**Perfect pentru**: training corporativ, cursuri universitare, învățare autodidactă și bootcampuri pentru dezvoltatori.

---

## 📖 Detaliu: Capacitățile AZD

Dincolo de elementele de bază, AZD oferă funcționalități puternice pentru implementări în producție:

- **Implementări pe bază de template-uri** - Folosește template-uri predefinite pentru tipare comune de aplicații  
- **Infrastructură ca și Cod** - Gestionează resurse Azure folosind Bicep sau Terraform  
- **Fluxuri de lucru integrate** - Provoacă, implementează și monitorizează aplicațiile fără întreruperi  
- **Prietenos pentru dezvoltatori** - Optimizat pentru productivitatea și experiența dezvoltatorilor

### **AZD + Microsoft Foundry: Perfect pentru implementările AI**

**De ce AZD pentru soluții AI?** AZD abordează principalele provocări cu care se confruntă dezvoltatorii AI:

- **Template-uri pregătite pentru AI** - Template-uri preconfigurate pentru modelele Microsoft Foundry, servicii Azure AI și sarcini ML  
- **Implementări AI securizate** - Modele de securitate încorporate pentru servicii AI, chei API și endpoint-uri de modele  
- **Modele AI pentru producție** - Cele mai bune practici pentru implementări AI scalabile și eficiente din punct de vedere al costurilor  
- **Fluxuri AI end-to-end** - De la dezvoltarea modelului până la implementarea în producție cu monitorizare adecvată  
- **Optimizare costuri** - Alocare inteligentă a resurselor și strategii de scalare pentru sarcini AI  
- **Integrare Microsoft Foundry** - Conexiune fluentă la catalogul și endpoint-urile modelelor Microsoft Foundry

---

## 🎯 Biblioteca de Template-uri & Exemple

### Recomandate: Template-uri Microsoft Foundry
**Pornește de aici dacă implementezi aplicații AI!**

> **Notă:** Aceste template-uri demonstrează diverse modele AI. Unele sunt Azure Samples externe, altele sunt implementări locale.

| Template | Capitol | Complexitate | Servicii | Tip |
|----------|---------|--------------|----------|-----|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitol 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitol 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitol 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitol 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitol 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitol 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Capitol 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Recomandate: Scenarii complete de învățare
**Template-uri de aplicații pregătite pentru producție mapate pe capitolele de învățare**

| Template | Capitol de învățare | Complexitate | Învățare cheie |
|----------|---------------------|--------------|---------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitol 2 | ⭐ | Modele de implementare AI de bază |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitol 2 | ⭐⭐ | Implementare RAG cu Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitol 4 | ⭐⭐ | Integrare Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitol 5 | ⭐⭐⭐ | Cadru agent și apelarea funcțiilor |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitol 8 | ⭐⭐⭐ | Orchestrare AI enterprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitol 5 | ⭐⭐⭐⭐ | Arhitectură multi-agent cu agenți Client și Inventar |

### Învățare prin tip de exemplu

> **📌 Exemple locale vs. externe:**  
> **Exemple locale** (din acest repo) = gata de utilizare imediată  
> **Externe** (Azure Samples) = clonare din repo-uri legate

#### Exemple locale (gata de utilizat)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementare completă pregătită pentru producție cu template-uri ARM  
  - Arhitectură multi-agent (agenți Client + Inventar)  
  - Monitorizare și evaluare cuprinzătoare  
  - Implementare cu un clic prin template ARM

#### Exemple locale - Aplicații container (Capitolele 2-5)  
**Exemple complexe de implementare container în acest depozit:**
- [**Exemple de aplicații containerizate**](examples/container-app/README.md) - Ghid complet pentru implementări containerizate  
  - [API Flask simplu](../../examples/container-app/simple-flask-api) - API REST de bază cu scalare până la zero  
  - [Arhitectură Microservicii](../../examples/container-app/microservices) - Implementare multi-serviciu pregătită pentru producție  
  - Modele de implementare Quick Start, Production și Avansat  
  - Ghid pentru monitorizare, securitate și optimizarea costurilor  

#### Exemple externe - Aplicații simple (Capitolele 1-2)  
**Clonați aceste depozite Azure Samples pentru a începe:**  
- [Aplicație Web Simplă - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Modele de implementare de bază  
- [Website static - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementare conținut static  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementare API REST  

#### Exemple externe - Integrare baze de date (Capitolele 3-4)  
- [Aplicație Bază de Date - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Modele de conectivitate baze de date  
- [Funcții + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flux de date serverless  

#### Exemple externe - Modele avansate (Capitolele 4-8)  
- [Microservicii Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitecturi multi-serviciu  
- [Joburi Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Procesare în fundal  
- [Pipeline ML Enterprise](https://github.com/Azure-Samples/mlops-v2) - Modele ML pregătite pentru producție  

### Colecții externe de template-uri  
- [**Galeria oficială de template-uri AZD**](https://azure.github.io/awesome-azd/) - Colecție selectă de template-uri oficiale și comunitare  
- [**Template-uri Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentație template Microsoft Learn  
- [**Directorul de exemple**](examples/README.md) - Exemple locale de învățare cu explicații detaliate  

---

## 📚 Resurse de învățare și referințe  

### Referințe rapide  
- [**Fișa de comenzi azd**](resources/cheat-sheet.md) - Comenzi esențiale azd organizate pe capitole  
- [**Glosar**](resources/glossary.md) - Termeni Azure și azd  
- [**Întrebări frecvente (FAQ)**](resources/faq.md) - Întrebări comune organizate pe capitole de învățare  
- [**Ghid de studiu**](resources/study-guide.md) - Exerciții practice cuprinzătoare  

### Workshop-uri practice  
- [**Laborator AI Workshop**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Faceti soluțiile AI implementabile cu AZD (2-3 ore)  
- [**Workshop interactiv**](workshop/README.md) - 8 module ghidate cu MkDocs și GitHub Codespaces  
  - Urmează: Introducere → Selecție → Validare → Deconstrucție → Configurare → Personalizare → Demontare → Încheiere  

### Resurse externe de învățare  
- Documentația Azure Developer CLI  
- Centrul de arhitectură Azure  
- Calculator de prețuri Azure  
- Status Azure  

### Aptitudini AI Agent pentru editorul dvs.  
- [**Aptitudini Microsoft Azure pe skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 de aptitudini agent deschise pentru AI Azure, Foundry, implementare, diagnosticare, optimizare costuri și altele. Instalați-le în GitHub Copilot, Cursor, Claude Code sau orice agent suportat:  
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```
  
---

## 🔧 Ghid rapid pentru depanare  

**Probleme comune începătorilor și soluții imediate:**  

<details>  
<summary><strong>❌ "azd: command not found"</strong></summary>  

```bash
# Instalați mai întâi AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verificați instalarea
azd version
```
</details>  

<details>  
<summary><strong>❌ "No subscription found" sau "Subscription not set"</strong></summary>  

```bash
# Listează abonamentele disponibile
az account list --output table

# Setează abonamentul implicit
az account set --subscription "<subscription-id-or-name>"

# Setează pentru mediul AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifică
az account show
```
</details>  

<details>  
<summary><strong>❌ "InsufficientQuota" sau "Quota exceeded"</strong></summary>  

```bash
# Încearcă o regiune Azure diferită
azd env set AZURE_LOCATION "westus2"
azd up

# Sau folosește SKU-uri mai mici în dezvoltare
# Editează infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>  

<details>  
<summary><strong>❌ "azd up" eșuează la jumătate</strong></summary>  

```bash
# Opțiunea 1: Curățați și încercați din nou
azd down --force --purge
azd up

# Opțiunea 2: Doar reparați infrastructura
azd provision

# Opțiunea 3: Verificați starea detaliată
azd show

# Opțiunea 4: Verificați jurnalele în Azure Monitor
azd monitor --logs
```
</details>  

<details>  
<summary><strong>❌ "Authentication failed" sau "Token expired"</strong></summary>  

```bash
# Reautentificare pentru AZD
azd auth logout
azd auth login

# Opțional: reîmprospătați și Azure CLI dacă rulați comenzi az
az logout
az login

# Verificați autentificarea
az account show
```
</details>  

<details>  
<summary><strong>❌ "Resource already exists" sau conflicte de denumire</strong></summary>  

```bash
# AZD generează nume unice, dar dacă apare un conflict:
azd down --force --purge

# Atunci încearcă din nou cu un mediu nou
azd env new dev-v2
azd up
```
</details>  

<details>  
<summary><strong>❌ Implementarea template-ului durează prea mult</strong></summary>  

**Timpuri normale de așteptare:**  
- Aplicație web simplă: 5-10 minute  
- Aplicație cu bază de date: 10-15 minute  
- Aplicații AI: 15-25 minute (provisionarea OpenAI este lentă)  

```bash
# Verifică progresul
azd show

# Dacă ești blocat >30 minute, verifică Portalul Azure:
azd monitor --overview
# Caută implementări eșuate
```
</details>  

<details>  
<summary><strong>❌ "Permission denied" sau "Forbidden"</strong></summary>  

```bash
# Verifică rolul tău în Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Ai nevoie cel puțin de rolul "Contributor"
# Cere administratorului tău Azure să acorde:
# - Contributor (pentru resurse)
# - Administrator Acces Utilizator (pentru atribuirea rolurilor)
```
</details>  

<details>  
<summary><strong>❌ Nu găsește URL-ul aplicației implementate</strong></summary>  

```bash
# Afișați toate punctele finale ale serviciului
azd show

# Sau deschideți Azure Portal
azd monitor

# Verificați serviciul specific
azd env get-values
# Căutați variabilele *_URL
```
</details>  

### 📚 Resurse complete pentru depanare  

- **Ghid probleme comune:** [Soluții detaliate](docs/chapter-07-troubleshooting/common-issues.md)  
- **Probleme specifice AI:** [Depanare AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)  
- **Ghid de depanare:** [Depanare pas cu pas](docs/chapter-07-troubleshooting/debugging.md)  
- **Cere ajutor:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli  

---

## 🎓 Finalizarea cursului & certificare  

### Urmărirea progresului  
Urmăriți progresul de învățare prin fiecare capitol:  

- [ ] **Capitolul 1**: Baze & Quick Start ✅  
- [ ] **Capitolul 2**: Dezvoltare AI-First ✅  
- [ ] **Capitolul 3**: Configurare & Autentificare ✅  
- [ ] **Capitolul 4**: Infrastructură ca Cod & Implementare ✅  
- [ ] **Capitolul 5**: Soluții AI multi-agent ✅  
- [ ] **Capitolul 6**: Validare & Planificare pre-implementare ✅  
- [ ] **Capitolul 7**: Depanare & Debugging ✅  
- [ ] **Capitolul 8**: Modele Enterprise & Producție ✅  

### Verificarea cunoștințelor  
După finalizarea fiecărui capitol, verificați cunoștințele prin:  
1. **Exercițiu practic**: Finalizați implementarea practică a capitolului  
2. **Verificare cunoștințe**: Consultați secțiunea FAQ pentru capitolul dvs.  
3. **Discuții comunitare**: Împărtășiți experiența în Azure Discord  
4. **Următorul capitol**: Continuați la nivelul următor de complexitate  

### Beneficii finale curs  
După terminarea tuturor capitolelor, veți avea:  
- **Experiență de producție**: Aplicații AI reale implementate în Azure  
- **Competențe profesionale**: Abilități de implementare enterprise-ready  
- **Recunoaștere în comunitate**: Membru activ al comunității dezvoltatorilor Azure  
- **Avansare în carieră**: Expertiză cerută în AZD și implementare AI  

---

## 🤝 Comunitate & suport  

### Obțineți ajutor & suport  
- **Probleme tehnice**: [Raportați bug-uri și cereri de funcționalități](https://github.com/microsoft/azd-for-beginners/issues)  
- **Întrebări de învățare**: [Comunitatea Microsoft Azure Discord](https://discord.gg/microsoft-azure) și [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **Ajutor AI specific**: Alăturați-vă [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **Documentație**: [Documentația oficială Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Perspective comunitare din Microsoft Foundry Discord  

**Rezultate recente sondaj din canalul #Azure:**  
- **45%** dintre dezvoltatori doresc să folosească AZD pentru sarcini AI  
- **Provocările principale:** Implementări multi-serviciu, gestionare credentiale, pregătirea pentru producție  
- **Cele mai cerute:** Template-uri AI specifice, ghiduri de depanare, bune practici  

**Alăturați-vă comunității noastre pentru a:**  
- Împărtăși experiențe AZD + AI și a primi ajutor  
- Accesa previzualizări timpurii ale noilor template-uri AI  
- Contribui la bune practici de implementare AI  
- Influența dezvoltarea viitoare a caracteristicilor AI + AZD  

### Contribuții la curs  
Primim cu plăcere contribuții! Vă rugăm să citiți [Ghidul de contribuții](CONTRIBUTING.md) pentru detalii despre:  
- **Îmbunătățiri de conținut**: Îmbunătățiți capitolele și exemplele existente  
- **Exemple noi**: Adăugați scenarii și template-uri din lumea reală  
- **Traduceri**: Ajutați la susținerea suportului multi-limbă  
- **Raportări bug-uri**: Creșteți acuratețea și claritatea  
- **Standardele comunității**: Urmați regulile noastre incluzive  

---

## 📄 Informații despre curs  

### Licență  
Acest proiect este licențiat sub Licența MIT - consultați fișierul [LICENSE](../../LICENSE) pentru detalii.  

### Resurse Microsoft de învățare conexe  

Echipa noastră produce și alte cursuri cuprinzătoare de învățare:  

<!-- CO-OP TRANSLATOR OTHER COURSES START -->  
### LangChain  
[![LangChain4j pentru Începători](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)  
[![LangChain.js pentru Începători](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)  
[![LangChain pentru Începători](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)  
---  

### Azure / Edge / MCP / Agenți  
[![AZD pentru Începători](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Edge AI pentru Începători](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![MCP pentru Începători](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Agenți AI pentru Începători](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  

---  
   
### Seria Generative AI  
[![Generative AI pentru Începători](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Inteligență Artificială Generativă (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Învățare de Bază
[![ML pentru Începători](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Știința Datelor pentru Începători](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Inteligența Artificială pentru Începători](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Securitate Cibernetică pentru Începători](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Dezvoltare Web pentru Începători](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pentru Începători](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Dezvoltare XR pentru Începători](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria Copilot
[![Copilot pentru Programare Asistată AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pentru C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigare în Curs

**🚀 Gata să începi să înveți?**

**Începători**: Începe cu [Capitolul 1: Fundamente și Start Rapid](#-chapter-1-foundation--quick-start)  
**Dezvoltatori AI**: Treci la [Capitolul 2: Dezvoltare AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Dezvoltatori Experimentați**: Începe cu [Capitolul 3: Configurare și Autentificare](#️-chapter-3-configuration--authentication)

**Următorii Pași**: [Începe Capitolul 1 - Bazele AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->