# AZD For Beginners: A Structured Learning Journey

![AZD pentru începători](../../translated_images/ro/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduceri automate (întotdeauna la zi)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](./README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Preferi să clonezi local?**
>
> Acest repository include peste 50 de traduceri, ceea ce mărește semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
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
> Aceasta îți oferă tot ce ai nevoie pentru a parcurge cursul cu un download mult mai rapid.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Ce e nou în azd astăzi

Azure Developer CLI a evoluat dincolo de aplicațiile web și API-urile tradiționale. Astăzi, azd este instrumentul unic pentru implementarea oricărei aplicații în Azure — inclusiv aplicații alimentate de AI și agenți inteligenți.

Iată ce înseamnă asta pentru tine:

- **Agenții AI sunt acum sarcini azd de primă clasă.** Poți inițializa, implementa și gestiona proiecte de agenți AI folosind același flux de lucru `azd init` → `azd up` pe care îl cunoști deja.
- **Integrarea Microsoft Foundry** aduce implementarea modelelor, găzduirea agenților și configurarea serviciilor AI direct în ecosistemul de șabloane azd.
- **Fluxul de lucru de bază nu s-a schimbat.** Fie că implementezi o aplicație todo, un microserviciu sau o soluție AI multi-agent, comenzile sunt aceleași.

Dacă ai folosit azd înainte, suportul AI este o extensie naturală — nu un instrument separat sau un traseu avansat. Dacă începi de la zero, vei învăța un singur flux de lucru care funcționează pentru toate cazurile.

---

## 🚀 Ce este Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** este un instrument CLI prietenos cu dezvoltatorii, care face simplă implementarea aplicațiilor în Azure. În loc să creezi și să conectezi manual zeci de resurse Azure, poți implementa aplicații întregi cu o singură comandă.

### Magia lui `azd up`

```bash
# Această comandă unică face totul:
# ✅ Creează toate resursele Azure
# ✅ Configurează rețeaua și securitatea
# ✅ Compilează codul aplicației tale
# ✅ Realizează implementarea în Azure
# ✅ Îți oferă un URL funcțional
azd up
```

**Gata!** Fără click-uri în Azure Portal, fără șabloane ARM complexe de învățat mai întâi, fără configurare manuală - doar aplicații funcționale pe Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Care este diferența?

Aceasta este cea mai frecventă întrebare a începătorilor. Iată răspunsul simplu:

| Caracteristică | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Scop** | Gestionarea resurselor Azure individuale | Implementarea aplicațiilor complete |
| **Abordare** | Axat pe infrastructură | Axat pe aplicații |
| **Exemplu** | `az webapp create --name myapp...` | `azd up` |
| **Curba de învățare** | Trebuie să cunoști serviciile Azure | Trebuie doar să-ți cunoști aplicația |
| **Potrivit pentru** | DevOps, Infrastructură | Dezvoltatori, Prototipare |

### O analogie simplă

- **Azure CLI** e ca și cum ai avea toate uneltele pentru a construi o casă - ciocane, ferăstraie, cuie. Poți construi orice, dar trebuie să știi construcții.
- **Azure Developer CLI** e ca și cum ai angaja un antreprenor - descrii ce vrei și el se ocupă de construcție.

### Când să folosești fiecare

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Lucrează împreună!

AZD folosește Azure CLI pe fundal. Poți folosi ambele:
```bash
# Implementați aplicația dvs. cu AZD
azd up

# Apoi ajustați anumite resurse cu Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Găsește șabloane în Awesome AZD

Nu porni de la zero! **Awesome AZD** este colecția comunității cu șabloane gata de implementat:

| Resursă | Descriere |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Răsfoiește peste 200 de șabloane cu implementare dintr-un singur clic |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Contribuie propriul tău șablon către comunitate |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Dă stea și explorează sursa |

### Șabloane AI populare din Awesome AZD

```bash
# Chat RAG cu modelele Microsoft Foundry + Căutare AI
azd init --template azure-search-openai-demo

# Aplicație rapidă de chat AI
azd init --template openai-chat-app-quickstart

# Agenți AI cu agenți Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Începe în 3 pași

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

### Pasul 2: Autentifică-te în Azure

```bash
azd auth login
```

### Pasul 3: Implementează prima ta aplicație

```bash
# Inițializează dintr-un șablon
azd init --template todo-nodejs-mongo

# Deploy pe Azure (creează totul!)
azd up
```

**🎉 Gata!** Aplicația ta este acum disponibilă pe Azure.

### Curățare (Nu uita!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cum să folosești acest curs

Acest curs este conceput pentru **învățare progresivă** - începe de unde te simți confortabil și avansează treptat:

| Experiența ta | Începe aici |
|-----------------|------------|
| **Începător absolut în Azure** | [Capitolul 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Cunoști Azure, ești nou cu AZD** | [Capitolul 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Dorești să implementezi aplicații AI** | [Capitolul 2: Dezvoltare orientată AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vrei practică aplicată** | [🎓 Atelier interactiv](workshop/README.md) - laborator ghidat de 3-4 ore |
| **Ai nevoie de modele pentru producție** | [Capitolul 8: Producție & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configurare rapidă

1. **Fă fork la acest depozit**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonează-l**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obține ajutor**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Preferi să clonezi local?**

> Acest repository include peste 50 de traduceri, ceea ce mărește semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Aceasta îți oferă tot ce ai nevoie pentru a parcurge cursul cu un download mult mai rapid.


## Prezentarea cursului

Stăpânește Azure Developer CLI (azd) prin capitole structurate concepute pentru învățare progresivă. **Accent special pe implementarea aplicațiilor AI cu integrare Microsoft Foundry.**

### De ce este esențial acest curs pentru dezvoltatorii moderni

Pe baza informațiilor din comunitatea Microsoft Foundry pe Discord, **45% dintre dezvoltatori doresc să folosească AZD pentru sarcini AI**, dar întâmpină provocări legate de:
- Arhitecturi AI complexe cu multiple servicii
- Practici de implementare AI în producție  
- Integrarea și configurarea serviciilor AI Azure
- Optimizarea costurilor pentru sarcini AI
- Depanarea problemelor specifice implementărilor AI

### Obiective de învățare

Parcurgând acest curs structurat, vei:
- **Stăpânește bazele AZD**: Concepte de bază, instalare și configurare
- **Implementează aplicații AI**: Folosește AZD cu serviciile Microsoft Foundry
- **Implementează Infrastructure as Code**: Gestionează resurse Azure cu șabloane Bicep
- **Depanează implementările**: Rezolvă probleme comune și depanează erorile
- **Optimizează pentru producție**: Securitate, scalare, monitorizare și gestionarea costurilor
- **Construiește soluții multi-agent**: Implementează arhitecturi AI complexe

## 🗺️ Harta cursului: Navigare rapidă pe capitole

Fiecare capitol are un README dedicat cu obiective de învățare, porniri rapide și exerciții:

| Capitol | Subiect | Lecții | Durată | Complexitate |
|---------|-------|---------|----------|------------|
| **[Capitolul 1: Fundament](docs/chapter-01-foundation/README.md)** | Început | [Bazele AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalare](docs/chapter-01-foundation/installation.md) &#124; [Primul proiect](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap. 2: Dezvoltare AI](docs/chapter-02-ai-development/README.md)** | Aplicații AI-First | [Integrare Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenți AI](docs/chapter-02-ai-development/agents.md) &#124; [Implementare modele AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atelier](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ore | ⭐⭐ |
| **[Cap. 3: Configurare](docs/chapter-03-configuration/README.md)** | Autentificare & Securitate | [Configurare](docs/chapter-03-configuration/configuration.md) &#124; [Autentificare & Securitate](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap. 4: Infrastructură](docs/chapter-04-infrastructure/README.md)** | IaC & Implementare | [Ghid de implementare](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provizionare](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ore | ⭐⭐⭐ |
| **[Cap. 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Soluții cu agenți AI | [Scenariu de retail](examples/retail-scenario.md) &#124; [Modele de coordonare](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[Cap. 6: Pre-implementare](docs/chapter-06-pre-deployment/README.md)** | Planificare & Validare | [Verificări pre-implementare](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planificare capacitate](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selectare SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 oră | ⭐⭐ |
| **[Cap. 7: Depanare](docs/chapter-07-troubleshooting/README.md)** | Depanare & Remediere | [Probleme comune](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depanare](docs/chapter-07-troubleshooting/debugging.md) &#124; [Probleme AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ore | ⭐⭐ |
| **[Cap. 8: Producție](docs/chapter-08-production/README.md)** | Modele enterprise | [Practici de producție](docs/chapter-08-production/production-ai-practices.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[🎓 Atelier](workshop/README.md)** | Laborator practic | [Introducere](workshop/docs/instructions/0-Introduction.md) &#124; [Selecție](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validare](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstrucție](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontare infrastructură](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Încheiere](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ore | ⭐⭐ |

**Durata totală a cursului:** ~10-14 ore | **Progresie competență:** Începător → Pregătit pentru producție

---

## 📚 Capitole de învățare

*Selectează-ți traseul de învățare în funcție de nivelul de experiență și obiective*

### 🚀 Capitolul 1: Fundamente & Pornire rapidă
**Prerechizite**: Abonament Azure, cunoștințe de bază de linie de comandă  
**Durata**: 30-45 minute  
**Complexitate**: ⭐

#### Ce vei învăța
- Înțelegerea fundamentelor Azure Developer CLI
- Instalarea AZD pe platforma ta
- Prima ta implementare reușită

#### Resurse de învățare
- **🎯 Începe aici**: [Ce este Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorie**: [Bazele AZD](docs/chapter-01-foundation/azd-basics.md) - Concepte și terminologie de bază
- **⚙️ Configurare**: [Instalare & Configurare](docs/chapter-01-foundation/installation.md) - Ghiduri specifice platformei
- **🛠️ Practic**: [Primul tău proiect](docs/chapter-01-foundation/first-project.md) - Tutorial pas cu pas
- **📋 Referință rapidă**: [Fișă de comenzi](resources/cheat-sheet.md)

#### Exerciții practice
```bash
# Verificare rapidă a instalării
azd version

# Implementați prima aplicație
azd init --template todo-nodejs-mongo
azd up
```

**💡 Rezultatul capitolului**: Implementarea cu succes a unei aplicații web simple pe Azure folosind AZD

**✅ Validare a succesului:**
```bash
# După parcurgerea Capitolului 1, ar trebui să puteți:
azd version              # Afișează versiunea instalată
azd init --template todo-nodejs-mongo  # Inițializează proiectul
azd up                  # Publică în Azure
azd show                # Afișează URL-ul aplicației care rulează
# Aplicația se deschide în browser și funcționează
azd down --force --purge  # Curăță resursele
```

**📊 Investiție de timp:** 30-45 minute  
**📈 Nivel de competență după:** Poate implementa aplicații de bază independent  
**📈 Nivel de competență după:** Poate implementa aplicații de bază independent

---

### 🤖 Capitolul 2: Dezvoltare AI-First (Recomandat dezvoltatorilor AI)
**Prerechizite**: Capitolul 1 finalizat  
**Durata**: 1-2 ore  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Integrarea Microsoft Foundry cu AZD
- Implementarea aplicațiilor cu AI
- Înțelegerea configurațiilor serviciilor AI

#### Resurse de învățare
- **🎯 Începe aici**: [Integrare Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenți AI**: [Ghidul agenților AI](docs/chapter-02-ai-development/agents.md) - Implementă agenți inteligenți cu AZD
- **📖 Modele**: [Implementare modele AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementă și gestionează modele AI
- **🛠️ Atelier**: [Laborator AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pregătește-ți soluțiile AI pentru AZD
- **🎥 Ghid interactiv**: [Materiale atelier](workshop/README.md) - Învățare în browser cu MkDocs * DevContainer Environment
- **📋 Șabloane**: [Șabloane Microsoft Foundry](#resurse-atelier)
- **📝 Exemple**: [Exemple de implementare AZD](examples/README.md)

#### Exerciții practice
```bash
# Lansați prima dvs. aplicație AI
azd init --template azure-search-openai-demo
azd up

# Încercați șabloane AI suplimentare
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Rezultatul capitolului**: Implementarea și configurarea unei aplicații de chat alimentate de AI cu capabilități RAG

**✅ Validare a succesului:**
```bash
# După Capitolul 2, ar trebui să poți:
azd init --template azure-search-openai-demo
azd up
# Testa interfața de chat AI
# Pune întrebări și obține răspunsuri generate de AI, însoțite de surse
# Verifică dacă integrarea căutării funcționează
azd monitor  # Verifică dacă Application Insights afișează telemetria
azd down --force --purge
```

**📊 Investiție de timp:** 1-2 ore  
**📈 Nivel de competență după:** Poate implementa și configura aplicații AI pregătite pentru producție  
**💰 Conștientizare costuri:** Înțelege costuri de dezvoltare $80-150/lună, costuri de producție $300-3500/lună

#### 💰 Considerații privind costurile pentru implementările AI

**Mediu de dezvoltare (Estimativ $80-150/lună):**
- Modele Microsoft Foundry (Pay-as-you-go): $0-50/lună (în funcție de utilizarea token-urilor)
- AI Search (nivel Basic): $75/lună
- Container Apps (Consumption): $0-20/lună
- Stocare (Standard): $1-5/lună

**Mediu de producție (Estimativ $300-3.500+/lună):**
- Modele Microsoft Foundry (PTU pentru performanță constantă): $3.000+/lună SAU Pay-as-you-go cu volum mare
- AI Search (nivel Standard): $250/lună
- Container Apps (Dedicated): $50-100/lună
- Application Insights: $5-50/lună
- Stocare (Premium): $10-50/lună

**💡 Sfaturi pentru optimizarea costurilor:**
- Folosește **Free Tier** Modele Microsoft Foundry pentru învățare (Azure OpenAI include 50.000 token-uri/lună)
- Rulează `azd down` pentru a dealoca resursele când nu dezvolți activ
- Începe cu facturare pe consum, treci la PTU doar pentru producție
- Folosește `azd provision --preview` pentru a estima costurile înainte de implementare
- Activează autoscaling: plătești doar pentru utilizarea reală

**Monitorizare costuri:**
```bash
# Verificați costurile lunare estimate
azd provision --preview

# Monitorizați costurile reale în Portalul Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capitolul 3: Configurare & Autentificare
**Prerechizite**: Capitolul 1 finalizat  
**Durata**: 45-60 minute  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Configurarea și gestionarea mediilor
- Cele mai bune practici pentru autentificare și securitate
- Nomenclatura și organizarea resurselor

#### Resurse de învățare
- **📖 Configurare**: [Ghid de configurare](docs/chapter-03-configuration/configuration.md) - Setarea mediului
- **🔐 Securitate**: [Modele de autentificare și managed identity](docs/chapter-03-configuration/authsecurity.md) - Modele de autentificare
- **📝 Exemple**: [Exemplu aplicație baze de date](examples/database-app/README.md) - Exemple AZD pentru baze de date

#### Exerciții practice
- Configurează medii multiple (dev, staging, prod)
- Configurează autentificarea managed identity
- Implementare configurații specifice mediului

**💡 Rezultatul capitolului**: Gestionarea mai multor medii cu autentificare și securitate adecvată

---

### 🏗️ Capitolul 4: Infrastructură ca Cod & Implementare
**Prerechizite**: Capitolele 1-3 finalizate  
**Durata**: 1-1.5 ore  
**Complexitate**: ⭐⭐⭐

#### Ce vei învăța
- Modele avansate de implementare
- Infrastructură ca cod cu Bicep
- Strategii de provizionare a resurselor

#### Resurse de învățare
- **📖 Implementare**: [Ghid de implementare](docs/chapter-04-infrastructure/deployment-guide.md) - Fluxuri de lucru complete
- **🏗️ Provizionare**: [Provizionare resurse](docs/chapter-04-infrastructure/provisioning.md) - Gestionarea resurselor Azure
- **📝 Exemple**: [Exemplu aplicație container](../../examples/container-app) - Implementări containerizate

#### Exerciții practice
- Creează șabloane Bicep personalizate
- Implementarea aplicațiilor multi-serviciu
- Implementarea strategiilor blue-green pentru distribuție

**💡 Rezultatul capitolului**: Implementarea aplicațiilor complexe multi-serviciu folosind șabloane de infrastructură personalizate

---

### 🎯 Capitolul 5: Soluții AI Multi-Agent (Avansat)
**Prerechizite**: Capitolele 1-2 finalizate  
**Durata**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce vei învăța
- Modele de arhitectură multi-agent
- Orchestrarea și coordonarea agenților
- Implementări AI pregătite pentru producție

#### Resurse de învățare
- **🤖 Proiect recomandat**: [Soluție multi-agent pentru retail](examples/retail-scenario.md) - Implementare completă
- **🛠️ Șabloane ARM**: [Pachet șabloane ARM](../../examples/retail-multiagent-arm-template) - Implementare cu un singur click
- **📖 Arhitectură**: [Modele de coordonare multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modele

#### Exerciții practice
```bash
# Implementați soluția completă multi-agent pentru retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorați configurațiile agenților
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Rezultatul capitolului**: Implementarea și gestionarea unei soluții AI multi-agent pregătite pentru producție cu agenți pentru Client și Inventar

---

### 🔍 Capitolul 6: Validare & Planificare pre-implementare
**Prerechizite**: Capitolul 4 finalizat  
**Durata**: 1 oră  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Planificarea capacității și validarea resurselor
- Strategii de selectare SKU
- Verificări pre-implementare și automatizare

#### Resurse de învățare
- **📊 Planificare**: [Planificare capacitate](docs/chapter-06-pre-deployment/capacity-planning.md) - Validarea resurselor
- **💰 Selectare**: [Selectare SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Alegere eficientă din punct de vedere al costurilor
- **✅ Validare**: [Verificări pre-implementare](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripturi automate

#### Exerciții practice
- Rulează scripturi de validare a capacității
- Optimizează selectările SKU pentru cost
- Implementează verificări automate pre-implementare

**💡 Rezultatul capitolului**: Validatează și optimizează implementările înainte de execuție

---

### 🚨 Capitolul 7: Depanare & Debugging
**Prerechizite**: Orice capitol de implementare finalizat  
**Durata**: 1-1.5 ore  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Abordări sistematice de depanare
- Probleme comune și soluții
- Depanare specifică AI

#### Resurse de învățare
- **🔧 Probleme comune**: [Probleme comune](docs/chapter-07-troubleshooting/common-issues.md) - FAQ și soluții
- **🕵️ Debugging**: [Ghid de depanare](docs/chapter-07-troubleshooting/debugging.md) - Strategii pas cu pas
- **🤖 Probleme AI**: [Depanare specifică AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Probleme ale serviciilor AI

#### Exerciții practice
- Diagnostică eșecurile de implementare
- Rezolvă problemele de autentificare
- Depanează conectivitatea serviciilor AI

**💡 Rezultatul capitolului**: Diagnostică și rezolvă independent probleme comune de implementare

---

### 🏢 Capitolul 8: Producție & Modele enterprise
**Prerechizite**: Capitolele 1-4 finalizate  
**Durata**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce vei învăța
- Strategii de implementare pentru producție
- Modele de securitate pentru întreprinderi
- Monitorizare și optimizarea costurilor

#### Resurse de învățare
- **🏭 Producție**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - modele pentru întreprinderi
- **📝 Exemple**: [Microservices Example](../../examples/microservices) - arhitecturi complexe
- **📊 Monitorizare**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - monitorizare

#### Exerciții practice
- Implementați modele de securitate enterprise
- Configurați monitorizare cuprinzătoare
- Implementați în producție cu guvernanță adecvată

**💡 Rezultatul capitolului**: Implementați aplicații pregătite pentru producție pentru întreprinderi, cu capabilități complete de producție

---

## 🎓 Prezentare generală a atelierului: Experiență de învățare practică

> **⚠️ STATUT ATELIER: În dezvoltare activă**  
> Materialele atelierului sunt în prezent în curs de dezvoltare și rafinare. Modulele de bază sunt funcționale, dar unele secțiuni avansate sunt incomplete. Lucrăm activ pentru a finaliza tot conținutul. [Urmăriți progresul →](workshop/README.md)

### Materiale interactive ale atelierului
**Învățare practică completă cu instrumente bazate pe browser și exerciții ghidate**

Materialele atelierului oferă o experiență de învățare structurată și interactivă care completează curriculumul pe capitole de mai sus. Atelierul este conceput atât pentru învățare în ritm propriu, cât și pentru sesiuni conduse de instructor.

#### 🛠️ Caracteristici ale atelierului
- **Interfață bazată pe browser**: Atelier complet alimentat de MkDocs cu funcții de căutare, copiere și teme
- **Integrare GitHub Codespaces**: Configurare a mediului de dezvoltare cu un singur clic
- **Parcurs de învățare structurat**: exerciții ghidate în 8 module (3-4 ore în total)
- **Metodologie progresivă**: Introducere → Selecție → Validare → Deconstrucție → Configurare → Personalizare → Demontare → Încheiere
- **Mediu DevContainer interactiv**: instrumente și dependențe preconfigurate

#### 📚 Structura modulelor atelierului
Atelierul urmărește o **metodologie progresivă în 8 module** care vă duce de la descoperire la stăpânirea implementării:

| Modul | Subiect | Ce vei face | Durată |
|--------|-------|----------------|----------|
| **0. Introducere** | Prezentare generală a atelierului | Înțelege obiectivele de învățare, cerințele preliminare și structura atelierului | 15 min |
| **1. Selecție** | Descoperirea șabloanelor | Explorați șabloanele AZD și selectați șablonul AI potrivit pentru scenariul dumneavoastră | 20 min |
| **2. Validare** | Implementare și verificare | Implementați șablonul cu `azd up` și verificați funcționarea infrastructurii | 30 min |
| **3. Deconstrucție** | Înțelege structura | Folosiți GitHub Copilot pentru a explora arhitectura șablonului, fișierele Bicep și organizarea codului | 30 min |
| **4. Configurare** | Analiză aprofundată azure.yaml | Stăpâniți configurația `azure.yaml`, hook-urile de ciclu de viață și variabilele de mediu | 30 min |
| **5. Personalizare** | Personalizați-l | Activați AI Search, tracing, evaluare și personalizați pentru scenariul dvs. | 45 min |
| **6. Demontare** | Curățare | Eliberați în siguranță resursele cu `azd down --purge` | 15 min |
| **7. Încheiere** | Pașii următori | Revizuiți realizările, conceptele cheie și continuați-vă călătoria de învățare | 15 min |

**Fluxul atelierului:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Începeți cu atelierul
```bash
# Opțiunea 1: GitHub Codespaces (Recomandată)
# Faceți clic pe "Code" → "Create codespace on main" în repozitoriu

# Opțiunea 2: Dezvoltare locală
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Urmați instrucțiunile de configurare din workshop/README.md
```

#### 🎯 Rezultatele învățării în cadrul atelierului
Prin finalizarea atelierului, participanții vor:
- **Implementați aplicații AI pentru producție**: Utilizați AZD cu serviciile Microsoft Foundry
- **Stăpâniți arhitecturi multi-agent**: Implementați soluții coordonate cu agenți AI
- **Implementați cele mai bune practici de securitate**: Configurați autentificarea și controlul accesului
- **Optimizare pentru scară**: Proiectați implementări performante și eficiente din punct de vedere al costurilor
- **Depanați implementările**: Rezolvați problemele comune în mod independent

#### 📖 Resurse atelier
- **🎥 Ghid interactiv**: [Materiale pentru atelier](workshop/README.md) - Mediu de învățare bazat pe browser
- **📋 Instrucțiuni pe module**:
  - [0. Introducere](workshop/docs/instructions/0-Introduction.md) - Prezentare generală a atelierului și obiectivele
  - [1. Selecție](workshop/docs/instructions/1-Select-AI-Template.md) - Găsiți și selectați șabloane AI
  - [2. Validare](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementați și verificați șabloanele
  - [3. Deconstrucție](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorați arhitectura șablonului
  - [4. Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) - Stăpâniți azure.yaml
  - [5. Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizați pentru scenariul dvs.
  - [6. Demontare](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Curățați resursele
  - [7. Încheiere](workshop/docs/instructions/7-Wrap-up.md) - Revizuire și pașii următori
- **🛠️ Laborator AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exerciții axate pe AI
- **💡 Pornire rapidă**: [Workshop Setup Guide](workshop/README.md#quick-start) - Configurarea mediului

**Perfect pentru**: training corporativ, cursuri universitare, învățare în ritm propriu și bootcamp-uri pentru dezvoltatori.

---

## 📖 Analiză aprofundată: Capabilitățile AZD

Dincolo de elementele de bază, AZD oferă funcționalități puternice pentru implementările în producție:

- **Implementări bazate pe șabloane** - Utilizați șabloane predefinite pentru modele comune de aplicații
- **Infrastructură ca Cod** - Gestionați resursele Azure folosind Bicep sau Terraform  
- **Fluxuri de lucru integrate** - Provisionați, implementați și monitorizați aplicațiile fără întreruperi
- **Prietenos pentru dezvoltatori** - Optimizat pentru productivitatea și experiența dezvoltatorilor

### **AZD + Microsoft Foundry: Perfect pentru implementările AI**

**De ce AZD pentru soluții AI?** AZD abordează principalele provocări cu care se confruntă dezvoltatorii AI:

- **Șabloane pregătite pentru AI** - Șabloane preconfigurate pentru modelele Microsoft Foundry, Cognitive Services și sarcinile de lucru ML
- **Implementări AI securizate** - Modele de securitate încorporate pentru serviciile AI, cheile API și endpoint-urile modelelor  
- **Modele AI pentru producție** - Cele mai bune practici pentru implementări AI scalabile și eficiente din punct de vedere al costurilor
- **Fluxuri de lucru AI de la un capăt la altul** - De la dezvoltarea modelului la implementarea în producție cu monitorizare adecvată
- **Optimizare a costurilor** - Alocare inteligentă a resurselor și strategii de scalare pentru sarcinile AI
- **Integrare Microsoft Foundry** - Conexiune fluidă la catalogul de modele și endpoint-urile Microsoft Foundry

---

## 🎯 Bibliotecă de șabloane și exemple

### Recomandate: Șabloane Microsoft Foundry
**Începeți aici dacă implementați aplicații AI!**

> **Notă:** Aceste șabloane demonstrează diverse modele AI. Unele sunt Azure Samples externe, altele sunt implementări locale.

| Șablon | Capitol | Complexitate | Servicii | Tip |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitol 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitol 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitol 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitol 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitol 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitol 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Capitol 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Selectate: Scenarii complete de învățare
**Șabloane de aplicații gata pentru producție mapate la capitolele de învățare**

| Template | Capitol de învățare | Complexitate | Ce veți învăța |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitol 2 | ⭐ | Tipare de implementare AI de bază |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitol 2 | ⭐⭐ | Implementare RAG cu Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitol 4 | ⭐⭐ | Integrare Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitol 5 | ⭐⭐⭐ | Framework de agenți și apelare de funcții |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitol 8 | ⭐⭐⭐ | Orchestrare AI pentru întreprinderi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitol 5 | ⭐⭐⭐⭐ | Arhitectură multi-agent cu agenți Client și Inventar |

### Învățare prin tip de exemplu

> **📌 Exemple locale vs. externe:**  
> **Exemple locale** (în acest repo) = Gata de utilizare imediat  
> **Exemple externe** (Azure Samples) = Clonați din repo-urile legate

#### Exemple locale (Gata de utilizare)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementare completă, gata pentru producție, cu șabloane ARM
  - Arhitectură multi-agent (agenți Client + Inventar)
  - Monitorizare și evaluare cuprinzătoare
  - Implementare cu un singur clic prin șablon ARM

#### Exemple locale - Aplicații container (Capitolele 2-5)
**Exemple cuprinzătoare de implementare a containerelor în acest depozit:**
- [**Container App Examples**](examples/container-app/README.md) - Ghid complet pentru implementări containerizate
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API Flask simplu - API REST de bază cu scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Arhitectură microservicii - Implementare multi-serviciu pregătită pentru producție
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, security, and cost optimization guidance

#### Exemple externe - Aplicații simple (Capitolele 1-2)
**Clonați aceste depozite Azure Samples pentru a începe:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Modele de implementare de bază
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementare conținut static
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementare API REST

#### Exemple externe - Integrare bază de date (Capitolele 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Modele de conectivitate la baze de date
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flux de lucru de date serverless

#### Exemple externe - Modele avansate (Capitolele 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitecturi multi-serviciu
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Procesare în fundal  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Modele ML pregătite pentru producție

### Colecții de șabloane externe
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Colecție selectată de șabloane oficiale și comunitare
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentație Microsoft Learn pentru șabloane
- [**Examples Directory**](examples/README.md) - Exemple locale de învățare cu explicații detaliate

---

## 📚 Resurse și referințe pentru învățare

### Referințe rapide
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Comenzi esențiale azd organizate pe capitole
- [**Glossary**](resources/glossary.md) - Terminologie Azure și azd  
- [**FAQ**](resources/faq.md) - Întrebări comune organizate pe capitole de învățare
- [**Study Guide**](resources/study-guide.md) - Ghid de studiu cu exerciții practice cuprinzătoare

### Ateliere practice
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Faceți soluțiile dvs. AI implementabile cu AZD (2-3 ore)
- [**Interactive Workshop**](workshop/README.md) - Exerciții ghidate în 8 module cu MkDocs și GitHub Codespaces
  - Urmărește: Introducere → Selecție → Validare → Deconstrucție → Configurare → Personalizare → Demontare → Încheiere

### Resurse externe de învățare
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrul de Arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculator de prețuri Azure](https://azure.microsoft.com/pricing/calculator/)
- [Starea Azure](https://status.azure.com/)

### Abilități ale agenților AI pentru editorul tău
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 de skill-uri pentru agenți deschise pentru Azure AI, Foundry, implementare, diagnosticare, optimizarea costurilor și altele. Instalează-le în GitHub Copilot, Cursor, Claude Code sau în orice agent acceptat:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Ghid rapid de depanare

**Probleme comune întâmpinate de începători și soluții imediate:**

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Opțiunea 1: Curăță și încearcă din nou
azd down --force --purge
azd up

# Opțiunea 2: Doar repară infrastructura
azd provision

# Opțiunea 3: Verifică starea detaliată
azd show

# Opțiunea 4: Verifică jurnalele în Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Reautentifică-te
az logout
az login

azd auth logout
azd auth login

# Verifică autentificarea
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD generează nume unice, dar dacă apare un conflict:
azd down --force --purge

# Apoi reîncearcă cu un mediu nou
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
# Verifică progresul
azd show

# Dacă ești blocat mai mult de 30 de minute, verifică portalul Azure:
azd monitor
# Caută implementări eșuate
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Verificați rolul dvs. în Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Aveți nevoie de cel puțin rolul "Contributor"
# Rugați administratorul Azure să acorde:
# - Contributor (pentru resurse)
# - User Access Administrator (pentru atribuiri de roluri)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Afișați toate endpoint-urile serviciilor
azd show

# Sau deschideți Portalul Azure
azd monitor

# Verificați un serviciu specific
azd env get-values
# Căutați variabilele *_URL
```
</details>

### 📚 Resurse complete de depanare

- **Ghid pentru probleme comune:** [Soluții detaliate](docs/chapter-07-troubleshooting/common-issues.md)
- **Probleme specifice AI:** [Depanare AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Ghid de depanare:** [Depanare pas cu pas](docs/chapter-07-troubleshooting/debugging.md)
- **Obține ajutor:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Finalizarea cursului & Certificare

### Urmărirea progresului
Urmărește-ți progresul de învățare pentru fiecare capitol:

- [ ] **Capitolul 1**: Fundamente & Pornire rapidă ✅
- [ ] **Capitolul 2**: Dezvoltare axată pe AI ✅  
- [ ] **Capitolul 3**: Configurare & Autentificare ✅
- [ ] **Capitolul 4**: Infrastructură ca Cod & Implementare ✅
- [ ] **Capitolul 5**: Soluții AI multi-agent ✅
- [ ] **Capitolul 6**: Validare & Planificare înainte de implementare ✅
- [ ] **Capitolul 7**: Diagnosticare și depanare ✅
- [ ] **Capitolul 8**: Modele pentru producție și întreprinderi ✅

### Verificarea învățării
După finalizarea fiecărui capitol, verifică-ți cunoștințele prin:
1. **Exercițiu practic**: Finalizează implementarea practică din capitol
2. **Verificare a cunoștințelor**: Revizuiește secțiunea FAQ pentru capitolul tău
3. **Discuție în comunitate**: Împărtășește-ți experiența în Discord Azure
4. **Capitolul următor**: Treci la nivelul de complexitate următor

### Beneficiile finalizării cursului
După finalizarea tuturor capitolelor, vei avea:
- **Experiență în producție**: Ai implementat aplicații AI reale în Azure
- **Competențe profesionale**: Capacități de implementare pregătite pentru mediul enterprise  
- **Recunoaștere în comunitate**: Membru activ al comunității dezvoltatorilor Azure
- **Dezvoltare profesională**: Expertiză în implementări AZD și AI foarte solicitată

---

## 🤝 Comunitate și suport

### Obține ajutor și asistență
- **Probleme tehnice**: [Raportează erori și solicită funcționalități](https://github.com/microsoft/azd-for-beginners/issues)
- **Întrebări despre învățare**: [Comunitatea Discord Microsoft Azure](https://discord.gg/microsoft-azure) și [![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajutor specific AI**: Alătură-te [![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentație**: [Documentația oficială Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Informații din comunitate de pe Discord Microsoft Foundry

**Rezultatele recente ale sondajului din canalul #Azure:**
- **45%** dintre dezvoltatori doresc să folosească AZD pentru sarcini de lucru AI
- **Principalele provocări**: Implementări multi-serviciu, gestionarea acreditărilor, pregătirea pentru producție  
- **Cele mai solicitate**: șabloane specifice AI, ghiduri de depanare, bune practici

**Alătură-te comunității noastre pentru a:**
- Împărtășește-ți experiențele AZD + AI și primește ajutor
- Accesează previzualizări timpurii ale noilor șabloane AI
- Contribuie la bune practici pentru implementări AI
- Influențează dezvoltarea viitoare de funcționalități AI + AZD

### Contribuții la curs
Primim cu plăcere contribuții! Te rugăm să citești [Ghidul de contribuție](CONTRIBUTING.md) pentru detalii despre:
- **Îmbunătățiri de conținut**: Îmbunătățește capitolele și exemplele existente
- **Exemple noi**: Adaugă scenarii din lumea reală și șabloane  
- **Traducere**: Ajută la menținerea suportului multilingv
- **Raportare erori**: Îmbunătățește acuratețea și claritatea
- **Standarde comunitare**: Urmează ghidurile noastre incluzive ale comunității

---

## 📄 Informații despre curs

### Licență
Acest proiect este licențiat sub Licența MIT - vezi fișierul [LICENSE](../../LICENSE) pentru detalii.

### Resurse Microsoft de învățare conexe

Echipa noastră produce și alte cursuri cuprinzătoare:

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
 
### Seria AI generativ
[![AI generativ pentru începători](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI generativ (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI generativ (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI generativ (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Învățare de bază
[![ML pentru începători](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Știința datelor pentru începători](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pentru începători](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Securitate cibernetică pentru începători](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Dezvoltare web pentru începători](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pentru începători](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Dezvoltare XR pentru începători](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria Copilot
[![Copilot pentru programare în pereche cu AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pentru C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigare curs

**🚀 Ești gata să începi să înveți?**

**Începători**: Începeți cu [Capitolul 1: Fundamente & Pornire rapidă](#-chapter-1-foundation--quick-start)  
**Dezvoltatori AI**: Treci la [Capitolul 2: Dezvoltare centrată pe AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Dezvoltatori experimentați**: Începeți cu [Capitolul 3: Configurare & Autentificare](#️-chapter-3-configuration--authentication)

**Următorii pași**: [Începe Capitolul 1 - Bazele AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu răspundem pentru eventualele neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->