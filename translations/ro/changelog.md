# Jurnal de Schimbări - AZD pentru Începători

## Introducere

Acest jurnal de schimbări documentează toate modificările, actualizările și îmbunătățirile notabile aduse în depozitul AZD pentru Începători. Urmăm principiile versiunii semantice și menținem acest jurnal pentru a ajuta utilizatorii să înțeleagă ce s-a schimbat între versiuni.

## Obiective de Învățare

Revizuind acest jurnal de schimbări, veți:
- Rămâne informat despre funcționalitățile noi și adăugările de conținut
- Înțelege îmbunătățirile aduse documentației existente
- Urmări corecturile și remediile pentru a asigura acuratețea
- Urmări evoluția materialelor de învățare în timp

## Rezultate ale Învățării

După revizuirea înregistrărilor din jurnalul de schimbări, veți putea:
- Identifica conținutul și resursele noi disponibile pentru învățare
- Înțelege ce secțiuni au fost actualizate sau îmbunătățite
- Planifica parcursul de învățare pe baza celor mai recente materiale
- Contribui cu feedback și sugestii pentru îmbunătățiri viitoare

## Istoricul Versiunilor

### [v3.8.0] - 2025-11-19

#### Documentație Avansată: Monitorizare, Securitate și Modele Multi-Agent
**Această versiune adaugă lecții de nivel avansat despre integrarea Application Insights, modele de autentificare și coordonare multi-agent pentru implementări în producție.**

#### Adăugat
- **📊 Lecție despre Integrarea Application Insights**: în `docs/pre-deployment/application-insights.md`:
  - Implementare AZD cu aprovizionare automată
  - Șabloane complete Bicep pentru Application Insights + Log Analytics
  - Aplicații Python funcționale cu telemetrie personalizată (peste 1.200 de linii)
  - Modele de monitorizare AI/LLM (urmărirea token-urilor/costurilor Azure OpenAI)
  - 6 diagrame Mermaid (arhitectură, trasare distribuită, flux de telemetrie)
  - 3 exerciții practice (alerte, tablouri de bord, monitorizare AI)
  - Exemple de interogări Kusto și strategii de optimizare a costurilor
  - Streaming de metrici live și depanare în timp real
  - Timp de învățare de 40-50 minute cu modele pregătite pentru producție

- **🔐 Lecție despre Modele de Autentificare și Securitate**: în `docs/getting-started/authsecurity.md`:
  - 3 modele de autentificare (șiruri de conexiune, Key Vault, identitate gestionată)
  - Șabloane complete de infrastructură Bicep pentru implementări sigure
  - Cod de aplicație Node.js cu integrare Azure SDK
  - 3 exerciții complete (activare identitate gestionată, identitate atribuită utilizatorului, rotație Key Vault)
  - Cele mai bune practici de securitate și configurații RBAC
  - Ghid de depanare și analiză a costurilor
  - Modele de autentificare fără parolă pregătite pentru producție

- **🤖 Lecție despre Modele de Coordonare Multi-Agent**: în `docs/pre-deployment/coordination-patterns.md`:
  - 5 modele de coordonare (secvențial, paralel, ierarhic, bazat pe evenimente, consens)
  - Implementare completă a unui serviciu de orchestrare (Python/Flask, peste 1.500 de linii)
  - 3 implementări specializate de agenți (Cercetare, Redactor, Editor)
  - Integrare Service Bus pentru cozi de mesaje
  - Gestionarea stării în Cosmos DB pentru sisteme distribuite
  - 6 diagrame Mermaid care arată interacțiunile agenților
  - 3 exerciții avansate (gestionarea timeout-urilor, logica de retry, circuit breaker)
  - Defalcare a costurilor (240-565 USD/lună) cu strategii de optimizare
  - Integrare Application Insights pentru monitorizare

#### Îmbunătățit
- **Capitolul Pre-implementare**: Include acum modele complete de monitorizare și coordonare
- **Capitolul Introducere**: Îmbunătățit cu modele profesionale de autentificare
- **Pregătire pentru Producție**: Acoperire completă de la securitate la observabilitate
- **Structura Cursului**: Actualizată pentru a face referire la noile lecții din Capitolele 3 și 6

#### Modificat
- **Progresia Învățării**: Integrare mai bună a securității și monitorizării pe parcursul cursului
- **Calitatea Documentației**: Standard consistent de calitate A (95-97%) în noile lecții
- **Modele de Producție**: Acoperire completă de la început până la sfârșit pentru implementări la nivel de întreprindere

#### Îmbunătățit
- **Experiența Dezvoltatorului**: Cale clară de la dezvoltare la monitorizarea în producție
- **Standarde de Securitate**: Modele profesionale pentru autentificare și gestionarea secretelor
- **Observabilitate**: Integrare completă Application Insights cu AZD
- **Sarcini AI**: Monitorizare specializată pentru Azure OpenAI și sisteme multi-agent

#### Validat
- ✅ Toate lecțiile includ cod complet funcțional (nu doar fragmente)
- ✅ Diagrame Mermaid pentru învățare vizuală (19 în total în cele 3 lecții)
- ✅ Exerciții practice cu pași de verificare (9 în total)
- ✅ Șabloane Bicep pregătite pentru producție, implementabile prin `azd up`
- ✅ Analiză a costurilor și strategii de optimizare
- ✅ Ghiduri de depanare și cele mai bune practici
- ✅ Puncte de verificare a cunoștințelor cu comenzi de verificare

