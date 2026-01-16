<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T14:51:26+00:00",
  "source_file": "README.md",
  "language_code": "ro"
}
-->
# AZD pentru Începători: O Călătorie de Învățare Structurată

![AZD-for-beginners](../../../../translated_images/ro/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Începutul cu Acest Curs

Urmărește acești pași pentru a începe călătoria ta de învățare AZD:

1. **Fă Fork la Repozitoriu**: Click [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonează Repozitoriul**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Alătură-te Comunității**: [Comunități Discord Azure](https://discord.com/invite/ByRwuEEgH4) pentru suport de specialitate
4. **Alege Calea Ta de Învățare**: Selectează un capitol de mai jos care corespunde nivelului tău de experiență

### Suport Multilingv

#### Traduceri Automatizate (Întotdeauna Actualizate)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](./README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Preferi să Clonezi Local?**

> Acest repo conține traduceri în peste 50 de limbi, ceea ce crește semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Acest lucru îți oferă tot ce ai nevoie să finalizezi cursul cu o descărcare mult mai rapidă.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Prezentarea Cursului

Stăpânește Azure Developer CLI (azd) prin capitole structurate concepute pentru o învățare progresivă. **Focalizare specială pe implementarea aplicațiilor AI cu integrarea Microsoft Foundry.**

### De Ce Este Esențial Acest Curs Pentru Dezvoltatorii Moderni

Bazat pe informațiile comunității Microsoft Foundry Discord, **45% dintre dezvoltatori doresc să folosească AZD pentru sarcini AI**, dar întâlnesc provocări legate de:
- Arhitecturi AI complexe multi-serviciu
- Cele mai bune practici pentru implementarea AI în producție  
- Integrarea și configurarea serviciilor Azure AI
- Optimizarea costurilor pentru sarcini AI
- Depanarea problemelor specifice implementărilor AI

### Obiectivele Învățării

Prin finalizarea acestui curs structurat vei:
- **Stăpâni Bazele AZD**: concepte de bază, instalare și configurare
- **Implementa Aplicații AI**: folosește AZD cu serviciile Microsoft Foundry
- **Implementa Infrastructure as Code**: gestionează resurse Azure cu șabloane Bicep
- **Depana Implementări**: rezolvă probleme comune și debugează
- **Optimizează pentru Producție**: securitate, scalare, monitorizare și managementul costurilor
- **Construiește Soluții Multi-Agent**: implementează arhitecturi AI complexe

## 📚 Capitole de Învățare

*Alege-ți calea de învățare în funcție de nivel și obiective*

### 🚀 Capitolul 1: Fundament și Pornire Rapidă
**Prerechizite**: abonament Azure, cunoștințe de bază despre linia de comandă  
**Durată**: 30-45 minute  
**Complexitate**: ⭐

#### Ce Vei Învăța
- Înțelegerea bazelor Azure Developer CLI
- Instalarea AZD pe platforma ta
- Prima ta implementare reușită

#### Resurse de Învațare
- **🎯 Începe Aici**: [Ce este Azure Developer CLI?](../..)
- **📖 Teorie**: [Bazele AZD](docs/getting-started/azd-basics.md) - concepte și terminologie esențială
- **⚙️ Configurare**: [Instalare & Configurare](docs/getting-started/installation.md) - ghiduri specifice platformei
- **🛠️ Practic**: [Primul Tău Proiect](docs/getting-started/first-project.md) - tutorial pas cu pas
- **📋 Referință Rapidă**: [Fișă de Comenzi](resources/cheat-sheet.md)

#### Exerciții Practice
```bash
# Verificare rapidă a instalării
azd version

# Lansați prima dvs. aplicație
azd init --template todo-nodejs-mongo
azd up
```

**💡 Rezultatul Capitolului**: Implementarea cu succes a unei aplicații web simple pe Azure folosind AZD

**✅ Validarea Succesului:**
```bash
# După finalizarea Capitolului 1, ar trebui să fiți capabil să:
azd version              # Afișează versiunea instalată
azd init --template todo-nodejs-mongo  # Inițializează proiectul
azd up                  # Face deploy pe Azure
azd show                # Afișează URL-ul aplicației care rulează
# Aplicația se deschide în browser și funcționează
azd down --force --purge  # Curăță resursele
```

**📊 Investiție de Timp:** 30-45 minute  
**📈 Nivel de Competență După:** Poate implementa aplicații de bază independent

**✅ Validarea Succesului:**
```bash
# După finalizarea Capitolului 1, ar trebui să puteți:
azd version              # Afișează versiunea instalată
azd init --template todo-nodejs-mongo  # Inițializează proiectul
azd up                  # Deplasează către Azure
azd show                # Afișează URL-ul aplicației în execuție
# Aplicația se deschide în browser și funcționează
azd down --force --purge  # Curăță resursele
```

**📊 Investiție de Timp:** 30-45 minute  
**📈 Nivel de Competență După:** Poate implementa aplicații de bază independent

---

### 🤖 Capitolul 2: Dezvoltare AI-First (Recomandat pentru Dezvoltatori AI)
**Prerechizite**: Capitolul 1 finalizat  
**Durată**: 1-2 ore  
**Complexitate**: ⭐⭐

#### Ce Vei Învăța
- Integrarea Microsoft Foundry cu AZD
- Implementarea aplicațiilor alimentate de AI
- Înțelegerea configurațiilor serviciilor AI

#### Resurse de Învațare
- **🎯 Începe Aici**: [Integrarea Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Modele**: [Implementarea Modelului AI](docs/microsoft-foundry/ai-model-deployment.md) - publică și gestionează modele AI
- **🛠️ Atelier**: [Laborator AI Workshop](docs/microsoft-foundry/ai-workshop-lab.md) - Pregătește soluțiile tale AI pentru AZD
- **🎥 Ghid Interactiv**: [Materiale Workshop](workshop/README.md) - Învățare în browser cu MkDocs * Mediu DevContainer
- **📋 Șabloane**: [Șabloane Microsoft Foundry](../..)
- **📝 Exemple**: [Exemple Implementări AZD](examples/README.md)

#### Exerciții Practice
```bash
# Lansați prima dvs. aplicație AI
azd init --template azure-search-openai-demo
azd up

# Încercați șabloane AI suplimentare
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Rezultatul Capitolului**: Implementarea și configurarea unei aplicații AI chat cu capabilități RAG

**✅ Validarea Succesului:**
```bash
# După Capitolul 2, ar trebui să puteți:
azd init --template azure-search-openai-demo
azd up
# Testați interfața de chat AI
# Puneți întrebări și primiți răspunsuri generate de AI cu surse
# Verificați dacă integrarea căutării funcționează
azd monitor  # Verificați dacă Application Insights afișează telemetria
azd down --force --purge
```

**📊 Investiție de Timp:** 1-2 ore  
**📈 Nivel de Competență După:** Poate implementa și configura aplicații AI gata pentru producție  
**💰 Conștientizare Costuri:** Înțelege costurile de dev de 80-150$/lună, costurile de producție 300-3500$/lună

#### 💰 Considerații privind Costurile pentru Implementări AI

**Mediu de Dezvoltare (Estimativ 80-150$/lună):**
- Azure OpenAI (Plată pe consum): 0-50$/lună (în funcție de utilizarea token-urilor)
- AI Search (nivel Basic): 75$/lună
- Container Apps (consum): 0-20$/lună
- Stocare (Standard): 1-5$/lună

**Mediu de Producție (Estimativ 300-3,500+/lună):**
- Azure OpenAI (PTU pentru performanță consecventă): 3,000+/lună SAU Plată pe consum cu volum mare
- AI Search (nivel Standard): 250$/lună
- Container Apps (dedicat): 50-100$/lună
- Application Insights: 5-50$/lună
- Stocare (Premium): 10-50$/lună

**💡 Sfaturi pentru Optimizarea Costurilor:**
- Folosește Azure OpenAI în nivelul Free Tier pentru învățare (inclus 50,000 tokeni/lună)
- Rulează `azd down` pentru a elibera resursele când nu dezvolți activ
- Pornește cu facturare pe consum, upgradează la PTU doar pentru producție
- Folosește `azd provision --preview` pentru a estima costurile înainte de implementare
- Activează auto-scalarea: plătești doar pentru utilizarea efectivă

**Monitorizarea Costurilor:**
```bash
# Verificați costurile lunare estimate
azd provision --preview

# Monitorizați costurile reale în Portalul Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capitolul 3: Configurare & Autentificare
**Prerechizite**: Capitolul 1 finalizat  
**Durată**: 45-60 minute  
**Complexitate**: ⭐⭐

#### Ce Vei Învăța
- Configurarea și gestionarea mediului
- Cele mai bune practici de autentificare și securitate
- Denumirea și organizarea resurselor

#### Resurse de Învațare
- **📖 Configurare**: [Ghid Configurare](docs/getting-started/configuration.md) - Configurarea mediului
- **🔐 Securitate**: [Modele de autentificare și identitate gestionată](docs/getting-started/authsecurity.md) - Modele autentificare
- **📝 Exemple**: [Exemplu Aplicație Bază de Date](examples/database-app/README.md) - Exemple AZD bază de date

#### Exerciții Practice
- Configurează medii multiple (dev, staging, prod)
- Configurează autentificarea cu identitate gestionată
- Implementarea configurațiilor specifice fiecărui mediu

**💡 Rezultatul Capitolului**: Gestionează multiple medii cu autentificare și securitate corespunzătoare

---

### 🏗️ Capitolul 4: Infrastructure as Code & Implementare
**Prerechizite**: Capitolele 1-3 finalizate  
**Durată**: 1-1.5 ore  
**Complexitate**: ⭐⭐⭐

#### Ce Vei Învăța
- Modele avansate de implementare
- Infrastructure as Code cu Bicep
- Strategii de provisioning pentru resurse

#### Resurse de Învațare
- **📖 Implementare**: [Ghid de Implementare](docs/deployment/deployment-guide.md) - Fluxuri complete
- **🏗️ Provisionare**: [Provisionarea Resurselor](docs/deployment/provisioning.md) - Management resurse Azure
- **📝 Exemple**: [Exemplu Container App](../../examples/container-app) - Implementări containerizate

#### Exerciții Practice
- Creează șabloane Bicep personalizate
- Implementă aplicații multi-serviciu
- Aplică strategii de implementare blue-green

**💡 Rezultatul Capitolului**: Implementează aplicații complexe multi-serviciu folosind șabloane de infrastructură personalizate

---

### 🎯 Capitolul 5: Soluții AI Multi-Agent (Avansat)
**Prerechizite**: Capitolele 1-2 finalizate  
**Durată**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce Vei Învăța
- Modele arhitecturale multi-agent
- Orchestrarea și coordonarea agenților  
- Implementări AI pregătite pentru producție

#### Resurse de Învățare
- **🤖 Proiect Recomandat**: [Soluție Multi-Agent pentru Retail](examples/retail-scenario.md) - Implementare completă  
- **🛠️ Șabloane ARM**: [Pachet Șabloane ARM](../../examples/retail-multiagent-arm-template) - Implementare cu un singur clic  
- **📖 Arhitectură**: [Tipare de coordonare multi-agent](/docs/pre-deployment/coordination-patterns.md) - Tipare

#### Exerciții Practice  
```bash
# Lansați soluția completă multi-agent pentru retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorați configurațiile agenților
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Rezultat Capitol**: Implementați și gestionați o soluție AI multi-agent pregătită pentru producție cu agenții Clienți și Inventar

---

### 🔍 Capitolul 6: Validare și Planificare Pre-Implementare  
**Prerechizite**: Capitolul 4 finalizat  
**Durată**: 1 oră  
**Complexitate**: ⭐⭐

#### Ce Veți Învăța  
- Planificarea capacității și validarea resurselor  
- Strategii de selecție SKU  
- Verificări prealabile și automatizări

#### Resurse de Învățare  
- **📊 Planificare**: [Planificarea Capacității](docs/pre-deployment/capacity-planning.md) - Validarea resurselor  
- **💰 Selecție**: [Selecția SKU](docs/pre-deployment/sku-selection.md) - Alegeri eficiente din punct de vedere al costurilor  
- **✅ Validare**: [Verificări Preflight](docs/pre-deployment/preflight-checks.md) - Scripturi automate

#### Exerciții Practice  
- Rulați scripturi de validare a capacității  
- Optimizați selecțiile SKU pentru cost  
- Implementați verificări automate pre-implementare

**💡 Rezultat Capitol**: Validați și optimizați implementările înainte de execuție

---

### 🚨 Capitolul 7: Depanare și Debugging  
**Prerechizite**: Orice capitol privind implementarea finalizat  
**Durată**: 1-1.5 ore  
**Complexitate**: ⭐⭐

#### Ce Veți Învăța  
- Metode sistematice de debugging  
- Probleme comune și soluții  
- Depanare specifică AI

#### Resurse de Învățare  
- **🔧 Probleme Comune**: [Probleme Comune](docs/troubleshooting/common-issues.md) - Întrebări frecvente și soluții  
- **🕵️ Debugging**: [Ghid de Debugging](docs/troubleshooting/debugging.md) - Strategii pas cu pas  
- **🤖 Probleme AI**: [Depanare Specifică AI](docs/troubleshooting/ai-troubleshooting.md) - Probleme cu serviciile AI

#### Exerciții Practice  
- Diagnosticați eșecurile de implementare  
- Rezolvați probleme de autentificare  
- Debugging pentru conectivitatea serviciilor AI

**💡 Rezultat Capitol**: Diagnosticați și rezolvați independent problemele comune de implementare

---

### 🏢 Capitolul 8: Tipare pentru Producție și Întreprinderi  
**Prerechizite**: Capitolele 1-4 finalizate  
**Durată**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce Veți Învăța  
- Strategii pentru implementări în producție  
- Tipare de securitate pentru întreprinderi  
- Monitorizare și optimizare costuri

#### Resurse de Învățare  
- **🏭 Producție**: [Cele Mai Bune Practici AI în Producție](docs/microsoft-foundry/production-ai-practices.md) - Tipare pentru întreprinderi  
- **📝 Exemple**: [Exemplu Microservicii](../../examples/microservices) - Arhitecturi complexe  
- **📊 Monitorizare**: [Integrare Application Insights](docs/pre-deployment/application-insights.md) - Monitorizare

#### Exerciții Practice  
- Implementați tipare de securitate pentru întreprinderi  
- Configurați monitorizare completă  
- Implementați în producție cu guvernanță adecvată

**💡 Rezultat Capitol**: Implementați aplicații enterprise pregătite pentru producție cu capacități complete

---

## 🎓 Prezentare Generală Workshop: Experiență Practică

> **⚠️ STATUS WORKSHOP: Dezvoltare Activă**  
> Materialele pentru workshop sunt în curs de dezvoltare și rafinare. Modulele principale sunt funcționale, dar unele secțiuni avansate sunt incomplete. Lucrăm activ pentru finalizarea întregului conținut. [Urmăriți progresul →](workshop/README.md)

### Materiale Interactive pentru Workshop  
**Experiență de învățare practică completă cu instrumente browser și exerciții ghidate**

Materialele noastre oferă o experiență de învățare structurată și interactivă, care completează curriculum-ul pe capitole prezentat mai sus. Workshop-ul este conceput atât pentru învățare individuală, cât și pentru sesiuni conduse de instructor.

#### 🛠️ Caracteristici Workshop  
- **Interfață Browser**: Workshop complet bazat pe MkDocs cu funcții de căutare, copiere și temă  
- **Integrare GitHub Codespaces**: Configurare mediu dezvoltare cu un clic  
- **Curs Structurat**: 7 exerciții ghidate (3.5 ore total)  
- **Descoperire → Implementare → Personalizare**: Metodologie progresivă  
- **Mediu DevContainer Interactiv**: Instrumente și dependențe preconfigurate

#### 📚 Structura Workshop  
Workshop-ul urmează metodologia **Descoperire → Implementare → Personalizare**:

1. **Faza de Descoperire** (45 min)  
   - Explorați șabloane Microsoft Foundry și servicii  
   - Înțelegeți tiparele arhitecturale multi-agent  
   - Revizuiți cerințele și prerechizitele implementării  

2. **Faza de Implementare** (2 ore)  
   - Implementați practic aplicații AI cu AZD  
   - Configurați servicii și endpoint-uri Azure AI  
   - Implementați tipare de securitate și autentificare  

3. **Faza de Personalizare** (45 min)  
   - Modificați aplicațiile pentru cazuri de utilizare specifice  
   - Optimizați pentru implementare în producție  
   - Implementați monitorizare și gestionare a costurilor

#### 🚀 Începerea Workshop-ului  
```bash
# Opțiunea 1: GitHub Codespaces (Recomandat)
# Dați clic pe "Code" → "Create codespace on main" în depozit

# Opțiunea 2: Dezvoltare locală
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Urmați instrucțiunile de configurare din workshop/README.md
```
  
#### 🎯 Rezultate de Învățare Workshop  
La finalizarea workshop-ului, participanții vor:  
- **Implementa Aplicații AI pentru Producție**: Folosi AZD cu servicii Microsoft Foundry  
- **Stăpâni Arhitecturi Multi-Agent**: Implementa soluții AI coordonate cu agenți  
- **Aplica Cele Mai Bune Practici de Securitate**: Configura autentificare și control acces  
- **Optimizeze pentru Scalabilitate**: Proiecteze implementări eficiente din punct de vedere al costurilor și performanței  
- **Depaneze Implementările**: Rezolve independent probleme frecvente

#### 📖 Resurse pentru Workshop  
- **🎥 Ghid Interactiv**: [Materiale Workshop](workshop/README.md) - Mediu de învățare în browser  
- **📋 Instrucțiuni Pas cu Pas**: [Exerciții Ghidate](../../workshop/docs/instructions) - Parcurgeri detaliate  
- **🛠️ Laborator AI Workshop**: [Laborator AI Workshop](docs/microsoft-foundry/ai-workshop-lab.md) - Exerciții axate pe AI  
- **💡 Start Rapid**: [Ghid de Configurare Workshop](workshop/README.md#quick-start) - Configurarea mediului

**Perfect pentru**: training corporativ, cursuri universitare, învățare autodidactă și bootcamp-uri pentru dezvoltatori.

---

## 📖 Ce este Azure Developer CLI?

Azure Developer CLI (azd) este o interfață de linie de comandă centrată pe dezvoltator care accelerează procesul de construire și implementare a aplicațiilor pe Azure. Oferă:

- **Implementări bazate pe șabloane** - Folosiți șabloane predefinite pentru tipare comune de aplicații  
- **Infrastructură ca și Cod** - Gestionați resurse Azure folosind Bicep sau Terraform  
- **Fluxuri de lucru integrate** - Provisionați, implementați și monitorizați aplicații fără întreruperi  
- **Prietenos dezvoltatorilor** - Optimizat pentru productivitate și experiență de dezvoltare

### **AZD + Microsoft Foundry: Ideal pentru Implementări AI**

**De ce AZD pentru soluții AI?** AZD rezolvă principalele provocări cu care se confruntă dezvoltatorii AI:

- **Șabloane pregătite pentru AI** - Șabloane preconfigurate pentru Azure OpenAI, Cognitive Services și sarcini ML  
- **Implementări AI securizate** - Tipare de securitate integrate pentru servicii AI, chei API și endpoint-uri modele  
- **Tipare AI pentru producție** - Cele mai bune practici pentru implementări AI scalabile și eficiente din punct de vedere al costurilor  
- **Fluxuri end-to-end AI** - De la dezvoltarea modelelor până la implementarea în producție cu monitorizare corespunzătoare  
- **Optimizare costuri** - Alocare inteligentă a resurselor și strategii de scalare pentru sarcini AI  
- **Integrare Microsoft Foundry** - Conexiune fluentă la catalogul de modele și endpoint-uri Microsoft Foundry

---

## 🎯 Bibliotecă Șabloane & Exemple

### Recomandate: Șabloane Microsoft Foundry  
**Începeți aici dacă implementați aplicații AI!**

> **Notă:** Aceste șabloane demonstrează diverse tipare AI. Unele sunt exemple externe Azure, altele implementări locale.

| Șablon | Capitol | Complexitate | Servicii | Tip |
|--------|---------|--------------|----------|-----|
| [**Începe cu chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Începe cu agenți AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolul 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolul 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolul 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolul 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolul 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Soluție Multi-Agent pentru Retail**](examples/retail-scenario.md) | Capitolul 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Recomandate: Scenarii Complete de Învățare  
**Șabloane de aplicații pregătite pentru producție, mapate pe capitole de învățare**

| Șablon | Capitol Învățare | Complexitate | Învățare Cheie |
|--------|------------------|--------------|----------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolul 2 | ⭐ | Tipare de bază pentru implementări AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolul 2 | ⭐⭐ | Implementare RAG cu Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolul 4 | ⭐⭐ | Integrare Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolul 5 | ⭐⭐⭐ | Cadru agent și apelare funcții |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolul 8 | ⭐⭐⭐ | Orchestrare AI enterprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolul 5 | ⭐⭐⭐⭐ | Arhitectură multi-agent cu agenți Client și Inventar |

### Învățare prin Tipul Exemplului

> **📌 Exemple Locale vs. Externe:**  
> **Exemple Locale** (în acest repo) = Disponibile imediat  
> **Exemple Externe** (Azure Samples) = Se clonează din repozitoriile indicate

#### Exemple Locale (Disponibile Imediat)  
- [**Soluție Multi-Agent pentru Retail**](examples/retail-scenario.md) - Implementare completă pregătită pentru producție cu șabloane ARM  
  - Arhitectură multi-agent (agenți Client + Inventar)  
  - Monitorizare și evaluare cuprinzătoare  
  - Implementare cu un clic prin șablon ARM

#### Exemple Locale - Aplicații Container (Capitolele 2-5)  
**Exemple complete de implementări container în acest depozit:**  
- [**Exemple Container App**](examples/container-app/README.md) - Ghid complet pentru implementări containerizate  
  - [API simplu Flask](../../examples/container-app/simple-flask-api) - API REST de bază cu scalare la zero  
  - [Arhitectură Microservicii](../../examples/container-app/microservices) - Implementare multi-serviciu pregătită pentru producție  
  - Tipare de implementare Quick Start, Producție și Avansate  
  - Instrucțiuni pentru monitorizare, securitate și optimizare costuri

#### Exemple Externe - Aplicații Simple (Capitolele 1-2)  
**Clonați aceste repozitorii Azure Samples pentru a începe:**  
- [Aplicație Web Simplă - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Tipare de implementare de bază  
- [Site Static - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementare conținut static  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementare API REST

#### Exemple Externe - Integrare Baze de Date (Capitolele 3-4)  
- [Aplicație Bază de Date - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tipare conectivitate baze de date  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flux de date serverless

#### Exemple Externe - Tipare Avansate (Capitolele 4-8)  
- [Microservicii Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitecturi multi-serviciu  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Procesare în background  
- [Pipeline ML Enterprise](https://github.com/Azure-Samples/mlops-v2) - Tipare ML pregătite pentru producție

### Colecții de Șabloane Externe  
- [**Galeria Oficială Șabloane AZD**](https://azure.github.io/awesome-azd/) - Colecție curată de șabloane oficiale și comunitare  
- [**Șabloane Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentație șabloane Microsoft Learn
- [**Directorul Exemplurilor**](examples/README.md) - Exemple locale de învățare cu explicații detaliate

---

## 📚 Resurse și Referințe pentru Învățare

### Referințe rapide
- [**Fișa cu comenzi esențiale**](resources/cheat-sheet.md) - Comenzile esențiale azd organizate pe capitole
- [**Glosar**](resources/glossary.md) - Terminologie Azure și azd  
- [**Întrebări frecvente**](resources/faq.md) - Întrebări comune organizate pe capitole de învățare
- [**Ghid de studiu**](resources/study-guide.md) - Exerciții practice cuprinzătoare

### Workshop-uri practice
- [**Laboratorul Workshop AI**](docs/microsoft-foundry/ai-workshop-lab.md) - Faceți soluțiile AI deployabile cu AZD (2-3 ore)
- [**Ghid workshop interactiv**](workshop/README.md) - Workshop bazat pe browser cu MkDocs și mediu DevContainer
- [**Traseu structurat de învățare**](../../workshop/docs/instructions) - Exerciții ghidate în 7 pași (Descoperire → Deploy → Personalizare)
- [**Workshop AZD pentru începători**](workshop/README.md) - Materiale complete de workshop hands-on cu integrare GitHub Codespaces

### Resurse externe de învățare
- Documentația Azure Developer CLI: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Centrul de arhitectură Azure: https://learn.microsoft.com/en-us/azure/architecture/
- Calculatorul de prețuri Azure: https://azure.microsoft.com/pricing/calculator/
- Status Azure: https://status.azure.com/

---

## 🔧 Ghid rapid de depanare

**Probleme comune întâmpinate de începători și soluții imediate:**

### ❌ "azd: command not found"

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

### ❌ "Nu a fost găsit niciun abonament" sau "Abonamentul nu a fost setat"

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

### ❌ "InsufficientQuota" sau "Cota depășită"

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

### ❌ „azd up” eșuează la jumătatea procesului

```bash
# Opțiunea 1: Curăță și încearcă din nou
azd down --force --purge
azd up

# Opțiunea 2: Doar repară infrastructura
azd provision

# Opțiunea 3: Verifică jurnalele detaliate
azd show
azd logs
```

### ❌ "Autentificare eșuată" sau "Token expirat"

```bash
# Reautentificare
az logout
az login

azd auth logout
azd auth login

# Verifică autentificarea
az account show
```

### ❌ "Resursa există deja" sau conflicte de denumire

```bash
# AZD generează nume unice, dar dacă apare un conflict:
azd down --force --purge

# Atunci încearcă din nou cu un mediu nou
azd env new dev-v2
azd up
```

### ❌ Deploy-ul template-ului durează prea mult

**Timpi normali de așteptare:**
- Aplicație web simplă: 5-10 minute
- Aplicație cu bază de date: 10-15 minute
- Aplicații AI: 15-25 minute (provisionarea OpenAI este lentă)

```bash
# Verifică progresul
azd show

# Dacă ești blocat >30 de minute, verifică Azure Portal:
azd monitor
# Caută implementări eșuate
```

### ❌ "Permisiune refuzată" sau "Interzis"

```bash
# Verificați rolul dvs. Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Aveți nevoie cel puțin de rolul "Contributor"
# Cereți administratorului Azure să acorde:
# - Contributor (pentru resurse)
# - Administrator Acces Utilizatori (pentru atribuiri de rol)
```

### ❌ Nu se găsește URL-ul aplicației deployate

```bash
# Afișează toate punctele finale ale serviciului
azd show

# Sau deschideți Portalul Azure
azd monitor

# Verificați serviciul specific
azd env get-values
# Căutați variabilele *_URL
```

### 📚 Resurse complete de depanare

- **Ghid Probleme Comune:** [Soluții detaliate](docs/troubleshooting/common-issues.md)
- **Probleme specifice AI:** [Depanare AI](docs/troubleshooting/ai-troubleshooting.md)
- **Ghid de depanare:** [Depanare pas cu pas](docs/troubleshooting/debugging.md)
- **Cere ajutor:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Ghid rapid de depanare

**Probleme comune întâmpinate de începători și soluții imediate:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Instalează mai întâi AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifică instalarea
azd version
```
</details>

<details>
<summary><strong>❌ "Nu a fost găsit niciun abonament" sau "Abonamentul nu a fost setat"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" sau "Cota depășită"</strong></summary>

```bash
# Încercați o regiune Azure diferită
azd env set AZURE_LOCATION "westus2"
azd up

# Sau utilizați SKU-uri mai mici în dezvoltare
# Editează infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ „azd up” eșuează la jumătatea procesului</strong></summary>

```bash
# Opțiunea 1: Curățați și încercați din nou
azd down --force --purge
azd up

# Opțiunea 2: Doar reparați infrastructura
azd provision

# Opțiunea 3: Verificați jurnalele detaliate
azd show
azd logs
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
# AZD generează nume unice, dar dacă apare conflict:
azd down --force --purge

# Atunci încearcă din nou cu un mediu nou
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Deploy-ul template-ului durează prea mult</strong></summary>

**Timpi normali de așteptare:**
- Aplicație web simplă: 5-10 minute
- Aplicație cu bază de date: 10-15 minute
- Aplicații AI: 15-25 minute (provisionarea OpenAI este lentă)

```bash
# Verifică progresul
azd show

# Dacă este blocat >30 minute, verifică portalul Azure:
azd monitor
# Caută implementări eșuate
```
</details>

<details>
<summary><strong>❌ "Permisiune refuzată" sau "Interzis"</strong></summary>

```bash
# Verifică rolul tău în Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Ai nevoie cel puțin de rolul „Contributor”
# Cere administratorului tău Azure să acorde:
# - Contributor (pentru resurse)
# - User Access Administrator (pentru atribuirea rolurilor)
```
</details>

<details>
<summary><strong>❌ Nu se găsește URL-ul aplicației deployate</strong></summary>

```bash
# Afișați toate punctele finale ale serviciului
azd show

# Sau deschideți Portalul Azure
azd monitor

# Verificați serviciul specific
azd env get-values
# Căutați variabilele *_URL
```
</details>

### 📚 Resurse complete de depanare

- **Ghid Probleme Comune:** [Soluții detaliate](docs/troubleshooting/common-issues.md)
- **Probleme specifice AI:** [Depanare AI](docs/troubleshooting/ai-troubleshooting.md)
- **Ghid de depanare:** [Depanare pas cu pas](docs/troubleshooting/debugging.md)
- **Cere ajutor:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Finalizarea cursului și certificare

### Monitorizarea progresului
Urmăriți progresul de învățare prin fiecare capitol:

- [ ] **Capitolul 1**: Fundamente & Start rapid ✅
- [ ] **Capitolul 2**: Dezvoltare AI-First ✅  
- [ ] **Capitolul 3**: Configurare & Autentificare ✅
- [ ] **Capitolul 4**: Infrastructură ca cod & Deploy ✅
- [ ] **Capitolul 5**: Soluții AI multi-agent ✅
- [ ] **Capitolul 6**: Validare & Planificare pre-deploy ✅
- [ ] **Capitolul 7**: Depanare & Debugging ✅
- [ ] **Capitolul 8**: Modele de producție & enterprise ✅

### Verificarea învățării
După finalizarea fiecărui capitol, verificați cunoștințele astfel:
1. **Exercițiu practic**: Finalizați deploy-ul hands-on din capitol
2. **Test de cunoștințe**: Consultați secțiunea FAQ pentru capitol
3. **Discuție comunitară**: Împărtășiți experiența pe Discord Azure
4. **Capitolul următor**: Trecerea la nivelul următor de complexitate

### Beneficiile finalizării cursului
După terminarea tuturor capitolelor, veți avea:
- **Experiență de producție**: Aplicații AI reale deployate pe Azure
- **Competențe profesionale**: Capabilități de deploy pregătite pentru enterprise  
- **Recunoaștere comunitară**: Membru activ al comunității dezvoltatorilor Azure
- **Avansare în carieră**: Expertiză cerută AZD și deploy AI

---

## 🤝 Comunitate & Suport

### Obține ajutor și suport
- **Probleme tehnice**: [Raportează bug-uri și cere funcții noi](https://github.com/microsoft/azd-for-beginners/issues)
- **Întrebări de învățare**: [Comunitatea Microsoft Azure Discord](https://discord.gg/microsoft-azure) și [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajutor specific AI**: Alăturați-vă [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentație**: [Documentația oficială Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insight-uri comunitare de pe Discord Microsoft Foundry

**Rezultate recente ale sondajului din canalul #Azure:**
- **45%** dintre dezvoltatori doresc să folosească AZD pentru sarcini AI
- **Provocări principale**: Deploy multi-servicii, gestionare credentiale, pregătire producție  
- **Cele mai cerute**: Template-uri specifice AI, ghiduri de depanare, bune practici

**Alăturați-vă comunității pentru a:**
- Împărtăși experiențele AZD + AI și primi suport
- Accesa previzualizări timpurii ale noilor template-uri AI
- Contribui la bune practici de deploy AI
- Influența dezvoltarea viitoarelor funcționalități AI + AZD

### Contribuții la curs
Bineveniți să contribuiți! Vă rugăm să citiți [Ghidul de Contribuție](CONTRIBUTING.md) pentru detalii despre:
- **Îmbunătățirea conținutului**: Perfecționarea capitolelor și exemplelor existente
- **Exemple noi**: Adăugarea de scenarii și template-uri din lumea reală  
- **Traduceri**: Ajutor pentru menținerea suportului multi-lingvistic
- **Raportare bug-uri**: Sporirea acurateței și clarității
- **Standarde comunitare**: Respectarea ghidurilor comunitare incluzive

---

## 📄 Informații despre curs

### Licență
Acest proiect este licențiat sub Licența MIT - vedeți fișierul [LICENSE](../../LICENSE) pentru detalii.

### Resurse Microsoft Learning corelate

Echipa noastră produce și alte cursuri cuprinzătoare de învățare:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pentru începători](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pentru începători](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

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
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigarea cursului

**🚀 Pregătit să începi să înveți?**

**Începători**: Începe cu [Capitolul 1: Bazele și Început Rapid](../..)  
**Dezvoltatori AI**: Sari la [Capitolul 2: Dezvoltare AI-First](../..)  
**Dezvoltatori experimentați**: Începe cu [Capitolul 3: Configurare și Autentificare](../..)

**Pașii următori**: [Începe Capitolul 1 - Bazele AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertisment**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->