<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-18T10:53:40+00:00",
  "source_file": "README.md",
  "language_code": "ro"
}
-->
# AZD Pentru Începători: O Călătorie Structurată de Învățare

![AZD-pentru-începători](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ro.png) 

## Începeți cu Acest Curs

Urmați acești pași pentru a începe călătoria de învățare AZD:

1. **Fork Repositoriu**: Click [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone Repositoriu**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Alăturați-vă Comunității**: [Comunitățile Azure Discord](https://discord.com/invite/ByRwuEEgH4) pentru suport de la experți
4. **Alegeți Calea de Învățare**: Selectați un capitol de mai jos care se potrivește nivelului dvs. de experiență

### Suport Multi-Limbă

#### Traduceri Automate (Întotdeauna Actualizate)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](./README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## Prezentare Generală a Cursului

Stăpâniți Azure Developer CLI (azd) prin capitole structurate concepute pentru o învățare progresivă. **Accent special pe implementarea aplicațiilor AI cu integrarea Azure AI Foundry.**

### De ce Acest Curs Este Esențial pentru Dezvoltatorii Moderni

Bazat pe informațiile din comunitatea Discord Azure AI Foundry, **45% dintre dezvoltatori doresc să utilizeze AZD pentru sarcini AI**, dar întâmpină dificultăți cu:
- Arhitecturi complexe AI multi-servicii
- Cele mai bune practici pentru implementarea AI în producție  
- Integrarea și configurarea serviciilor Azure AI
- Optimizarea costurilor pentru sarcini AI
- Rezolvarea problemelor specifice implementării AI

### Obiective de Învățare

Prin completarea acestui curs structurat, veți:
- **Stăpâni Fundamentele AZD**: Concepte de bază, instalare și configurare
- **Implementa Aplicații AI**: Utilizați AZD cu serviciile Azure AI Foundry
- **Aplica Infrastructura ca Cod**: Gestionați resursele Azure cu șabloane Bicep
- **Depana Implementările**: Rezolvați problemele comune și depanați erorile
- **Optimiza pentru Producție**: Securitate, scalare, monitorizare și gestionarea costurilor
- **Construi Soluții Multi-Agent**: Implementați arhitecturi AI complexe

## 📚 Capitole de Învățare

*Alegeți calea de învățare în funcție de nivelul de experiență și obiective*

### 🚀 Capitolul 1: Fundamente & Start Rapid
**Cerințe preliminare**: Abonament Azure, cunoștințe de bază despre linia de comandă  
**Durată**: 30-45 minute  
**Complexitate**: ⭐

#### Ce Veți Învăța
- Înțelegerea fundamentelor Azure Developer CLI
- Instalarea AZD pe platforma dvs.
- Prima implementare reușită

#### Resurse de Învățare
- **🎯 Începeți Aici**: [Ce este Azure Developer CLI?](../..)
- **📖 Teorie**: [Bazele AZD](docs/getting-started/azd-basics.md) - Concepte și terminologie de bază
- **⚙️ Configurare**: [Instalare & Configurare](docs/getting-started/installation.md) - Ghiduri specifice platformei
- **🛠️ Practică**: [Primul Proiect](docs/getting-started/first-project.md) - Tutorial pas cu pas
- **📋 Referință Rapidă**: [Fișă de Comenzi](resources/cheat-sheet.md)

#### Exerciții Practice
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Rezultatul Capitolului**: Implementați cu succes o aplicație web simplă pe Azure folosind AZD

---

### 🤖 Capitolul 2: Dezvoltare Centrată pe AI (Recomandat pentru Dezvoltatori AI)
**Cerințe preliminare**: Capitolul 1 completat  
**Durată**: 1-2 ore  
**Complexitate**: ⭐⭐

#### Ce Veți Învăța
- Integrarea Azure AI Foundry cu AZD
- Implementarea aplicațiilor alimentate de AI
- Înțelegerea configurațiilor serviciilor AI

#### Resurse de Învățare
- **🎯 Începeți Aici**: [Integrarea Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Modele**: [Implementarea Modelului AI](docs/ai-foundry/ai-model-deployment.md) - Implementați și gestionați modele AI
- **🛠️ Atelier**: [Laboratorul AI Workshop](docs/ai-foundry/ai-workshop-lab.md) - Pregătiți soluțiile AI pentru AZD
- **📋 Șabloane**: [Șabloane Azure AI Foundry](../..)

#### Exerciții Practice
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Rezultatul Capitolului**: Implementați și configurați o aplicație de chat alimentată de AI cu capabilități RAG

---

### ⚙️ Capitolul 3: Configurare & Autentificare
**Cerințe preliminare**: Capitolul 1 completat  
**Durată**: 45-60 minute  
**Complexitate**: ⭐⭐

#### Ce Veți Învăța
- Configurarea și gestionarea mediului
- Cele mai bune practici de autentificare și securitate
- Denumirea și organizarea resurselor

#### Resurse de Învățare
- **📖 Configurare**: [Ghid de Configurare](docs/getting-started/configuration.md) - Configurarea mediului
- **🔐 Securitate**: Modele de autentificare și identitate gestionată
- **📝 Exemple**: [Exemplu Aplicație Bază de Date](../../examples/database-app) - Modele de configurare

#### Exerciții Practice
- Configurați mai multe medii (dev, staging, prod)
- Configurați autentificarea prin identitate gestionată
- Implementați configurații specifice mediului

**💡 Rezultatul Capitolului**: Gestionați mai multe medii cu autentificare și securitate adecvate

---

### 🏗️ Capitolul 4: Infrastructura ca Cod & Implementare
**Cerințe preliminare**: Capitolele 1-3 completate  
**Durată**: 1-1.5 ore  
**Complexitate**: ⭐⭐⭐

#### Ce Veți Învăța
- Modele avansate de implementare
- Infrastructura ca Cod cu Bicep
- Strategii de aprovizionare a resurselor

#### Resurse de Învățare
- **📖 Implementare**: [Ghid de Implementare](docs/deployment/deployment-guide.md) - Fluxuri de lucru complete
- **🏗️ Aprovizionare**: [Aprovizionarea Resurselor](docs/deployment/provisioning.md) - Gestionarea resurselor Azure
- **📝 Exemple**: [Exemplu Aplicație Container](../../examples/container-app) - Implementări containerizate

#### Exerciții Practice
- Creați șabloane Bicep personalizate
- Implementați aplicații multi-servicii
- Implementați strategii de implementare blue-green

**💡 Rezultatul Capitolului**: Implementați aplicații complexe multi-servicii folosind șabloane de infrastructură personalizate

---

### 🎯 Capitolul 5: Soluții AI Multi-Agent (Avansat)
**Cerințe preliminare**: Capitolele 1-2 completate  
**Durată**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce Veți Învăța
- Modele de arhitectură multi-agent
- Orchestrarea și coordonarea agenților
- Implementări AI pregătite pentru producție

#### Resurse de Învățare
- **🤖 Proiect Recomandat**: [Soluție Multi-Agent Retail](examples/retail-scenario.md) - Implementare completă
- **🛠️ Șabloane ARM**: [Pachet Șablon ARM](../../examples/retail-multiagent-arm-template) - Implementare cu un singur click
- **📖 Arhitectură**: Modele de coordonare multi-agent

#### Exerciții Practice
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Rezultatul Capitolului**: Implementați și gestionați o soluție AI multi-agent pregătită pentru producție cu agenți pentru Clienți și Inventar

---

### 🔍 Capitolul 6: Validare & Planificare Pre-Implementare
**Cerințe preliminare**: Capitolul 4 completat  
**Durată**: 1 oră  
**Complexitate**: ⭐⭐

#### Ce Veți Învăța
- Planificarea capacității și validarea resurselor
- Strategii de selecție SKU
- Verificări preliminare și automatizare

#### Resurse de Învățare
- **📊 Planificare**: [Planificarea Capacității](docs/pre-deployment/capacity-planning.md) - Validarea resurselor
- **💰 Selecție**: [Selecția SKU](docs/pre-deployment/sku-selection.md) - Alegeri eficiente din punct de vedere al costurilor
- **✅ Validare**: [Verificări Preliminare](docs/pre-deployment/preflight-checks.md) - Scripturi automate

#### Exerciții Practice
- Rulați scripturi de validare a capacității
- Optimizați selecțiile SKU pentru costuri
- Implementați verificări automate pre-implementare

**💡 Rezultatul Capitolului**: Validați și optimizați implementările înainte de execuție

---

### 🚨 Capitolul 7: Depanare & Debugging
**Cerințe preliminare**: Orice capitol de implementare completat  
**Durată**: 1-1.5 ore  
**Complexitate**: ⭐⭐

#### Ce Veți Învăța
- Abordări sistematice de debugging
- Probleme comune și soluții
- Depanare specifică AI

#### Resurse de Învățare
- **🔧 Probleme Comune**: [Probleme Comune](docs/troubleshooting/common-issues.md) - FAQ și soluții
- **🕵️ Debugging**: [Ghid de Debugging](docs/troubleshooting/debugging.md) - Strategii pas cu pas
- **🤖 Probleme AI**: [Depanare Specifică AI](docs/troubleshooting/ai-troubleshooting.md) - Probleme ale serviciilor AI

#### Exerciții Practice
- Diagnosticați eșecurile de implementare
- Rezolvați problemele de autentificare
- Depanați conectivitatea serviciilor AI

**💡 Rezultatul Capitolului**: Diagnosticați și rezolvați independent problemele comune de implementare

---

### 🏢 Capitolul 8: Modele de Producție & Enterprise
**Cerințe preliminare**: Capitolele 1-4 completate  
**Durată**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce Veți Învăța
- Strategii de implementare în producție
- Modele de securitate enterprise
- Monitorizare și optimizare a costurilor

#### Resurse de Învățare
- **🏭 Producție**: [Cele Mai Bune Practici AI pentru Producție](docs/ai-foundry/production-ai-practices.md) - Modele enterprise
- **📝 Exemple**: [Exemplu Microservicii](../../examples/microservices) - Arhitecturi complexe
- **📊 Monitorizare**: Integrare cu Application Insights

#### Exerciții practice
- Implementați modele de securitate pentru întreprinderi
- Configurați monitorizarea completă
- Lansați în producție cu guvernanță adecvată

**💡 Rezultatul capitolului**: Lansați aplicații pregătite pentru întreprinderi, cu capacități complete de producție

---

## 📖 Ce este Azure Developer CLI?

Azure Developer CLI (azd) este o interfață de linie de comandă orientată către dezvoltatori, care accelerează procesul de construire și lansare a aplicațiilor pe Azure. Oferă:

- **Lansări bazate pe șabloane** - Utilizați șabloane predefinite pentru modele comune de aplicații
- **Infrastructură ca cod** - Gestionați resursele Azure folosind Bicep sau Terraform  
- **Fluxuri de lucru integrate** - Proiectați, lansați și monitorizați aplicațiile fără întreruperi
- **Prietenos pentru dezvoltatori** - Optimizat pentru productivitatea și experiența dezvoltatorilor

### **AZD + Azure AI Foundry: Perfect pentru lansări AI**

**De ce AZD pentru soluții AI?** AZD abordează principalele provocări ale dezvoltatorilor AI:

- **Șabloane pregătite pentru AI** - Șabloane preconfigurate pentru Azure OpenAI, Cognitive Services și sarcini ML
- **Lansări AI sigure** - Modele de securitate integrate pentru servicii AI, chei API și puncte de acces ale modelelor  
- **Modele AI pentru producție** - Cele mai bune practici pentru lansări scalabile și eficiente din punct de vedere al costurilor
- **Fluxuri de lucru AI complete** - De la dezvoltarea modelului la lansarea în producție cu monitorizare adecvată
- **Optimizarea costurilor** - Strategii inteligente de alocare și scalare a resurselor pentru sarcini AI
- **Integrare cu Azure AI Foundry** - Conexiune fără întreruperi la catalogul de modele și punctele de acces AI Foundry

---

## 🎯 Biblioteca de șabloane și exemple

### Recomandat: Șabloane Azure AI Foundry
**Începeți aici dacă lansați aplicații AI!**

| Șablon | Capitol | Complexitate | Servicii |
|--------|---------|--------------|----------|
| [**Începeți cu AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Începeți cu agenți AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolul 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Automatizare flux de lucru multi-agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Generați documente din datele dvs.**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Îmbunătățiți întâlnirile cu clienții folosind agenți**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernizați codul cu agenți**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Construiți agentul dvs. conversațional**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Descoperiți informații din date conversaționale**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Procesare de conținut multi-modal**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Recomandat: Scenarii complete de învățare
**Șabloane de aplicații pregătite pentru producție, mapate pe capitole de învățare**

| Șablon | Capitol de învățare | Complexitate | Învățare cheie |
|--------|---------------------|--------------|----------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolul 2 | ⭐ | Modele de lansare AI de bază |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolul 2 | ⭐⭐ | Implementare RAG cu Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolul 4 | ⭐⭐ | Integrare Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolul 5 | ⭐⭐⭐ | Cadru de agenți și apelarea funcțiilor |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolul 8 | ⭐⭐⭐ | Orchestrare AI pentru întreprinderi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolul 5 | ⭐⭐⭐⭐ | Arhitectură multi-agent cu agenți pentru clienți și inventar |

### Învățare prin tip de exemplu

#### Aplicații simple (Capitolele 1-2)
- [Aplicație web simplă](../../examples/simple-web-app) - Modele de lansare de bază
- [Website static](../../examples/static-site) - Lansare de conținut static
- [API de bază](../../examples/basic-api) - Lansare REST API

#### Integrare cu baze de date (Capitolele 3-4)  
- [Aplicație cu baze de date](../../examples/database-app) - Modele de conectivitate cu baze de date
- [Procesare de date](../../examples/data-processing) - Lansare fluxuri de lucru ETL

#### Modele avansate (Capitolele 4-8)
- [Aplicații containerizate](../../examples/container-app) - Lansări containerizate
- [Microservicii](../../examples/microservices) - Arhitecturi multi-servicii  
- [Soluții pentru întreprinderi](../../examples/enterprise) - Modele pregătite pentru producție

### Colecții externe de șabloane
- [**Șabloane AZD Azure-Samples**](https://github.com/Azure-Samples/azd-templates) - Exemple oficiale Microsoft
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Șabloane contribuie de comunitate
- [**Directorul de exemple**](examples/README.md) - Exemple locale de învățare cu explicații detaliate

---

## 📚 Resurse de învățare și referințe

### Referințe rapide
- [**Fișă de comandă**](resources/cheat-sheet.md) - Comenzi esențiale azd organizate pe capitole
- [**Glosar**](resources/glossary.md) - Termeni Azure și azd  
- [**FAQ**](resources/faq.md) - Întrebări frecvente organizate pe capitole de învățare
- [**Ghid de studiu**](resources/study-guide.md) - Exerciții practice cuprinzătoare

### Ateliere practice
- [**Laborator de workshop AI**](docs/ai-foundry/ai-workshop-lab.md) - Faceți soluțiile dvs. AI compatibile cu AZD
- [**Workshop AZD pentru începători**](workshop/README.md) - Materiale complete pentru workshop-uri practice

### Resurse externe de învățare
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrul de arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculator de prețuri Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

---

## 🎓 Finalizarea cursului și certificare

### Urmărirea progresului
Urmăriți progresul dvs. de învățare prin fiecare capitol:

- [ ] **Capitolul 1**: Fundamente și început rapid ✅
- [ ] **Capitolul 2**: Dezvoltare AI-First ✅  
- [ ] **Capitolul 3**: Configurare și autentificare ✅
- [ ] **Capitolul 4**: Infrastructură ca cod și lansare ✅
- [ ] **Capitolul 5**: Soluții AI multi-agent ✅
- [ ] **Capitolul 6**: Validare și planificare pre-lansare ✅
- [ ] **Capitolul 7**: Depanare și rezolvare de probleme ✅
- [ ] **Capitolul 8**: Modele pentru producție și întreprinderi ✅

### Verificarea învățării
După finalizarea fiecărui capitol, verificați cunoștințele dvs. prin:
1. **Exercițiu practic**: Finalizați lansarea practică a capitolului
2. **Verificare cunoștințe**: Revizuiți secțiunea FAQ pentru capitolul dvs.
3. **Discuție comunitară**: Împărtășiți experiența dvs. pe Discord Azure
4. **Capitolul următor**: Trecerea la nivelul următor de complexitate

### Beneficii ale finalizării cursului
După finalizarea tuturor capitolelor, veți avea:
- **Experiență de producție**: Aplicații AI reale lansate pe Azure
- **Abilități profesionale**: Capacități de lansare pregătite pentru întreprinderi  
- **Recunoaștere comunitară**: Membru activ al comunității dezvoltatorilor Azure
- **Avansare în carieră**: Expertiză AZD și AI în cerere

---

## 🤝 Comunitate și suport

### Obțineți ajutor și suport
- **Probleme tehnice**: [Raportați erori și solicitați funcții](https://github.com/microsoft/azd-for-beginners/issues)
- **Întrebări de învățare**: [Comunitatea Discord Microsoft Azure](https://discord.gg/microsoft-azure)
- **Ajutor specific AI**: Alăturați-vă canalului [#Azure](https://discord.gg/microsoft-azure) pentru discuții AZD + AI Foundry
- **Documentație**: [Documentația oficială Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Perspective comunitare din Discord Azure AI Foundry

**Rezultatele recente ale sondajului din canalul #Azure:**
- **45%** dintre dezvoltatori doresc să utilizeze AZD pentru sarcini AI
- **Provocări principale**: Lansări multi-servicii, gestionarea acreditivelor, pregătirea pentru producție  
- **Cele mai solicitate**: Șabloane specifice AI, ghiduri de depanare, cele mai bune practici

**Alăturați-vă comunității noastre pentru:**
- Împărtășiți experiențele dvs. AZD + AI și obțineți ajutor
- Accesați previzualizări timpurii ale noilor șabloane AI
- Contribuiți la cele mai bune practici de lansare AI
- Influențați dezvoltarea viitoare a funcțiilor AI + AZD

### Contribuția la curs
Acceptăm contribuții! Citiți [Ghidul de contribuție](CONTRIBUTING.md) pentru detalii despre:
- **Îmbunătățiri ale conținutului**: Îmbunătățiți capitolele și exemplele existente
- **Exemple noi**: Adăugați scenarii și șabloane reale  
- **Traduceri**: Ajutați la menținerea suportului multi-lingvistic
- **Raportarea erorilor**: Îmbunătățiți acuratețea și claritatea
- **Standarde comunitare**: Respectați liniile directoare ale comunității incluzive

---

## 📄 Informații despre curs

### Licență
Acest proiect este licențiat sub Licența MIT - consultați fișierul [LICENSE](../../LICENSE) pentru detalii.

### Resurse de învățare Microsoft asociate

Echipa noastră produce alte cursuri cuprinzătoare de învățare:

- [**NOU** Protocolul Context Model (MCP) pentru începători](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Agenți AI pentru începători](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI pentru începători folosind .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI pentru începători](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI pentru începători folosind Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML pentru începători](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science pentru începători](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI pentru începători](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity pentru începători](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev pentru începători](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT pentru începători](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Dezvoltare XR pentru începători](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Stăpânirea GitHub Copilot pentru programare asistată AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Stăpânirea GitHub Copilot pentru dezvoltatori C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Alegeți propria aventură Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Navigarea cursului

**🚀 Gata să începeți învățarea?**

**Începători**: Începeți cu [Capitolul 1: Fundamente și început rapid](../..)  
**Dezvoltatori AI**: Săriți la [Capitolul 2: Dezvoltare AI-First](../..)
**Dezvoltatori experimentați**: Începeți cu [Capitolul 3: Configurare și Autentificare](../..)

**Pași următori**: [Începeți Capitolul 1 - Bazele AZD](docs/getting-started/azd-basics.md) →

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.