#### Rezultatele Evaluării Documentației
- **docs/pre-deployment/application-insights.md**: - Ghid complet de monitorizare
- **docs/getting-started/authsecurity.md**: - Modele profesionale de securitate
- **docs/pre-deployment/coordination-patterns.md**: - Arhitecturi avansate multi-agent
- **Conținut Nou General**: - Standard de calitate consistent ridicat

#### Implementare Tehnică
- **Application Insights**: Log Analytics + telemetrie personalizată + trasare distribuită
- **Autentificare**: Identitate Gestionată + Key Vault + modele RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrare
- **Monitorizare**: Metrici live + interogări Kusto + alerte + tablouri de bord
- **Gestionarea Costurilor**: Strategii de eșantionare, politici de retenție, controale bugetare

### [v3.7.0] - 2025-11-19

#### Îmbunătățiri ale Calității Documentației și Exemplu Nou Azure OpenAI
**Această versiune îmbunătățește calitatea documentației în întregul depozit și adaugă un exemplu complet de implementare Azure OpenAI cu interfață de chat GPT-4.**

#### Adăugat
- **🤖 Exemplu de Chat Azure OpenAI**: Implementare completă GPT-4 în `examples/azure-openai-chat/`:
  - Infrastructură completă Azure OpenAI (implementare model GPT-4)
  - Interfață de chat Python în linie de comandă cu istoric conversațional
  - Integrare Key Vault pentru stocarea sigură a cheilor API
  - Urmărirea utilizării token-urilor și estimarea costurilor
  - Limitarea ratei și gestionarea erorilor
  - README cu ghid de implementare de 35-45 minute
  - 11 fișiere pregătite pentru producție (șabloane Bicep, aplicație Python, configurație)
- **📚 Exerciții de Documentație**: Adăugate exerciții practice în ghidul de configurare:
  - Exercițiul 1: Configurare multi-mediu (15 minute)
  - Exercițiul 2: Practică de gestionare a secretelor (10 minute)
  - Criterii clare de succes și pași de verificare
- **✅ Verificare Implementare**: Secțiune de verificare adăugată în ghidul de implementare:
  - Proceduri de verificare a sănătății
  - Listă de verificare a criteriilor de succes
  - Rezultate așteptate pentru toate comenzile de implementare
  - Referință rapidă pentru depanare

#### Îmbunătățit
- **examples/README.md**: Actualizat la calitate A (93%):
  - Adăugat azure-openai-chat în toate secțiunile relevante
  - Actualizat numărul de exemple locale de la 3 la 4
  - Adăugat în tabelul Exemple de Aplicații AI
  - Integrat în Ghidul Rapid pentru Utilizatori Intermediari
  - Adăugat în secțiunea Șabloane Microsoft Foundry pentru AI
  - Actualizat Matricea de Comparație și secțiunile de identificare a tehnologiilor
- **Calitatea Documentației**: Îmbunătățită de la B+ (87%) → A- (92%) în folderul docs:
  - Adăugate rezultate așteptate pentru exemplele critice de comenzi
  - Incluse pași de verificare pentru modificările de configurare
  - Îmbunătățită învățarea practică cu exerciții aplicate

#### Modificat
- **Progresia Învățării**: Integrare mai bună a exemplelor AI pentru utilizatorii intermediari
- **Structura Documentației**: Exerciții mai aplicabile cu rezultate clare
- **Procesul de Verificare**: Criterii explicite de succes adăugate în fluxurile cheie

#### Îmbunătățit
- **Experiența Dezvoltatorului**: Implementarea Azure OpenAI durează acum 35-45 minute (față de 60-90 pentru alternative complexe)
- **Transparența Costurilor**: Estimări clare ale costurilor (50-200 USD/lună) pentru exemplul Azure OpenAI
- **Parcursul de Învățare**: Dezvoltatorii AI au un punct de intrare clar cu azure-openai-chat
- **Standardele Documentației**: Rezultate așteptate și pași de verificare consistenți

#### Validat
- ✅ Exemplul Azure OpenAI complet funcțional cu `azd up`
- ✅ Toate cele 11 fișiere de implementare corecte sintactic
- ✅ Instrucțiunile README corespund experienței reale de implementare
- ✅ Linkurile documentației actualizate în peste 8 locații
- ✅ Indexul exemplelor reflectă corect cele 4 exemple locale
- ✅ Fără linkuri externe duplicate în tabele
- ✅ Toate referințele de navigare corecte

#### Implementare Tehnică
- **Arhitectura Azure OpenAI**: GPT-4 + Key Vault + model Container Apps
- **Securitate**: Pregătit pentru Identitate Gestionată, secrete în Key Vault
- **Monitorizare**: Integrare Application Insights
- **Gestionarea Costurilor**: Urmărirea token-urilor și optimizarea utilizării
- **Implementare**: O singură comandă `azd up` pentru configurare completă

### [v3.6.0] - 2025-11-19

#### Actualizare Majoră: Exemple de Implementare a Aplicațiilor Containerizate
**Această versiune introduce exemple complete, pregătite pentru producție, de implementare a aplicațiilor containerizate folosind Azure Developer CLI (AZD), cu documentație completă și integrare în parcursul de învățare.**

