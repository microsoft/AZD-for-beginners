# Întrebări Frecvente (FAQ)

**Obțineți ajutor pe capitole**
- **📚 Acasă curs**: [AZD Pentru Începători](../README.md)
- **🚆 Probleme de instalare**: [Capitolul 1: Instalare & Configurare](../docs/chapter-01-foundation/installation.md)
- **🤖 Întrebări AI**: [Capitolul 2: Dezvoltare AI-First](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Depanare**: [Capitolul 7: Depanare & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introducere

Această FAQ cuprinzătoare oferă răspunsuri la cele mai frecvente întrebări despre Azure Developer CLI (azd) și implementările pe Azure. Găsiți soluții rapide pentru probleme comune, înțelegeți cele mai bune practici și obțineți clarificări despre concepte și fluxuri de lucru azd.

## Obiective de învățare

Parcurgând această FAQ, veți:
- Găsi răspunsuri rapide la întrebări și probleme frecvente despre Azure Developer CLI
- Înțelege conceptele cheie și terminologia printr-un format practic de întrebări și răspunsuri
- Accesa soluții de depanare pentru probleme și scenarii de eroare frecvente
- Învața cele mai bune practici prin întrebări frecvente despre optimizare
- Descoperi funcționalități și capabilități avansate prin întrebări de nivel expert
- Consulta eficient ghidări despre costuri, securitate și strategii de implementare

## Rezultatele învățării

Consultând regulat această FAQ, veți putea:
- Rezolva independent problemele comune Azure Developer CLI folosind soluțiile oferite
- Lua decizii informate despre strategiile și configurațiile de implementare
- Înțelege relația dintre azd și celelalte unelte și servicii Azure
- Aplica cele mai bune practici bazate pe experiența comunității și recomandările experților
- Depana eficient problemele de autentificare, implementare și configurare
- Optimiza costurile și performanța folosind informațiile și recomandările FAQ

## Cuprins

- [Începutul lucrului](#getting-started)
- [Autentificare & Acces](#authentication--access)
- [Șabloane & Proiecte](#templates--projects)
- [Implementare & Infrastructură](#deployment--infrastructure)
- [Configurare & Medii](#configuration--environments)
- [Depanare](#troubleshooting)
- [Costuri & Facturare](#cost--billing)
- [Cele mai bune practici](#best-practices)
- [Subiecte avansate](#advanced-topics)

---

## Începutul lucrului

### Î: Ce este Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) este un instrument de linie de comandă centrat pe dezvoltator care accelerează timpul necesar pentru a-ți transfera aplicația din mediul local de dezvoltare în Azure. Oferă cele mai bune practici prin șabloane și ajută cu întregul ciclu de viață al implementării.

### Î: Cu ce se diferențiază azd față de Azure CLI?
**R**: 
- **Azure CLI**: Instrument general pentru gestionarea resurselor Azure
- **azd**: Instrument focalizat pe dezvoltator pentru fluxurile de lucru ale implementării aplicațiilor
- azd are propriul său flux de autentificare și implementare; Azure CLI este un instrument separat, complementar
- azd include șabloane, gestionare a mediilor și automatizare a implementării

### Î: Am nevoie să am instalat Azure CLI pentru a folosi azd?
**R**: Nu pentru fluxul principal AZD. Autentifică-te cu `azd auth login`. Instalează Azure CLI separat când o legătură din șablon sau un exercițiu rulează explicit comenzi `az`.

### Î: Ce limbaje de programare suportă azd?
**R**: azd este independent de limbaj. Funcționează cu:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Site-uri web statice
- Aplicații containerizate

### Î: Pot folosi azd cu proiecte existente?
**R**: Da! Poți fie:
1. Să folosești `azd init` pentru a adăuga configurația azd în proiectele existente
2. Să adaptezi proiectele existente pentru a se potrivi structurii șablonului azd
3. Să creezi șabloane personalizate bazate pe arhitectura ta existentă

---

## Autentificare & Acces

### Î: Cum mă autentific în Azure folosind azd?
**R**: Folosește `azd auth login` care va deschide o fereastră de browser pentru autentificare Azure. Pentru scenarii CI/CD, folosește principii de serviciu sau identități gestionate.

### Î: Pot folosi azd cu mai multe abonamente Azure?
**R**: Da. Folosește `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` pentru a specifica abonamentul pe care să îl folosești pentru fiecare mediu.

### Î: Ce permisiuni am nevoie pentru a implementa cu azd?
**R**: De obicei ai nevoie de:
- rolul **Contributor** pe grupul de resurse sau abonament
- rolul **User Access Administrator** dacă implementezi resurse care necesită asignări de roluri
- Permisiunile specifice variază în funcție de șablon și resursele implementate

### Î: Pot folosi azd în pipeline-uri CI/CD?
**R**: Absolut! azd este conceput pentru integrare CI/CD. Folosește principii de serviciu pentru autentificare și setează variabile de mediu pentru configurare.

### Î: Cum gestionez autentificarea în GitHub Actions?
**R**: Preferă federația de identitate pentru workload (OIDC), configurată cu `azd pipeline config`. Workflow-ul generat instalează AZD și autentifică AZD direct cu o identitate federată. Un pas `azure/login` singur nu stabilește un login AZD. Un pas de autentificare într-un job existent este:
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

Provisionează sau implementează după autentificare, cu mediul AZD, abonamentul și locația intenționate configurate. Acreditivul federat al identității trebuie să aibă încredere în depozitul/ref-ul workflow-ului sau mediul GitHub, iar rolurile sale Azure trebuie să permită operațiunile solicitate.

---

## Șabloane & Proiecte

### Î: Unde pot găsi șabloane azd?
**R**: 
- Șabloane oficiale și din comunitate: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Șabloane din comunitate: Caută pe GitHub "azd-template"
- Folosește `azd template list` pentru a răsfoi șabloanele disponibile

### Î: Cum creez un șablon personalizat?
**R**: 
1. Pornește de la o structură de șablon existentă
2. Modifică `azure.yaml`, fișierele de infrastructură și codul aplicației
3. Testează riguros cu `azd up`
4. Publică pe GitHub cu tag-urile potrivite

### Î: Pot folosi azd fără un șablon?
**R**: Da, folosește `azd init` într-un proiect existent pentru a crea fișierele necesare de configurare. Va trebui să configurezi manual `azure.yaml` și fișierele de infrastructură.

### Î: Care este diferența între șabloanele oficiale și cele din comunitate?
**R**: 
- **Șabloane oficiale**: Menținute de Microsoft, actualizate regulat, documentație cuprinzătoare
- **Șabloane din comunitate**: Create de dezvoltatori, pot avea cazuri de utilizare specializate, calitate și mentenanță variabilă

### Î: Cum actualizez un șablon în proiectul meu?
**R**: Șabloanele nu se actualizează automat. Poți:
1. Compara și îmbina manual schimbările din șablonul sursă
2. Porni de la zero cu `azd init` folosind șablonul actualizat
3. Selecta îmbunătățiri specifice din șabloane actualizate

---

## Implementare & Infrastructură

### Î: Ce servicii Azure poate implementa azd?
**R**: azd poate implementa orice serviciu Azure prin șabloane Bicep/ARM, inclusiv:
- Servicii App, Container Apps, Functions
- Baze de date (SQL, PostgreSQL, Cosmos DB)
- Stocare, Key Vault, Application Insights
- Resurse de rețea, securitate și monitorizare

### Î: Pot implementa în mai multe regiuni?
**R**: Da, configurează mai multe regiuni în șabloanele Bicep și setează parametrul de locație corespunzător pentru fiecare mediu.

### Î: Cum gestionez migrările de scheme de baze de date?
**R**: Folosește hook-urile de implementare în `azure.yaml`:
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

### Î: Cum implementez peste resurse Azure existente?
**R**: Da, când șablonul suportă asta. Referențiază resursele existente cu declarațiile Bicep `existing` sau parametrii documentați ai șablonului pentru resurse existente, și mapează serviciile aplicației către țintele lor intenționate. Acest lucru nu transferă proprietatea sau nu creează automat permisiunile lipsă. Revizuiește șablonul înainte de implementare.

### Î: Pot folosi Terraform în loc de Bicep?
**R**: Da. AZD suportă atât Terraform, cât și Bicep. Selectează un șablon bazat pe Terraform sau configurează `infra.provider: terraform` în `azure.yaml`, cu fișiere Terraform și configurare a stării/backend-ului potrivită. Vezi [fluxul de lucru Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

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
**R**: În folderul `.azure` din directorul proiectului tău. Fiecare mediu are propriul folder cu fișiere de configurare.

### Î: Cum setez configurarea specifică mediului?
**R**: Folosește `azd env set` pentru a configura variabilele de mediu:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Î: Pot partaja configurațiile de mediu între membrii echipei?
**R**: Folderul `.azure` conține informații sensibile și nu ar trebui să fie adăugat în controlul versiunilor. În schimb:
1. Documentează variabilele de mediu necesare
2. Folosește scripturi de implementare pentru a configura mediile
3. Folosește Azure Key Vault pentru configurări sensibile

### Î: Cum suprascriu valorile implicite ale șablonului?
**R**: Setează variabile de mediu care corespund parametrilor șablonului:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Doar variabilele consumate de șablon afectează implementarea. `SKU_NAME` de mai sus este un exemplu de intrare personalizată, nu o setare universală AZD.

---

## Depanare

### Î: De ce eșuează `azd up`?
**R**: Cauze frecvente:
1. **Probleme de autentificare**: Rulează `azd auth login`
2. **Permisiuni insuficiente**: Verifică asignările rolurilor tale Azure
3. **Conflicte de denumire a resurselor**: Revizuiește resursa în conflict și intrările de denumire din șablon; creează un mediu separat cu `azd env new` când izolare este necesară
4. **Probleme de cotă/capacitate**: Verifică disponibilitatea regională
5. **Erori în șablon**: Validează șabloanele Bicep

### Î: Cum debugez eșecurile de implementare?
**R**: 
1. Folosește `azd deploy --debug` pentru output detaliat
2. Verifică istoricul implementărilor în portalul Azure
3. Revizuiește Jurnalul de Activitate în portalul Azure
4. Folosește `azd show` pentru a afișa starea curentă a mediului

### Î: De ce nu funcționează variabilele mele de mediu?
**R**: Verifică:
1. Numele variabilelor să coincidă exact cu parametrii șablonului
2. Valorile să fie corect citate dacă conțin spații
3. Mediul este selectat: `azd env select <environment>`
4. Variabilele sunt setate în mediul corect

### Î: Cum curăț implementările eșuate?
**R**: 
```bash
azd down
```
Revizuiește mai întâi mediul selectat și confirmarea ștergerii. Aceasta șterge resursele Azure provisionate, nu configurația locală a mediului `.azure`. `--purge` solicită suplimentar ștergerea permanentă a resurselor șterse soft suportate și poate fi blocată de protecția de reținere/ștergere; nu este un pas de recuperare de rutină.

### Î: De ce aplicația mea nu este accesibilă după implementare?
**R**: Verifică:
1. Implementarea s-a finalizat cu succes
2. Aplicația rulează (verifică jurnalele în portalul Azure)
3. Grupurile de securitate de rețea permit traficul
4. DNS/domainuri personalizate sunt configurate corect

---

## Costuri & Facturare

### Î: Cât costă implementările azd?
**R**: Costurile depind de:
- Serviciile Azure implementate
- Nivelurile/sku-urile serviciilor selectate
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

### Î: Există opțiuni de nivel gratuit pentru șabloanele azd?
**R**: Unele servicii au SKU-uri gratuite sau granturi lunare, supuse eligibilității, planului de hosting, regiunii și limitelor de abonament. Acestea nu fac întreg șablonul gratuit: baze de date, căutare, rețea, registru, telemetrie și inferență modele pot genera taxe separat. Verifică lista [serviciilor gratuite Azure](https://azure.microsoft.com/free/) și prețurile curente pentru fiecare resursă înainte de implementare.

### Î: Cum estimez costurile înainte de implementare?
**R**: 
1. Revizuiește `main.bicep` din șablon pentru a vedea ce resurse sunt create
2. Folosește Calculatorul de prețuri Azure cu SKU-uri specifice
3. Implementează mai întâi într-un mediu de dezvoltare pentru a monitoriza costurile reale
4. Folosește Azure Cost Management pentru analiză detaliată a costurilor

---

## Cele mai bune practici

### Î: Care sunt cele mai bune practici pentru structura proiectului azd?
**R**: 
1. Păstrează codul aplicației separat de infrastructură
2. Folosește nume semnificative pentru servicii în `azure.yaml`
3. Implementează o gestionare corectă a erorilor în scripturile de build
4. Folosește configurarea specifică mediului
5. Include documentație detaliată

### Î: Cum ar trebui să organizez mai multe servicii în azd?
**R**: Folosește structura recomandată:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Î: Ar trebui să comit folderul `.azure` în controlul versiunilor?
**R**: **Nu!** Folderul `.azure` conține informații sensibile. Adaugă-l la `.gitignore`:
```gitignore
.azure/
```

### Î: Cum gestionez secretele și configurațiile sensibile?
**R**: 
1. Folosește Azure Key Vault pentru secrete
2. Referințează secretele Key Vault în configurația aplicației
3. Nu comite niciodată secrete în controlul versiunilor
4. Folosește identități gestionate pentru autentificare serviciu-la-serviciu

### Î: Care este abordarea recomandată pentru CI/CD cu azd?
**R**: 
1. Folosește medii separate pentru fiecare etapă (dev/staging/prod)
2. Implementează testare automată înainte de implementare
3. Folosește principii de serviciu pentru autentificare
4. Stochează configurația sensibilă în secrete/variabile ale pipeline-ului
5. Implementează porți de aprobare pentru implementările în producție

---

## Subiecte Avansate

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
1. Folosește comenzile azd în scripturile pipeline-ului existent
2. Standardizează pe șabloanele azd în echipe
3. Integrează cu monitorizarea și alertarea existentă
4. Folosește ieșirea JSON a azd pentru integrarea în pipeline

### Î: Pot folosi azd cu Azure DevOps?
**R**: Da, azd funcționează cu orice sistem CI/CD. Creează pipeline-uri Azure DevOps care folosesc comenzile azd.

### Î: Cum pot contribui la azd sau crea șabloane comunitare?
**R**: 
1. **azd tool**: Contribuie la [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Șabloane**: Urmează [instrucțiunile contribuției galeriei Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentație**: Contribuie la documentație pe [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Î: Care este foaia de parcurs pentru azd?
**R**: Verifică [foaia de parcurs oficială](https://github.com/Azure/azure-dev/projects) pentru funcționalități și îmbunătățiri planificate.

### Î: Cum migrez de la alte instrumente de implementare la azd?
**R**: 
1. Analizează arhitectura actuală de implementare
2. Creează șabloane Bicep echivalente
3. Configurează `azure.yaml` pentru a corespunde serviciilor curente
4. Testează temeinic în mediul de dezvoltare
5. Migrează gradual mediile

---

## Mai ai întrebări?

### **Caută mai întâi**
- Verifică [documentația oficială](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Caută în [problemele GitHub](https://github.com/Azure/azure-dev/issues) pentru probleme similare

### **Obține ajutor**
- [Discuții GitHub](https://github.com/Azure/azure-dev/discussions) - Suport comunitar
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Întrebări tehnice
- [Azure Discord](https://discord.gg/azure) - Chat comunitar în timp real

### **Raportează probleme**
- [Probleme GitHub](https://github.com/Azure/azure-dev/issues/new) - Raportări de bug-uri și cereri de funcționalități
- Include jurnale relevante, mesaje de eroare și pași de reproducere

### **Află mai multe**
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrul de arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework-ul Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Ghid tehnic revizuit: 4 noiembrie 2026. Disponibilitatea în cloud și prețurile trebuie verificate pentru abonamentul și regiunea ta.*

---

**Navigare**
- **Lecția Anterioară**: [Glosar](glossary.md)
- **Lecția Următoare**: [Ghid de studiu](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->