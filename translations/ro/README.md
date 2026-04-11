# AZD Pentru Începători: O Călătorie de Învățare Structurată

![AZD-pentru-începători](../../translated_images/ro/azdbeginners.5527441dd9f74068.webp) 

[![Urmăritori GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Fork-uri GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Stele GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduceri automate (Întotdeauna la zi)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabă](../ar/README.md) | [Bengaleză](../bn/README.md) | [Bulgară](../bg/README.md) | [Birmană (Myanmar)](../my/README.md) | [Chineză (Simplificată)](../zh-CN/README.md) | [Chineză (Tradițională, Hong Kong)](../zh-HK/README.md) | [Chineză (Tradițională, Macao)](../zh-MO/README.md) | [Chineză (Tradițională, Taiwan)](../zh-TW/README.md) | [Croată](../hr/README.md) | [Cehă](../cs/README.md) | [Daneză](../da/README.md) | [Olandeză](../nl/README.md) | [Estonă](../et/README.md) | [Finlandeză](../fi/README.md) | [Franceză](../fr/README.md) | [Germană](../de/README.md) | [Greacă](../el/README.md) | [Ebraică](../he/README.md) | [Hindi](../hi/README.md) | [Maghiară](../hu/README.md) | [Indoneziană](../id/README.md) | [Italiană](../it/README.md) | [Japoneză](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Coreeană](../ko/README.md) | [Lituaniană](../lt/README.md) | [Malaeză](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepaleză](../ne/README.md) | [Pidgin nigeriană](../pcm/README.md) | [Norvegiană](../no/README.md) | [Persană (Farsi)](../fa/README.md) | [Poloneză](../pl/README.md) | [Portugheză (Brazilia)](../pt-BR/README.md) | [Portugheză (Portugalia)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Română](./README.md) | [Rusă](../ru/README.md) | [Sârbă (Chirilică)](../sr/README.md) | [Slovacă](../sk/README.md) | [Slovenă](../sl/README.md) | [Spaniolă](../es/README.md) | [Swahili](../sw/README.md) | [Suedeză](../sv/README.md) | [Tagalog (Filipine)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailandeză](../th/README.md) | [Turcă](../tr/README.md) | [Ucraineană](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnameză](../vi/README.md)

> **Preferi să clonezi local?**
>
> Acest depozit include peste 50 de traduceri care măresc semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
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
> Aceasta îți oferă tot ce ai nevoie pentru a parcurge cursul cu o descărcare mult mai rapidă.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Ce e nou în azd astăzi

Azure Developer CLI a evoluat dincolo de aplicațiile web și API-urile tradiționale. Astăzi, azd este unicul instrument pentru implementarea oricărei aplicații pe Azure — inclusiv aplicații alimentate de AI și agenți inteligenți.

Iată ce înseamnă asta pentru tine:

- **Agenții AI sunt acum sarcini azd de primă clasă.** Poți inițializa, implementa și gestiona proiecte de agenți AI folosind același flux `azd init` → `azd up` pe care îl cunoști.
- **Integrarea Microsoft Foundry** aduce implementarea modelelor, găzduirea agenților și configurarea serviciilor AI direct în ecosistemul de șabloane azd.
- **Fluxul de lucru de bază nu s-a schimbat.** Indiferent dacă implementezi o aplicație todo, un microserviciu sau o soluție AI multi-agent, comenzile sunt aceleași.

Dacă ai folosit azd înainte, suportul pentru AI este o extensie naturală — nu un instrument separat sau o cale avansată. Dacă începi de la zero, vei învăța un singur flux de lucru care funcționează pentru tot.

---

## 🚀 Ce este Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** este un instrument CLI prietenos pentru dezvoltatori care face simplă implementarea aplicațiilor pe Azure. În loc să creezi și să conectezi manual zeci de resurse Azure, poți implementa aplicații întregi cu o singură comandă.

### Magia comenzii `azd up`

```bash
# Această singură comandă face totul:
# ✅ Creează toate resursele Azure
# ✅ Configurează rețeaua și securitatea
# ✅ Construiește codul aplicației tale
# ✅ Deployează către Azure
# ✅ Îți oferă un URL funcțional
azd up
```

**Asta e tot!** Fără clicuri în Azure Portal, fără șabloane ARM complexe de învățat mai întâi, fără configurare manuală — doar aplicații funcționale pe Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Care este diferența?

Aceasta este cea mai frecventă întrebare pe care o pun începătorii. Iată răspunsul simplu:

| Caracteristică | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Scop** | Gestionarea resurselor Azure individuale | Implementarea aplicațiilor complete |
| **Abordare** | Orientat către infrastructură | Orientat către aplicație |
| **Exemplu** | `az webapp create --name myapp...` | `azd up` |
| **Curba de învățare** | Trebuie să cunoști serviciile Azure | Trebuie doar să-ți cunoști aplicația |
| **Potrivit pentru** | DevOps, Infrastructură | Dezvoltatori, Prototipare |

### O analogie simplă

- **Azure CLI** este ca și cum ai avea toate uneltele pentru a construi o casă - ciocane, ferăstraie, cuie. Poți construi orice, dar trebuie să cunoști construcțiile.
- **Azure Developer CLI** este ca și cum ai angaja un antreprenor - descrii ce vrei și el se ocupă de construire.

### Când să folosești fiecare

| Scenariu | Folosește |
|----------|----------|
| "Vreau să îmi implementez aplicația web rapid" | `azd up` |
| "Trebuie să creez doar un cont de stocare" | `az storage account create` |
| "Construiesc o aplicație AI completă" | `azd init --template azure-search-openai-demo` |
| "Trebuie să depanez o resursă Azure specifică" | `az resource show` |
| "Vreau o implementare pregătită pentru producție în câteva minute" | `azd up --environment production` |

### Funcționează împreună!

AZD folosește Azure CLI în fundal. Poți folosi ambele:
```bash
# Desfășurați aplicația dvs. cu AZD
azd up

# Apoi ajustați în mod fin resursele specifice cu Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Găsește șabloane în Awesome AZD

Nu porni de la zero! **Awesome AZD** este colecția comunității de șabloane gata de implementare:

| Resursă | Descriere |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Răsfoiește peste 200 de șabloane cu implementare dintr-un singur clic |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Contribuie cu propriul tău șablon la comunitate |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Dă stea și explorează codul sursă |

### Șabloane AI populare din Awesome AZD

```bash
# Chat RAG cu modelele Microsoft Foundry + căutare AI
azd init --template azure-search-openai-demo

# Aplicație rapidă de chat AI
azd init --template openai-chat-app-quickstart

# Agenți AI cu agenți Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Începe în 3 pași

Înainte de a începe, asigură-te că mașina ta este pregătită pentru șablonul pe care vrei să îl implementezi:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If any required check fails, fix that first and then continue with the quick start.

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
# Opțional dacă plănuiți să utilizați comenzile Azure CLI direct în acest curs
az login

# Necessar pentru fluxurile de lucru AZD
azd auth login
```

If you are not sure which one you need, follow the full setup flow in [Instalare și configurare](docs/chapter-01-foundation/installation.md#authentication-setup).

### Pasul 3: Implementează prima ta aplicație

```bash
# Inițializează de la un șablon
azd init --template todo-nodejs-mongo

# Deploy pe Azure (creează totul!)
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

Acest curs este conceput pentru **învățare progresivă** - începe de unde te simți confortabil și avansează treptat:

| Experiența ta | Începe aici |
|-----------------|------------|
| **Începător în Azure** | [Capitolul 1: Fundamente](#-chapter-1-foundation--quick-start) |
| **Cunoști Azure, nou în AZD** | [Capitolul 1: Fundamente](#-chapter-1-foundation--quick-start) |
| **Vrei să implementezi aplicații AI** | [Capitolul 2: Dezvoltare axată pe AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vrei practică hands-on** | [🎓 Atelier interactiv](workshop/README.md) - laborator ghidat de 3-4 ore |
| **Ai nevoie de modele pentru producție** | [Capitolul 8: Producție & Întreprindere](#-chapter-8-production--enterprise-patterns) |

### Configurare rapidă

1. **Fă fork la acest depozit**: [![Fork-uri GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonează-l**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obține ajutor**: [Comunitatea Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Preferi să clonezi local?**
>
> Acest depozit include peste 50 de traduceri care măresc semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Aceasta îți oferă tot ce ai nevoie pentru a parcurge cursul cu o descărcare mult mai rapidă.


## Prezentarea cursului

Stăpânește Azure Developer CLI (azd) prin capitole structurate pentru învățare progresivă. **Accent special pe implementarea aplicațiilor AI cu integrare Microsoft Foundry.**

### De ce acest curs este esențial pentru dezvoltatorii moderni

Pe baza informațiilor din comunitatea Microsoft Foundry Discord, **45% dintre dezvoltatori doresc să folosească AZD pentru sarcini AI** dar întâmpină provocări legate de:
- Arhitecturi AI complexe cu mai multe servicii
- Cele mai bune practici pentru implementarea AI în producție  
- Integrarea și configurarea serviciilor Azure AI
- Optimizarea costurilor pentru sarcinile AI
- Depanarea problemelor specifice implementărilor AI

### Obiectivele de învățare

Parcurgând acest curs structurat, vei:
- **Stăpâni fundamentele AZD**: Concepte de bază, instalare și configurare
- **Implementezi aplicații AI**: Folosește AZD cu serviciile Microsoft Foundry
- **Implementezi Infrastructure as Code**: Gestionează resurse Azure cu șabloane Bicep
- **Depanezi implementările**: Rezolvă probleme comune și debugează erorile
- **Optimizezi pentru producție**: Securitate, scalare, monitorizare și gestionarea costurilor
- **Construiești soluții multi-agent**: Implementează arhitecturi AI complexe

## Înainte de a începe: Conturi, Acces și Presupuneri

Înainte de a începe Capitolul 1, asigură-te că ai cele de mai jos puse la punct. Pașii de instalare din continuarea acestui ghid presupun că aceste elemente de bază sunt deja gestionate.
- **Un abonament Azure**: Puteți folosi un abonament existent de la serviciu sau contul personal, sau creați o [încercare gratuită](https://aka.ms/azurefreetrial) pentru a începe.
- **Permisiunea de a crea resurse Azure**: Pentru majoritatea exercițiilor, ar trebui să aveți cel puțin acces **Contributor** la subscripția sau grupul de resurse țintă. Unele capitole pot presupune, de asemenea, că puteți crea grupuri de resurse, managed identities și asignări RBAC.
- [**Un cont GitHub**](https://github.com): Acesta este util pentru a face fork la repository, a urmări propriile modificări și a folosi GitHub Codespaces pentru workshop.
- **Prerechizite pentru runtime-ul șabloanelor**: Unele șabloane necesită instrumente locale precum Node.js, Python, Java sau Docker. Rulați validatorul de configurare înainte de a începe pentru a identifica lipsurile din timp.
- **Familiaritate de bază cu terminalul**: Nu trebuie să fiți expert, dar ar trebui să fiți confortabil să rulați comenzi precum `git clone`, `azd auth login` și `azd up`.

> **Lucrați într-o subscripție enterprise?**
> Dacă mediul dvs. Azure este gestionat de un administrator, confirmați din timp că puteți implementa resurse în subscripția sau grupul de resurse pe care intenționați să îl folosiți. Dacă nu, cereți o subscripție sandbox sau acces Contributor înainte de a începe.

> **Noul în Azure?**
> Începeți cu propria perioadă de încercare Azure sau cu un abonament pay-as-you-go la https://aka.ms/azurefreetrial pentru a putea finaliza exercițiile de la un capăt la altul fără a aștepta aprobări la nivel de tenant.

## 🗺️ Hartă a cursului: Navigare rapidă pe capitole

Fiecare capitol are un README dedicat cu obiective de învățare, quick starts și exerciții:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Cap. 1: Fundamente](docs/chapter-01-foundation/README.md)** | Început | [Bazele AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalare](docs/chapter-01-foundation/installation.md) &#124; [Primul proiect](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap. 2: Dezvoltare AI](docs/chapter-02-ai-development/README.md)** | Aplicații AI-First | [Integrare Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenți AI](docs/chapter-02-ai-development/agents.md) &#124; [Implementare modele AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atelier](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap. 3: Configurare](docs/chapter-03-configuration/README.md)** | Autentificare & Securitate | [Configurare](docs/chapter-03-configuration/configuration.md) &#124; [Autentificare și securitate](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap. 4: Infrastructură](docs/chapter-04-infrastructure/README.md)** | IaC & Implementare | [Ghid de implementare](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionare](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Cap. 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Soluții cu agenți AI | [Scenariu retail](examples/retail-scenario.md) &#124; [Modele de coordonare](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Cap. 6: Pre-implementare](docs/chapter-06-pre-deployment/README.md)** | Planificare & Validare | [Verificări preflight](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planificare capacitate](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selecție SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Cap. 7: Depanare](docs/chapter-07-troubleshooting/README.md)** | Debug & Remediere | [Probleme comune](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depanare](docs/chapter-07-troubleshooting/debugging.md) &#124; [Probleme AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Cap. 8: Producție](docs/chapter-08-production/README.md)** | Modele enterprise | [Practici de producție](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Atelier](workshop/README.md)** | Laborator practic | [Introducere](workshop/docs/instructions/0-Introduction.md) &#124; [Selecție](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validare](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstrucție](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Dezafectare infrastructură](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Concluzie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Durata totală a cursului:** ~10-14 ore | **Evoluția competențelor:** Începător → Pregătit pentru producție

---

## 📚 Capitole de învățare

*Selectează traseul de învățare în funcție de nivelul de experiență și obiective*

### 🚀 Capitolul 1: Fundamente & Început rapid
**Precondiții**: Un abonament Azure, cunoștințe de bază de linie de comandă  
**Durată**: 30-45 minute  
**Complexitate**: ⭐

#### Ce vei învăța
- Înțelegerea conceptelor fundamentale ale Azure Developer CLI
- Instalarea AZD pe platforma ta
- Prima ta implementare reușită

#### Resurse de învățare
- **🎯 Începe aici**: [Ce este Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorie**: [Bazele AZD](docs/chapter-01-foundation/azd-basics.md) - Concepte centrale și terminologie
- **⚙️ Configurare**: [Instalare & Configurare](docs/chapter-01-foundation/installation.md) - Ghiduri specifice platformei
- **🛠️ Practic**: [Primul tău proiect](docs/chapter-01-foundation/first-project.md) - Tutorial pas cu pas
- **📋 Referință rapidă**: [Fișă de comenzi](resources/cheat-sheet.md)

#### Exerciții practice
```bash
# Verificare rapidă a instalării
azd version

# Lansați prima aplicație
azd init --template todo-nodejs-mongo
azd up
```

**💡 Rezultatul capitolului**: Vei implementa cu succes o aplicație web simplă în Azure folosind AZD

**✅ Validarea succesului:**
```bash
# După finalizarea Capitolului 1, ar trebui să puteți:
azd version              # Afișează versiunea instalată
azd init --template todo-nodejs-mongo  # Inițializează proiectul
azd up                  # Publică pe Azure
azd show                # Afișează URL-ul aplicației care rulează
# Aplicația se deschide în browser și funcționează
azd down --force --purge  # Curăță resursele
```

**📊 Timp estimat:** 30-45 minute  
**📈 Nivel de competență după:** Poți implementa aplicații de bază independent  
**📈 Nivel de competență după:** Poți implementa aplicații de bază independent

---

### 🤖 Capitolul 2: Dezvoltare AI-First (Recomandat pentru dezvoltatorii AI)
**Precondiții**: Capitolul 1 finalizat  
**Durată**: 1-2 ore  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Integrarea Microsoft Foundry cu AZD
- Implementarea aplicațiilor alimentate de AI
- Înțelegerea configurațiilor serviciilor AI

#### Resurse de învățare
- **🎯 Începe aici**: [Integrare Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenți AI**: [Ghid agenți AI](docs/chapter-02-ai-development/agents.md) - Implementați agenți inteligenți cu AZD
- **📖 Modele**: [Implementare modele AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementați și gestionați modele AI
- **🛠️ Atelier**: [Atelier AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pregătiți soluțiile AI pentru AZD
- **🎥 Ghid interactiv**: [Materiale workshop](workshop/README.md) - Învățare în browser cu MkDocs * DevContainer Environment
- **📋 Șabloane**: [Șabloane Microsoft Foundry](#resurse-pentru-atelier)
- **📝 Exemple**: [Exemple de implementare AZD](examples/README.md)

#### Exerciții practice
```bash
# Desfășoară prima ta aplicație IA
azd init --template azure-search-openai-demo
azd up

# Încearcă șabloane IA suplimentare
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Rezultatul capitolului**: Implementați și configurați o aplicație de chat alimentată de AI cu capabilități RAG

**✅ Validarea succesului:**
```bash
# După Capitolul 2, ar trebui să puteți:
azd init --template azure-search-openai-demo
azd up
# Testați interfața de chat AI
# Puneți întrebări și primiți răspunsuri generate de AI cu surse
# Verificați că integrarea căutării funcționează
azd monitor  # Verificați că Application Insights afișează telemetria
azd down --force --purge
```

**📊 Timp estimat:** 1-2 ore  
**📈 Nivel de competență după:** Poți implementa și configura aplicații AI pregătite pentru producție  
**💰 Conștientizare costuri:** Estimați costuri de dezvoltare de $80-150/lună, costuri de producție $300-3500/lună

#### 💰 Considerații privind costurile pentru implementările AI

**Mediu de dezvoltare (Estimativ $80-150/lună):**
- Modele Microsoft Foundry (Pay-as-you-go): $0-50/lună (în funcție de utilizarea tokenilor)
- AI Search (nivel Basic): $75/lună
- Container Apps (Consumption): $0-20/lună
- Stocare (Standard): $1-5/lună

**Mediu de producție (Estimativ $300-3,500+/lună):**
- Modele Microsoft Foundry (PTU pentru performanță constantă): $3,000+/lună SAU Pay-as-you-go cu volum mare
- AI Search (nivel Standard): $250/lună
- Container Apps (Dedicated): $50-100/lună
- Application Insights: $5-50/lună
- Stocare (Premium): $10-50/lună

**💡 Sfaturi pentru optimizarea costurilor:**
- Folosește **Free Tier** pentru Modelele Microsoft Foundry pentru învățare (Azure OpenAI 50.000 tokeni/lună inclus)
- Rulează `azd down` pentru a elibera resursele când nu dezvolți activ
- Începe cu facturare pe consum, treci la PTU doar pentru producție
- Folosește `azd provision --preview` pentru a estima costurile înainte de implementare
- Activează auto-scalarea: plătești doar pentru utilizarea efectivă

**Monitorizarea costurilor:**
```bash
# Verificați costurile lunare estimate
azd provision --preview

# Monitorizați costurile reale în Portalul Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capitolul 3: Configurare & Autentificare
**Precondiții**: Capitolul 1 finalizat  
**Durată**: 45-60 minute  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Configurarea și gestionarea mediului
- Cele mai bune practici pentru autentificare și securitate
- Denumirea și organizarea resurselor

#### Resurse de învățare
- **📖 Configurare**: [Ghid de configurare](docs/chapter-03-configuration/configuration.md) - Configurarea mediului
- **🔐 Securitate**: [Modele de autentificare și identitate gestionată](docs/chapter-03-configuration/authsecurity.md) - Modele de autentificare
- **📝 Exemple**: [Exemplu aplicație bază de date](examples/database-app/README.md) - Exemple AZD Database

#### Exerciții practice
- Configurează medii multiple (dev, staging, prod)
- Configurează autentificarea cu identitate gestionată
- Implementează configurații specifice fiecărui mediu

**💡 Rezultatul capitolului**: Gestionează medii multiple cu autentificare și securitate adecvată

---

### 🏗️ Capitolul 4: Infrastructură ca Cod & Implementare
**Precondiții**: Capitolele 1-3 finalizate  
**Durată**: 1-1.5 ore  
**Complexitate**: ⭐⭐⭐

#### Ce vei învăța
- Modele avansate de implementare
- Infrastructură ca Cod cu Bicep
- Strategii de provisionare a resurselor

#### Resurse de învățare
- **📖 Implementare**: [Ghid de implementare](docs/chapter-04-infrastructure/deployment-guide.md) - Fluxuri de lucru complete
- **🏗️ Provisionare**: [Provisionare resurse](docs/chapter-04-infrastructure/provisioning.md) - Managementul resurselor Azure
- **📝 Exemple**: [Exemplu aplicație Container](../../examples/container-app) - Implementări containerizate

#### Exerciții practice
- Creează șabloane Bicep personalizate
- Implementează aplicații multi-serviciu
- Implementează strategii de implementare blue-green

**💡 Rezultatul capitolului**: Implementează aplicații complexe multi-serviciu folosind șabloane de infrastructură personalizate

---

### 🎯 Capitolul 5: Soluții AI Multi-Agent (Avansat)
**Precondiții**: Capitolele 1-2 finalizate  
**Durată**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce vei învăța
- Modele de arhitectură multi-agent
- Orchestrarea și coordonarea agenților
- Implementări AI pregătite pentru producție

#### Resurse de învățare
- **🤖 Proiect reprezentativ**: [Soluție Multi-Agent pentru retail](examples/retail-scenario.md) - Implementare completă
- **🛠️ Șabloane ARM**: [Pachet șabloane ARM](../../examples/retail-multiagent-arm-template) - Implementare cu un clic
- **📖 Arhitectură**: [Modele de coordonare multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modele

#### Exerciții practice
```bash
# Implementați soluția completă multi-agent pentru comerțul cu amănuntul
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorați configurațiile agenților
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Rezultatul capitolului**: Implementează și gestionează o soluție AI multi-agent pregătită pentru producție cu agenți Customer și Inventory

---

### 🔍 Capitolul 6: Validare și planificare pre-implementare
**Precondiții**: Capitolul 4 finalizat  
**Durată**: 1 oră  
**Complexitate**: ⭐⭐
#### Ce veți învăța
- Planificarea capacității și validarea resurselor
- Strategii de selecție SKU
- Verificări pre-lansare și automatizare

#### Resurse de învățare
- **📊 Planificare**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validarea resurselor
- **💰 Selecție**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Alegeri eficiente din punct de vedere al costurilor
- **✅ Validare**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripturi automate

#### Exerciții practice
- Rulați scripturi de validare a capacității
- Optimizați selecțiile SKU pentru cost
- Implementați verificări automate înainte de implementare

**💡 Rezultatul capitolului**: Validați și optimizați implementările înainte de execuție

---

### 🚨 Capitolul 7: Depanare și diagnosticare
**Cerințe prealabile**: Orice capitol de implementare finalizat  
**Durată**: 1-1.5 ore  
**Complexitate**: ⭐⭐

#### Ce veți învăța
- Abordări sistematice de depanare
- Probleme comune și soluții
- Depanare specifică AI

#### Resurse de învățare
- **🔧 Probleme comune**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - Întrebări frecvente și soluții
- **🕵️ Depanare**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Strategii pas cu pas
- **🤖 Probleme AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Probleme ale serviciilor AI

#### Exerciții practice
- Diagnosticați eșecurile de implementare
- Rezolvați probleme de autentificare
- Depanați conectivitatea serviciilor AI

**💡 Rezultatul capitolului**: Diagnosticați și rezolvați independent problemele comune de implementare

---

### 🏢 Capitolul 8: Modele pentru producție și întreprinderi
**Cerințe prealabile**: Capitolele 1-4 finalizate  
**Durată**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce veți învăța
- Strategii de implementare în producție
- Modele de securitate pentru întreprinderi
- Monitorizare și optimizarea costurilor

#### Resurse de învățare
- **🏭 Producție**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Modele pentru întreprinderi
- **📝 Exemple**: [Microservices Example](../../examples/microservices) - Arhitecturi complexe
- **📊 Monitorizare**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitorizare

#### Exerciții practice
- Implementați modele de securitate pentru întreprinderi
- Configurați monitorizare cuprinzătoare
- Implementați în producție cu guvernanță adecvată

**💡 Rezultatul capitolului**: Implementați aplicații gata pentru întreprindere cu capabilități complete de producție

---

## 🎓 Prezentare generală a atelierului: Experiență de învățare practică

> **⚠️ STARE ATELIER: Dezvoltare activă**  
> Materialele atelierului sunt în curs de dezvoltare și rafinare. Modulele de bază sunt funcționale, dar unele secțiuni avansate sunt incomplete. Lucrăm activ pentru a finaliza tot conținutul. [Urmărește progresul →](workshop/README.md)

### Materiale interactive ale atelierului
**Învățare practică cuprinzătoare cu instrumente bazate pe browser și exerciții ghidate**

Materialele atelierului oferă o experiență de învățare interactivă și structurată care completează curriculumul bazat pe capitole de mai sus. Atelierul este conceput atât pentru învățare în ritm propriu, cât și pentru sesiuni conduse de instructor.

#### 🛠️ Caracteristicile atelierului
- **Interfață bazată pe browser**: Atelier complet alimentat de MkDocs cu funcții de căutare, copiere și teme
- **Integrare GitHub Codespaces**: Configurare mediului de dezvoltare cu un singur clic
- **Cale de învățare structurată**: Exerciții ghidate în 8 module (3-4 ore în total)
- **Metodologie progresivă**: Introducere → Selecție → Validare → Deconstrucție → Configurare → Personalizare → Demontare → Concluzie
- **Mediu DevContainer interactiv**: Instrumente și dependențe preconfigurate

#### 📚 Structura modulelor atelierului
Atelierul urmează o **metodologie progresivă în 8 module** care vă duce de la descoperire la stăpânirea implementării:

| Modul | Subiect | Ce veți face | Durată |
|--------|-------|----------------|----------|
| **0. Introducere** | Prezentare generală a atelierului | Înțelegeți obiectivele de învățare, cerințele prealabile și structura atelierului | 15 min |
| **1. Selecție** | Descoperirea șabloanelor | Explorați șabloanele AZD și selectați șablonul AI potrivit pentru scenariul dvs. | 20 min |
| **2. Validare** | Implementare și verificare | Implementați șablonul cu `azd up` și validați că infrastructura funcționează | 30 min |
| **3. Deconstrucție** | Înțelegerea structurii | Folosiți GitHub Copilot pentru a explora arhitectura șablonului, fișierele Bicep și organizarea codului | 30 min |
| **4. Configurare** | Analiză aprofundată azure.yaml | Stăpâniți configurația `azure.yaml`, hook-urile de ciclu de viață și variabilele de mediu | 30 min |
| **5. Personalizare** | Personalizați-l | Activați AI Search, tracing, evaluarea și personalizați pentru scenariul dvs. | 45 min |
| **6. Demontare** | Curățare | Eliberați în siguranță resursele cu `azd down --purge` | 15 min |
| **7. Încheiere** | Pașii următori | Revizuiți realizările, conceptele cheie și continuați-vă parcursul de învățare | 15 min |

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
# Faceți clic pe "Code" → "Create codespace on main" în repository

# Opțiunea 2: Dezvoltare locală
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Urmați instrucțiunile de configurare din workshop/README.md
```

#### 🎯 Rezultatele învățării din atelier
Prin finalizarea atelierului, participanții vor:
- **Implementați aplicații AI pentru producție**: Utilizați AZD cu serviciile Microsoft Foundry
- **Stăpâniți arhitecturi multi-agent**: Implementați soluții AI cu agenți coordonați
- **Implementați cele mai bune practici de securitate**: Configurați autentificarea și controlul accesului
- **Optimizați pentru scalare**: Proiectați implementări eficiente din punct de vedere al costurilor și performante
- **Depanați implementările**: Rezolvați probleme comune independent

#### 📖 Resurse pentru atelier
- **🎥 Ghid interactiv**: [Workshop Materials](workshop/README.md) - Mediu de învățare bazat pe browser
- **📋 Instrucțiuni pe module**:
  - [0. Introducere](workshop/docs/instructions/0-Introduction.md) - Prezentare generală și obiectivele atelierului
  - [1. Selecție](workshop/docs/instructions/1-Select-AI-Template.md) - Găsiți și selectați șabloane AI
  - [2. Validare](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementați și verificați șabloanele
  - [3. Deconstrucție](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorați arhitectura șablonului
  - [4. Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) - Stăpâniți azure.yaml
  - [5. Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizați pentru scenariul dvs.
  - [6. Demontare](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Curățați resursele
  - [7. Încheiere](workshop/docs/instructions/7-Wrap-up.md) - Revizuiți și pașii următori
- **🛠️ Laborator atelier AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exerciții axate pe AI
- **💡 Pornire rapidă**: [Workshop Setup Guide](workshop/README.md#quick-start) - Configurarea mediului

**Potrivit pentru**: Training corporativ, cursuri universitare, învățare în ritm propriu și bootcamp-uri pentru dezvoltatori.

---

## 📖 Analiză detaliată: Capacitățile AZD

Dincolo de elementele de bază, AZD oferă caracteristici puternice pentru implementări în producție:

- **Implementări bazate pe șabloane** - Utilizați șabloane preconstruite pentru tipare comune de aplicații
- **Infrastructură ca cod** - Gestionați resursele Azure folosind Bicep sau Terraform  
- **Fluxuri de lucru integrate** - Provisionați, implementați și monitorizați aplicațiile fără probleme
- **Prietenos pentru dezvoltatori** - Optimizat pentru productivitatea și experiența dezvoltatorilor

### **AZD + Microsoft Foundry: Ideal pentru implementări AI**

**De ce AZD pentru soluții AI?** AZD abordează principalele provocări cu care se confruntă dezvoltatorii AI:

- **Șabloane pregătite pentru AI** - Șabloane preconfigurate pentru modelele Microsoft Foundry, Cognitive Services și sarcini ML
- **Implementări AI securizate** - Modele de securitate integrate pentru serviciile AI, chei API și endpoint-uri ale modelelor  
- **Modele AI pentru producție** - Cele mai bune practici pentru implementări AI scalabile și eficiente din punct de vedere al costurilor
- **Fluxuri de lucru AI end-to-end** - De la dezvoltarea modelului la implementarea în producție cu monitorizare adecvată
- **Optimizare a costurilor** - Alocare inteligentă a resurselor și strategii de scalare pentru sarcinile AI
- **Integrare Microsoft Foundry** - Conectare fără probleme la catalogul de modele și endpoint-urile Microsoft Foundry

---

## 🎯 Bibliotecă de șabloane și exemple

### Recomandate: Șabloane Microsoft Foundry
**Începeți aici dacă implementați aplicații AI!**

> **Notă:** Aceste șabloane demonstrează diferite modele AI. Unele sunt Azure Samples externe, altele implementări locale.

| Șablon | Capitol | Complexitate | Servicii | Tip |
|----------|---------|------------|----------|------|
| [**Începeți cu chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Începeți cu agenți AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolul 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolul 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolul 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolul 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolul 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Soluție multi-agent Retail**](examples/retail-scenario.md) | Capitolul 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Recomandate: Scenarii de învățare complete
**Șabloane de aplicații gata pentru producție alocate capitolelor de învățare**

| Șablon | Capitolul de învățare | Complexitate | Aspecte cheie |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolul 2 | ⭐ | Tipare de implementare AI de bază |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolul 2 | ⭐⭐ | Implementare RAG cu Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolul 4 | ⭐⭐ | Integrare Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolul 5 | ⭐⭐⭐ | Framework de agenți și apelarea funcțiilor |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolul 8 | ⭐⭐⭐ | Orchestrare AI pentru întreprinderi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolul 5 | ⭐⭐⭐⭐ | Arhitectură multi-agent cu agenți Client și Inventar |

### Învățare prin tip de exemplu

> **📌 Exemple locale vs. externe:**  
> **Exemple locale** (în acest repo) = Gata de utilizare imediată  
> **Exemple externe** (Azure Samples) = Clonați din depozitele legate

#### Exemple locale (Gata de utilizare)
- [**Soluție multi-agent Retail**](examples/retail-scenario.md) - Implementare completă gata pentru producție cu template-uri ARM
  - Arhitectură multi-agent (agenți Client + Inventar)
  - Monitorizare și evaluare cuprinzătoare
  - Implementare cu un singur clic prin template ARM

#### Exemple locale - Aplicații containerizate (Capitolele 2-5)
**Exemple cuprinzătoare de implementare a containerelor în acest depozit:**
- [**Exemple aplicații Container**](examples/container-app/README.md) - Ghid complet pentru implementări containerizate
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST de bază cu scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Implementare multi-serviciu pregătită pentru producție
  - Pornire rapidă, Producție și modele de implementare Avansate
  - Ghid pentru monitorizare, securitate și optimizarea costurilor

#### Exemple externe - Aplicații simple (Capitolele 1-2)
**Clonați aceste depozite Azure Samples pentru a începe:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Tipare de implementare de bază
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementare conținut static
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementare API REST

#### Exemple externe - Integrare baze de date (Capitolele 3-4)
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Modele de conectivitate la bază de date
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flux de lucru serverless pentru date

#### External Examples - Advanced Patterns (Chapters 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitecturi multi-serviciu
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Procesare în fundal  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Modele ML pregătite pentru producție

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Colecție selectată de șabloane oficiale și comunitare
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentație Microsoft Learn pentru șabloane
- [**Examples Directory**](examples/README.md) - Exemple locale pentru învățare cu explicații detaliate

---

## 📚 Resurse și referințe pentru învățare

### Referințe rapide
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Comenzi esențiale azd organizate pe capitole
- [**Glossary**](resources/glossary.md) - Terminologie Azure și azd  
- [**FAQ**](resources/faq.md) - Întrebări frecvente organizate pe capitole de învățare
- [**Study Guide**](resources/study-guide.md) - Exerciții practice cuprinzătoare

### Ateliere practice
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fă ca soluțiile tale AI să poată fi implementate cu AZD (2-3 ore)
- [**Interactive Workshop**](workshop/README.md) - Exerciții ghidate în 8 module cu MkDocs și GitHub Codespaces
  - Urmează: Introducere → Selecție → Validare → Deconstrucție → Configurare → Personalizare → Dezafectare → Concluzie

### Resurse externe de învățare
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### Competențe AI Agent pentru editorul tău
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 competențe de agent deschise pentru Azure AI, Foundry, implementare, diagnosticare, optimizarea costurilor și altele. Instalează-le în GitHub Copilot, Cursor, Claude Code sau în orice agent suportat:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Ghid rapid de depanare

**Probleme frecvente întâmpinate de începători și soluții imediate:**

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
# Încercați o regiune Azure diferită
azd env set AZURE_LOCATION "westus2"
azd up

# Sau folosiți SKU-uri mai mici în dezvoltare
# Editați infra/main.parameters.json:
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

# Opțiunea 2: Remediază doar infrastructura
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
# Reautentifică-te pentru AZD
azd auth logout
azd auth login

# Opțional: reîmprospătează și Azure CLI dacă rulezi comenzi az
az logout
az login

# Verifică autentificarea
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD generează nume unice, dar în caz de conflict:
azd down --force --purge

# Apoi reîncercați cu un mediu nou
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Timpuri normale de așteptare:**
- Aplicație web simplă: 5-10 minute
- Aplicație cu bază de date: 10-15 minute
- Aplicații AI: 15-25 minute (provisionarea OpenAI este lentă)

```bash
# Verifică progresul
azd show

# Dacă rămâi blocat mai mult de 30 de minute, verifică Portalul Azure:
azd monitor --overview
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
# - User Access Administrator (pentru atribuirea rolurilor)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Afișează toate endpoint-urile serviciilor
azd show

# Sau deschide Portalul Azure
azd monitor

# Verifică un serviciu specific
azd env get-values
# Caută variabilele *_URL
```
</details>

### 📚 Resurse complete de depanare

- **Ghid probleme comune:** [Soluții detaliate](docs/chapter-07-troubleshooting/common-issues.md)
- **Probleme specifice AI:** [Depanare AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Ghid de depanare:** [Depanare pas cu pas](docs/chapter-07-troubleshooting/debugging.md)
- **Obține ajutor:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Finalizarea cursului și certificare

### Urmărirea progresului
Urmărește-ți progresul de învățare pe fiecare capitol:

- [ ] **Capitolul 1**: Fundamente & Start rapid ✅
- [ ] **Capitolul 2**: Dezvoltare AI-first ✅  
- [ ] **Capitolul 3**: Configurare & Autentificare ✅
- [ ] **Capitolul 4**: Infrastructură ca Cod & Implementare ✅
- [ ] **Capitolul 5**: Soluții AI multi-agent ✅
- [ ] **Capitolul 6**: Validare și planificare pre-implementare ✅
- [ ] **Capitolul 7**: Depanare & Debugging ✅
- [ ] **Capitolul 8**: Modele pentru producție & enterprise ✅

### Verificarea cunoștințelor
După finalizarea fiecărui capitol, verifică-ți cunoștințele prin:
1. **Exercițiu practic**: Finalizează implementarea practică a capitolului
2. **Verificare a cunoștințelor**: Consultă secțiunea FAQ pentru capitolul tău
3. **Discuție comunitară**: Împărtășește-ți experiența în Azure Discord
4. **Următorul capitol**: Treci la următorul nivel de complexitate

### Beneficiile finalizării cursului
După finalizarea tuturor capitolelor, vei avea:
- **Experiență în producție**: Ai implementat aplicații AI reale în Azure
- **Abilități profesionale**: Capacități de implementare pregătite pentru mediul enterprise  
- **Recunoaștere în comunitate**: Membru activ al comunității de dezvoltatori Azure
- **Avansare în carieră**: Expertiză solicitată în AZD și implementarea AI

---

## 🤝 Comunitate și suport

### Obține ajutor & suport
- **Probleme tehnice**: [Raportează erori și solicită funcționalități](https://github.com/microsoft/azd-for-beginners/issues)
- **Întrebări de învățare**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) și [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajutor specific AI**: Alătură-te [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentație**: [Documentația oficială Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Perspective din comunitate de pe Microsoft Foundry Discord

**Rezultatele recente ale sondajului din canalul #Azure:**
- **45%** dintre dezvoltatori doresc să folosească AZD pentru sarcini de lucru AI
- **Principalele provocări**: Implementări multi-serviciu, gestionarea acreditărilor, pregătirea pentru producție  
- **Cele mai solicitate**: șabloane specifice AI, ghiduri de depanare, bune practici

**Alătură-te comunității noastre pentru a:**
- Împărtășește experiențele tale AZD + AI și primește ajutor
- Accesează previzualizări timpurii ale noilor șabloane AI
- Contribuie la bunele practici pentru implementarea AI
- Influențează dezvoltarea viitoare a funcționalităților AI + AZD

### Contribuția la curs
Vă încurajăm să contribuiți! Citiți [Ghidul de contribuție](CONTRIBUTING.md) pentru detalii despre:
- **Îmbunătățiri de conținut**: Îmbunătățește capitolele și exemplele existente
- **Exemple noi**: Adaugă scenarii și șabloane din lumea reală  
- **Traducere**: Ajută la menținerea suportului multilingv
- **Raportare bug-uri**: Îmbunătățește acuratețea și claritatea
- **Standarde comunitare**: Urmează ghidurile noastre comunitare incluzive

---

## 📄 Informații despre curs

### Licență
Acest proiect este licențiat sub MIT License - vezi fișierul [LICENSE](../../LICENSE) pentru detalii.

### Resurse legate de învățare Microsoft

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
[![AI Agents pentru începători](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria AI Generativă
[![AI Generativ pentru începători](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Generativ (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Generativ (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI Generativ (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Învățare de bază
[![ML pentru începători](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Știința datelor pentru începători](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Inteligență artificială pentru începători](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Securitate cibernetică pentru începători](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Dezvoltare web pentru începători](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pentru începători](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Dezvoltare XR pentru începători](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Seria Copilot
[![Copilot pentru programare AI în pereche](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pentru C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigarea cursului

**🚀 Gata să începi să înveți?**

**Începători**: Începe cu [Capitolul 1: Fundamente & Pornire rapidă](#-chapter-1-foundation--quick-start)  
**Dezvoltatori AI**: Accesează [Capitolul 2: Dezvoltare AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Dezvoltatori cu experiență**: Începeți cu [Capitolul 3: Configurare & Autentificare](#️-chapter-3-configuration--authentication)

**Următorii pași**: [Începe Capitolul 1 - Bazele AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm responsabilitatea pentru eventuale neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->