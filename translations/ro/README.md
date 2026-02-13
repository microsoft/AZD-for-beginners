# AZD Pentru Începători: O Călătorie Structurată de Învățare

![AZD-for-beginners](../../translated_images/ro/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduceri Automate (Întotdeauna Actualizate)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](./README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Preferi să clonezi local?**
>
> Acest depozit include peste 50 de traduceri în limbi care cresc semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
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

## 🚀 Ce este Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** este un instrument de linie de comandă prietenos pentru dezvoltatori care face simplă desfășurarea aplicațiilor pe Azure. În loc să creezi manual și să conectezi zeci de resurse Azure, poți desfășura aplicații întregi cu o singură comandă.

### Magia comenzii `azd up`

```bash
# Această singură comandă face totul:
# ✅ Creează toate resursele Azure
# ✅ Configurează rețeaua și securitatea
# ✅ Construiește codul aplicației tale
# ✅ Publică în Azure
# ✅ Îți oferă un URL funcțional
azd up
```

**Atât!** Fără click-uri în Azure Portal, fără șabloane ARM complexe de învățat mai întâi, fără configurare manuală - doar aplicații funcționale pe Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Care este Diferența?

Aceasta este întrebarea cea mai frecventă pe care o pun începătorii. Iată răspunsul simplu:

| Caracteristică | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Scop** | Administrarea resurselor Azure individuale | Desfășurarea aplicațiilor complete |
| **Mentalitate** | Orientată pe infrastructură | Orientată pe aplicații |
| **Exemplu** | `az webapp create --name myapp...` | `azd up` |
| **Curba de învățare** | Trebuie să cunoști serviciile Azure | Trebuie să cunoști doar aplicația ta |
| **Cel mai potrivit pentru** | DevOps, Infrastructură | Dezvoltatori, Prototipare |

### O Analogie Simplă

- **Azure CLI** este ca și cum ai avea toate uneltele pentru a construi o casă - ciocane, ferăstraie, cuie. Poți construi orice, dar trebuie să știi construcția.
- **Azure Developer CLI** este ca și cum ai angaja un contractant - descrii ce vrei și el se ocupă de construcție.

### Când să folosești fiecare

| Scenariu | Folosește aceasta |
|----------|------------------|
| "Vreau să desfășor rapid aplicația web" | `azd up` |
| "Trebuie să creez doar un cont de stocare" | `az storage account create` |
| "Construiesc o aplicație completă AI" | `azd init --template azure-search-openai-demo` |
| "Trebuie să depanez o anumită resursă Azure" | `az resource show` |
| "Vreau o desfășurare gata pentru producție în minute" | `azd up --environment production` |

### Funcționează împreună!

AZD utilizează Azure CLI în fundal. Poți folosi ambele:
```bash
# Desfășurați aplicația cu AZD
azd up

# Apoi ajustați în detaliu resurse specifice cu Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Găsește Șabloane în Awesome AZD

Nu porni de la zero! **Awesome AZD** este colecția comunitară de șabloane gata de desfășurat:

| Resursă | Descriere |
|----------|-----------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Răsfoiește peste 200 de șabloane cu desfășurare cu un singur clic |
| 🔗 [**Trimite un Șablon**](https://github.com/Azure/awesome-azd/issues) | Contribuie cu propriul tău șablon comunității |
| 🔗 [**Depozit GitHub**](https://github.com/Azure/awesome-azd) | Dă stea și explorează sursa |

### Șabloane AI Populare din Awesome AZD

```bash
# Conversație RAG cu Azure OpenAI + Căutare AI
azd init --template azure-search-openai-demo

# Aplicație rapidă de chat AI
azd init --template openai-chat-app-quickstart

# Agenți AI cu Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Începe în 3 Pași

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

### Pasul 2: Autentificare în Azure

```bash
azd auth login
```

### Pasul 3: Desfășoară Prima Ta Aplicație

```bash
# Inițializează dintr-un șablon
azd init --template todo-nodejs-mongo

# Implementează în Azure (creează totul!)
azd up
```

**🎉 Gata!** Aplicația ta este acum live pe Azure.

### Curățare (Nu uita!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cum să Folosești Acest Curs

Acest curs este conceput pentru **învățare progresivă** - începe de unde te simți confortabil și avansează:

| Experiența Ta | Începe Aici |
|-----------------|------------|
| **Nou-nouț la Azure** | [Capitolul 1: Bază](../..) |
| **Cunoști Azure, dar nu AZD** | [Capitolul 1: Bază](../..) |
| **Vrei să desfășori aplicații AI** | [Capitolul 2: Dezvoltare AI](../..) |
| **Vrei practică practică** | [🎓 Atelier Interactiv](workshop/README.md) - laborator ghidat de 3-4 ore |
| **Ai nevoie de modele de producție** | [Capitolul 8: Producție & Enterprise](../..) |

### Configurare Rapidă

1. **Fă fork la acest depozit**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonează-l**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Primește Ajutor**: [Comunitatea Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Preferi să clonezi local?**

> Acest depozit include peste 50 de traduceri în limbi care cresc semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Acest lucru îți oferă tot ce ai nevoie pentru a finaliza cursul cu o descărcare mult mai rapidă.


## Prezentare Generală a Cursului

Stăpânește Azure Developer CLI (azd) prin capitole structurate concepute pentru învățare progresivă. **Focalizare specială pe desfășurarea aplicațiilor AI cu integrare Microsoft Foundry.**

### De Ce Este Acest Curs Esențial pentru Dezvoltatorii Moderni

Bazat pe feedback-ul comunității Microsoft Foundry Discord, **45% dintre dezvoltatori doresc să folosească AZD pentru sarcini AI** dar întâmpină provocări cu:
- Arhitecturi complexe AI multi-servicii
- Cele mai bune practici pentru desfășurarea AI în producție  
- Integrarea și configurarea serviciilor Azure AI
- Optimizarea costurilor pentru sarcinile AI
- Diagnosticarea problemelor specifice desfășurării AI

### Obiective de Învățare

Finalizând acest curs structurat, vei:
- **Stăpâni Bazele AZD**: concepte cheie, instalare și configurare
- **Desfășura Aplicații AI**: folosește AZD cu serviciile Microsoft Foundry
- **Implementa Infrastructure as Code**: gestionează resurse Azure cu șabloane Bicep
- **Depana Desfășurări**: rezolvă probleme comune și depanează erori
- **Optimizează pentru Producție**: securitate, scalare, monitorizare și gestionare a costurilor
- **Construiește Soluții Multi-Agent**: desfășoară arhitecturi AI complexe

## 🗺️ Harta Cursului: Navigare Rapidă pe Capitole

Fiecare capitol are un README dedicat cu obiective de învățare, porniri rapide și exerciții:

| Capitol | Subiect | Lecții | Durată | Complexitate |
|---------|---------|---------|---------|-------------|
| **[Cap 1: Bază](docs/chapter-01-foundation/README.md)** | Început | [Bazele AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalare](docs/chapter-01-foundation/installation.md) &#124; [Primul Proiect](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Dezvoltare AI](docs/chapter-02-ai-development/README.md)** | Aplicații AI First | [Integrare Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenti AI](docs/chapter-02-ai-development/agents.md) &#124; [Desfășurare Model AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atelier](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ore | ⭐⭐ |
| **[Cap 3: Configurare](docs/chapter-03-configuration/README.md)** | Autentificare & Securitate | [Configurare](docs/chapter-03-configuration/configuration.md) &#124; [Autentificare & Securitate](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infrastructură](docs/chapter-04-infrastructure/README.md)** | IaC & Implementare | [Ghiozdan Implementare](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionare](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ore | ⭐⭐⭐ |
| **[Cap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Soluții Agente AI | [Scenariu Retail](examples/retail-scenario.md) &#124; [Modele de coordonare](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[Cap 6: Pre-Implementare](docs/chapter-06-pre-deployment/README.md)** | Planificare & Validare | [Verificări Preliminare](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planificare Capacitate](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selecție SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 oră | ⭐⭐ |
| **[Cap 7: Depanare](docs/chapter-07-troubleshooting/README.md)** | Depanare & Remediere | [Probleme Comune](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depanare](docs/chapter-07-troubleshooting/debugging.md) &#124; [Probleme AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ore | ⭐⭐ |
| **[Cap 8: Producție](docs/chapter-08-production/README.md)** | Modele Enterprise | [Practici de Producție](docs/chapter-08-production/production-ai-practices.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laborator Practic | [Introducere](workshop/docs/instructions/0-Introduction.md) &#124; [Selecție](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validare](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstrucție](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontare](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Concluzii](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ore | ⭐⭐ |

**Durata totală a cursului:** ~10-14 ore | **Progresie a abilităților:** Începător → Pregătit pentru Producție

---

## 📚 Capitole de învățare

*Alege drumul de învățare potrivit în funcție de nivelul de experiență și obiective*

### 🚀 Capitolul 1: Fundamente & Start Rapid  
**Precondiții**: Abonament Azure, cunoștințe de bază de linie de comandă  
**Durata**: 30-45 minute  
**Complexitate**: ⭐  

#### Ce vei învăța  
- Noțiuni fundamentale despre Azure Developer CLI  
- Instalarea AZD pe platforma ta  
- Prima implementare de succes  

#### Resurse de învățare  
- **🎯 Începe aici**: [Ce este Azure Developer CLI?](../..)  
- **📖 Teorie**: [Noțiuni de bază AZD](docs/chapter-01-foundation/azd-basics.md) - Concepe principale și terminologie  
- **⚙️ Configurare**: [Instalare & Setup](docs/chapter-01-foundation/installation.md) - Ghiduri specifice platformei  
- **🛠️ Practic**: [Primul Proiect](docs/chapter-01-foundation/first-project.md) - Tutorial pas cu pas  
- **📋 Referință rapidă**: [Fișa de comenzi](resources/cheat-sheet.md)  

#### Exerciții practice  
```bash
# Verificare rapidă a instalării
azd version

# Lansați prima dvs. aplicație
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Rezultat capitol**: Implementează cu succes o aplicație web simplă în Azure folosind AZD  

**✅ Validare succes:**  
```bash
# După finalizarea Capitolului 1, ar trebui să puteți:
azd version              # Afișează versiunea instalată
azd init --template todo-nodejs-mongo  # Inițializează proiectul
azd up                  # Face deploy pe Azure
azd show                # Afișează URL-ul aplicației în execuție
# Aplicația se deschide în browser și funcționează
azd down --force --purge  # Curăță resursele
```
  
**📊 Investiție de timp:** 30-45 minute  
**📈 Nivel de abilitate după:** Poate implementa aplicații de bază independent  

**✅ Validare succes:**  
```bash
# După finalizarea Capitolului 1, ar trebui să puteți:
azd version              # Afișează versiunea instalată
azd init --template todo-nodejs-mongo  # Inițializează proiectul
azd up                  # Publică pe Azure
azd show                # Afișează URL-ul aplicației în execuție
# Aplicația se deschide în browser și funcționează
azd down --force --purge  # Curăță resursele
```
  
**📊 Investiție de timp:** 30-45 minute  
**📈 Nivel de abilitate după:** Poate implementa aplicații de bază independent  

---

### 🤖 Capitolul 2: Dezvoltare AI-First (Recomandat pentru dezvoltatori AI)  
**Precondiții**: Capitolul 1 finalizat  
**Durata**: 1-2 ore  
**Complexitate**: ⭐⭐  

#### Ce vei învăța  
- Integrarea Microsoft Foundry cu AZD  
- Implementarea aplicațiilor alimentate de AI  
- Înțelegerea configurațiilor serviciilor AI  

#### Resurse de învățare  
- **🎯 Începe aici**: [Integrare Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 Agenți AI**: [Ghid Agenți AI](docs/chapter-02-ai-development/agents.md) - Implementare agenți inteligenți cu AZD  
- **📖 Modele**: [Implementare modele AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Desfășurare și administrare modele AI  
- **🛠️ Workshop**: [Workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pregătește soluțiile tale AI pentru AZD  
- **🎥 Ghid Interactiv**: [Materiale Workshop](workshop/README.md) - Învățare prin browser cu MkDocs * Mediu DevContainer  
- **📋 Șabloane**: [Șabloane Microsoft Foundry](../..)  
- **📝 Exemple**: [Exemple de implementare AZD](examples/README.md)  

#### Exerciții practice  
```bash
# Lansați prima dumneavoastră aplicație AI
azd init --template azure-search-openai-demo
azd up

# Încercați șabloane AI suplimentare
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Rezultat capitol**: Implementarea și configurarea unei aplicații de chat AI cu capabilități RAG  

**✅ Validare succes:**  
```bash
# După Capitolul 2, ar trebui să poți:
azd init --template azure-search-openai-demo
azd up
# Testa interfața de chat AI
# Pune întrebări și primește răspunsuri generate de AI cu surse
# Verifica că integrarea căutării funcționează
azd monitor  # Verifica că Application Insights afișează telemetrie
azd down --force --purge
```
  
**📊 Investiție de timp:** 1-2 ore  
**📈 Nivel de abilitate după:** Poate implementa și configura aplicații AI pregătite pentru producție  
**💰 Conștientizare costuri:** Înțelege costurile de dezvoltare $80-150/lună, producție $300-3500/lună  

#### 💰 Considerații de cost pentru implementările AI

**Mediu de dezvoltare (estimativ $80-150/lună):**  
- Azure OpenAI (Plată pe consum): $0-50/lună (în funcție de utilizare tokeni)  
- AI Search (nivel Basic): $75/lună  
- Container Apps (consum): $0-20/lună  
- Stocare (Standard): $1-5/lună  

**Mediu de producție (estimativ $300-3,500+/lună):**  
- Azure OpenAI (PTU pentru performanță constantă): $3,000+/lună SAU Plata pe consum cu volum mare  
- AI Search (nivel Standard): $250/lună  
- Container Apps (dediat): $50-100/lună  
- Application Insights: $5-50/lună  
- Stocare (Premium): $10-50/lună  

**💡 Sfaturi de optimizare a costurilor:**  
- Folosește **Nivelul Gratuit** Azure OpenAI pentru învățare (50,000 tokeni lunar incluși)  
- Rulează `azd down` pentru dezalocarea resurselor când nu dezvolți activ  
- Pornește cu facturare pe consum, treci la PTU doar în producție  
- Utilizează `azd provision --preview` pentru estimarea costurilor înainte de implementare  
- Activează auto-scalare: plătești doar pentru consumul real  

**Monitorizare costuri:**  
```bash
# Verificați costurile lunare estimate
azd provision --preview

# Monitorizați costurile reale în Portalul Azure
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ Capitolul 3: Configurare & Autentificare  
**Precondiții**: Capitolul 1 finalizat  
**Durata**: 45-60 minute  
**Complexitate**: ⭐⭐  

#### Ce vei învăța  
- Configurarea și gestionarea mediilor  
- Autentificare și bune practici de securitate  
- Nomenclatura și organizarea resurselor  

#### Resurse de învățare  
- **📖 Configurare**: [Ghid configurație](docs/chapter-03-configuration/configuration.md) - Configurare mediu  
- **🔐 Securitate**: [Tipare autentificare și identitate administrată](docs/chapter-03-configuration/authsecurity.md)  
- **📝 Exemple**: [Exemplu aplicație bază de date](examples/database-app/README.md) - Exemple AZD bază de date  

#### Exerciții practice  
- Configurează medii multiple (dev, staging, prod)  
- Configurează autentificare cu identitate administrată  
- Implementează configurații specifice mediului  

**💡 Rezultat capitol**: Gestionează medii multiple cu autentificare și securitate adecvată  

---

### 🏗️ Capitolul 4: Infrastructura ca Cod & Implementare  
**Precondiții**: Capitolele 1-3 finalizate  
**Durata**: 1-1.5 ore  
**Complexitate**: ⭐⭐⭐  

#### Ce vei învăța  
- Modele avansate de implementare  
- Infrastructură ca cod folosind Bicep  
- Strategii de provisioning resurse  

#### Resurse de învățare  
- **📖 Implementare**: [Ghid implementare](docs/chapter-04-infrastructure/deployment-guide.md) - Fluxuri complete  
- **🏗️ Provisionare**: [Provisionare resurse](docs/chapter-04-infrastructure/provisioning.md) - Gestionare resurse Azure  
- **📝 Exemple**: [Exemplu aplicație Container](../../examples/container-app) - Implementări containerizate  

#### Exerciții practice  
- Creează șabloane Bicep personalizate  
- Implementează aplicații multi-serviciu  
- Implementează strategii blue-green deployment  

**💡 Rezultat capitol**: Implementarea aplicațiilor complexe multi-serviciu folosind șabloane personalizate de infrastructură  

---

### 🎯 Capitolul 5: Soluții Multi-Agent AI (Avansat)  
**Precondiții**: Capitolele 1-2 finalizate  
**Durata**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐  

#### Ce vei învăța  
- Modele arhitecturale multi-agent  
- Orchestrare și coordonare agenți  
- Implementări AI pregătite pentru producție  

#### Resurse de învățare  
- **🤖 Proiect evidențiat**: [Soluție multi-agent Retail](examples/retail-scenario.md) - Implementare completă  
- **🛠️ Șabloane ARM**: [Pachet șabloane ARM](../../examples/retail-multiagent-arm-template) - Implementare cu un singur clic  
- **📖 Arhitectură**: [Modele de coordonare multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md)  

#### Exerciții practice  
```bash
# Implementați soluția completă multi-agent pentru retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorați configurațiile agenților
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Rezultat capitol**: Implementarea și gestionarea unei soluții AI multi-agent pregătite pentru producție cu agenți Client și Inventar  

---

### 🔍 Capitolul 6: Validare & Planificare Pre-Implementare  
**Precondiții**: Capitolul 4 finalizat  
**Durata**: 1 oră  
**Complexitate**: ⭐⭐  

#### Ce vei învăța  
- Planificarea capacității și validarea resurselor  
- Strategii de selecție SKU  
- Verificări pre-implementare și automatizare  

#### Resurse de învățare  
- **📊 Planificare**: [Planificare capacitate](docs/chapter-06-pre-deployment/capacity-planning.md) - Validare resurse  
- **💰 Selecție**: [Selecție SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Alegeri eficiente din punct de vedere al costurilor  
- **✅ Validare**: [Verificări pre-implementare](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripturi automate  

#### Exerciții practice  
- Rulează scripturi de validare a capacității  
- Optimizează selecțiile SKU pentru cost  
- Implementează verificări automate înaintea implementării  

**💡 Rezultat capitol**: Validarea și optimizarea implementărilor înainte de execuție  

---

### 🚨 Capitolul 7: Depanare & Debugging  
**Precondiții**: Orice capitol de implementare finalizat  
**Durata**: 1-1.5 ore  
**Complexitate**: ⭐⭐  

#### Ce vei învăța  
- Abordări sistematice de depanare  
- Probleme comune și soluții  
- Depanare specifică serviciilor AI  

#### Resurse de învățare  
- **🔧 Probleme comune**: [Probleme Comune](docs/chapter-07-troubleshooting/common-issues.md) - FAQ și soluții  
- **🕵️ Depanare**: [Ghid Depanare](docs/chapter-07-troubleshooting/debugging.md) - Strategii pas cu pas  
- **🤖 Probleme AI**: [Depanare AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Probleme cu serviciile AI  

#### Exerciții practice  
- Diagnostică eșecurile de implementare  
- Rezolvă probleme de autentificare  
- Depanează conectivitatea serviciilor AI  

**💡 Rezultat capitol**: Diagnostică și rezolvare independentă a problemelor comune de implementare  

---

### 🏢 Capitolul 8: Producție & Modele Enterprise  
**Precondiții**: Capitolele 1-4 finalizate  
**Durata**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐  

#### Ce vei învăța  
- Strategii de implementare în producție  
- Modele enterprise de securitate  
- Monitorizare și optimizare costuri  

#### Resurse de învățare  
- **🏭 Producție**: [Best Practices AI Produție](docs/chapter-08-production/production-ai-practices.md) - Modele enterprise  
- **📝 Exemple**: [Exemplu Microservicii](../../examples/microservices) - Arhitecturi complexe  
- **📊 Monitorizare**: [Integrare Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorizare  

#### Exerciții practice  
- Implementează modele enterprise de securitate  
- Configurează monitorizare cuprinzătoare  
- Implementează în producție cu guvernanță adecvată  

**💡 Rezultat capitol**: Implementarea aplicațiilor pregătite pentru producție cu capabilități complete  

---

## 🎓 Prezentare Workshop: Experiență practică de învățare

> **⚠️ STARE WORKSHOP: Dezvoltare activă**  
> Materialele atelierului sunt în curs de dezvoltare și rafinare. Modulele de bază sunt funcționale, dar unele secțiuni avansate sunt incomplete. Lucrăm activ pentru a finaliza tot conținutul. [Urmărește progresul →](workshop/README.md)

### Materiale Atelier Interactive
**Învățare practică cuprinzătoare cu instrumente bazate pe browser și exerciții ghidate**

Materialele atelierului oferă o experiență de învățare structurată, interactivă, care completează curriculumul pe capitole de mai sus. Atelierul este conceput atât pentru învățare individuală în ritm propriu, cât și pentru sesiuni conduse de instructor.

#### 🛠️ Caracteristicile Atelierului
- **Interfață Bazată pe Browser**: Atelier complet alimentat de MkDocs cu funcții de căutare, copiere și temă
- **Integrare GitHub Codespaces**: Configurare a mediului de dezvoltare cu un singur click
- **Cale de Învățare Structurată**: Exerciții ghidate în 8 module (3-4 ore în total)
- **Metodologie Progresivă**: Introducere → Selecție → Validare → Deconstrucție → Configurare → Personalizare → Demontare → Încheiere
- **Mediu DevContainer Interactiv**: Instrumente și dependențe preconfigurate

#### 📚 Structura Modulului Atelierului
Atelierul urmează o **metodologie progresivă în 8 module** care te duce de la descoperire până la stăpânirea implementării:

| Modul | Subiect | Ce Vei Face | Durată |
|--------|-------|----------------|----------|
| **0. Introducere** | Prezentare Atelier | Înțelege obiectivele de învățare, cerințele prealabile și structura atelierului | 15 min |
| **1. Selecție** | Descoperirea Șabloanelor | Explorează șabloanele AZD și selectează șablonul AI potrivit pentru scenariul tău | 20 min |
| **2. Validare** | Implementare și Verificare | Implementează șablonul cu `azd up` și validează funcționarea infrastructurii | 30 min |
| **3. Deconstrucție** | Înțelege Structura | Folosește GitHub Copilot pentru a explora arhitectura șablonului, fișiere Bicep și organizarea codului | 30 min |
| **4. Configurare** | Analiză detaliată azure.yaml | Stăpânește configurarea fișierului `azure.yaml`, hook-urile lifecycle și variabilele de mediu | 30 min |
| **5. Personalizare** | Fă-l al Tău | Activează AI Search, urmărire, evaluare și personalizează pentru scenariul tău | 45 min |
| **6. Demontare** | Curățare | Deprovisionare sigură a resurselor cu `azd down --purge` | 15 min |
| **7. Încheiere** | Pașii Următori | Recapitulare realizări, concepte cheie și continuă-ți parcursul de învățare | 15 min |

**Fluxul Atelierului:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Începerea Atelierului
```bash
# Opțiunea 1: GitHub Codespaces (Recomandat)
# Faceți clic pe "Code" → "Create codespace on main" în depozit

# Opțiunea 2: Dezvoltare locală
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Urmați instrucțiunile de configurare din workshop/README.md
```

#### 🎯 Rezultatele Învățării în Atelier
Prin finalizarea atelierului, participanții vor:
- **Implementa Aplicații AI în Producție**: Folosește AZD cu serviciile Microsoft Foundry
- **Stăpâni Arhitecturi Multi-Agent**: Implementează soluții AI coordonate cu agenți multipli
- **Aplică Cele Mai Bune Practici de Securitate**: Configurează autentificarea și controlul accesului
- **Optimizează pentru Scalabilitate**: Proiectează implementări performante și eficiente din punct de vedere al costurilor
- **Rezolvă Problemele În Implementări**: Depanează independent problemele comune

#### 📖 Resurse Atelier
- **🎥 Ghid Interactiv**: [Materiale Atelier](workshop/README.md) - Mediu de învățare bazat pe browser
- **📋 Instrucțiuni Modul cu Modul**:
  - [0. Introducere](workshop/docs/instructions/0-Introduction.md) - Prezentare și obiective atelier
  - [1. Selecție](workshop/docs/instructions/1-Select-AI-Template.md) - Găsește și selectează șabloane AI
  - [2. Validare](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementează și verifică șabloanele
  - [3. Deconstrucție](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorează arhitectura șabloanelor
  - [4. Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) - Stăpânește azure.yaml
  - [5. Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizează pentru scenariul tău
  - [6. Demontare](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Curăță resursele
  - [7. Încheiere](workshop/docs/instructions/7-Wrap-up.md) - Recapitulare și pași următori
- **🛠️ Laborator Atelier AI**: [Laborator Atelier AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exerciții axate pe AI
- **💡 Pornire Rapidă**: [Ghid Configurare Atelier](workshop/README.md#quick-start) - Configurarea mediului

**Perfect pentru**: training corporativ, cursuri universitare, învățare autodidactă și bootcamp-uri pentru dezvoltatori.

---

## 📖 Explorare Detaliată: Capabilitățile AZD

Dincolo de elementele de bază, AZD oferă funcționalități puternice pentru implementări în producție:

- **Implementări bazate pe șabloane** - Folosește șabloane predefinite pentru modele comune de aplicații
- **Infrastructură ca și Cod** - Gestionează resurse Azure folosind Bicep sau Terraform  
- **Fluxuri de lucru integrate** - Provisionează, implementează și monitorizează aplicații fără întreruperi
- **Prietenos pentru dezvoltatori** - Optimizat pentru productivitatea și experiența dezvoltatorilor

### **AZD + Microsoft Foundry: Ideal pentru Implementări AI**

**De ce AZD pentru Soluții AI?** AZD răspunde principalelor provocări ale dezvoltatorilor AI:

- **Șabloane Pregătite pentru AI** - Șabloane preconfigurate pentru Azure OpenAI, Cognitive Services și sarcini ML
- **Implementări AI Sigure** - Modele securizate pentru servicii AI, chei API și puncte finale ale modelelor  
- **Modele AI pentru Producție** - Cele mai bune practici pentru implementări AI scalabile și eficiente din punct de vedere al costurilor
- **Fluxuri de lucru AI de la cap la coadă** - De la dezvoltarea modelului la implementarea în producție cu monitorizare corespunzătoare
- **Optimizare Costuri** - Alocare inteligentă a resurselor și strategii de scalare pentru sarcini AI
- **Integrare Microsoft Foundry** - Conexiune fără cusur la catalogul și punctele finale din Microsoft Foundry

---

## 🎯 Bibliotecă Șabloane & Exemple

### Recomandat: Șabloane Microsoft Foundry
**Începe aici dacă implementezi aplicații AI!**

> **Notă:** Aceste șabloane demonstrează diverse modele AI. Unele sunt exemple externe Azure, altele sunt implementări locale.

| Șablon | Capitol | Complexitate | Servicii | Tip |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolul 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolul 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolul 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolul 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolul 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Capitolul 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Recomandat: Scenarii Complete de Învățare
**Șabloane de aplicații gata pentru producție mapate pe capitolele de învățare**

| Șablon | Capitolul de Învățare | Complexitate | Învățare Cheie |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolul 2 | ⭐ | Modele de bază pentru implementare AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolul 2 | ⭐⭐ | Implementare RAG cu Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolul 4 | ⭐⭐ | Integrare Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolul 5 | ⭐⭐⭐ | Cadru agent și apelarea funcțiilor |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolul 8 | ⭐⭐⭐ | Orchestrare AI enterprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolul 5 | ⭐⭐⭐⭐ | Arhitectură multi-agent cu agenți Client și Inventar |

### Învățare după Tipul Exemplului

> **📌 Exemple Locale vs. Externe:**  
> **Exemple Locale** (în acest depozit) = Gata de utilizat imediat  
> **Exemple Externe** (Azure Samples) = Clonează din depozitele legate

#### Exemple Locale (Gata de utilizat)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementare completă gata de producție cu șabloane ARM
  - Arhitectură multi-agent (agenți Client + Inventar)
  - Monitorizare cuprinzătoare și evaluare
  - Implementare cu un singur click prin șablon ARM

#### Exemple Locale - Aplicații Container (Capitolele 2-5)
**Exemple complete de implementare containerizată în acest depozit:**
- [**Exemple Aplicații Container**](examples/container-app/README.md) - Ghid complet pentru implementări containerizate
  - [API Flask Simplu](../../examples/container-app/simple-flask-api) - API REST de bază cu scalare la zero
  - [Arhitectură Microservicii](../../examples/container-app/microservices) - Implementare multi-serviciu gata pentru producție
  - Modele de implementare Quick Start, Producție și Avansate
  - Ghid pentru monitorizare, securitate și optimizare costuri

#### Exemple Externe - Aplicații Simple (Capitolele 1-2)
**Clonează aceste depozite Azure Samples pentru a începe:**
- [Aplicație Web Simplă - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Modele de implementare de bază
- [Site Static - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementare conținut static
- [Aplicație Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementare API REST

#### Exemple Externe - Integrare Bază de Date (Capitolele 3-4)  
- [Aplicație Bază de Date - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Modele de conectivitate bază de date
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flux de lucru serverless pentru date

#### Exemple Externe - Modele Avansate (Capitolele 4-8)
- [Microservicii Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitecturi multi-serviciu
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Procesare în fundal  
- [Pipeline ML Enterprise](https://github.com/Azure-Samples/mlops-v2) - Modele ML gata pentru producție

### Colecții Externe de Șabloane
- [**Galeria Oficială de Șabloane AZD**](https://azure.github.io/awesome-azd/) - Colecție selectă de șabloane oficiale și din comunitate
- [**Șabloane Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentație Microsoft Learn pentru șabloane
- [**Director Exemple**](examples/README.md) - Exemple locale de învățare cu explicații detaliate

---

## 📚 Resurse și Referințe de Învățare

### Referințe Rapide
- [**Fișă Comenzi**](resources/cheat-sheet.md) - Comenzi esențiale azd organizate pe capitole
- [**Glosar**](resources/glossary.md) - Terminologie Azure și azd  
- [**Întrebări Frecvente**](resources/faq.md) - Întrebări uzuale organizate pe capitole de învățare
- [**Ghid de Studiu**](resources/study-guide.md) - Exerciții practice cuprinzătoare

### Ateliere Practice
- [**Laborator Atelier AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fă soluțiile tale AI gata de implementare cu AZD (2-3 ore)
- [**Atelier Interactiv**](workshop/README.md) - Exerciții ghidate în 8 module cu MkDocs și GitHub Codespaces
  - Urmează ordinea: Introducere → Selecție → Validare → Deconstrucție → Configurare → Personalizare → Demontare → Încheiere

### Resurse Externe de Învățare
- Documentația Azure Developer CLI: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Calculator prețuri Azure: https://azure.microsoft.com/pricing/calculator/
- Stare Azure: https://status.azure.com/

---

## 🔧 Ghid Rapid de Depanare

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
<summary><strong>❌ "Cota insuficientă" sau "Cota depășită"</strong></summary>

```bash
# Încearcă altă regiune Azure
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
<summary><strong>❌ "azd up" eșuează la jumătatea procesului</strong></summary>

```bash
# Opțiunea 1: Curățați și încercați din nou
azd down --force --purge
azd up

# Opțiunea 2: Remediați doar infrastructura
azd provision

# Opțiunea 3: Verificați starea detaliată
azd show

# Opțiunea 4: Verificați jurnalele în Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentificare eșuată" sau "Token expirat"</strong></summary>

```bash
# Reautentificare
az logout
az login

azd auth logout
azd auth login

# Verifică autentificarea
az account show
```
</details>

<details>
<summary><strong>❌ "Resursa există deja" sau conflicte de denumire</strong></summary>

```bash
# AZD generează nume unice, dar dacă apare un conflict:
azd down --force --purge

# Atunci încearcă din nou cu un mediu nou
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

# Dacă ești blocat >30 minute, verifică portalul Azure:
azd monitor
# Caută implementări eșuate
```
</details>

<details>
<summary><strong>❌ "Permisiune refuzată" sau "Interzis"</strong></summary>

```bash
# Verificați rolul dvs. Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Aveți nevoie de cel puțin rolul "Contributor"
# Cereți administratorului dvs. Azure să acorde:
# - Contributor (pentru resurse)
# - Administrator de acces utilizator (pentru atribuiri de rol)
```
</details>

<details>
<summary><strong>❌ Nu se găsește URL-ul aplicației implementate</strong></summary>

```bash
# Arată toate punctele finale ale serviciului
azd show

# Sau deschide Portalul Azure
azd monitor

# Verifică serviciul specific
azd env get-values
# Caută variabilele *_URL
```
</details>

### 📚 Resurse complete pentru depanare

- **Ghid probleme comune:** [Soluții Detaliate](docs/chapter-07-troubleshooting/common-issues.md)
- **Probleme specifice AI:** [Depanare AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Ghid de depanare:** [Depanare pas cu pas](docs/chapter-07-troubleshooting/debugging.md)
- **Obține ajutor:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Finalizarea cursului și certificarea

### Urmărirea progresului
Urmărește-ți progresul de învățare prin fiecare capitol:

- [ ] **Capitolul 1**: Baze & Pornire rapidă ✅  
- [ ] **Capitolul 2**: Dezvoltare cu AI în prim-plan ✅  
- [ ] **Capitolul 3**: Configurare & Autentificare ✅  
- [ ] **Capitolul 4**: Infrastructură ca Cod & Implementare ✅  
- [ ] **Capitolul 5**: Soluții AI multi-agent ✅  
- [ ] **Capitolul 6**: Validare & Planificare pre-implementare ✅  
- [ ] **Capitolul 7**: Depanare & Debugging ✅  
- [ ] **Capitolul 8**: Modele de producție & enterprise ✅

### Verificarea cunoștințelor
După fiecare capitol, verifică-ți cunoștințele prin:  
1. **Exercițiu practic**: Finalizează implementarea practică a capitolului  
2. **Test cunoștințe**: Revizuiește secțiunea FAQ pentru capitolul tău  
3. **Discuție în comunitate**: Împărtășește experiența ta în Azure Discord  
4. **Capitol următor**: Trece la nivelul următor de complexitate

### Beneficii la finalizarea cursului
După ce finalizezi toate capitolele, vei avea:  
- **Experiență de producție**: Aplicații AI reale implementate pe Azure  
- **Competențe profesionale**: Capacitate de implementare pregătită pentru mediul enterprise  
- **Recunoaștere în comunitate**: Membru activ în comunitatea dezvoltatorilor Azure  
- **Avansare în carieră**: Expertiză cerută în AZD și implementarea AI

---

## 🤝 Comunitate & Suport

### Obține ajutor & suport
- **Probleme tehnice**: [Raportează erori și solicită funcționalități](https://github.com/microsoft/azd-for-beginners/issues)  
- **Întrebări de învățare**: [Comunitatea Microsoft Azure Discord](https://discord.gg/microsoft-azure) și [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **Ajutor specific AI**: Alătură-te [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **Documentație**: [Documentația oficială Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Sondaje din comunitatea Microsoft Foundry Discord

**Rezultate recente din canalul #Azure:**  
- **45%** dintre dezvoltatori vor să folosească AZD pentru sarcini AI  
- **Provocările principale**: Implementări multi-servicii, gestionarea credențialelor, pregătire pentru producție  
- **Cele mai solicitate**: Șabloane specifice AI, ghiduri de depanare, bune practici

**Alătură-te comunității noastre pentru a:**  
- Împărtăși experiențe AZD + AI și primi ajutor  
- Accesa previzualizări timpurii ale noilor șabloane AI  
- Contribui la cele mai bune practici pentru implementarea AI  
- Influența dezvoltarea viitoarelor funcționalități AI + AZD

### Contribuții la curs
Sunt binevenite contribuțiile! Te rugăm să citești [Ghidul de contribuții](CONTRIBUTING.md) pentru detalii despre:  
- **Îmbunătățiri de conținut**: Îmbunătățește capitolele și exemplele existente  
- **Exemple noi**: Adaugă scenarii și șabloane din lumea reală  
- **Traduceri**: Ajută la menținerea suportului multilingv  
- **Raportare bug-uri**: Crește acuratețea și claritatea  
- **Standardele comunității**: Urmează ghidurile noastre incluzive

---

## 📄 Informații despre curs

### Licență
Acest proiect este licențiat sub Licența MIT - vezi fișierul [LICENSE](../../LICENSE) pentru detalii.

### Resurse Microsoft Learning conexe

Echipa noastră produce alte cursuri de învățare cuprinzătoare:

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
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Învățare de bază
[![ML pentru Începători](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science pentru Începători](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pentru Începători](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity pentru Începători](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev pentru Începători](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pentru Începători](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development pentru Începători](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria Copilot
[![Copilot pentru programare asistată AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pentru C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ Navigarea cursului

**🚀 Pregătit să începi să înveți?**

**Începători**: Începe cu [Capitolul 1: Fundație & Pornire rapidă](../..)  
**Dezvoltatori AI**: Sari la [Capitolul 2: Dezvoltare AI-First](../..)  
**Dezvoltatori experimentați**: Începe cu [Capitolul 3: Configurare & Autentificare](../..)

**Pașii următori**: [Începe Capitolul 1 - Bazele AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinarea răspunderii**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu suntem responsabili pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->