# AZD Pentru Începători: O Călătorie de Învățare Structurată

![AZD-for-beginners](../../translated_images/ro/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduceri Automatizate (Întotdeauna la Zi)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](./README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Preferi să clonezi local?**
>
> Acest depozit include peste 50 de traduceri în limbi diferite, ceea ce crește semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
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

## 🆕 Ce e Nou în azd Astăzi

> 📌 Acest curs este validat cu **`azd 1.27.1`** (iulie 2026). Rulează `azd version` pentru a verifica versiunea ta și `azd upgrade` pentru a obține cea mai recentă.

Azure Developer CLI a evoluat dincolo de aplicațiile web tradiționale și API-uri. Astăzi, azd este unicul instrument pentru implementarea **oricărei** aplicații în Azure, incluzând aplicații alimentate de AI și agenți inteligenți.

Iată ce înseamnă asta pentru tine:

- **Agenții AI sunt acum sarcini azd de primă clasă.** Poți inițializa, implementa și gestiona proiecte de agenți AI folosind același flux de lucru `azd init` → `azd up` pe care îl cunoști deja.
- **Un ciclu complet al agentului din CLI.** Extensia `azure.ai.agents` acoperă acum întregul parcurs—`azd ai agent init` pentru scaffolding, `azd ai agent invoke` pentru testare (cu afișarea timpului de răspuns), `azd ai agent eval generate` și `azd ai agent optimize` pentru măsurarea și îmbunătățirea calității, și `azd ai agent delete` pentru curățare.
- **Mai multe blocuri de construcție AI.** Noile extensii în previzualizare—`azure.ai.skills` și `azure.ai.connections`—îți permit să gestionezi abilități reutilizabile ale agenților și conexiuni Foundry direct cu azd.
- **Integrare Microsoft Foundry** aduce implementarea modelelor, găzduirea agenților și configurarea serviciului AI direct în ecosistemul șabloanelor azd.
- **Bazele de zi cu zi mai fluide.** Versiunile recente au făcut `azd init` idempotent (sigur de rulat din nou), au făcut ca `azd auth login` să elimine automat tokenurile expirate și au adăugat un prompt prietenos pentru prima rulare `azd tool`.
- **Fluxul de lucru de bază nu s-a schimbat.** Fie că implementezi o aplicație todo, un microserviciu sau o soluție AI cu mai mulți agenți, comenzile sunt aceleași.

> **Notă pentru utilizatorii Aspire:** Microsoft se referă acum la produs simplu ca **Aspire** (fost ".NET Aspire"). Suportul azd pentru Aspire rămâne neschimbat—doar numele a fost actualizat.

Dacă ai folosit azd înainte, suportul pentru AI este o extensie naturală—nu un instrument separat sau un traseu avansat. Dacă începi de la zero, vei învăța un singur flux de lucru care funcționează pentru tot.

---

## 🚀 Ce este Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** este un instrument prietenos pentru dezvoltatori, cu interfață de linie de comandă, care face simplă implementarea aplicațiilor în Azure. În loc să creezi manual și să conectezi zeci de resurse Azure, poți implementa aplicații complete cu o singură comandă.

### Magia `azd up`

```bash
# Această comandă unică face totul:
# ✅ Creează toate resursele Azure
# ✅ Configurează rețeaua și securitatea
# ✅ Construiește codul aplicației tale
# ✅ Face deploy pe Azure
# ✅ Îți oferă un URL funcțional
azd up
```

**Atât!** Fără clicuri în Azure Portal, fără șabloane ARM complexe de învățat prima dată, fără configurări manuale - doar aplicații care funcționează pe Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Care e Diferența?

Aceasta este cea mai frecventă întrebare a începătorilor. Iată răspunsul simplu:

| Caracteristică | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Scop** | Gestionarea resurselor individuale Azure | Implementarea aplicațiilor complete |
| **Mentalitate** | Axat pe infrastructură | Axat pe aplicație |
| **Exemplu** | `az webapp create --name myapp...` | `azd up` |
| **Curba de învățare** | Trebuie să cunoști serviciile Azure | Trebuie doar să știi aplicația ta |
| **Potrivit pentru** | DevOps, Infrastructură | Dezvoltatori, Prototipare |

### O Analogie Simplă

- **Azure CLI** este ca și cum ai avea toate uneltele pentru a construi o casă - ciocane, ferăstraie, cuie. Poți construi orice, dar trebuie să știi construcții.
- **Azure Developer CLI** este ca și cum ai angaja un constructor - descrii ce vrei și ei se ocupă de construcție.

### Când să Folosești Fiecare

| Scenariu | Folosește Acesta |
|----------|----------|
| "Vreau să implementez rapid aplicația web" | `azd up` |
| "Trebuie să creez doar un cont de stocare" | `az storage account create` |
| "Construiesc o aplicație AI completă" | `azd init --template azure-search-openai-demo` |
| "Trebuie să depanez o resursă Azure specifică" | `az resource show` |
| "Vreau o implementare gata de producție în câteva minute" | `azd up --environment production` |

### Ele Lucrează Împreună!

AZD folosește Azure CLI în fundal. Poți folosi ambele:
```bash
# Implementați aplicația dvs. cu AZD
azd up

# Apoi ajustați resursele specifice cu Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Găsește Șabloane în Awesome AZD

Nu începe de la zero! **Awesome AZD** este colecția comunității cu șabloane gata de implementat:

| Resursă | Descriere |
|----------|-------------|
| 🔗 [**Galerie Awesome AZD**](https://azure.github.io/awesome-azd/) | Răsfoiește peste 200 de șabloane cu implementare cu un singur clic |
| 🔗 [**Trimite un Șablon**](https://github.com/Azure/awesome-azd/issues) | Contribuie cu propriul șablon comunității |
| 🔗 [**Depozitul GitHub**](https://github.com/Azure/awesome-azd) | Marchează cu stea și explorează sursa |

### Șabloane AI Populare din Awesome AZD

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

Înainte să începi, asigură-te că mașina ta este pregătită pentru șablonul pe care vrei să-l implementezi:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Dacă orice verificare necesară eșuează, rezolvă mai întâi acea problemă, apoi continuă cu pornirea rapidă.

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

### Pasul 2: Autentificare pentru AZD

```bash
# Opțional dacă intenționați să utilizați comenzile Azure CLI direct în acest curs
az login

# Necesare pentru fluxurile de lucru AZD
azd auth login
```

Dacă nu ești sigur care trebuie să o folosești, urmează fluxul complet de configurare din [Instalare & Configurare](docs/chapter-01-foundation/installation.md#authentication-setup).

### Pasul 3: Implementează Prima Ta Aplicație

```bash
# Inițializare dintr-un șablon
azd init --template todo-nodejs-mongo

# Implementare în Azure (creează totul!)
azd up
```

**🎉 Gata!** Aplicația ta este acum live pe Azure.

### Curățenie (Nu uita!)

```bash
# Eliminați toate resursele după ce ați terminat experimentarea
azd down --force --purge
```

---

## 📚 Cum să folosești acest Curs

Acest curs este conceput pentru **învățare progresivă** - începe de unde te simți confortabil și avansează treptat:

| Experiența Ta | Începe Aici |
|-----------------|------------|
| **Nou în Azure** | [Capitolul 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Cunoști Azure, dar ești nou la AZD** | [Capitolul 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Vrei să implementezi aplicații AI** | [Capitolul 2: Dezvoltare AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vrei practică hands-on** | [🎓 Atelier Interactiv](workshop/README.md) - laborator ghidat de 3-4 ore |
| **Ai nevoie de modele pentru producție** | [Capitolul 8: Producție & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configurare Rapidă

1. **Fork-uiește acest Depozit**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonează-l**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obține Ajutor**: [Comunitatea Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Preferi să clonezi local?**

> Acest depozit include peste 50 de traduceri în limbi diferite, ceea ce crește semnificativ dimensiunea descărcării. Pentru a clona fără traduceri, folosește sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Acest lucru îți oferă tot ce ai nevoie pentru a finaliza cursul cu o descărcare mult mai rapidă.


## Prezentare Generală a Cursului

Stăpânește Azure Developer CLI (azd) prin capitole structurate concepute pentru învățare progresivă. **Focalizare specială pe implementarea aplicațiilor AI cu integrarea Microsoft Foundry.**


### De ce este acest curs esențial pentru dezvoltatorii moderni

Pe baza informațiilor din comunitatea Microsoft Foundry Discord, **45% dintre dezvoltatori doresc să utilizeze AZD pentru sarcini AI**, dar se confruntă cu provocări legate de:
- Arhitecturi AI complexe multi-serviciu
- Cele mai bune practici pentru implementarea AI în producție  
- Integrarea și configurarea serviciilor Azure AI
- Optimizarea costurilor pentru sarcini AI
- Depanarea problemelor specifice implementării AI

### Obiectivele de învățare

Prin parcurgerea acestui curs structurat, veți:
- **Stăpâniți Fundamentele AZD**: Concepte de bază, instalare și configurare
- **Implementați Aplicații AI**: Utilizați AZD cu serviciile Microsoft Foundry
- **Implementați Infrastructură ca și Cod**: Gestionați resurse Azure cu șabloane Bicep
- **Depanați Implementările**: Rezolvați probleme comune și depanați erori
- **Optimizare pentru producție**: Securitate, scalare, monitorizare și management al costurilor
- **Construiți Soluții Multi-Agent**: Implementați arhitecturi AI complexe

## Înainte să începeți: Conturi, Acces și Presupuneri

Înainte de a începe Capitolul 1, asigurați-vă că aveți următoarele pregătite. Pașii de instalare prezentați mai jos presupun că aceste aspecte de bază sunt deja rezolvate.

- **Un abonament Azure**: Puteți folosi un abonament existent de la serviciu sau contul propriu, sau să creați un [trial gratuit](https://aka.ms/azurefreetrial) pentru a începe.
- **Permisiunea de a crea resurse Azure**: Pentru majoritatea exercițiilor, ar trebui să aveți cel puțin acces **Contributor** pe abonamentul sau grupul de resurse țintă. Unele capitole pot presupune, de asemenea, că puteți crea grupuri de resurse, identități gestionate și atribuiri RBAC.
- [**Un cont GitHub**](https://github.com): Este util pentru a face fork al depozitului, a urmări propriile modificări și a utiliza GitHub Codespaces pentru atelier.
- **Prerechizite pentru runtime-ul șabloanelor**: Unele șabloane necesită instrumente locale precum Node.js, Python, Java sau Docker. Rulați validatorul de setup înainte de a începe pentru a identifica lipsa instrumentelor din timp.
- **Familiaritate de bază cu terminalul**: Nu trebuie să fiți expert, dar ar trebui să vă simțiți confortabil rulând comenzi precum `git clone`, `azd auth login`, și `azd up`.

> **Lucrați într-un abonament enterprise?**
> Dacă mediul dvs. Azure este gestionat de un administrator, confirmați din timp că puteți implementa resurse în abonamentul sau grupul de resurse pe care intenționați să îl folosiți. Dacă nu, solicitați un abonament sandbox sau acces Contributor înainte să începeți.

> **Sunteți nou în Azure?**
> Începeți cu un trial Azure personal sau un abonament pay-as-you-go la https://aka.ms/azurefreetrial pentru a putea finaliza exercițiile complet fără a aștepta aprobări la nivel de tenant.

## 🗺️ Harta cursului: Navigare rapidă pe capitole

Fiecare capitol are un README dedicat cu obiectivele de învățare, începuturi rapide și exerciții:

| Capitol | Subiect | Lecții | Durată | Complexitate |
|---------|---------|---------|----------|------------|
| **[Cap 1: Fundamente](docs/chapter-01-foundation/README.md)** | Început | [Bazele AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalare](docs/chapter-01-foundation/installation.md) &#124; [Primul Proiect](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Dezvoltare AI](docs/chapter-02-ai-development/README.md)** | Aplicații AI | [Integrare Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenți AI](docs/chapter-02-ai-development/agents.md) &#124; [Implementarea modelelor AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atelier](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ore | ⭐⭐ |
| **[Cap 3: Configurare](docs/chapter-03-configuration/README.md)** | Autentificare & Securitate | [Configurare](docs/chapter-03-configuration/configuration.md) &#124; [Autentificare & Securitate](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infrastructură](docs/chapter-04-infrastructure/README.md)** | IaC & Implementare | [Ghid implementare](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionare](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ore | ⭐⭐⭐ |
| **[Cap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Soluții Agenți AI | [Scenariu Retail](examples/retail-scenario.md) &#124; [Modele de coordonare](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[Cap 6: Pre-Implementare](docs/chapter-06-pre-deployment/README.md)** | Planificare & Validare | [Verificări pre-zbor](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planificare capacitate](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selecție SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 oră | ⭐⭐ |
| **[Cap 7: Depanare](docs/chapter-07-troubleshooting/README.md)** | Debug & Remediere | [Probleme comune](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Probleme AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ore | ⭐⭐ |
| **[Cap 8: Producție](docs/chapter-08-production/README.md)** | Modele enterprise | [Practici de producție](docs/chapter-08-production/production-ai-practices.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[🎓 Atelier](workshop/README.md)** | Laborator practic | [Introducere](workshop/docs/instructions/0-Introduction.md) &#124; [Selecție](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validare](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstrucție](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Dezafectare](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Încheiere](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ore | ⭐⭐ |

**Durata totală a cursului:** ~10-14 ore | **Progresie abilități:** Începător → Pregătit pentru producție

---

## 📚 Capitolele de Învățare

*Selectați traseul de învățare în funcție de nivelul și obiectivele dvs.*

### 🚀 Capitolul 1: Fundamente & Start Rapid
**Prerechizite**: Abonament Azure, cunoștințe de bază în linia de comandă  
**Durată**: 30-45 minute  
**Complexitate**: ⭐

#### Ce veți învăța
- Înțelegerea fundamentele Azure Developer CLI
- Instalarea AZD pe platforma dvs.
- Prima implementare reușită

#### Resurse de învățare
- **🎯 Începeți aici**: [Ce este Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorie**: [Bazele AZD](docs/chapter-01-foundation/azd-basics.md) - Concepte și terminologie esențială
- **⚙️ Setup**: [Instalare & Configurare](docs/chapter-01-foundation/installation.md) - Ghiduri platforme specifice
- **🛠️ Practic**: [Primul Proiect](docs/chapter-01-foundation/first-project.md) - Tutorial pas cu pas
- **📋 Referință rapidă**: [Fișă comenzi](resources/cheat-sheet.md)

#### Exercitii practice
```bash
# Verificare rapidă a instalării
azd version

# Lansați prima aplicație
azd init --template todo-nodejs-mongo
azd up
```

**💡 Rezultatul capitolului**: Implementați cu succes o aplicație web simplă pe Azure utilizând AZD

**✅ Validare succes:**
```bash
# După finalizarea Capitolului 1, ar trebui să puteți:
azd version              # Afișează versiunea instalată
azd init --template todo-nodejs-mongo  # Inițializează proiectul
azd up                  # Publică pe Azure
azd show                # Afișează URL-ul aplicației care rulează
# Aplicația se deschide în browser și funcționează
azd down --force --purge  # Curăță resursele
```

**📊 Timp necesar:** 30-45 minute  
**📈 Nivel de abilitate după:** Poate implementa aplicații de bază independent
**📈 Nivel de abilitate după:** Poate implementa aplicații de bază independent

---

### 🤖 Capitolul 2: Dezvoltare AI-First (Recomandat pentru dezvoltatori AI)
**Prerechizite**: Capitolul 1 finalizat  
**Durată**: 1-2 ore  
**Complexitate**: ⭐⭐

#### Ce veți învăța
- Integrarea Microsoft Foundry cu AZD
- Implementarea aplicațiilor AI
- Înțelegerea configurării serviciilor AI

#### Resurse de învățare
- **🎯 Începeți aici**: [Integrare Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenți AI**: [Ghid Agenți AI](docs/chapter-02-ai-development/agents.md) - Implementați agenți inteligenți cu AZD
- **📖 Modele**: [Implementarea modelelor AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Deploy și management AI
- **🛠️ Atelier**: [Laborator AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pregătiți soluțiile AI pentru AZD
- **🎥 Ghid Interactiv**: [Materiale atelier](workshop/README.md) - Învățare bazată pe browser cu MkDocs * Mediu DevContainer
- **📋 Șabloane**: [Șabloane Microsoft Foundry](#resurse-pentru-atelier)
- **📝 Exemple**: [Exemple implementare AZD](examples/README.md)

#### Exercitii practice
```bash
# Lansați prima dvs. aplicație AI
azd init --template azure-search-openai-demo
azd up

# Încercați șabloane AI suplimentare
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Rezultatul capitolului**: Implementați și configurați o aplicație chat AI cu capacități RAG

**✅ Validare succes:**
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

**📊 Timp necesar:** 1-2 ore  
**📈 Nivel de abilitate după:** Poate implementa și configura aplicații AI pregătite pentru producție  
**💰 Conștientizare costuri:** Înțelege costuri dezvoltare $80-150/lună, costuri producție $300-3500/lună

#### 💰 Considerații privind costurile pentru implementările AI

**Mediul de dezvoltare (estimativ $80-150/lună):**
- Modele Microsoft Foundry (pay-as-you-go): $0-50/lună (în funcție de utilizarea tokenilor)
- AI Search (nivel de bază): $75/lună
- Container Apps (consum): $0-20/lună
- Stocare (standard): $1-5/lună

**Mediul de producție (estimativ $300-3,500+/lună):**
- Modele Microsoft Foundry (PTU pentru performanță consistentă): $3,000+/lună SAU pay-as-you-go cu volum mare
- AI Search (nivel standard): $250/lună
- Container Apps (dedicat): $50-100/lună
- Application Insights: $5-50/lună
- Stocare (premium): $10-50/lună

**💡 Sfaturi de optimizare a costurilor:**
- Utilizați **nivelul gratuit** de modele Microsoft Foundry pentru învățare (Azure OpenAI include 50.000 tokens/lună)
- Rulați `azd down` pentru a elibera resurse atunci când nu dezvoltați activ
- Începeți cu facturare pe consum, treceți la PTU doar pentru producție
- Folosiți `azd provision --preview` pentru a estima costurile înainte de implementare
- Activați scalare automată: plătiți doar pentru utilizarea reală

**Monitorizarea costurilor:**
```bash
# Verifică costurile estimate lunare
azd provision --preview

# Monitorizează costurile reale în Portalul Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capitolul 3: Configurare & Autentificare
**Prerechizite**: Capitolul 1 finalizat  
**Durată**: 45-60 minute  
**Complexitate**: ⭐⭐

#### Ce veți învăța
- Configurarea și managementul mediului
- Cele mai bune practici de autentificare și securitate
- Denumirea și organizarea resurselor

#### Resurse de învățare
- **📖 Configurare**: [Ghid Configurare](docs/chapter-03-configuration/configuration.md) - Setarea mediului
- **🔐 Securitate**: [Pattern-uri autentificare și identitate gestionată](docs/chapter-03-configuration/authsecurity.md) - Modele autentificare
- **📝 Exemple**: [Exemplu aplicație bază de date](examples/database-app/README.md) - Exemple AZD Database

#### Exercitii practice
- Configurați medii multiple (dev, staging, prod)
- Configurați autentificare cu identitate gestionată
- Implementați configurații specifice mediului

**💡 Rezultatul capitolului**: Gestionează mai multe medii cu autentificare și securitate corectă

---

### 🏗️ Capitolul 4: Infrastructură ca și Cod & Implementare
**Prerechizite**: Capitolele 1-3 finalizate  
**Durată**: 1-1.5 ore  
**Complexitate**: ⭐⭐⭐

#### Ce veți învăța
- Modele avansate de implementare
- Infrastructură ca și Cod cu Bicep
- Strategii de provisionare a resurselor

#### Resurse de învățare
- **📖 Implementare**: [Ghid implementare](docs/chapter-04-infrastructure/deployment-guide.md) - Fluxuri complete
- **🏗️ Provisionare**: [Provisionarea resurselor](docs/chapter-04-infrastructure/provisioning.md) - Gestionare resurse Azure
- **📝 Exemple**: [Exemplu aplicație containerizată](../../examples/container-app) - Implementări containerizate

#### Exercitii practice
- Creați șabloane Bicep personalizate
- Implementați aplicații multi-serviciu
- Implementați strategii de implementare blue-green

**💡 Rezultatul capitolului**: Implementați aplicații complexe multi-serviciu folosind șabloane de infrastructură personalizate

---


### 🎯 Capitolul 5: Soluții AI Multi-Agent (Avansat)
**Prerechizite**: Capitolele 1-2 finalizate  
**Durată**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce vei învăța
- Modele de arhitectură multi-agent
- Orchestrarea și coordonarea agenților
- Implementări AI gata de producție

#### Resurse de învățare
- **🤖 Proiect prezentat**: [Soluție Multi-Agent pentru retail](examples/retail-scenario.md) - Implementare completă
- **🛠️ Șabloane ARM**: [Pachet șabloane ARM](../../examples/retail-multiagent-arm-template) - Instalare cu un singur clic
- **📖 Arhitectură**: [Modele de coordonare multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modele

#### Exerciții practice
```bash
# Implementați soluția completă multi-agent pentru retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorați configurațiile agenților
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Rezultatul capitolului**: Implementarea și gestionarea unei soluții AI multi-agent gata de producție cu agenți pentru Clienți și Inventar

---

### 🔍 Capitolul 6: Validare și Planificare Pre-Implementare
**Prerechizite**: Capitolul 4 finalizat  
**Durată**: 1 oră  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Planificarea capacității și validarea resurselor
- Strategii de selecție SKU
- Verificări pre-zbor și automatizare

#### Resurse de învățare
- **📊 Planificare**: [Planificarea capacității](docs/chapter-06-pre-deployment/capacity-planning.md) - Validarea resurselor
- **💰 Selectare**: [Selecția SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Opțiuni cost-eficiente
- **✅ Validare**: [Verificări pre-zbor](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripturi automate

#### Exerciții practice
- Rularea scripturilor de validare a capacității
- Optimizarea selecțiilor SKU pentru costuri
- Implementarea verificărilor automate pre-implementare

**💡 Rezultatul capitolului**: Validarea și optimizarea implementărilor înainte de execuție

---

### 🚨 Capitolul 7: Depanare și Debugging
**Prerechizite**: Orice capitol de implementare finalizat  
**Durată**: 1-1.5 ore  
**Complexitate**: ⭐⭐

#### Ce vei învăța
- Abordări sistematice de debugging
- Probleme comune și soluții
- Depanare specifică AI

#### Resurse de învățare
- **🔧 Probleme comune**: [Probleme comune](docs/chapter-07-troubleshooting/common-issues.md) - Întrebări frecvente și soluții
- **🕵️ Debugging**: [Ghid de debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategii pas cu pas
- **🤖 Probleme AI**: [Depanare specifică AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Probleme cu serviciile AI

#### Exerciții practice
- Diagnosticul eșecurilor de implementare
- Rezolvarea problemelor de autentificare
- Debugging conectivității serviciilor AI

**💡 Rezultatul capitolului**: Diagnosticați și rezolvați independent probleme comune de implementare

---

### 🏢 Capitolul 8: Modele pentru Producție și Întreprinderi
**Prerechizite**: Capitolele 1-4 finalizate  
**Durată**: 2-3 ore  
**Complexitate**: ⭐⭐⭐⭐

#### Ce vei învăța
- Strategii de implementare în producție
- Modele de securitate pentru întreprinderi
- Monitorizare și optimizare costuri

#### Resurse de învățare
- **🏭 Producție**: [Best Practices AI în producție](docs/chapter-08-production/production-ai-practices.md) - Modele pentru întreprinderi
- **📝 Exemple**: [Exemplu Microservicii](../../examples/microservices) - Arhitecturi complexe
- **📊 Monitorizare**: [Integrare Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorizare

#### Exerciții practice
- Implementarea modelelor de securitate pentru întreprinderi
- Configurarea monitorizării complete
- Implementarea în producție cu guvernanță corespunzătoare

**💡 Rezultatul capitolului**: Implementarea aplicațiilor pregătite pentru producție cu toate capabilitățile necesare

---

## 🎓 Prezentarea atelierului: Experiență hands-on de învățare

> **⚠️ STATUS ATELIER: Dezvoltare activă**  
> Materialele atelierului sunt în curs de dezvoltare și rafinare. Modulele de bază sunt funcționale, însă unele secțiuni avansate sunt incomplete. Lucrăm activ pentru finalizarea tuturor conținuturilor. [Urmărește progresul →](workshop/README.md)

### Materiale interactive pentru atelier
**Învățare practică cu instrumente în browser și exerciții ghidate**

Materialele noastre pentru atelier oferă o experiență de învățare structurată și interactivă, care completează curriculum-ul bazat pe capitole de mai sus. Atelierul este conceput pentru învățare autodidactă și sesiuni conduse de instructor.

#### 🛠️ Caracteristici ale atelierului
- **Interfață bazată pe browser**: Atelier complet susținut de MkDocs cu funcții de căutare, copiere și temă
- **Integrare GitHub Codespaces**: Configurare mediu de dezvoltare cu un singur clic
- **Parcurgere structurată**: 8 module cu exerciții ghidate (3-4 ore total)
- **Metodologie progresivă**: Introducere → Selecție → Validare → Deconstrucție → Configurare → Personalizare → Demontare → Încheiere
- **Mediu DevContainer interactiv**: Instrumente și dependențe preconfigurate

#### 📚 Structura modulelor atelierului
Atelierul urmează o **metodologie progresivă în 8 module** care te conduce de la descoperire la măiestria implementării:

| Modul | Subiect | Ce vei face | Durată |
|--------|-------|----------------|----------|
| **0. Introducere** | Prezentarea atelierului | Înțelege obiectivele de învățare, prerechizitele și structura atelierului | 15 min |
| **1. Selecție** | Descoperirea șabloanelor | Explorează șabloanele AZD și selectează șablonul AI potrivit scenariului tău | 20 min |
| **2. Validare** | Implementare & Verificare | Implementează șablonul cu `azd up` și validează funcționarea infrastructurii | 30 min |
| **3. Deconstrucție** | Înțelegerea structurii | Folosește GitHub Copilot pentru explorarea arhitecturii, fișierelor Bicep și organizării codului | 30 min |
| **4. Configurare** | Analiză detaliată azure.yaml | Stăpânește configurarea `azure.yaml`, hook-uri ciclu de viață și variabile de mediu | 30 min |
| **5. Personalizare** | Fă-l al tău | Activează AI Search, trasabilitate, evaluare și personalizează pentru scenariul tău | 45 min |
| **6. Demontare** | Curățenie | Dezactivează în siguranță resursele cu `azd down --purge` | 15 min |
| **7. Încheiere** | Pași următori | Recapitularea realizărilor, concepte cheie și continuarea procesului de învățare | 15 min |

**Fluxul atelierului:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Începe cu atelierul
```bash
# Opțiunea 1: GitHub Codespaces (Recomandat)
# Apasă pe „Code” → „Create codespace on main” în depozit

# Opțiunea 2: Dezvoltare locală
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Urmează instrucțiunile de configurare din workshop/README.md
```

#### 🎯 Rezultatele învățării în atelier
La finalizarea atelierului, participanții vor:
- **Implementa aplicații AI în producție**: Folosind AZD cu serviciile Microsoft Foundry
- **Stăpâni arhitecturi multi-agent**: Implementează soluții AI cu agenți coordonați
- **Aplică bune practici de securitate**: Configurează autentificarea și controlul accesului
- **Optimizează pentru scalabilitate**: Proiectează implementări performante și cost-eficiente
- **Depanează implementările**: Rezolvă probleme comune independent

#### 📖 Resurse pentru atelier
- **🎥 Ghid interactiv**: [Materiale atelier](workshop/README.md) - Mediu de învățare în browser
- **📋 Instrucțiuni modul cu modul**:
  - [0. Introducere](workshop/docs/instructions/0-Introduction.md) - Prezentarea atelierului și obiective
  - [1. Selecție](workshop/docs/instructions/1-Select-AI-Template.md) - Găsește și selectează șabloanele AI
  - [2. Validare](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementare și verificare șabloane
  - [3. Deconstrucție](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorează arhitectura șablonului
  - [4. Configurare](workshop/docs/instructions/4-Configure-AI-Template.md) - Stăpânește azure.yaml
  - [5. Personalizare](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizează pentru scenariul tău
  - [6. Demontare](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Curățare resurse
  - [7. Încheiere](workshop/docs/instructions/7-Wrap-up.md) - Recapitulare și pași următori
- **🛠️ Laborator AI Atelier**: [Laborator AI Atelier](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exerciții axate pe AI
- **💡 Pornire rapidă**: [Ghid configurare atelier](workshop/README.md#quick-start) - Configurarea mediului

**Ideal pentru**: Training-uri corporate, cursuri universitare, învățare autodidactă și bootcamp-uri pentru dezvoltatori.

---

## 📖 Detaliu: Capacități AZD

Dincolo de elementele fundamentale, AZD oferă caracteristici puternice pentru implementări în producție:

- **Implementări bazate pe șabloane** - Folosește șabloane predefinite pentru modele comune de aplicații
- **Infrastructură ca și cod** - Gestionează resurse Azure folosind Bicep sau Terraform  
- **Fluxuri de lucru integrate** - Provisionează, implementează și monitorizează aplicații fără întreruperi
- **Prietenos pentru dezvoltatori** - Optimizat pentru productivitate și experiență dezvoltator

### **AZD + Microsoft Foundry: Ideal pentru implementări AI**

**De ce AZD pentru soluții AI?** AZD răspunde principalelor provocări cu care se confruntă dezvoltatorii AI:

- **Șabloane pregătite pentru AI** - Șabloane preconfigurate pentru Modele Microsoft Foundry, Servicii AI Azure și sarcini ML
- **Implementări AI securizate** - Modele de securitate integrate pentru servicii AI, chei API și endpoint-uri model  
- **Modele AI pentru producție** - Bune practici pentru implementări AI scalabile și cost-eficiente
- **Fluxuri AI end-to-end** - De la dezvoltarea modelului până la implementarea în producție cu monitorizare adecvată
- **Optimizare a costurilor** - Alocare inteligentă a resurselor și strategii de scalare pentru sarcini AI
- **Integrare Microsoft Foundry** - Conectare fluentă la catalogul și endpoint-urile Microsoft Foundry

---

## 🎯 Bibliotecă de șabloane și exemple

### Recomandate: Șabloane Microsoft Foundry
**Începe aici dacă implementezi aplicații AI!**

> **Notă:** Aceste șabloane demonstrează diverse modele AI. Unele sunt exemple externe Azure, altele implementări locale.

| Șablon | Capitol | Complexitate | Servicii | Tip |
|----------|---------|------------|----------|------|
| [**Începe cu chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolul 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Începe cu agenți AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolul 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolul 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**Start rapid OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolul 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolul 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolul 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Soluție Multi-Agent Retail**](examples/retail-scenario.md) | Capitolul 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Recomandate: Scenarii complete de învățare
**Șabloane de aplicații gata de producție mapate pe capitole de învățare**

| Șablon | Capitolul de învățare | Complexitate | Învățare cheie |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolul 2 | ⭐ | Modele de bază AI pentru implementare |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolul 2 | ⭐⭐ | Implementare RAG cu Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolul 4 | ⭐⭐ | Integrare Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolul 5 | ⭐⭐⭐ | Cadru agenți și apelare funcții |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolul 8 | ⭐⭐⭐ | Orchestrare AI pentru întreprinderi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolul 5 | ⭐⭐⭐⭐ | Arhitectură multi-agent cu agenți Clienți și Inventar |

### Învățare după tipul de exemplu

> **📌 Exemple locale vs. externe:**  
> **Exemple locale** (în acest repo) = Gata de folosit imediat  
> **Exemple externe** (Azure Samples) = Clonează din depozitele linkuite

#### Exemple locale (Gata de folosit)
- [**Soluție Multi-Agent Retail**](examples/retail-scenario.md) - Implementare completă gata de producție cu șabloane ARM
  - Arhitectură multi-agent (agenți Client + Inventar)
  - Monitorizare și evaluare cuprinzătoare
  - Instalare cu un singur clic prin șablon ARM

#### Exemple locale - Aplicații Container (Capitole 2-5)
**Exemple cu implementare container cuprinzătoare în acest depozit:**

- [**Exemple de aplicații containerizate**](examples/container-app/README.md) - Ghid complet pentru implementări containerizate
  - [API Flask simplu](../../examples/container-app/simple-flask-api) - API REST de bază cu scalare la zero
  - [Arhitectură Microservicii](../../examples/container-app/microservices) - Implementare multi-servicii gata pentru producție
  - Modele rapide de pornire, producție și avansate
  - Ghid pentru monitorizare, securitate și optimizare a costurilor

#### Exemple Externe - Aplicații Simple (Capitolele 1-2)
**Clonează aceste repozitoare Azure Samples pentru a începe:**
- [Aplicație Web Simplă - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Modele de implementare de bază
- [Website Static - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementare conținut static
- [Aplicație Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementare API REST

#### Exemple Externe - Integrare Bază de Date (Capitolele 3-4)  
- [Aplicație Bază de Date - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Modele de conectivitate la bază de date
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flux de date fără server

#### Exemple Externe - Modele Avansate (Capitolele 4-8)
- [Microservicii Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitecturi multi-servicii
- [Joburi Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Procesare în fundal  
- [Pipeline ML Enterprise](https://github.com/Azure-Samples/mlops-v2) - Modele ML gata pentru producție

### Colecții de Șabloane Externe
- [**Galeria Oficială de Șabloane AZD**](https://azure.github.io/awesome-azd/) - Colecție selectată de șabloane oficiale și din comunitate
- [**Șabloane Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentație șabloane pe Microsoft Learn
- [**Directorul de Exemple**](examples/README.md) - Exemple locale de învățare cu explicații detaliate

---

## 📚 Resurse și Referințe pentru Învățare

### Referințe Rapide
- [**Fișă cu Comenzi**](resources/cheat-sheet.md) - Comenzi azd esențiale organizate pe capitole
- [**Glosar**](resources/glossary.md) - Terminologie Azure și azd  
- [**Întrebări Frecvente**](resources/faq.md) - Întrebări comune organizate pe capitole de învățare
- [**Ghid de Studiu**](resources/study-guide.md) - Exerciții practice cuprinzătoare

### Ateliere Practice
- [**Laborator Atelier AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Fă-ți soluțiile AI implementabile cu AZD (2-3 ore)
- [**Atelier Interactiv**](workshop/README.md) - 8 module de exerciții ghidate cu MkDocs și GitHub Codespaces
  - Urmează: Introducere → Selecție → Validare → Deconstrucție → Configurare → Personalizare → Demontare → Concluzii

### Resurse Externe pentru Învățare
- [Documentație Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrul de Arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculator Prețuri Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### Skill-uri AI Agent pentru Editorul Tău
- [**Skill-uri Microsoft Azure pe skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 skill-uri open agent pentru Azure AI, Foundry, implementare, diagnosticare, optimizare costuri și altele. Instalează-le în GitHub Copilot, Cursor, Claude Code sau orice agent suportat:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Ghid Rapid de Depanare

**Probleme comune întâmpinate de începători și soluțiile imediate:**

<details>
<summary><strong>❌ "azd: comandă negăsită"</strong></summary>

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
<summary><strong>❌ "Nu s-a găsit abonamentul" sau "Abonamentul nu este setat"</strong></summary>

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
<summary><strong>❌ "Quota insuficientă" sau "Cotă depășită"</strong></summary>

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
<summary><strong>❌ "azd up" eșuează la jumătatea procesului</strong></summary>

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
<summary><strong>❌ "Autentificare eșuată" sau "Token expirat"</strong></summary>

```bash
# Reautentificare pentru AZD
azd auth logout
azd auth login

# Opțional: reîmprospătează și Azure CLI dacă execuți comenzi az
az logout
az login

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

# Dacă este blocat >30 de minute, verifică portalul Azure:
azd monitor --overview
# Caută implementări eșuate
```
</details>

<details>
<summary><strong>❌ "Permisiune refuzată" sau "Interzis"</strong></summary>

```bash
# Verificați rolul dvs. Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Aveți nevoie cel puțin de rolul "Contributor"
# Cereți administratorului Azure să acorde:
# - Contributor (pentru resurse)
# - Administrator acces utilizatori (pentru atribuiri de rol)
```
</details>

<details>
<summary><strong>❌ Nu poate găsi URL-ul aplicației implementate</strong></summary>

```bash
# Afișează toate punctele finale ale serviciului
azd show

# Sau deschide Portalul Azure
azd monitor

# Verifică serviciul specific
azd env get-values
# Caută variabilele *_URL
```
</details>

### 📚 Resurse Complete pentru Depanare

- **Ghid Probleme Comune:** [Soluții detaliate](docs/chapter-07-troubleshooting/common-issues.md)
- **Probleme specifice AI:** [Depanare AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Ghid Debugging:** [Depanare pas cu pas](docs/chapter-07-troubleshooting/debugging.md)
- **Obține Ajutor:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Finalizarea Cursului & Certificare

### Monitorizarea Progresului
Urmărește progresul de învățare pentru fiecare capitol:

- [ ] **Capitolul 1**: Fundamente & Pornire Rapidă ✅
- [ ] **Capitolul 2**: Dezvoltare AI-First ✅  
- [ ] **Capitolul 3**: Configurare & Autentificare ✅
- [ ] **Capitolul 4**: Infrastructură ca Cod & Implementare ✅
- [ ] **Capitolul 5**: Soluții AI cu Multi-Agent ✅
- [ ] **Capitolul 6**: Validare & Planificare înainte de implementare ✅
- [ ] **Capitolul 7**: Depanare & Debugging ✅
- [ ] **Capitolul 8**: Modele pentru Producție & Enterprise ✅

### Verificarea Învățării
După finalizarea fiecărui capitol, verifică-ți cunoștințele prin:
1. **Exercițiu practic**: Completează implementarea practică din capitol
2. **Verificare de cunoștințe**: Revizuiește secțiunea FAQ pentru capitolul tău
3. **Discuție comunitară**: Împărtășește experiența ta pe Azure Discord
4. **Capitolul următor**: Treci la nivelul următor de complexitate

### Beneficii ale finalizării cursului
După finalizarea tuturor capitolelor, vei avea:
- **Experiență în Producție**: Aplicații AI reale implementate pe Azure
- **Competențe Profesionale**: Capacități de implementare gata pentru întreprinderi  
- **Recunoaștere în Comunitate**: Membru activ al comunității dezvoltatorilor Azure
- **Avansare în Carieră**: Expertiză cerută în AZD și implementare AI

---

## 🤝 Comunitate & Suport

### Obține Ajutor & Suport
- **Probleme Tehnice**: [Raportează erori și solicită funcționalități](https://github.com/microsoft/azd-for-beginners/issues)
- **Întrebări despre Învățare**: [Comunitatea Microsoft Azure Discord](https://discord.gg/microsoft-azure) și [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajutor Specific AI**: Alătură-te [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentație**: [Documentație oficială Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insight-uri din Comunitate de pe Microsoft Foundry Discord

**Rezultatele recente ale sondajului din canalul #Azure:**
- **45%** din dezvoltatori doresc să utilizeze AZD pentru sarcini AI
- **Principalele provocări**: Implementări multi-servicii, gestionarea acreditărilor, pregătirea pentru producție  
- **Cele mai cerute**: Șabloane specifice AI, ghiduri de depanare, bune practici

**Alătură-te comunității noastre pentru a:**
- Împărtăși experiența ta cu AZD + AI și primi ajutor
- Accesa previzualizări timpurii ale noilor șabloane AI
- Contribui la cele mai bune practici pentru implementare AI
- Influența dezvoltarea viitoare a funcționalităților AI + AZD

### Contribuții la Curs
Suntem deschiși la contribuții! Te rugăm să consulți [Ghidul de Contribuire](CONTRIBUTING.md) pentru detalii despre:
- **Îmbunătățiri de conținut**: Îmbunătățește capitole și exemple existente
- **Exemple noi**: Adaugă scenarii și șabloane din viața reală  
- **Traduceri**: Ajută la menținerea suportului multilingv
- **Raportări de erori**: Crește acuratețea și claritatea
- **Standarde Comunitare**: Respectă ghidul nostru incluziv de comunitate

---

## 📄 Informații despre Curs

### Licență
Acest proiect este licențiat sub Licența MIT - vezi fișierul [LICENSE](../../LICENSE) pentru detalii.

### Resurse Microsoft Learning asociate

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
 
### Seria AI Generativ
[![AI Generativ pentru Începători](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Generativ (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Generativ (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Învățare de bază
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
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

## 🗺️ Navigare în curs

**🚀 Gata să începi să înveți?**

**Începători**: Începe cu [Capitolul 1: Fundamente și Pornire rapidă](#-chapter-1-foundation--quick-start)  
**Dezvoltatori AI**: Sare la [Capitolul 2: Dezvoltare AI-primă](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Dezvoltatori experimentați**: Începe cu [Capitolul 3: Configurare & Autentificare](#️-chapter-3-configuration--authentication)

**Pașii următori**: [Începe Capitolul 1 - Bazele AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->