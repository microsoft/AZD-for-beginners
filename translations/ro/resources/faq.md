# Întrebări frecvente (FAQ)

**Obține ajutor pe capitole**
- **📚 Pagina principală a cursului**: [AZD Pentru Începători](../README.md)
- **🚆 Probleme la instalare**: [Capitolul 1: Instalare & Configurare](../docs/chapter-01-foundation/installation.md)
- **🤖 Întrebări despre AI**: [Capitolul 2: Dezvoltare AI-Primară](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Depanare**: [Capitolul 7: Depanare & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introducere

Această FAQ cuprinzătoare oferă răspunsuri la cele mai frecvente întrebări despre Azure Developer CLI (azd) și implementările Azure. Găsiți soluții rapide la probleme comune, înțelegeți cele mai bune practici și obțineți clarificări despre conceptele și fluxurile de lucru azd.

## Obiective de învățare

Parcurgând această FAQ, veți:
- Găsi răspunsuri rapide la întrebări și probleme frecvente legate de Azure Developer CLI
- Înțelege conceptele și terminologia cheie printr-un format practic de întrebări și răspunsuri
- Accesa soluții de depanare pentru probleme și scenarii de eroare frecvente
- Învăța cele mai bune practici prin întrebări frecvent adresate despre optimizare
- Descoperi funcționalități și capabilități avansate prin întrebări la nivel de expert
- Referi eficient ghiduri despre costuri, securitate și strategii de implementare

## Rezultate de învățare

Consultând regulat această FAQ, veți putea:
- Rezolva probleme comune Azure Developer CLI independent folosind soluțiile oferite
- Lua decizii informate despre strategiile și configurațiile de implementare
- Înțelege relația dintre azd și alte unelte și servicii Azure
- Aplica cele mai bune practici bazate pe experiența comunității și recomandările experților
- Depana eficient probleme de autentificare, implementare și configurare
- Optimiza costurile și performanța folosind perspectivele și recomandările din FAQ

## Cuprins

- [Începerea lucrului](#getting-started)
- [Autentificare & Acces](#authentication--access)
- [Șabloane & Proiecte](#templates--projects)
- [Implementare & Infrastructură](#deployment--infrastructure)
- [Configurare & Medii](#configuration--environments)
- [Depanare](#troubleshooting)
- [Costuri & Facturare](#cost--billing)
- [Cele mai bune practici](#best-practices)
- [Subiecte avansate](#advanced-topics)

---

## Începerea lucrului

### Î: Ce este Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) este un instrument de linie de comandă axat pe dezvoltatori care accelerează timpul necesar pentru a aduce aplicația de la mediul local de dezvoltare la Azure. Oferă cele mai bune practici prin șabloane și asistă pe tot parcursul ciclului de viață al implementării.

### Î: Cum diferă azd de Azure CLI?
**R**: 
- **Azure CLI**: Instrument general pentru gestionarea resurselor Azure
- **azd**: Instrument axat pe dezvoltatori pentru fluxurile de lucru ale implementării aplicațiilor
- azd are propriul flux de autentificare și implementare; Azure CLI este un instrument separat, complementar
- azd include șabloane, gestionarea mediilor și automatizarea implementării

### Î: Trebuie să am instalat Azure CLI pentru a folosi azd?
**R**: Nu pentru fluxul principal AZD. Autentifică-te cu `azd auth login`. Instalează Azure CLI separat atunci când un cârlig de șablon sau un exercițiu rulează explicit comenzi `az`.

### Î: Ce limbaje de programare suportă azd?
**R**: azd este agnostic față de limbaj. Funcționează cu:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Site-uri statice
- Aplicații containerizate

### Î: Pot folosi azd cu proiecte existente?
**R**: Da! Poți fie:
1. Să folosești `azd init` pentru a adăuga configurația azd la proiecte existente
2. Să adaptezi proiectele existente pentru a corespunde structurii șablonului azd
3. Să creezi șabloane personalizate bazate pe arhitectura ta existentă

### Î: Ce s-a schimbat odată cu disponibilitatea generală a extensiei Foundry?
**R**: Pachetul `microsoft.foundry` a ajuns la versiunea 1.0 și GA pe 5 noiembrie 2026. Cu AZD 1.37.0+, folosește `azd ext install microsoft.foundry` pentru a instala șapte extensii principale pentru agenți, conexiuni, inspector, proiecte, rutine, abilități și truse de unelte. Nu este un nou spațiu de nume pentru comenzi, iar componentele sale sunt versiunate independent. Evaluările, seturile de date, fine-tuning-ul și modelele personalizate sunt instalate separat; funcționalitățile opționale în previzualizare nu devin GA doar pentru că pachetul este GA.

Parcurgerea [agentului găzduit](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) folosește Python 3.13+ și uv actual. `azd ai agent run` deschide Agent Inspector local, dar apelurile modelului încă folosesc Azure și implică costuri. Modul cod `azd deploy` încarcă sursa pentru o compilare la distanță fără a necesita o compilare locală în container.

### Î: `azd down` elimină un agent găzduit dintr-un proiect Foundry existent?
**R**: Nu pentru calea de reutilizare a proiectului descrisă în quickstart-ul agentului găzduit: lasă proiectul, agentul găzduit și alte resurse neatinse. Elimină resursele nedorite separat fără a șterge resursele partajate. Dacă mediul a creat un nou proiect Foundry, `azd down` șterge grupul său de resurse și tot ce este în el. Revizuiește [ghidul de curățare](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) și prompturile de ștergere înainte de confirmare.

---

## Autentificare & Acces

### Î: Cum mă autentific la Azure folosind azd?
**R**: Folosește `azd auth login` care va deschide o fereastră de browser pentru autentificare Azure. Pentru scenarii CI/CD, folosește principii de serviciu sau identități gestionate.

### Î: Pot folosi azd cu abonamente Azure multiple?
**R**: Da. Folosește `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` pentru a specifica ce abonament se folosește pentru fiecare mediu.

### Î: Ce permisiuni am nevoie pentru a implementa cu azd?
**R**: De obicei ai nevoie de:
- Rolul de **Contributor** pe grupul de resurse sau abonament
- **Administrator acces utilizator** dacă implementezi resurse care necesită atribuiri de rol
- Permisiunile specifice variază după șablon și resursele implementate

### Î: Pot folosi azd în pipeline-urile CI/CD?
**R**: Absolut! azd este conceput pentru integrare CI/CD. Folosește principii de serviciu pentru autentificare și setează variabile de mediu pentru configurare.

### Î: Cum gestionez autentificarea în GitHub Actions?
**R**: Preferă federarea identității pentru sarcini (OIDC), configurată cu `azd pipeline config`. Workflow-ul generat instalează AZD și autentifică AZD direct cu o identitate federată. Un pas `azure/login` de unul singur nu stabilește o autentificare AZD. Un pas de autentificare într-un job existent este:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Proviționează sau implementează după autentificare, cu mediul AZD, abonamentul și locația configurate corespunzător. Credențialul federat al identității trebuie să aibă încredere în repository-ul/ref-ul workflow-ului sau mediu GitHub, iar rolurile sale Azure trebuie să permită operațiunile solicitate.

---

## Șabloane & Proiecte

### Î: Unde pot găsi șabloane azd?
**R**: 
- Șabloane oficiale și comunitare: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Șabloane comunitare: caută pe GitHub "azd-template"
- Folosește `azd template list` pentru a naviga prin șabloanele disponibile

### Î: Cum creez un șablon personalizat?
**R**: 
1. Pornește de la o structură de șablon existentă
2. Modifică `azure.yaml`, fișierele de infrastructură și codul aplicației
3. Testează temeinic cu `azd up`
4. Publică pe GitHub cu tag-urile corespunzătoare

### Î: Pot folosi azd fără un șablon?
**R**: Da, folosește `azd init` într-un proiect existent pentru a crea fișierele de configurație necesare. Va trebui să configurezi manual `azure.yaml` și fișierele de infrastructură.

### Î: Care este diferența între șabloanele oficiale și cele comunitare?
**R**: 
- **Șabloane oficiale**: întreținute de Microsoft, actualizate regulat, documentație cuprinzătoare
- **Șabloane comunitare**: create de dezvoltatori, pot avea cazuri de utilizare specializate, calitate și întreținere variabile

### Î: Cum actualizez un șablon în proiectul meu?
**R**: Șabloanele nu se actualizează automat. Poți:
1. Să compari și să îmbini manual modificările din șablonul sursă
2. Să începi proaspăt cu `azd init` folosind șablonul actualizat
3. Să preiei selectiv îmbunătățiri specifice din șabloanele actualizate

---

## Implementare & Infrastructură

### Î: Ce servicii Azure poate implementa azd?
**R**: azd poate implementa orice serviciu Azure prin șabloane Bicep/ARM, inclusiv:
- App Services, Container Apps, Functions
- Baze de date (SQL, PostgreSQL, Cosmos DB)
- Stocare, Key Vault, Application Insights
- Resurse de rețea, securitate și monitorizare

### Î: Pot implementa în mai multe regiuni?
**R**: Da, configurează mai multe regiuni în șabloanele Bicep și setează parametrii de locație corespunzător pentru fiecare mediu.

### Î: Cum gestionhez migrațiile schemelor de baze de date?
**R**: Folosește cârligele de implementare în `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Î: Pot implementa doar infrastructura fără aplicații?
**R**: Da, folosește `azd provision` pentru a implementa doar componentele de infrastructură definite în șabloanele tale.

### Î: Cum pot implementa pe resurse Azure existente?
**R**: Da, dacă șablonul îl suportă. Referențiază resursele existente cu declarațiile Bicep `existing` sau parametrii documentați pentru resurse existente din șablon și mapează serviciile aplicației pe țintele dorite. Acest lucru nu importă proprietatea sau creează automat permisiunile lipsă. Revizuiește șablonul înainte de implementare.

### Î: Pot folosi Terraform în loc de Bicep?
**R**: Da. AZD suportă atât Terraform cât și Bicep. Selectează un șablon bazat pe Terraform sau configurează `infra.provider: terraform` în `azure.yaml`, cu fișiere Terraform corespunzătoare și configurare de stare/backend. Vezi [fluxul Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configurare & Medii

### Î: Cum gestionez medii diferite (dev, staging, prod)?
**R**: Creează medii separate cu `azd env new <environment-name>` și configurează setări diferite pentru fiecare:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Î: Unde sunt stocate configurațiile de mediu?
**R**: În folderul `.azure` din directorul proiectului tău. Fiecare mediu are propriul folder cu fișiere de configurație.

### Î: Cum setez configurație specifică mediului?
**R**: Folosește `azd env set` pentru a configura variabile de mediu:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Î: Pot partaja configurațiile de mediu între membrii echipei?
**R**: Folderul `.azure` conține informații sensibile și nu trebuie comis în controlul versiunii. În schimb:
1. Documentează variabilele de mediu necesare
2. Folosește scripturi de implementare pentru a configura mediile
3. Folosește Azure Key Vault pentru configurațiile sensibile

### Î: Cum suprascriu valorile implicite ale șablonului?
**R**: Setează variabile de mediu care corespund parametrilor șablonului:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Doar variabilele consumate de șablon afectează implementarea. `SKU_NAME` de mai sus este un exemplu de input personalizat, nu o setare universală AZD.

---

## Depanare

### Î: De ce eșuează `azd up`?
**R**: Cauze comune:
1. **Probleme de autentificare**: Rulează `azd auth login`
2. **Permisiuni insuficiente**: Verifică atribuțiile de rol Azure
3. **Conflicte de denumire a resurselor**: Revizuiește resursa în conflict și inputurile de denumire ale șablonului; creează un mediu separat cu `azd env new` când este necesară izolarea
4. **Probleme de cotă/capacitate**: Verifică disponibilitatea regională
5. **Erori în șablon**: Validează șabloanele Bicep

### Î: Cum depanez eșecurile de implementare?
**R**: 
1. Folosește `azd deploy --debug` pentru ieșire detaliată
2. Verifică istoricul implementărilor în portalul Azure
3. Revizuiește Jurnalul de activitate în portalul Azure
4. Folosește `azd show` pentru a afișa starea curentă a mediului

### Î: De ce nu funcționează variabilele mele de mediu?
**R**: Verifică:
1. Numele variabilelor corespund exact parametrilor șablonului
2. Valorile sunt corect între ghilimele dacă conțin spații
3. Mediul este selectat: `azd env select <environment>`
4. Variabilele sunt setate în mediul corect

### Î: Cum curăț implementările eșuate?
**R**: 
```bash
azd down
```
Revizuiește mai întâi mediul selectat și confirmarea ștergerii. Aceasta șterge resursele Azure provisionate, nu configurația locală a mediului `.azure`. `--purge` solicită și ștergerea permanentă a resurselor soft-sterse suportate și poate fi blocată de protecția de retenție/purgare; nu este un pas uzual de recuperare.

### Î: De ce aplicația mea nu este accesibilă după implementare?
**R**: Verifică:
1. Implementarea s-a finalizat cu succes
2. Aplicația este în funcțiune (verifică jurnalele în portalul Azure)
3. Grupurile de securitate rețea permit traficul
4. DNS/domeniile personalizate sunt configurate corect

---

## Costuri & Facturare

### Î: Cât vor costa implementările azd?
**R**: Costurile depind de:
- Serviciile Azure implementate
- Nivelurile/ SKU-urile serviciului selectate
- Diferențele de preț regionale
- Modelele de utilizare

Folosește [Calculatorul de prețuri Azure](https://azure.microsoft.com/pricing/calculator/) pentru estimări.

### Î: Cum controlez costurile în implementările azd?
**R**: 
1. Folosește SKU-uri de nivel inferior pentru mediile de dezvoltare
2. Configurează bugete și alerte Azure
3. Folosește `azd down` pentru a elimina resursele când nu sunt necesare
4. Alege regiuni potrivite (costurile variază în funcție de locație)
5. Folosește instrumentele Azure Cost Management

### Î: Există opțiuni gratuite pentru șabloanele azd?
**R**: Unele servicii au SKU-uri gratuite sau granturi lunare, supuse eligibilității, planului de găzduire, regiunii și limitelor abonamentului. Acestea nu fac un șablon întreg gratuit: bazele de date, căutarea, rețeaua, registrul, telemetria și inferența modelului pot genera costuri independente. Verificați [lista serviciilor gratuite Azure](https://azure.microsoft.com/free/) și prețurile curente pentru fiecare resursă înainte de implementare.

### Î: Cum pot estima costurile înainte de implementare?
**R**: 
1. Revizuiți `main.bicep` din șablon pentru a vedea ce resurse sunt create
2. Folosiți Calculatoarele de Prețuri Azure cu SKU-urile specifice
3. Implementați mai întâi într-un mediu de dezvoltare pentru a monitoriza costurile reale
4. Folosiți Azure Cost Management pentru analiza detaliată a costurilor

---

## Cele mai bune practici

### Î: Care sunt cele mai bune practici pentru structura proiectului azd?
**R**: 
1. Mențineți codul aplicației separat de infrastructură
2. Folosiți nume semnificative pentru servicii în `azure.yaml`
3. Implementați manipularea corectă a erorilor în scripturile de construire
4. Folosiți configurație specifică mediului
5. Includeți documentație cuprinzătoare

### Î: Cum ar trebui să organizez mai multe servicii în azd?
**R**: Folosiți structura recomandată:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Î: Ar trebui să adaug folderul `.azure` în controlul versiunilor?
**R**: **Nu!** Folderul `.azure` conține informații sensibile. Adăugați-l în `.gitignore`:
```gitignore
.azure/
```

### Î: Cum gestionez secretele și configurația sensibilă?
**R**: 
1. Folosiți Azure Key Vault pentru secrete
2. Referențiați secretele Key Vault în configurația aplicației
3. Nu faceți niciodată commit la secrete în controlul versiunilor
4. Folosiți identități gestionate pentru autentificarea între servicii

### Î: Care este abordarea recomandată pentru CI/CD cu azd?
**R**: 
1. Folosiți medii separate pentru fiecare etapă (dev/staging/prod)
2. Implementați testare automată înainte de implementare
3. Folosiți principalii de serviciu pentru autentificare
4. Stocați configurația sensibilă în secretele/variabilele pipeline-ului
5. Implementați porți de aprobare pentru implementările de producție

---

## Subiecte avansate

### Î: Pot extinde azd cu funcționalități personalizate?
**R**: Da, prin hook-uri de implementare în `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Î: Cum integrez azd cu procesele DevOps existente?
**R**: 
1. Folosiți comenzi azd în scripturile pipeline-urilor existente
2. Standardizați șabloanele azd între echipe
3. Integrați cu monitorizarea și alertarea existentă
4. Folosiți output-ul JSON al azd pentru integrarea în pipeline

### Î: Pot folosi azd cu Azure DevOps?
**R**: Da, azd funcționează cu orice sistem CI/CD. Creați pipeline-uri Azure DevOps care folosesc comenzi azd.

### Î: Cum pot contribui la azd sau crea șabloane comunitare?
**R**: 
1. **Instrumentul azd**: Contribuiți la [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Șabloane**: Urmați instrucțiunile de contribuție din galeria [Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentație**: Contribuiți la documentație la [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Î: Care este foaia de parcurs pentru azd?
**R**: Verificați [foaia de parcurs oficială](https://github.com/Azure/azure-dev/projects) pentru caracteristici și îmbunătățiri planificate.

### Î: Cum migrez de la alte instrumente de implementare la azd?
**R**: 
1. Analizați arhitectura curentă de implementare
2. Creați șabloane Bicep echivalente
3. Configurați `azure.yaml` să corespundă serviciilor curente
4. Testați temeinic în mediul de dezvoltare
5. Migrați treptat mediile

---

## Aveți încă întrebări?

### **Cautați mai întâi**
- Verificați [documentația oficială](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Căutați în [problemele GitHub](https://github.com/Azure/azure-dev/issues) pentru probleme similare

### **Obțineți ajutor**
- [Discuții GitHub](https://github.com/Azure/azure-dev/discussions) - Suport comunitar
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Întrebări tehnice
- [Azure Discord](https://discord.gg/azure) - Chat comunitar în timp real

### **Raportați probleme**
- [Probleme GitHub](https://github.com/Azure/azure-dev/issues/new) - Raportări de buguri și cereri de funcții
- Includeți jurnale relevante, mesaje de eroare și pașii de reproducere

### **Aflați mai multe**
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrul de arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Cadrul Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Ghid tehnic revizuit: 4 noiembrie 2026. Disponibilitatea în cloud și prețurile trebuie verificate pentru abonamentul și regiunea dvs.*

---

**Navigare**
- **Lecția anterioară**: [Glosar](glossary.md)
- **Lecția următoare**: [Ghid de studiu](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->