# Changelog - AZD Pentru Începători

## Introducere

Acest changelog documentează toate modificările notabile, actualizările și îmbunătățirile din depozitul AZD Pentru Începători. Urmăm principiile versionării semantice și menținem acest jurnal pentru a ajuta utilizatorii să înțeleagă ce s-a schimbat între versiuni.

## Obiective de Învățare

Prin revizuirea acestui changelog, veți:
- Rămâne informat despre noile funcționalități și adăugări de conținut
- Înțelege îmbunătățirile aduse documentației existente
- Monitoriza corecturile și remediile pentru asigurarea acurateței
- Urmări evoluția materialelor de învățare în timp

## Rezultate așteptate

După ce examinați înregistrările din changelog, veți putea:
- Identifica conținutul nou și resursele disponibile pentru învățare
- Înțelege care secțiuni au fost actualizate sau îmbunătățite
- Planifica traseul de învățare bazat pe cele mai actuale materiale
- Oferi feedback și sugestii pentru îmbunătățiri viitoare

## Istoricul Versiunilor

### [v3.17.0] - 2026-02-05

#### Îmbunătățire Navigare în Curs
**Această versiune îmbunătățește navigarea capitolelor în README.md cu un format tabelar îmbunătățit.**

#### Modificat
- **Tabel Harta Cursului**: Îmbunătățit cu linkuri directe către lecții, estimări ale duratei și evaluări ale complexității
- **Curățare Foldere**: Eliminarea folderelor vechi redundante (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validare Linkuri**: Toate cele peste 21 linkuri interne din tabelul Harta Cursului verificate

### [v3.16.0] - 2026-02-05

#### Actualizări Nume Produse
**Această versiune actualizează referințele produselor către brandingul actual Microsoft.**

#### Modificat
- **Azure AI Foundry → Microsoft Foundry**: Toate referințele actualizate în fișierele non-traducere
- **Azure AI Agent Service → Foundry Agents**: Numele serviciului actualizat pentru a reflecta brandingul curent

#### Fișiere Actualizate
- `README.md` - Pagina principală a cursului
- `changelog.md` - Istoricul versiunilor
- `course-outline.md` - Structura cursului
- `docs/chapter-02-ai-development/agents.md` - Ghid agenți AI
- `examples/README.md` - Documentație exemple
- `workshop/README.md` - Pagina principală workshop
- `workshop/docs/index.md` - Index workshop
- `workshop/docs/instructions/*.md` - Toate fișierele de instrucțiuni workshop

---

### [v3.15.0] - 2026-02-05

#### Restructurare Majoră a Depozitului: Foldere Denumite pe Capitole
**Această versiune restructurează documentația în foldere dedicate capitolelor pentru o navigare mai clară.**

#### Redenumiri Foldere
Folderele vechi au fost înlocuite cu foldere numerotate pe capitole:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adăugat nou: `docs/chapter-05-multi-agent/`

#### Migrații Fișiere
| Fișier | Din | În |
|--------|-----|----|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| Toate fișierele pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Toate fișierele troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adăugat
- **📚 Fișiere README pe Capitole**: Creat README.md în fiecare folder de capitol cu:
  - Obiective de învățare și durată
  - Tabel de lecții cu descrieri
  - Comenzi rapide pentru început
  - Navigare către celelalte capitole

#### Modificat
- **🔗 Actualizare toate linkurile interne**: Peste 78 de căi actualizate în toate fișierele de documentație
- **🗺️ README.md principal**: Actualizare Harta Cursului cu noua structură pe capitole
- **📝 examples/README.md**: Actualizare referințe către folderele capitolelor

#### Eliminat
- Structura veche a folderelor (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restructurare Depozit: Navigare pe Capitole
**Această versiune a adăugat fișiere README pentru navigarea pe capitole (înlocuită de v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ghid Nou pentru Agenți AI
**Această versiune adaugă un ghid cuprinzător pentru implementarea agenților AI cu Azure Developer CLI.**

#### Adăugat
- **🤖 docs/microsoft-foundry/agents.md**: Ghid complet care acoperă:
  - Ce sunt agenții AI și în ce diferă de chatboți
  - Trei șabloane rapide de pornire pentru agenți (Foundry Agents, Prompty, RAG)
  - Modele de arhitectură pentru agenți (agent unic, RAG, multi-agent)
  - Configurarea și personalizarea uneltelor
  - Monitorizarea și urmărirea metricilor
  - Considerații privind costurile și optimizarea
  - Scenarii comune de depanare
  - Trei exerciții practice cu criterii de succes

#### Structura Conținutului
- **Introducere**: Concepte despre agenți pentru începători
- **Început Rapid**: Implementare agenți cu `azd init --template get-started-with-ai-agents`
- **Modele de Arhitectură**: Diagrame vizuale ale modelelor agenților
- **Configurare**: Setări unelte și variabile de mediu
- **Monitorizare**: Integrare Application Insights
- **Exerciții**: Învățare practică progresivă (20-45 minute fiecare)

---

### [v3.12.0] - 2026-02-05

#### Actualizare Mediu DevContainer
**Această versiune actualizează configurația containerului de dezvoltare cu unelte moderne și setări implicite mai bune pentru experiența de învățare AZD.**

#### Modificat
- **🐳 Imagine Bază**: Actualizată de la `python:3.12-bullseye` la `python:3.12-bookworm` (ultima versiune stabilă Debian)
- **📛 Nume Container**: Redenumit din "Python 3" în "AZD for Beginners" pentru claritate

#### Adăugat
- **🔧 Noi Caracteristici Dev Container**:
  - `azure-cli` cu suport Bicep activat
  - `node:20` (versiune LTS pentru șabloane AZD)
  - `github-cli` pentru gestionarea șabloanelor
  - `docker-in-docker` pentru implementări container app

- **🔌 Forwarding Porturi**: Porturi preconfigurate pentru dezvoltare comună:
  - 8000 (previzualizare MkDocs)
  - 3000 (aplicații web)
  - 5000 (Python Flask)
  - 8080 (API-uri)

- **🧩 Extensii VS Code Noi**:
  - `ms-python.vscode-pylance` - IntelliSense Python îmbunătățit
  - `ms-azuretools.vscode-azurefunctions` - Suport Azure Functions
  - `ms-azuretools.vscode-docker` - Suport Docker
  - `ms-azuretools.vscode-bicep` - Suport limbaj Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestionare resurse Azure
  - `yzhang.markdown-all-in-one` - Editare Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Suport diagrame Mermaid
  - `redhat.vscode-yaml` - Suport YAML (pentru azure.yaml)
  - `eamodio.gitlens` - Vizualizare Git
  - `mhutchie.git-graph` - Istoric Git

- **⚙️ Setări VS Code**: Setări implicite pentru interpret Python, format la salvare și eliminare spații albe

- **📦 Actualizare requirements-dev.txt**:
  - Adăugat pluginul MkDocs minify
  - Adăugat pre-commit pentru calitatea codului
  - Adăugate pachete Azure SDK (azure-identity, azure-mgmt-resource)

#### Remediat
- **Comandă Post-Creare**: Verifică acum instalarea AZD și Azure CLI la pornirea containerului

---

### [v3.11.0] - 2026-02-05

#### Revizuire README pentru Începători
**Această versiune îmbunătățește semnificativ README.md pentru a fi mai accesibil începătorilor și adaugă resurse esențiale pentru dezvoltatori AI.**

#### Adăugat
- **🆚 Comparație Azure CLI vs AZD**: Explicație clară privind când să folosești fiecare unealtă cu exemple practice
- **🌟 Linkuri Awesome AZD**: Linkuri directe către galeria șabloanelor comunității și resurse de contribuție:
  - [Galerie Awesome AZD](https://azure.github.io/awesome-azd/) - peste 200 șabloane gata de implementat
  - [Trimite un șablon](https://github.com/Azure/awesome-azd/issues) - Contribuții comunitare
- **🎯 Ghid de Început Rapid**: Secțiune simplificată în 3 pași (Instalare → Login → Implementare)
- **📊 Tabel Navigare pe Experiență**: Ghid clar unde să începi în funcție de experiența dezvoltatorului

#### Modificat
- **Structură README**: Reorganizată pentru dezvăluire progresivă - informații cheie primele
- **Secțiune Introducere**: Rescrisă pentru a explica „Magia `azd up`” pentru începători compleți
- **Șters Conținut Duplicat**: Eliminată secțiunea duplicată de depanare
- **Comenzi depanare**: Corectată referința `azd logs` pentru a folosi comanda validă `azd monitor --logs`

#### Remediat
- **🔐 Comenzi Autentificare**: Adăugat `azd auth login` și `azd auth logout` în cheat-sheet.md
- **Referințe Comenzi Invalide**: Eliminat rămășițele comenzii `azd logs` din secțiunea de depanare README

#### Note
- **Scop**: Modificări aplicate în README.md principal și resources/cheat-sheet.md
- **Public Țintă**: Îmbunătățiri dedicate dezvoltatorilor noi în AZD

---

### [v3.10.0] - 2026-02-05

#### Actualizare Acuratețe Comenzi Azure Developer CLI
**Această versiune corectează comenzile inexistente AZD în toată documentația, asigurând că toate exemplele de cod folosesc sintaxa validă Azure Developer CLI.**

#### Remediat
- **🔧 Eliminat Comenzi AZD Inexistente**: Audit complet și corectare comenzi invalide:
  - `azd logs` (inexistentă) → înlocuită cu `azd monitor --logs` sau alternative Azure CLI
  - Subcomenzi `azd service` (inexistente) → înlocuite cu `azd show` și Azure CLI
  - `azd infra import/export/validate` (inexistente) → eliminate sau înlocuite cu alternative valide
  - Flag-uri `azd deploy --rollback/--incremental/--parallel/--detect-changes` (inexistente) → eliminate
  - Flag-uri `azd provision --what-if/--rollback` (inexistente) → actualizate să folosească `--preview`
  - `azd config validate` (inexistentă) → înlocuită cu `azd config list`
  - `azd info`, `azd history`, `azd metrics` (inexistente) → eliminate

- **📚 Fișiere Actualizate cu Corectări Comenzi**:
  - `resources/cheat-sheet.md`: Restructurare majoră a referinței comenzilor
  - `docs/deployment/deployment-guide.md`: Fixuri pentru rollback și strategii de implementare
  - `docs/troubleshooting/debugging.md`: Corectare secțiuni de analiză loguri
  - `docs/troubleshooting/common-issues.md`: Actualizare comenzi depanare
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectare secțiune depanare AZD
  - `docs/getting-started/azd-basics.md`: Corectare comenzi monitorizare
  - `docs/getting-started/first-project.md`: Actualizare exemple monitorizare și depanare
  - `docs/getting-started/installation.md`: Fixare exemple help și versiune
  - `docs/pre-deployment/application-insights.md`: Corectare comenzi vizualizare loguri
  - `docs/pre-deployment/coordination-patterns.md`: Corectare comenzi depanare agenți

- **📝 Referință Versiune Actualizată**:
  - `docs/getting-started/installation.md`: Înlocuire versiune hardcodata `1.5.0` cu generic `1.x.x` și link către releases

#### Modificat
- **Strategii Rollback**: Documentația actualizată să folosească rollback bazat pe Git (AZD nu are rollback nativ)
- **Vizualizare Loguri**: Înlocuire referințe `azd logs` cu `azd monitor --logs`, `azd monitor --live` și comenzi Azure CLI
- **Secțiune Performanță**: Eliminarea flag-urilor de implementare paralele/incrementale inexistente, oferind alternative valide

#### Detalii Tehnice
- **Comenzi AZD valide**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag-uri valide azd monitor**: `--live`, `--logs`, `--overview`
- **Funcționalități eliminate**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verificare**: Comenzile verificate față de Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalizarea atelierului și actualizarea calității documentației
**Această versiune finalizează modulele interactive ale atelierului, repară toate linkurile de documentație rupte și îmbunătățește calitatea generală a conținutului pentru dezvoltatorii AI care folosesc Microsoft AZD.**

#### Adăugat
- **📝 CONTRIBUTING.md**: Document nou cu linii directoare pentru contribuții, care include:
  - Instrucțiuni clare pentru raportarea problemelor și propunerea de modificări
  - Standardele documentației pentru conținut nou
  - Linii directoare pentru exemple de cod și convenții pentru mesajele commit-urilor
  - Informații despre implicarea comunității

#### Finalizat
- **🎯 Modul Atelier 7 (Încheiere)**: Modul complet de încheiere cu:
  - Rezumat detaliat al realizărilor atelierului
  - Secțiune despre conceptele cheie stăpânite privind AZD, șabloane și AI Foundry
  - Recomandări pentru continuarea parcursului de învățare
  - Exerciții de provocare a atelierului cu niveluri de dificultate
  - Link-uri pentru feedback comunitar și suport

- **📚 Modul Atelier 3 (Dezasamblare)**: Obiective de învățare actualizate cu:
  - Ghid pentru activarea GitHub Copilot cu serverele MCP
  - Înțelegerea structurii de foldere a șabloanelor AZD
  - Modele de organizare infrastructură ca și cod (Bicep)
  - Instrucțiuni pentru laboratoare practice

- **🔧 Modul Atelier 6 (Demontare)**: Finalizat cu:
  - Obiective pentru curățarea resurselor și gestionarea costurilor
  - Utilizarea `azd down` pentru dezprovisionarea sigură a infrastructurii
  - Ghid pentru recuperarea serviciilor cognitive șterse soft
  - Sugestii bonus de explorare pentru GitHub Copilot și portalul Azure

#### Reparat
- **🔗 Repararea Linkurilor Rupte**: Rezolvate peste 15 linkuri interne de documentație rupte:
  - `docs/ai-foundry/ai-model-deployment.md`: Corectate căile către microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectate căile ai-model-deployment.md și production-ai-practices.md
  - `docs/getting-started/first-project.md`: Înlocuit cicd-integration.md inexistent cu deployment-guide.md
  - `examples/retail-scenario.md`: Corectate căile FAQ și ghidurilor de depanare
  - `examples/container-app/microservices/README.md`: Corectate căile către pagina cursului și ghidul de implementare
  - `resources/faq.md` și `resources/glossary.md`: Actualizate referințele capitolelor AI
  - `course-outline.md`: Corectate referințele către ghidul instructorului și laboratoarele AI

- **📅 Banner stare atelier**: Actualizat din „În construcție” în stare activă a atelierului cu data februarie 2026

- **🔗 Navigare atelier**: Reparate linkuri rupte în README.md ale atelierului care indicau un folder lab-1-azd-basics inexistent

#### Modificat
- **Prezentarea Atelierului**: Eliminat avertismentul „în construcție”, atelierul este acum complet și gata de utilizare
- **Consistență navigare**: Asigurată navigarea corectă între modulele atelierului
- **Referințe trasee de învățare**: Actualizate referințele capitolelor pentru a utiliza traseele microsoft-foundry corecte

#### Validat
- ✅ Toate fișierele markdown în limba engleză au linkuri interne valide
- ✅ Modulele atelier 0-7 sunt complete cu obiective de învățare
- ✅ Navigarea între capitole și module funcționează corect
- ✅ Conținut potrivit pentru dezvoltatorii AI care folosesc Microsoft AZD
- ✅ Limbaj și structură prietenoasă pentru începători păstrate integral
- ✅ CONTRIBUTING.md oferă ghidaj clar pentru contribuitori din comunitate

#### Implementare tehnică
- **Validare linkuri**: Script PowerShell automatizat a verificat toate linkurile interne .md
- **Audit conținut**: Revizuire manuală a completitudinii atelierului și potrivirii pentru începători
- **Sistem navigare**: Aplicate modele consistente de navigare între capitole și module

#### Note
- **Domeniu**: Modificările aplicate doar documentației în limba engleză
- **Traduceri**: Folderele de traducere nu au fost actualizate în această versiune (sincronizare ulterioară automată)
- **Durată Atelier**: Atelierul complet oferă acum 3-4 ore de învățare practică

---

### [v3.8.0] - 2025-11-19

#### Documentație avansată: Monitorizare, Securitate și Modele Multi-Agent
**Această versiune adaugă lecții cuprinzătoare de categoria A despre integrarea Application Insights, modele de autentificare și coordonare multi-agent pentru implementări de producție.**

#### Adăugat
- **📊 Lecția integrare Application Insights** în `docs/pre-deployment/application-insights.md`:
  - Implementare focalizată pe AZD cu provisioning automat
  - Șabloane Bicep complete pentru Application Insights + Log Analytics
  - Aplicații Python funcționale cu telemetrie personalizată (peste 1200 linii)
  - Modele de monitorizare AI/LLM (urmărire token/cost Azure OpenAI)
  - 6 diagrame Mermaid (arhitectură, tracing distribuit, flux telemetrie)
  - 3 exerciții practice (alerte, dashboarduri, monitorizare AI)
  - Exemple Kusto și strategii de optimizare costuri
  - Streaming live metrici și depanare în timp real
  - Durată învățare 40-50 minute cu modele pregătite pentru producție

- **🔐 Lecția modele de autentificare și securitate** în `docs/getting-started/authsecurity.md`:
  - 3 modele de autentificare (connection strings, Key Vault, identitate gestionată)
  - Șabloane infrastructure Bicep complete pentru implementări sigure
  - Cod aplicație Node.js cu integrare SDK Azure
  - 3 exerciții complete (activare managed identity, identitate atribuită utilizator, rotație Key Vault)
  - Cele mai bune practici securitate și configurări RBAC
  - Ghid depanare și analiză costuri
  - Modele producție pentru autentificare fără parolă

- **🤖 Lecția modele coordonare multi-agent** în `docs/pre-deployment/coordination-patterns.md`:
  - 5 modele de coordonare (secvențial, paralel, ierarhic, eveniment-driven, consens)
  - Implementare completă serviciu orchestrator (Python/Flask, peste 1500 linii)
  - 3 implementări agenți specializați (Research, Writer, Editor)
  - Integrare Service Bus pentru cozi mesaje
  - Gestionare stare Cosmos DB pentru sisteme distribuite
  - 6 diagrame Mermaid cu interacțiuni agenți
  - 3 exerciții avansate (gestionare timeout, logică retry, circuit breaker)
  - Analiză costuri ($240-565/lună) cu strategii de optimizare
  - Integrare Application Insights pentru monitorizare

#### Îmbunătățit
- **Capitolul pre-implementare**: Include acum modele complete de monitorizare și coordonare
- **Capitolul de începere**: Îmbunătățit cu modele profesionale de autentificare
- **Pregătire producție**: Acoperire completă de la securitate la observabilitate
- **Structura cursului**: Actualizări referitoare la lecțiile noi din Capitolele 3 și 6

#### Modificat
- **Progresul învățării**: Integrare mai bună a securității și monitorizării pe parcursul cursului
- **Calitatea documentației**: Standarde consecvente categoria A (95-97%) în lecțiile noi
- **Modele producție**: Acoperire completă end-to-end pentru implementări enterprise

#### Îmbunătățit
- **Experiența dezvoltatorilor**: Traseu clar de la dezvoltare la monitorizare în producție
- **Standard securitate**: Modele profesionale pentru autentificare și gestionare secrete
- **Observabilitate**: Integrare completă Application Insights cu AZD
- **Lucrări AI**: Monitorizare specializată pentru Azure OpenAI și sisteme multi-agent

#### Validat
- ✅ Toate lecțiile conțin cod complet funcțional (nu doar fragmente)
- ✅ Diagrame Mermaid pentru învățare vizuală (19 în total în 3 lecții)
- ✅ Exerciții practice cu pași de verificare (9 în total)
- ✅ Șabloane Bicep gata de producție și implementabile cu `azd up`
- ✅ Analiză costuri și strategii de optimizare
- ✅ Ghiduri de depanare și cele mai bune practici
- ✅ Puncte de control al cunoștințelor cu comenzi de verificare

#### Rezultate notare documentație
- **docs/pre-deployment/application-insights.md**: Ghid complet monitorizare
- **docs/getting-started/authsecurity.md**: Modele profesionale securitate
- **docs/pre-deployment/coordination-patterns.md**: Arhitecturi avansate multi-agent
- **Conținut nou general**: Standarde înalte și consistente

#### Implementare tehnică
- **Application Insights**: Log Analytics + telemetrie personalizată + tracing distribuit
- **Autentificare**: Managed Identity + Key Vault + modele RBAC
- **Multi-agent**: Service Bus + Cosmos DB + Container Apps + orchestrare
- **Monitorizare**: Metrici live + interogări Kusto + alerte + dashboard-uri
- **Gestionare costuri**: Strategie sampling, politici retenție, control buget

### [v3.7.0] - 2025-11-19

#### Îmbunătățiri calitate documentație și exemplu nou Azure OpenAI
**Această versiune îmbunătățește calitatea documentației în întregul depozit și adaugă un exemplu complet de implementare Azure OpenAI cu interfață chat GPT-4.**

#### Adăugat
- **🤖 Exemplu chat Azure OpenAI**: Implementare completă GPT-4 cu funcționalitate în `examples/azure-openai-chat/`:
  - Infrastructură Azure OpenAI completă (implementare model GPT-4)
  - Interfață chat Python CLI cu istoric conversații
  - Integrare Key Vault pentru stocarea securizată a cheilor API
  - Monitorizare utilizare tokeni și estimare costuri
  - Limitare rată și gestionare erori
  - README detaliat cu ghid de implementare pentru 35-45 minute
  - 11 fișiere gata pentru producție (șabloane Bicep, aplicație Python, configurație)
- **📚 Exerciții documentație**: Adăugate exerciții practice în ghidul de configurare:
  - Exercițiul 1: Configurare multi-mediu (15 minute)
  - Exercițiul 2: Practică gestionare secrete (10 minute)
  - Criterii clare de succes și pași de verificare
- **✅ Verificare implementare**: Secțiune de verificare adăugată în ghidul de implementare:
  - Proceduri de verificare a sănătății serviciului
  - Lista de verificare a criteriilor de succes
  - Rezultate așteptate pentru toate comenzi de implementare
  - Referință rapidă pentru depanare

#### Îmbunătățit
- **examples/README.md**: Actualizat cu calitate categorie A (93%):
  - Adăugat azure-openai-chat în toate secțiunile relevante
  - Numărul exemplelor locale actualizat de la 3 la 4
  - Inclus în tabelul Exemple Aplicații AI
  - Integrat în Quick Start pentru utilizatori intermediari
  - Adăugat în secțiunea Șabloane Microsoft Foundry
  - Updatat matrice comparativă și secțiuni tehnologice
- **Calitate documentație**: Îmbunătățită de la B+ (87%) la A- (92%) în folderul docs:
  - Adăugat rezultate așteptate în exemple de comenzi critice
  - Inclus pași de verificare pentru modificări configurare
  - Învățare practică cu exerciții aplicabile

#### Modificat
- **Progres învățare**: Integrare mai bună a exemplelor AI pentru începători intermediari
- **Structură documentație**: Exerciții mai practice cu rezultate clare
- **Proces verificare**: Criterii explicite de succes adăugate în fluxuri cheie

#### Îmbunătățit
- **Experiența dezvoltatorului**: Implementarea Azure OpenAI durează acum 35-45 minute (vs 60-90 alte alternative complexe)
- **Transparență costuri**: Estimări clare ($50-200/lună) pentru exemplul Azure OpenAI
- **Traseu de învățare**: Dezvoltatorii AI au punct de intrare clar cu azure-openai-chat
- **Standard documentație**: Rezultate așteptate și pași de verificare consistenți

#### Validat
- ✅ Exemplul Azure OpenAI complet funcțional cu `azd up`
- ✅ Toate cele 11 fișiere implementare corecte sintactic
- ✅ Instrucțiunile README se potrivesc cu experiența reală de implementare
- ✅ Linkurile documentației actualizate în peste 8 locații
- ✅ Indexul exemplelor reflectă corect 4 exemple locale
- ✅ Fără linkuri externe duplicate în tabele
- ✅ Toate referințele de navigare corecte

#### Implementare tehnică
- **Arhitectură Azure OpenAI**: GPT-4 + Key Vault + Container Apps
- **Securitate**: Managed Identity pregătită, secrete în Key Vault
- **Monitorizare**: Integrare Application Insights
- **Gestionare costuri**: Monitorizare tokeni și optimizare utilizare
- **Implementare**: Comandă unică `azd up` pentru configurare completă

### [v3.6.0] - 2025-11-19

#### Actualizare majoră: Exemple de implementare Container App
**Această versiune introduce exemple complete, pregătite pentru producție, de implementare aplicații containerizate folosind Azure Developer CLI (AZD), cu documentație completă și integrare în traseul de învățare.**

#### Adăugat
- **🚀 Exemple Container App**: Exemple locale noi în `examples/container-app/`:
  - [Ghid Master](examples/container-app/README.md): Prezentare completă a implementărilor containerizate, start rapid, producție și modele avansate
  - [API Flask simplu](../../examples/container-app/simple-flask-api): REST API prietenos pentru începători cu scale-to-zero, probe de sănătate, monitorizare și depanare
  - [Arhitectură microservicii](../../examples/container-app/microservices): Implementare multi-servicii gata pentru producție (API Gateway, Product, Order, User, Notification), mesagerie asincronă, Service Bus, Cosmos DB, Azure SQL, tracing distribuit, deploy albastru-verde/canary
- **Cele mai bune practici**: Securitate, monitorizare, optimizare costuri și ghiduri CI/CD pentru încărcături containerizate
- **Exemple cod**: Șabloane `azure.yaml`, Bicep complete și implementări multi-limbaj (Python, Node.js, C#, Go)
- **Testare & depanare**: Scenarii end-to-end, comenzi monitorizare, ghiduri depanare

#### Modificat
- **README.md**: Actualizat pentru a prezenta și lega noile exemple container app sub „Local Examples - Container Applications”
- **examples/README.md**: Actualizat pentru a evidenția exemplele container app, a adăuga intrări în matricea de comparație și a actualiza referințele tehnologice/arhitecturale
- **Plan de curs și ghid de studiu**: Actualizat pentru a face referire la noi exemple de aplicații containerizate și modele de implementare în capitolele relevante

#### Validat
- ✅ Toate noile exemple pot fi implementate cu `azd up` și respectă cele mai bune practici
- ✅ Legăturile din documentație și navigația au fost actualizate
- ✅ Exemplele acoperă scenarii de la începători la avansați, inclusiv microservicii de producție

#### Note
- **Domeniu**: Doar documentația și exemplele în limba engleză
- **Pași următori**: Extinderea cu modele avansate suplimentare pentru containere și automatizare CI/CD în versiunile viitoare

### [v3.5.0] - 2025-11-19

#### Rebranding produs: Microsoft Foundry
**Această versiune implementează o schimbare completă a numelui produsului de la „Microsoft Foundry” la „Microsoft Foundry” în toată documentația în limba engleză, reflectând rebrandingul oficial Microsoft.**

#### Modificat
- **🔄 Actualizare nume produs**: Rebranding complet de la „Microsoft Foundry” la „Microsoft Foundry”
  - Actualizate toate referințele în documentația în limba engleză din folderul `docs/`
  - Redenumit folderul: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Redenumit fișierul: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referințe actualizate în 7 fișiere de documentație

- **📁 Modificări structură foldere**:
  - `docs/ai-foundry/` redenumit în `docs/microsoft-foundry/`
  - Toate referințele încrucișate actualizate conform noii structuri a folderelor
  - Legăturile de navigare validate în toată documentația

- **📄 Redenumiri fișiere**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toate legăturile interne actualizate pentru a face referire la noul nume de fișier

#### Fișiere actualizate
- **Documentație capitole** (7 fișiere):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizări legături de navigare
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referințe actualizate la numele produsului
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - deja folosește Microsoft Foundry (din actualizările anterioare)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referințe actualizate (prezentare generală, feedback comunitate, documentație)
  - `docs/getting-started/azd-basics.md` - 4 legături încrucișate actualizate
  - `docs/getting-started/first-project.md` - 2 legături de navigare capitol actualizate
  - `docs/getting-started/installation.md` - 2 legături următor capitol actualizate
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referințe actualizate (navigare, comunitatea Discord)
  - `docs/troubleshooting/common-issues.md` - 1 legătură de navigare actualizată
  - `docs/troubleshooting/debugging.md` - 1 legătură de navigare actualizată

- **Fișiere structură curs** (2 fișiere):
  - `README.md` - 17 referințe actualizate (prezentare curs, titluri capitole, secțiune template-uri, perspective comunitate)
  - `course-outline.md` - 14 referințe actualizate (prezentare generală, obiective de învățare, resurse capitole)

#### Validat
- ✅ Nicio referință rămasă la calea folderului „ai-foundry” în documentația în limba engleză
- ✅ Nicio referință rămasă la numele produsului „Microsoft Foundry” în documentația în limba engleză
- ✅ Toate legăturile de navigare funcționale conform noii structuri de foldere
- ✅ Redenumirile fișierelor și folderelor finalizate cu succes
- ✅ Referințele încrucișate între capitole validate

#### Note
- **Domeniu**: Modificări aplicate doar documentației în limba engleză din folderul `docs/`
- **Traduceri**: Folderele de traduceri (`translations/`) nu au fost actualizate în această versiune
- **Workshop**: Materialele workshopului (`workshop/`) nu au fost actualizate în această versiune
- **Exemple**: Fișierele cu exemple pot încă conține denumiri vechi (vor fi actualizate în versiuni viitoare)
- **Legături externe**: URL-uri externe și referințe GitHub rămân neschimbate

#### Ghid de migrare pentru contributori
Dacă aveți branch-uri locale sau documentație care face referire la structura veche:
1. Actualizați referințele la folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualizați referințele la fișiere: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Înlocuiți numele produsului: „Microsoft Foundry” → „Microsoft Foundry”
4. Verificați că toate legăturile interne în documentație funcționează corect

---

### [v3.4.0] - 2025-10-24

#### Previzualizare infrastructură și îmbunătățiri de validare
**Această versiune introduce suport complet pentru noua funcție de previzualizare Azure Developer CLI și îmbunătățește experiența utilizatorului în workshop.**

#### Adăugat
- **🧪 Documentație funcție azd provision --preview**: Acoperire completă pentru noua capacitate de previzualizare a infrastructurii
  - Referință comandă și exemple de utilizare în foaia de trucuri
  - Integrare detaliată în ghidul de provisioning, cu studii de caz și beneficii
  - Integrare verificare prealabilă pentru validare mai sigură a implementării
  - Actualizări în ghidul de începere cu cele mai bune practici de implementare sigură
- **🚧 Banner stare workshop**: Banner HTML profesional care indică starea de dezvoltare a workshopului
  - Design gradient cu indicatori de construcție pentru comunicare clară către utilizatori
  - Marcaj cu data ultimei actualizări pentru transparență
  - Design adaptabil pentru dispozitive mobile

#### Îmbunătățit
- **Siguranța infrastructurii**: Funcționalitate de previzualizare integrată în documentația de implementare
- **Validare înainte de implementare**: Scripturi automate acum includ testarea previzualizării infrastructurii
- **Flux de lucru dezvoltatori**: Secvențe de comenzi actualizate pentru a include previzualizarea ca bună practică
- **Experiență workshop**: Așteptări clare stabilite pentru utilizatori privind stadiul dezvoltării conținutului

#### Modificat
- **Bune practici implementare**: Metodă recomandată cu workflow initiat de previzualizare
- **Flux documentație**: Validarea infrastructurii mutată mai devreme în procesul de învățare
- **Prezentare workshop**: Comunicare profesională a statusului cu timeline clar de dezvoltare

#### Îmbunătățiri
- **Abordare axată pe siguranță**: Modificările infrastructurii pot fi validate înainte de implementare
- **Colaborare în echipă**: Rezultatele previzualizării pot fi partajate pentru revizuire și aprobare
- **Conștientizare costuri**: Înțelegere mai bună a costurilor resurselor înainte de provisioning
- **Reducerea riscurilor**: Eșecurile implementărilor diminuate prin validare prealabilă

#### Implementare tehnică
- **Integrare multi-document**: Funcția de previzualizare documentată în 4 fișiere cheie
- **Modele de comandă**: Sintaxă și exemple consistente în întreaga documentație
- **Integrare bune practici**: Previzualizarea inclusă în fluxurile de validare și scripturi
- **Indicatori vizuali**: Marcaje clare NEW pentru vizibilitate

#### Infrastructură workshop
- **Comunicare stare**: Banner HTML profesional cu stil gradient
- **Experiență utilizator**: Stare clară a dezvoltării previne confuzia
- **Prezentare profesională**: Menține credibilitatea depozitului și setarea așteptărilor
- **Transparență timeline**: Data ultimei actualizări din octombrie 2025 pentru responsabilitate

### [v3.3.0] - 2025-09-24

#### Materiale workshop îmbunătățite și experiență interactivă de învățare
**Această versiune introduce materiale complete de workshop cu ghiduri interactive în browser și trasee de învățare structurate.**

#### Adăugat
- **🎥 Ghid workshop interactiv**: Experiență de workshop bazată pe browser cu previzualizare MkDocs
- **📝 Instrucțiuni structurate workshop**: Parcurs educațional ghidat în 7 pași, de la descoperire la personalizare
  - 0-Introducere: Prezentare generală și configurare workshop
  - 1-Select-AI-Template: Proces de descoperire și selecție template
  - 2-Validate-AI-Template: Proceduri de implementare și validare
  - 3-Deconstruct-AI-Template: Înțelegerea arhitecturii template-ului
  - 4-Configure-AI-Template: Configurare și personalizare
  - 5-Customize-AI-Template: Modificări avansate și iterații
  - 6-Teardown-Infrastructure: Curățare și gestionare resurse
  - 7-Concluzii: Rezumat și pași următori
- **🛠️ Unelte workshop**: Configurație MkDocs cu tema Material pentru experiență educațională îmbunătățită
- **🎯 Parcurs practic de învățare**: Metodologie în 3 pași (Descoperire → Implementare → Personalizare)
- **📱 Integrare GitHub Codespaces**: Configurare simplificată a mediului de dezvoltare

#### Îmbunătățit
- **Laborator AI Workshop**: Extins cu experiență educațională aprofundată de 2-3 ore
- **Documentație workshop**: Prezentare profesională cu navigare și elemente vizuale
- **Progres educațional**: Ghid clar pas cu pas de la selecția template-ului la implementare în producție
- **Experiență dezvoltator**: Unelte integrate pentru fluxuri de lucru eficiente

#### Îmbunătățiri
- **Accesibilitate**: Interfață browser cu căutare, copiere și comutare temă
- **Învățare în ritm propriu**: Structură flexibilă care acomodează diferite viteze de învățare
- **Aplicabilitate practică**: Scenarii reale de implementare AI
- **Integrare comunitate**: Acces Discord pentru suport și colaborare workshop

#### Funcționalități workshop
- **Căutare încorporată**: Descoperire rapidă de cuvinte cheie și lecții
- **Copiere blocuri de cod**: Funcționalitate hover-to-copy pentru toate exemplele
- **Comutare temă**: Mod întunecat/deschis pentru preferințe diverse
- **Resurse vizuale**: Capturi de ecran și diagrame pentru înțelegere facilitată
- **Integrare ajutor**: Acces direct la Discord pentru suport comunitar

### [v3.2.0] - 2025-09-17

#### Restructurare majoră navigare și sistem de învățare bazat pe capitole
**Această versiune introduce o structură completă de învățare pe capitole cu navigare avansată în întregul depozit.**

#### Adăugat
- **📚 Sistem de învățare bazat pe capitole**: Restructurarea întregului curs în 8 capitole progresive de învățare
  - Capitolul 1: Fundamente & Start rapid (⭐ - 30-45 min)
  - Capitolul 2: Dezvoltare AI-First (⭐⭐ - 1-2 ore)
  - Capitolul 3: Configurare & Autentificare (⭐⭐ - 45-60 min)
  - Capitolul 4: Infrastructură ca cod & Implementare (⭐⭐⭐ - 1-1,5 ore)
  - Capitolul 5: Soluții Multi-Agent AI (⭐⭐⭐⭐ - 2-3 ore)
  - Capitolul 6: Validare & Planificare pre-implementare (⭐⭐ - 1 oră)
  - Capitolul 7: Depanare & Debugging (⭐⭐ - 1-1,5 ore)
  - Capitolul 8: Modele pentru producție & întreprinderi (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistem de navigare cuprinzător**: Antete și subsoluri consistente în toată documentația
- **🎯 Urmărire progres**: Listă de verificare a finalizării cursului și sistem de verificare a învățării
- **🗺️ Ghidare traseu de învățare**: Puncte clare de intrare pentru niveluri și obiective diferite
- **🔗 Navigare prin referințe încrucișate**: Capitole conexe și precondiții clar legate

#### Îmbunătățit
- **Structură README**: Transformată într-o platformă de învățare organizată pe capitole
- **Navigare documentație**: Fiecare pagină include context de capitol și ghidare progres
- **Organizare template-uri**: Exemple și template-uri mapate pentru capitole corespunzătoare
- **Integrare resurse**: Foaie de trucuri, FAQ și ghiduri de studiu conectate la capitole relevante
- **Integrare workshop**: Laboratoare practice asociate cu obiective de învățare multiple

#### Modificat
- **Progres învățare**: Trecere de la documentație liniară la învățare flexibilă pe capitole
- **Locație configurare**: Ghid configurare mutat ca Capitolul 3 pentru un flux educațional mai bun
- **Integrare conținut AI**: Integrare îmbunătățită a conținutului specific AI pe parcurs
- **Conținut producție**: Modele avansate consolidate în Capitolul 8 pentru cursanții enterprise

#### Îmbunătățit
- **Experiență utilizator**: Breadcrumb-uri clare și indicatori de progres pe capitole
- **Accesibilitate**: Modele de navigare consistente pentru traversare ușoară a cursului
- **Prezentare profesională**: Structură universitară potrivită pentru training academic și corporativ
- **Eficiență învățare**: Timp redus de găsire a conținutului prin organizare îmbunătățită

#### Implementare tehnică
- **Antete navigare**: Navigare capitole standardizată în peste 40 fișiere de documentație
- **Navigare subsol**: Ghidări consistente pentru progres și indicatori de finalizare capitol
- **Legături încrucișate**: Sistem cuprinzător de legături interne pentru concepte conexe
- **Mapare capitole**: Template-uri și exemple clar asociate obiectivelor de învățare

#### Îmbunătățirea ghidului de studiu
- **📚 Obiective complete de învățare**: Ghid reorganizat pentru alinierea la sistemul de 8 capitole
- **🎯 Evaluare pe capitole**: Fiecare capitol include obiective specifice și exerciții practice
- **📋 Urmărirea progresului**: Program săptămânal de învățare cu rezultate măsurabile și liste de verificare
- **❓ Întrebări de evaluare**: Întrebări de validare a cunoștințelor pentru fiecare capitol cu rezultate profesionale
- **🛠️ Exerciții practice**: Activități hands-on cu scenarii reale de implementare și depanare
- **📊 Progresie abilități**: Avansare clară de la concepte de bază la modele enterprise cu focus pe dezvoltare carieră
- **🎓 Cadru certificare**: Rezultate de dezvoltare profesională și sistem de recunoaștere comunitară
- **⏱️ Management timeline**: Plan structurat de 10 săptămâni cu validare a etapelor

### [v3.1.0] - 2025-09-17

#### Soluții multi-agent AI îmbunătățite
**Această versiune îmbunătățește soluția retail multi-agent cu denumiri mai clare pentru agenți și documentație extinsă.**

#### Modificat
- **Terminologie multi-agent**: Înlocuit „agent Cora” cu „agent Client” în întreaga soluție multi-agent retail pentru claritate
- **Arhitectură agent**: Actualizate toate documentațiile, template-urile ARM și exemplele de cod pentru a folosi „agent Client” consecvent
- **Exemple configurare**: Modernizate modelele de configurare pentru agenți cu denumiri actualizate
- **Consistență documentație**: Asigurate referințe profesioniste și descriptive pentru agenți

#### Îmbunătățit
- **Pachet template ARM**: Actualizat retail-multiagent-arm-template cu referințe agent Client
- **Diagrame arhitectură**: Reîmprospătate diagrame Mermaid cu denumiri agenți actualizate
- **Exemple cod**: Clase Python și exemple implementare folosesc acum denumirea CustomerAgent
- **Variabile mediu**: Actualizate toate scripturile de implementare pentru a folosi convenția CUSTOMER_AGENT_NAME

#### Îmbunătățit
- **Experiența Dezvoltatorului**: Roluri și responsabilități mai clare ale agenților în documentație
- **Pregătirea pentru Producție**: Aliniere mai bună cu convențiile de denumire enterprise
- **Materiale de Învățare**: Denumire mai intuitivă a agenților pentru scopuri educaționale
- **Utilizabilitatea Șabloanelor**: Înțelegere simplificată a funcțiilor agenților și a modelelor de implementare

#### Detalii Tehnice
- Actualizate diagramele arhitecturii Mermaid cu referințe la CustomerAgent
- Înlocuite numele claselor CoraAgent cu CustomerAgent în exemplele Python
- Modificate configurațiile JSON ale șabloanelor ARM pentru a folosi tipul agent "customer"
- Actualizate variabilele de mediu de la CORA_AGENT_* la CUSTOMER_AGENT_*
- Reîmprospătate toate comenzile de implementare și configurațiile containerelor

### [v3.0.0] - 2025-09-12

#### Schimbări Majore – Focalizare pe Dezvoltatorii AI și Integrare Microsoft Foundry
**Această versiune transformă depozitul într-o resursă de învățare cuprinzătoare, concentrată pe AI, cu integrare Microsoft Foundry.**

#### Adăugate
- **🤖 Parcurs de Învățare AI-First**: Restructurare completă prioritizând dezvoltatorii și inginerii AI
- **Ghid de Integrare Microsoft Foundry**: Documentație cuprinzătoare pentru conectarea AZD la serviciile Microsoft Foundry
- **Modele de Implementare AI**: Ghid detaliat acoperind selecția modelului, configurarea și strategii pentru implementare în producție
- **Laborator Workshop AI**: Atelier practic de 2-3 ore pentru convertirea aplicațiilor AI în soluții implementabile cu AZD
- **Practici Optime pentru AI în Producție**: Modele pregătite pentru întreprinderi privind scalarea, monitorizarea și securizarea sarcinilor AI
- **Ghid de Depanare Specific AI**: Depanare cuprinzătoare pentru Azure OpenAI, Cognitive Services și probleme de implementare AI
- **Galerie Șabloane AI**: Colecție selectată de șabloane Microsoft Foundry cu ratinguri de complexitate
- **Materiale Workshop**: Structură completă de workshop cu laboratoare practice și materiale de referință

#### Îmbunătățite
- **Structura README**: Focalizată pe dezvoltatorii AI cu 45% interes din comunitatea Microsoft Foundry Discord
- **Parcurse de Învățare**: Parcurs dedicat dezvoltatorilor AI pe lângă cele tradiționale pentru studenți și ingineri DevOps
- **Recomandări Șabloane**: Șabloane AI recomandate incluzând azure-search-openai-demo, contoso-chat, și openai-chat-app-quickstart
- **Integrare Comunitate**: Suport extins în Discord cu canale și discuții specifice AI

#### Securitate și Focus pe Producție
- **Modele de Identitate Gestionată**: Configurări de autentificare și securitate specifice AI
- **Optimizare Costuri**: Monitorizare utilizare tokeni și controale bugetare pentru sarcini AI
- **Implementare Multi-Regiune**: Strategii pentru implementarea globală a aplicațiilor AI
- **Monitorizare Performanță**: Metrici specifice AI și integrare cu Application Insights

#### Calitatea Documentației
- **Structură Lineară a Cursului**: Progresie logică de la începător la modele avansate de implementare AI
- **URL-uri Validate**: Toate linkurile externe către depozite verificate și accesibile
- **Referință Completă**: Toate linkurile interne validate și funcționale
- **Pregătit pentru Producție**: Modele de implementare enterprise cu exemple din lumea reală

### [v2.0.0] - 2025-09-09

#### Schimbări Majore – Restructurare Depozit și Îmbunătățire Profesională
**Această versiune reprezintă o remodelare semnificativă a structurii depozitului și a prezentării conținutului.**

#### Adăugate
- **Cadru Structurat de Învățare**: Toate paginile de documentație includ acum secțiuni pentru Introducere, Obiective de Învățare și Rezultate așteptate
- **Sistem de Navigare**: Adăugate linkuri Lecția Anterioară/Următoare în toată documentația pentru o progresie ghidată
- **Ghid de Studiu**: study-guide.md cu obiective de învățare, exerciții practice și materiale de evaluare
- **Prezentare Profesională**: Eliminat toate emoji-urile pentru accesibilitate și aspect profesional îmbunătățit
- **Structură Conținut Îmbunătățită**: Organizare și flux îmbunătățit al materialelor de învățare

#### Modificate
- **Format Documentație**: Standardizat toată documentația cu structură axată pe învățare
- **Flux Navigare**: Implementare progresie logică în toate materialele de învățare
- **Prezentare Conținut**: Eliminare elemente decorative în favoarea unui format clar și profesional
- **Structură Linkuri**: Actualizat toate linkurile interne pentru a sprijini noul sistem de navigare

#### Îmbunătățite
- **Accesibilitate**: Eliminarea dependențelor de emoji pentru compatibilitate cu cititoarele de ecran
- **Aspect Profesional**: Prezentare curată, în stil academic, potrivită pentru învățarea enterprise
- **Experiență de Învățare**: Abordare structurată cu obiective clare și rezultate pentru fiecare lecție
- **Organizare Conținut**: Flux logic îmbunătățit și legături între subiecte conexe

### [v1.0.0] - 2025-09-09

#### Lansare Inițială – Depozit Complet pentru Învățarea AZD

#### Adăugate
- **Structura Principală a Documentației**
  - Serii complete de ghiduri de început rapid
  - Documentație cuprinzătoare pentru implementare și provisioning
  - Resurse detaliate pentru depanare și ghiduri de depanare
  - Instrumente și proceduri de validare pre-implementare

- **Modul Început Rapid**
  - Bazele AZD: Concepute și terminologie de bază
  - Ghid de Instalare: Instrucțiuni specifice platformei
  - Ghid de Configurare: Setarea mediului și autentificarea
  - Tutorial Proiect Inițial: Învățare practică pas cu pas

- **Modul Implementare și Provisioning**
  - Ghid Implementare: Documentație completă flux de lucru
  - Ghid Provisioning: Infrastructură ca cod cu Bicep
  - Practici optime pentru implementări în producție
  - Modele de arhitectură multi-serviciu

- **Modul Validare Pre-Implementare**
  - Planificarea Capacității: Validarea disponibilității resurselor Azure
  - Selecția SKU: Ghid cuprinzător pentru niveluri de servicii
  - Verificări Pre-zbor: Scripturi automate de validare (PowerShell și Bash)
  - Estimare costuri și instrumente de planificare bugetară

- **Modul Depanare**
  - Probleme Comune: Probleme frecvent întâlnite și soluții
  - Ghid Depanare: Metodologii sistematice de depanare
  - Tehnici și instrumente avansate de diagnostic
  - Monitorizare și optimizare performanță

- **Resurse și Referințe**
  - Fișă de Comenzi Rapidă: Referință rapidă pentru comenzi esențiale
  - Glosar: Definiții cuprinzătoare ale terminologiei și acronimelor
  - Întrebări Frecvente: Răspunsuri detaliate la întrebări comune
  - Linkuri către resurse externe și conexiuni în comunitate

- **Exemple și Șabloane**
  - Exemplu de Aplicație Web Simplă
  - Șablon pentru implementare Site Static
  - Configurare Aplicație Container
  - Modele de integrare baze de date
  - Exemple de arhitectură microservicii
  - Implementări de funcții serverless

#### Funcționalități
- **Suport Multi-Platăformă**: Ghiduri de instalare și configurare pentru Windows, macOS și Linux
- **Niveluri Multiple de Abilități**: Conținut destinat de la studenți la dezvoltatori profesioniști
- **Focus Practic**: Exemple practice și scenarii din lumea reală
- **Acoperire Cuprinzătoare**: De la concepte de bază la modele enterprise avansate
- **Abordare Security-First**: Cele mai bune practici de securitate integrate pe tot parcursul
- **Optimizare Costuri**: Ghiduri pentru implementări cost-eficiente și gestionarea resurselor

#### Calitatea Documentației
- **Exemple Cod Detaliate**: Exemple de cod practice și testate
- **Instrucțiuni Pas cu Pas**: Ghiduri clare și acționabile
- **Gestionare Completă a Erorilor**: Depanare pentru probleme frecvente
- **Integrare Best Practices**: Standardele și recomandările industriei
- **Compatibilitate Versiuni**: Actualizat cu cele mai recente servicii Azure și funcționalități azd

## Îmbunătățiri Viitoare Planificate

### Versiunea 3.1.0 (Planificată)
#### Extindere Platformă AI
- **Suport Multi-Model**: Modele de integrare pentru Hugging Face, Azure Machine Learning și modele personalizate
- **Cadre pentru Agenți AI**: Șabloane pentru implementări LangChain, Semantic Kernel și AutoGen
- **Modele RAG Avansate**: Opțiuni de baze de date vectoriale dincolo de Azure AI Search (Pinecone, Weaviate etc.)
- **Observabilitate AI**: Monitorizare îmbunătățită a performanței modelului, utilizării tokenilor și calității răspunsurilor

#### Experiența Dezvoltatorului
- **Extensie VS Code**: Experiență integrată AZD + AI Foundry în dezvoltare
- **Integrare GitHub Copilot**: Generare asistată AI de șabloane AZD
- **Tutoriale Interactive**: Exerciții de codare practice cu validare automată pentru scenarii AI
- **Conținut Video**: Tutoriale video suplimentare pentru învățarea vizuală, axate pe implementări AI

### Versiunea 4.0.0 (Planificată)
#### Modele Enterprise AI
- **Cadru de Guvernanță**: Guvernanță model AI, conformitate și trasee de audit
- **AI Multi-Tenant**: Modele pentru servirea mai multor clienți cu servicii AI izolate
- **Implementare AI la Margine**: Integrare cu Azure IoT Edge și instanțe container
- **Cloud Hibrid AI**: Modele multi-cloud și hibride pentru sarcini AI

#### Funcționalități Avansate
- **Automatizare Pipeline AI**: Integrare MLOps cu pipeline-uri Azure Machine Learning
- **Securitate Avansată**: Modele zero-trust, endpoint-uri private și protecție avansată împotriva amenințărilor
- **Optimizare Performanță**: Reglaj avansat și strategii de scalare pentru aplicații AI cu trafic mare
- **Distribuție Globală**: Modele de livrare conținut și caching la margine pentru aplicații AI

### Versiunea 3.0.0 (Planificată) - Înlocuită de Versiunea Curentă
#### Adăugări Propuse – Implementate în v3.0.0
- ✅ **Conținut Focalizat pe AI**: Integrare cuprinzătoare Microsoft Foundry (Finalizat)
- ✅ **Tutoriale Interactive**: Laborator AI hands-on (Finalizat)
- ✅ **Modul Securitate Avansată**: Modele de securitate specifice AI (Finalizat)
- ✅ **Optimizare Performanță**: Strategii de reglaj pentru sarcini AI (Finalizat)

### Versiunea 2.1.0 (Planificată) – Parțial Implementată în v3.0.0
#### Îmbunătățiri Minore – Unele Finalizate în Versiunea Curentă
- ✅ **Exemple Suplimentare**: Scenarii de implementare AI (Finalizat)
- ✅ **FAQ Extins**: Întrebări și depanare specifice AI (Finalizat)
- **Integrare Unelte**: Ghiduri pentru integrarea IDE și editor
- ✅ **Extindere Monitorizare**: Modele de monitorizare și alertare AI (Finalizat)

#### Planificate Pentru Versiuni Viitoare
- **Documentație Prietenoasă pentru Mobil**: Design responsiv pentru învățare pe mobil
- **Acces Offline**: Pachete documentație descărcabile
- **Integrare IDE Îmbunătățită**: Extensie VS Code pentru fluxuri AZD + AI
- **Tablou de Bord Comunitar**: Metrici comunitare în timp real și urmărire contribuții

## Contribuții la Changelog

### Raportarea Schimbărilor
Când contribuiți la acest depozit, asigurați-vă că intrările în changelog includ:

1. **Numărul Versiunii**: Urmând scheme semantice (major.minor.patch)
2. **Data**: Dată lansare sau actualizare în format YYYY-MM-DD
3. **Categorie**: Adăugat, Modificat, Depreciat, Eliminat, Remediat, Securitate
4. **Descriere Clară**: Descriere concisă a modificării
5. **Evaluare Impact**: Cum afectează utilizatorii existenți

### Categorii de Schimbări

#### Adăugat
- Funcționalități noi, secțiuni documentație sau capabilități
- Exemple noi, șabloane sau resurse de învățare
- Unelte suplimentare, scripturi sau utilitare

#### Modificat
- Modificări la funcționalitatea sau documentația existentă
- Actualizări pentru a îmbunătăți claritatea sau acuratețea
- Restructurarea conținutului sau organizării

#### Depreciat
- Funcții sau abordări în faza de eliminare
- Secțiuni de documentație programate pentru eliminare
- Metode cu alternative mai bune

#### Eliminat
- Funcții, documentație sau exemple învechite
- Informații depășite sau abordări depreciate
- Conținut redundant sau consolidat

#### Remediat
- Corectări de erori în documentație sau cod
- Rezolvarea problemelor raportate
- Îmbunătățiri pentru acuratețe sau funcționalitate

#### Securitate
- Îmbunătățiri sau remedieri legate de securitate
- Actualizări ale celor mai bune practici de securitate
- Rezolvarea vulnerabilităților de securitate

### Ghiduri de Versionare Semantică

#### Versiune Majoră (X.0.0)
- Schimbări ce afectează compatibilitatea, necesitând acțiune din partea utilizatorului
- Restructurări semnificative ale conținutului sau organizării
- Modificări care schimbă abordarea fundamentală sau metodologia

#### Versiune Minoră (X.Y.0)
- Funcționalități noi sau adăugiri de conținut
- Îmbunătățiri ce mențin compatibilitatea inversă
- Exemple, unelte sau resurse suplimentare

#### Versiune Patch (X.Y.Z)
- Corecții de erori și remediere bug-uri
- Îmbunătățiri minore ale conținutului existent
- Clarificări și ajustări mici

## Feedback și Sugestii ale Comunității

Încurajăm activ feedback-ul comunității pentru a îmbunătăți această resursă de învățare:

### Cum să Oferi Feedback
- **Issue-uri GitHub**: Semnalează probleme sau propune îmbunătățiri (issue-uri specifice AI sunt binevenite)
- **Discuții Discord**: Împărtășește idei și implică-te în comunitatea Microsoft Foundry
- **Pull Requests**: Contribuie cu îmbunătățiri directe la conținut, în special șabloane și ghiduri AI
- **Microsoft Foundry Discord**: Participă în canalul #Azure pentru discuții AZD + AI
- **Forumuri Comunitare**: Implică-te în discuții mai largi de dezvoltatori Azure

### Categorii de Feedback
- **Acuratețe Conținut AI**: Corecții privind integrarea și implementarea serviciilor AI
- **Experiența de Învățare**: Sugestii pentru un flux mai bun de învățare a dezvoltatorilor AI
- **Lipsuri în Conținut AI**: Cereri pentru șabloane, modele sau exemple AI suplimentare
- **Accesibilitate**: Îmbunătățiri pentru nevoi diverse de învățare
- **Integrare Unelte AI**: Sugestii pentru integrarea mai bună a fluxurilor de dezvoltare AI
- **Modele Implementare AI pentru Producție**: Cereri pentru modele enterprise de implementare AI

### Angajament de Răspuns
- **Răspuns la Issue**: În termen de 48 de ore pentru probleme raportate
- **Cereri Funcționalități**: Evaluare în termen de o săptămână
- **Contribuții Comunitare**: Revizuire în termen de o săptămână
- **Probleme de Securitate**: Prioritate imediată cu răspuns accelerat

## Program de Mentenanță

### Actualizări Regulate
- **Revizuiri Lunare**: Acuratețe conținut și validare linkuri
- **Actualizări Trimestriale**: Adăugiri și îmbunătățiri majore de conținut
- **Revizuiri Semestriale**: Restructurări și îmbunătățiri cuprinzătoare
- **Lansări Anuale**: Actualizări majore cu îmbunătățiri semnificative

### Monitorizare și Asigurarea Calității
- **Testare Automată**: Validare regulată a exemplelor de cod și linkurilor
- **Integrare Feedback Comunitate**: Încorporarea constantă a sugestiilor utilizatorilor
- **Actualizări Tehnologice**: Aliniere cu cele mai recente servicii Azure și versiuni azd
- **Audituri Accesibilitate**: Revizuiri periodice pentru principii de design incluziv

## Politica de Suport Versiuni

### Suport Versiune Curentă
- **Ultima Versiune Majoră**: Suport complet cu actualizări regulate
- **Versiunea Majoră Anterioară**: Actualizări de securitate și remedieri critice timp de 12 luni
- **Versiuni Legacy**: Suport comunitar doar, fără actualizări oficiale

### Ghid de Migrare
Când sunt lansate versiuni majore, oferim:
- **Ghiduri de migrare**: Instrucțiuni pas cu pas pentru tranziție
- **Note de compatibilitate**: Detalii despre modificările majore
- **Suport pentru unelte**: Scripturi sau utilitare pentru a ajuta la migrare
- **Suport comunitar**: Forumuri dedicate întrebărilor legate de migrare

---

**Navigare**
- **Lecția anterioară**: [Ghid de studiu](resources/study-guide.md)
- **Lecția următoare**: Revenire la [README principal](README.md)

**Rămâi informat**: Urmărește acest depozit pentru notificări despre versiuni noi și actualizări importante ale materialelor educaționale.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinarea responsabilității**:
Acest document a fost tradus folosind serviciul de traducere automată AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite care pot rezulta din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->