#### Adăugat
- **🚀 Exemple de Aplicații Containerizate**: Noi exemple locale în `examples/container-app/`:
  - [Ghid Principal](examples/container-app/README.md): Prezentare completă a implementărilor containerizate, ghid rapid, producție și modele avansate
  - [API Flask Simplu](../../examples/container-app/simple-flask-api): API REST prietenos pentru începători cu scale-to-zero, probe de sănătate, monitorizare și depanare
  - [Arhitectură Microservicii](../../examples/container-app/microservices): Implementare multi-serviciu pregătită pentru producție (API Gateway, Product, Order, User, Notification), mesagerie asincronă, Service Bus, Cosmos DB, Azure SQL, trasare distribuită, implementare blue-green/canary
- **Cele Mai Bune Practici**: Securitate, monitorizare, optimizare a costurilor și ghidare CI/CD pentru sarcini containerizate
- **Exemple de Cod**: `azure.yaml` complet, șabloane Bicep și implementări de servicii multi-limbaj (Python, Node.js, C#, Go)
- **Testare și Depanare**: Scenarii de testare end-to-end, comenzi de monitorizare, ghiduri de depanare

#### Modificat
- **README.md**: Actualizat pentru a evidenția și lega noile exemple de aplicații containerizate sub "Exemple Locale - Aplicații Containerizate"
- **examples/README.md**: Actualizat pentru a evidenția exemplele de aplicații containerizate, a adăuga intrări în matricea de comparație și a actualiza referințele tehnologice/arhitecturale
- **Structura Cursului și Ghidul de Studiu**: Actualizate pentru a face referire la noile exemple de aplicații containerizate și modele de implementare în capitolele relevante

#### Validat
- ✅ Toate noile exemple implementabile cu `azd up` și urmează cele mai bune practici
- ✅ Linkurile și navigarea documentației actualizate
- ✅ Exemplele acoperă scenarii de la începători la avansați, inclusiv microservicii de producție

#### Note
- **Domeniu**: Documentație și exemple doar în limba engleză
- **Pași Următori**: Extindere cu modele avansate suplimentare pentru containere și automatizare CI/CD în versiunile viitoare

### [v3.5.0] - 2025-11-19

#### Rebranding al Produsului: Microsoft Foundry
**Această versiune implementează o schimbare completă a denumirii produsului din "Azure AI Foundry" în "Microsoft Foundry" în toată documentația în limba engleză, reflectând rebranding-ul oficial al Microsoft.**

#### Modificat
- **🔄 Actualizare Denumire Produs**: Rebranding complet din "Azure AI Foundry" în "Microsoft Foundry"
  - Actualizate toate referințele din documentația în limba engleză din folderul `docs/`
  - Folder redenumit: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fișier redenumit: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referințe de conținut actualizate în 7 fișiere de documentație

- **📁 Schimbări în Structura Folderelor**:
  - `docs/ai-foundry/` redenumit în `docs/microsoft-foundry/`
  - Toate referințele încrucișate actualizate pentru a reflecta noua structură a folderelor
  - Linkurile de navigare validate în toată documentația

- **📄 Redenumiri de Fișiere**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toate linkurile interne actualizate pentru a face referire la noul nume de fișier

#### Fișiere Actualizate
- **Documentația Capitolului** (7 fișiere):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizări de linkuri de navigare
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referințe la denumirea produsului actualizate
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Deja folosește Microsoft Foundry (din actualizările anterioare)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referințe actualizate (prezentare generală, feedback comunitar, documentație)
  - `docs/getting-started/azd-basics.md` - 4 linkuri de referință încrucișată actualizate
  - `docs/getting-started/first-project.md` - 2 linkuri de navigare a capitolului actualizate
  - `docs/getting-started/installation.md` - 2 linkuri către capitolul următor actualizate
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referințe actualizate (navigare, comunitatea Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navigare actualizat
  - `docs/troubleshooting/debugging.md` - 1 link de navigare actualizat

- **Fișierele Structurii Cursului** (2 fișiere):

- **Atelier**: Materialele atelierului (`workshop/`) nu au fost actualizate în această versiune
- **Exemple**: Fișierele de exemple pot face încă referire la denumiri vechi (se va rezolva într-o actualizare viitoare)
- **Linkuri externe**: URL-urile externe și referințele la repository-ul GitHub rămân neschimbate

#### Ghid de migrare pentru contribuitori
Dacă aveți ramuri locale sau documentație care face referire la structura veche:
1. Actualizați referințele la foldere: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualizați referințele la fișiere: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Înlocuiți denumirea produsului: "Azure AI Foundry" → "Microsoft Foundry"
4. Verificați că toate linkurile interne din documentație funcționează în continuare

---

### [v3.4.0] - 2025-10-24

#### Previzualizare infrastructură și îmbunătățiri de validare
**Această versiune introduce suport complet pentru noua funcționalitate de previzualizare Azure Developer CLI și îmbunătățește experiența utilizatorilor atelierului.**

#### Adăugat
- **🧪 Documentație pentru funcția `azd provision --preview`**: Acoperire completă a noii capabilități de previzualizare a infrastructurii
  - Referințe la comenzi și exemple de utilizare în fișa de lucru
  - Integrare detaliată în ghidul de provizionare cu studii de caz și beneficii
  - Integrare de verificare preliminară pentru validarea mai sigură a implementărilor
  - Actualizări ale ghidului de început cu practici de implementare sigure
- **🚧 Banner de stare pentru atelier**: Banner HTML profesional care indică starea de dezvoltare a atelierului
  - Design cu gradient și indicatori de construcție pentru o comunicare clară cu utilizatorii
  - Timpul ultimei actualizări pentru transparență
  - Design responsiv pentru dispozitive mobile

#### Îmbunătățit
- **Siguranța infrastructurii**: Funcționalitatea de previzualizare integrată în toată documentația de implementare
- **Validare înainte de implementare**: Scripturile automate includ acum testarea previzualizării infrastructurii
- **Fluxul de lucru al dezvoltatorilor**: Secvențele de comenzi actualizate pentru a include previzualizarea ca practică recomandată
- **Experiența atelierului**: Așteptări clare stabilite pentru utilizatori cu privire la starea de dezvoltare a conținutului

#### Modificat
- **Cele mai bune practici de implementare**: Fluxul de lucru bazat pe previzualizare este acum abordarea recomandată
- **Fluxul documentației**: Validarea infrastructurii mutată mai devreme în procesul de învățare
- **Prezentarea atelierului**: Comunicare profesională a stării cu un calendar clar de dezvoltare

#### Îmbunătățit
- **Abordare axată pe siguranță**: Modificările infrastructurii pot fi acum validate înainte de implementare
- **Colaborare în echipă**: Rezultatele previzualizării pot fi partajate pentru revizuire și aprobare
- **Conștientizare a costurilor**: Înțelegere mai bună a costurilor resurselor înainte de provizionare
- **Reducerea riscurilor**: Reducerea eșecurilor de implementare prin validare avansată

#### Implementare tehnică
- **Integrare multi-document**: Funcția de previzualizare documentată în 4 fișiere cheie
- **Modele de comandă**: Sintaxă și exemple consistente în toată documentația
- **Integrarea celor mai bune practici**: Previzualizarea inclusă în fluxurile de lucru și scripturile de validare
- **Indicatori vizuali**: Marcaje clare pentru funcții NOI pentru descoperire ușoară

#### Infrastructura atelierului
- **Comunicarea stării**: Banner HTML profesional cu stilizare gradient
- **Experiența utilizatorului**: Stare clară a dezvoltării pentru a evita confuziile
- **Prezentare profesională**: Menține credibilitatea repository-ului în timp ce setează așteptări
- **Transparența calendarului**: Timpul ultimei actualizări din octombrie 2025 pentru responsabilitate

### [v3.3.0] - 2025-09-24

#### Materiale de atelier îmbunătățite și experiență interactivă de învățare
**Această versiune introduce materiale complete pentru atelier cu ghiduri interactive bazate pe browser și trasee de învățare structurate.**

#### Adăugat
- **🎥 Ghid interactiv pentru atelier**: Experiență de atelier bazată pe browser cu capabilități de previzualizare MkDocs
- **📝 Instrucțiuni structurate pentru atelier**: Traseu de învățare ghidat în 7 pași, de la descoperire la personalizare
  - 0-Introducere: Prezentare generală a atelierului și configurare
  - 1-Selectare-Șablon-AI: Procesul de descoperire și selecție a șablonului
  - 2-Validare-Șablon-AI: Proceduri de implementare și validare
  - 3-Deconstrucție-Șablon-AI: Înțelegerea arhitecturii șablonului
  - 4-Configurare-Șablon-AI: Configurare și personalizare
  - 5-Personalizare-Șablon-AI: Modificări avansate și iterații
  - 6-Demontare-Infrastructură: Curățare și gestionarea resurselor
  - 7-Concluzie: Rezumat și pași următori
- **🛠️ Instrumente pentru atelier**: Configurare MkDocs cu tema Material pentru o experiență de învățare îmbunătățită
- **🎯 Traseu de învățare practic**: Metodologie în 3 pași (Descoperire → Implementare → Personalizare)
- **📱 Integrare GitHub Codespaces**: Configurare fără probleme a mediului de dezvoltare

#### Îmbunătățit
- **Laborator AI pentru atelier**: Extins cu o experiență de învățare structurată de 2-3 ore
- **Documentația atelierului**: Prezentare profesională cu navigare și elemente vizuale
- **Progresia învățării**: Ghidare clară pas cu pas de la selecția șablonului la implementarea în producție
- **Experiența dezvoltatorului**: Instrumente integrate pentru fluxuri de lucru simplificate

#### Îmbunătățit
- **Accesibilitate**: Interfață bazată pe browser cu funcționalități de căutare, copiere și comutare temă
- **Învățare în ritm propriu**: Structură flexibilă a atelierului care se adaptează diferitelor viteze de învățare
- **Aplicație practică**: Scenarii reale de implementare a șabloanelor AI
- **Integrare comunitară**: Integrare Discord pentru suport și colaborare în cadrul atelierului

#### Caracteristici ale atelierului
- **Căutare integrată**: Descoperire rapidă a cuvintelor cheie și lecțiilor
- **Blocuri de cod copiable**: Funcționalitate de copiere prin hover pentru toate exemplele de cod
- **Comutare temă**: Suport pentru mod întunecat/luminos pentru preferințe diferite
- **Resurse vizuale**: Capturi de ecran și diagrame pentru o mai bună înțelegere
- **Integrare de ajutor**: Acces direct la Discord pentru suport comunitar

### [v3.2.0] - 2025-09-17

#### Restructurare majoră a navigației și sistem de învățare bazat pe capitole
**Această versiune introduce o structură de învățare bazată pe capitole cu navigare îmbunătățită în întregul repository.**

#### Adăugat
- **📚 Sistem de învățare bazat pe capitole**: Restructurarea întregului curs în 8 capitole progresive de învățare
  - Capitolul 1: Fundamente și început rapid (⭐ - 30-45 min)
  - Capitolul 2: Dezvoltare AI-First (⭐⭐ - 1-2 ore)
  - Capitolul 3: Configurare și autentificare (⭐⭐ - 45-60 min)
  - Capitolul 4: Infrastructură ca cod și implementare (⭐⭐⭐ - 1-1,5 ore)
  - Capitolul 5: Soluții AI multi-agent (⭐⭐⭐⭐ - 2-3 ore)
  - Capitolul 6: Validare și planificare înainte de implementare (⭐⭐ - 1 oră)
  - Capitolul 7: Depanare și rezolvare de probleme (⭐⭐ - 1-1,5 ore)
  - Capitolul 8: Modele de producție și pentru întreprinderi (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistem de navigare cuprinzător**: Anteturi și subsoluri de navigare consistente în toată documentația
- **🎯 Urmărirea progresului**: Listă de verificare pentru finalizarea cursului și sistem de verificare a învățării
- **🗺️ Ghid pentru traseul de învățare**: Puncte de intrare clare pentru diferite niveluri de experiență și obiective
- **🔗 Navigare cu referințe încrucișate**: Capitolele și cerințele prealabile clar legate

#### Îmbunătățit
- **Structura README**: Transformată într-o platformă de învățare structurată cu organizare bazată pe capitole
- **Navigarea documentației**: Fiecare pagină include acum contextul capitolului și ghidare pentru progresie
- **Organizarea șabloanelor**: Exemplele și șabloanele mapate la capitolele de învățare corespunzătoare
- **Integrarea resurselor**: Fișe de lucru, întrebări frecvente și ghiduri de studiu conectate la capitole relevante
- **Integrarea atelierului**: Laboratoare practice mapate la obiectivele de învățare ale mai multor capitole

#### Modificat
- **Progresia învățării**: Mutată de la documentație liniară la învățare flexibilă bazată pe capitole
- **Poziționarea configurării**: Ghidul de configurare repoziționat ca Capitolul 3 pentru un flux de învățare mai bun
- **Integrarea conținutului AI**: Integrare mai bună a conținutului specific AI pe parcursul traseului de învățare
- **Conținut pentru producție**: Modelele avansate consolidate în Capitolul 8 pentru cursanții din întreprinderi

#### Îmbunătățit
- **Experiența utilizatorului**: Navigare clară cu breadcrumbs și indicatori de progresie a capitolelor
- **Accesibilitate**: Modele de navigare consistente pentru o traversare mai ușoară a cursului
- **Prezentare profesională**: Structură de curs în stil universitar, potrivită pentru formare academică și corporativă
- **Eficiența învățării**: Timp redus pentru găsirea conținutului relevant prin organizare îmbunătățită

#### Implementare tehnică
- **Anteturi de navigare**: Navigare standardizată pe capitole în peste 40 de fișiere de documentație
- **Navigare în subsol**: Ghidare consistentă pentru progresie și indicatori de finalizare a capitolelor
- **Legături încrucișate**: Sistem cuprinzător de legături interne care conectează concepte relevante
- **Maparea capitolelor**: Șabloane și exemple clar asociate cu obiectivele de învățare

#### Îmbunătățirea ghidului de studiu
- **📚 Obiective de învățare cuprinzătoare**: Ghidul de studiu restructurat pentru a se alinia cu sistemul de 8 capitole
- **🎯 Evaluare bazată pe capitole**: Fiecare capitol include obiective specifice de învățare și exerciții practice
- **📋 Urmărirea progresului**: Program săptămânal de învățare cu rezultate măsurabile și liste de verificare pentru finalizare
- **❓ Întrebări de evaluare**: Întrebări de validare a cunoștințelor pentru fiecare capitol cu rezultate profesionale
- **🛠️ Exerciții practice**: Activități practice cu scenarii reale de implementare și depanare
- **📊 Progresia abilităților**: Avansare clară de la concepte de bază la modele pentru întreprinderi, cu accent pe dezvoltarea carierei
- **🎓 Cadru de certificare**: Rezultate pentru dezvoltare profesională și sistem de recunoaștere comunitară
- **⏱️ Gestionarea timpului**: Plan de învățare structurat pe 10 săptămâni cu validarea etapelor

### [v3.1.0] - 2025-09-17

#### Soluții AI multi-agent îmbunătățite
**Această versiune îmbunătățește soluția multi-agent pentru retail cu denumiri mai clare ale agenților și documentație îmbunătățită.**

#### Modificat
- **Terminologia multi-agent**: Înlocuit "agent Cora" cu "agent Client" în întreaga soluție multi-agent pentru retail pentru o înțelegere mai clară
- **Arhitectura agenților**: Actualizate toate documentațiile, șabloanele ARM și exemplele de cod pentru a utiliza denumirea consistentă "agent Client"
- **Exemple de configurare**: Modele de configurare a agenților modernizate cu denumiri actualizate
- **Consistența documentației**: Asigurată utilizarea unor denumiri profesionale și descriptive pentru agenți în toate referințele

#### Îmbunătățit
- **Pachet șablon ARM**: Actualizat șablonul retail-multiagent-arm-template cu referințe la agentul Client
- **Diagrame arhitecturale**: Diagrame Mermaid reîmprospătate cu denumiri actualizate ale agenților
- **Exemple de cod**: Clasele Python și exemplele de implementare utilizează acum denumirea CustomerAgent
- **Variabile de mediu**: Actualizate toate scripturile de implementare pentru a utiliza convențiile CUSTOMER_AGENT_NAME

#### Îmbunătățit
- **Experiența dezvoltatorului**: Roluri și responsabilități mai clare ale agenților în documentație
- **Pregătirea pentru producție**: Aliniere mai bună cu convențiile de denumire pentru întreprinderi
- **Materiale de învățare**: Denumiri mai intuitive ale agenților pentru scopuri educaționale
- **Utilitatea șabloanelor**: Înțelegere simplificată a funcțiilor agenților și a modelelor de implementare

#### Detalii tehnice
- Diagrame arhitecturale Mermaid actualizate cu referințe la CustomerAgent
- Înlocuit numele claselor CoraAgent cu CustomerAgent în exemplele Python
- Configurații JSON ale șabloanelor ARM modificate pentru a utiliza tipul de agent "customer"
- Actualizate variabilele de mediu de la CORA_AGENT_* la CUSTOMER_AGENT_*
- Reîmprospătate toate comenzile de implementare și configurațiile containerelor

### [v3.0.0] - 2025-09-12

#### Schimbări majore - Focus pe dezvoltatori AI și integrarea Azure AI Foundry
**Această versiune transformă repository-ul într-o resursă completă de învățare axată pe AI, cu integrarea Azure AI Foundry.**

#### Adăugat
- **🤖 Traseu de învățare AI-First**: Restructurare completă care prioritizează dezvoltatorii și inginerii AI
- **Ghid de integrare Azure AI Foundry**: Documentație cuprinzătoare pentru conectarea AZD cu serviciile Azure AI Foundry
- **Modele de implementare AI**: Ghid detaliat care acoperă selecția, configurarea și strategiile de implementare în producție
- **Laborator AI pentru atelier**: Atelier practic de 2-3 ore pentru conversia aplicațiilor AI în soluții implementabile AZD
- **Cele mai bune practici AI pentru producție**: Modele pregătite pentru întreprinderi pentru scalare, monitorizare și securizarea sarcinilor AI
- **Ghid de depanare specific AI**: Depanare cuprinzătoare pentru Azure OpenAI, Cognitive Services și probleme de implementare AI
- **Galerie de șabloane AI**: Colecție de șabloane Azure AI Foundry cu evaluări de complexitate
- **Materiale pentru atelier**: Structură completă a atelierului cu laboratoare practice și materiale de referință

#### Îmbunătățit
- **Structura README**
- **Prezentarea conținutului**: Elemente decorative eliminate în favoarea unui format clar și profesional
- **Structura linkurilor**: Toate linkurile interne actualizate pentru a susține noul sistem de navigare

#### Îmbunătățiri
- **Accesibilitate**: Eliminarea dependenței de emoji pentru o compatibilitate mai bună cu cititoarele de ecran
- **Aspect profesional**: Prezentare curată, stil academic, potrivită pentru învățarea în mediul enterprise
- **Experiența de învățare**: Abordare structurată cu obiective și rezultate clare pentru fiecare lecție
- **Organizarea conținutului**: Flux logic mai bun și conexiuni între subiecte înrudite

### [v1.0.0] - 2025-09-09

#### Lansare inițială - Repozitoriu complet de învățare AZD

#### Adăugiri
- **Structura principală a documentației**
  - Seria completă de ghiduri introductive
  - Documentație detaliată pentru implementare și provizionare
  - Resurse detaliate pentru depanare și ghiduri de diagnosticare
  - Instrumente și proceduri de validare înainte de implementare

- **Modulul introductiv**
  - Bazele AZD: Concepte de bază și terminologie
  - Ghid de instalare: Instrucțiuni de configurare specifice platformei
  - Ghid de configurare: Setarea mediului și autentificarea
  - Tutorial pentru primul proiect: Învățare practică pas cu pas

- **Modulul de implementare și provizionare**
  - Ghid de implementare: Documentație completă a fluxului de lucru
  - Ghid de provizionare: Infrastructură ca cod cu Bicep
  - Cele mai bune practici pentru implementări în producție
  - Modele de arhitectură multi-servicii

- **Modulul de validare înainte de implementare**
  - Planificarea capacității: Validarea disponibilității resurselor Azure
  - Selectarea SKU: Ghid complet pentru nivelurile de servicii
  - Verificări preliminare: Scripturi automate de validare (PowerShell și Bash)
  - Instrumente de estimare a costurilor și planificare bugetară

- **Modulul de depanare**
  - Probleme comune: Probleme frecvent întâlnite și soluții
  - Ghid de diagnosticare: Metodologii sistematice de depanare
  - Tehnici și instrumente avansate de diagnosticare
  - Monitorizarea performanței și optimizare

- **Resurse și referințe**
  - Foaie de referință pentru comenzi: Referință rapidă pentru comenzi esențiale
  - Glosar: Definiții complete ale terminologiei și acronimelor
  - Întrebări frecvente: Răspunsuri detaliate la întrebări comune
  - Linkuri către resurse externe și conexiuni comunitare

- **Exemple și șabloane**
  - Exemplu de aplicație web simplă
  - Șablon de implementare pentru site-uri statice
  - Configurare pentru aplicații containerizate
  - Modele de integrare a bazelor de date
  - Exemple de arhitectură microservicii
  - Implementări de funcții serverless

#### Funcționalități
- **Suport multi-platformă**: Ghiduri de instalare și configurare pentru Windows, macOS și Linux
- **Niveluri multiple de competență**: Conținut destinat studenților și dezvoltatorilor profesioniști
- **Focus practic**: Exemple practice și scenarii din lumea reală
- **Acoperire cuprinzătoare**: De la concepte de bază la modele avansate pentru enterprise
- **Abordare orientată spre securitate**: Cele mai bune practici de securitate integrate
- **Optimizare a costurilor**: Ghiduri pentru implementări eficiente din punct de vedere al costurilor și gestionarea resurselor

#### Calitatea documentației
- **Exemple de cod detaliate**: Exemple practice, testate
- **Instrucțiuni pas cu pas**: Ghiduri clare și acționabile
- **Gestionarea erorilor**: Depanare pentru probleme comune
- **Integrarea celor mai bune practici**: Standardele și recomandările industriei
- **Compatibilitate cu versiunile**: Actualizat cu cele mai recente servicii Azure și funcționalități azd

## Îmbunătățiri planificate pentru viitor

### Versiunea 3.1.0 (Planificată)
#### Extinderea platformei AI
- **Suport multi-model**: Modele de integrare pentru Hugging Face, Azure Machine Learning și modele personalizate
- **Framework-uri pentru agenți AI**: Șabloane pentru implementări LangChain, Semantic Kernel și AutoGen
- **Modele avansate RAG**: Opțiuni pentru baze de date vectoriale dincolo de Azure AI Search (Pinecone, Weaviate etc.)
- **Observabilitate AI**: Monitorizare îmbunătățită pentru performanța modelelor, utilizarea token-urilor și calitatea răspunsurilor

#### Experiența dezvoltatorului
- **Extensie VS Code**: Experiență integrată de dezvoltare AZD + AI Foundry
- **Integrare GitHub Copilot**: Generare asistată de AI pentru șabloane AZD
- **Tutoriale interactive**: Exerciții practice de codare cu validare automată pentru scenarii AI
- **Conținut video**: Tutoriale video suplimentare pentru învățare vizuală, axate pe implementările AI

### Versiunea 4.0.0 (Planificată)
#### Modele AI pentru enterprise
- **Framework de guvernanță**: Guvernanță, conformitate și trasee de audit pentru modele AI
- **AI multi-chiriaș**: Modele pentru servirea mai multor clienți cu servicii AI izolate
- **Implementare AI la margine**: Integrare cu Azure IoT Edge și instanțe containerizate
- **AI în cloud hibrid**: Modele de implementare multi-cloud și hibrid pentru sarcini AI

#### Funcționalități avansate
- **Automatizarea pipeline-urilor AI**: Integrare MLOps cu pipeline-uri Azure Machine Learning
- **Securitate avansată**: Modele zero-trust, puncte finale private și protecție avansată împotriva amenințărilor
- **Optimizarea performanței**: Strategii avansate de ajustare și scalare pentru aplicații AI cu debit mare
- **Distribuție globală**: Modele de livrare a conținutului și caching la margine pentru aplicații AI

### Versiunea 3.0.0 (Planificată) - Înlocuită de lansarea actuală
#### Adăugiri propuse - Acum implementate în v3.0.0
- ✅ **Conținut axat pe AI**: Integrare completă Azure AI Foundry (Finalizat)
- ✅ **Tutoriale interactive**: Laborator de workshop AI practic (Finalizat)
- ✅ **Modul de securitate avansată**: Modele de securitate specifice AI (Finalizat)
- ✅ **Optimizarea performanței**: Strategii de ajustare pentru sarcini AI (Finalizat)

### Versiunea 2.1.0 (Planificată) - Parțial implementată în v3.0.0
#### Îmbunătățiri minore - Unele finalizate în lansarea actuală
- ✅ **Exemple suplimentare**: Scenarii de implementare axate pe AI (Finalizat)
- ✅ **FAQ extins**: Întrebări și soluții specifice AI (Finalizat)
- **Integrarea instrumentelor**: Ghiduri îmbunătățite pentru integrarea IDE și editorului
- ✅ **Extinderea monitorizării**: Modele de monitorizare și alertare specifice AI (Finalizat)

#### Încă planificate pentru lansări viitoare
- **Documentație prietenoasă pentru mobil**: Design responsiv pentru învățarea pe mobil
- **Acces offline**: Pachete de documentație descărcabile
- **Integrare IDE îmbunătățită**: Extensie VS Code pentru fluxuri de lucru AZD + AI
- **Tablou de bord comunitar**: Metrici comunitare în timp real și urmărirea contribuțiilor

## Contribuirea la jurnalul de modificări

### Raportarea modificărilor
Când contribuiți la acest repo, asigurați-vă că intrările din jurnalul de modificări includ:

1. **Numărul versiunii**: Conform versiunii semantice (major.minor.patch)
2. **Data**: Data lansării sau actualizării în format YYYY-MM-DD
3. **Categorie**: Adăugat, Modificat, Depreciat, Eliminat, Reparat, Securitate
4. **Descriere clară**: Descriere concisă a modificării
5. **Evaluarea impactului**: Cum afectează modificările utilizatorii existenți

### Categorii de modificări

#### Adăugat
- Funcționalități noi, secțiuni de documentație sau capabilități
- Exemple noi, șabloane sau resurse de învățare
- Instrumente, scripturi sau utilitare suplimentare

#### Modificat
- Modificări ale funcționalității sau documentației existente
- Actualizări pentru îmbunătățirea clarității sau acurateței
- Restructurarea conținutului sau organizării

#### Depreciat
- Funcționalități sau abordări care sunt în curs de eliminare
- Secțiuni de documentație programate pentru eliminare
- Metode care au alternative mai bune

#### Eliminat
- Funcționalități, documentație sau exemple care nu mai sunt relevante
- Informații învechite sau abordări depreciate
- Conținut redundant sau consolidat

#### Reparat
- Corectarea erorilor din documentație sau cod
- Rezolvarea problemelor sau defecțiunilor raportate
- Îmbunătățirea acurateței sau funcționalității

#### Securitate
- Îmbunătățiri sau corecții legate de securitate
- Actualizări ale celor mai bune practici de securitate
- Rezolvarea vulnerabilităților de securitate

### Ghiduri pentru versiunea semantică

#### Versiune majoră (X.0.0)
- Modificări majore care necesită acțiuni din partea utilizatorului
- Restructurări semnificative ale conținutului sau organizării
- Modificări care alterează abordarea sau metodologia fundamentală

#### Versiune minoră (X.Y.0)
- Funcționalități sau adăugiri noi de conținut
- Îmbunătățiri care mențin compatibilitatea retroactivă
- Exemple, instrumente sau resurse suplimentare

#### Versiune patch (X.Y.Z)
- Corecturi de erori și ajustări
- Îmbunătățiri minore ale conținutului existent
- Clarificări și mici îmbunătățiri

## Feedback și sugestii din comunitate

Încurajăm activ feedback-ul comunității pentru a îmbunătăți această resursă de învățare:

### Cum să oferi feedback
- **Probleme pe GitHub**: Raportați probleme sau sugerați îmbunătățiri (probleme specifice AI sunt binevenite)
- **Discuții pe Discord**: Împărtășiți idei și interacționați cu comunitatea Azure AI Foundry
- **Pull Requests**: Contribuiți direct la îmbunătățirea conținutului, în special șabloane și ghiduri AI
- **Discord Azure AI Foundry**: Participați în canalul #Azure pentru discuții AZD + AI
- **Forumuri comunitare**: Participați la discuții mai ample ale dezvoltatorilor Azure

### Categorii de feedback
- **Acuratețea conținutului AI**: Corecții pentru informațiile despre integrarea și implementarea serviciilor AI
- **Experiența de învățare**: Sugestii pentru un flux de învățare AI mai bun
- **Conținut AI lipsă**: Cereri pentru șabloane, modele sau exemple AI suplimentare
- **Accesibilitate**: Îmbunătățiri pentru nevoile diverse de învățare
- **Integrarea instrumentelor AI**: Sugestii pentru o mai bună integrare a fluxului de lucru AI
- **Modele AI pentru producție**: Cereri pentru modele de implementare AI pentru enterprise

### Angajamentul de răspuns
- **Răspuns la probleme**: În termen de 48 de ore pentru problemele raportate
- **Cereri de funcționalități**: Evaluare în termen de o săptămână
- **Contribuții comunitare**: Revizuire în termen de o săptămână
- **Probleme de securitate**: Prioritate imediată cu răspuns accelerat

## Program de întreținere

### Actualizări regulate
- **Revizuiri lunare**: Acuratețea conținutului și validarea linkurilor
- **Actualizări trimestriale**: Adăugiri și îmbunătățiri majore ale conținutului
- **Revizuiri semestriale**: Restructurări și îmbunătățiri cuprinzătoare
- **Lansări anuale**: Actualizări majore ale versiunii cu îmbunătățiri semnificative

### Monitorizare și asigurarea calității
- **Testare automată**: Validarea regulată a exemplelor de cod și linkurilor
- **Integrarea feedback-ului comunitar**: Incorporarea regulată a sugestiilor utilizatorilor
- **Actualizări tehnologice**: Alinierea cu cele mai recente servicii Azure și lansări azd
- **Audituri de accesibilitate**: Revizuiri regulate pentru principiile de design incluziv

## Politica de suport pentru versiuni

### Suport pentru versiunea curentă
- **Ultima versiune majoră**: Suport complet cu actualizări regulate
- **Versiunea majoră anterioară**: Actualizări de securitate și corecții critice timp de 12 luni
- **Versiuni vechi**: Suport comunitar doar, fără actualizări oficiale

### Ghiduri de migrare
Când sunt lansate versiuni majore, oferim:
- **Ghiduri de migrare**: Instrucțiuni pas cu pas pentru tranziție
- **Note de compatibilitate**: Detalii despre modificările majore
- **Suport pentru instrumente**: Scripturi sau utilitare pentru a ajuta la migrare
- **Suport comunitar**: Forumuri dedicate pentru întrebări legate de migrare

---

**Navigare**
- **Lecția anterioară**: [Ghid de studiu](resources/study-guide.md)
- **Lecția următoare**: Revenire la [README principal](README.md)

**Rămâi la curent**: Urmărește acest repo pentru notificări despre noi lansări și actualizări importante ale materialelor de învățare.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru neînțelegerile sau interpretările greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->