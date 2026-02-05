# Întrebări Frecvente (FAQ)

**Obține Ajutor pe Capitole**
- **📚 Pagina Principală a Cursului**: [AZD Pentru Începători](../README.md)
- **🚆 Probleme de Instalare**: [Capitolul 1: Instalare și Configurare](../docs/getting-started/installation.md)
- **🤖 Întrebări despre AI**: [Capitolul 2: Dezvoltare AI-First](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Depanare**: [Capitolul 7: Depanare și Debugging](../docs/troubleshooting/common-issues.md)

## Introducere

Acest FAQ cuprinzător oferă răspunsuri la cele mai frecvente întrebări despre Azure Developer CLI (azd) și implementările în Azure. Găsește soluții rapide la probleme comune, înțelege cele mai bune practici și clarifică conceptele și fluxurile de lucru azd.

## Obiective de Învățare

Revizuind acest FAQ, vei putea:
- Găsi răspunsuri rapide la întrebări și probleme comune legate de Azure Developer CLI
- Înțelege concepte și termeni cheie printr-un format practic de întrebări și răspunsuri
- Accesa soluții de depanare pentru probleme frecvente și scenarii de eroare
- Învăța cele mai bune practici prin întrebări frecvente despre optimizare
- Descoperi funcționalități avansate și capabilități prin întrebări de nivel expert
- Consulta eficient ghiduri despre costuri, securitate și strategii de implementare

## Rezultate de Învățare

Cu referințe regulate la acest FAQ, vei putea:
- Rezolva independent problemele comune ale Azure Developer CLI folosind soluțiile oferite
- Lua decizii informate despre strategii și configurații de implementare
- Înțelege relația dintre azd și alte instrumente și servicii Azure
- Aplica cele mai bune practici bazate pe experiența comunității și recomandările experților
- Depana probleme de autentificare, implementare și configurare în mod eficient
- Optimiza costurile și performanța folosind informațiile și recomandările din FAQ

## Cuprins

- [Introducere](../../../resources)
- [Autentificare și Acces](../../../resources)
- [Șabloane și Proiecte](../../../resources)
- [Implementare și Infrastructură](../../../resources)
- [Configurare și Medii](../../../resources)
- [Depanare](../../../resources)
- [Costuri și Facturare](../../../resources)
- [Cele Mai Bune Practici](../../../resources)
- [Subiecte Avansate](../../../resources)

---

## Introducere

### Î: Ce este Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) este un instrument de linie de comandă orientat către dezvoltatori, care accelerează procesul de trecere a aplicației tale din mediul local de dezvoltare în Azure. Oferă cele mai bune practici prin șabloane și ajută la gestionarea întregului ciclu de viață al implementării.

### Î: Cum diferă azd de Azure CLI?
**R**: 
- **Azure CLI**: Instrument general pentru gestionarea resurselor Azure
- **azd**: Instrument axat pe fluxurile de lucru pentru implementarea aplicațiilor
- azd utilizează Azure CLI intern, dar oferă abstracții de nivel înalt pentru scenarii comune de dezvoltare
- azd include șabloane, gestionarea mediilor și automatizarea implementării

### Î: Am nevoie de Azure CLI instalat pentru a folosi azd?
**R**: Da, azd necesită Azure CLI pentru autentificare și anumite operațiuni. Instalează mai întâi Azure CLI, apoi azd.

### Î: Ce limbaje de programare sunt suportate de azd?
**R**: azd este agnostic față de limbajul de programare. Funcționează cu:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Site-uri statice
- Aplicații containerizate

### Î: Pot folosi azd cu proiecte existente?
**R**: Da! Poți:
1. Folosi `azd init` pentru a adăuga configurația azd la proiectele existente
2. Adapta proiectele existente pentru a se potrivi structurii șabloanelor azd
3. Crea șabloane personalizate bazate pe arhitectura ta existentă

---

## Autentificare și Acces

### Î: Cum mă autentific în Azure folosind azd?
**R**: Folosește `azd auth login`, care va deschide o fereastră de browser pentru autentificarea în Azure. Pentru scenarii CI/CD, folosește principii de serviciu sau identități gestionate.

### Î: Pot folosi azd cu mai multe subscripții Azure?
**R**: Da. Folosește `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` pentru a specifica subscripția utilizată pentru fiecare mediu.

### Î: Ce permisiuni sunt necesare pentru a implementa cu azd?
**R**: De obicei, ai nevoie de:
- Rolul **Contributor** pe grupul de resurse sau subscripție
- **User Access Administrator** dacă implementezi resurse care necesită atribuiri de roluri
- Permisiunile specifice variază în funcție de șablon și resursele implementate

### Î: Pot folosi azd în pipeline-uri CI/CD?
**R**: Absolut! azd este proiectat pentru integrarea CI/CD. Folosește principii de serviciu pentru autentificare și setează variabilele de mediu pentru configurare.

### Î: Cum gestionez autentificarea în GitHub Actions?
**R**: Folosește acțiunea Azure Login cu credențiale de principiu de serviciu:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Șabloane și Proiecte

### Î: Unde pot găsi șabloane azd?
**R**: 
- Șabloane oficiale: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Șabloane comunitare: Caută pe GitHub "azd-template"
- Folosește `azd template list` pentru a naviga prin șabloanele disponibile

### Î: Cum creez un șablon personalizat?
**R**: 
1. Începe cu structura unui șablon existent
2. Modifică `azure.yaml`, fișierele de infrastructură și codul aplicației
3. Testează cu `azd up`
4. Publică pe GitHub cu etichete corespunzătoare

### Î: Pot folosi azd fără un șablon?
**R**: Da, folosește `azd init` într-un proiect existent pentru a crea fișierele de configurare necesare. Va trebui să configurezi manual `azure.yaml` și fișierele de infrastructură.

### Î: Care este diferența dintre șabloanele oficiale și cele comunitare?
**R**: 
- **Șabloane oficiale**: Menținute de Microsoft, actualizate regulat, documentație cuprinzătoare
- **Șabloane comunitare**: Create de dezvoltatori, pot avea cazuri de utilizare specializate, calitate și întreținere variabile

### Î: Cum actualizez un șablon în proiectul meu?
**R**: Șabloanele nu sunt actualizate automat. Poți:
1. Compara și îmbina manual modificările din șablonul sursă
2. Începe de la zero cu `azd init` folosind șablonul actualizat
3. Selecta îmbunătățiri specifice din șabloanele actualizate

---

## Implementare și Infrastructură

### Î: Ce servicii Azure poate implementa azd?
**R**: azd poate implementa orice serviciu Azure prin șabloane Bicep/ARM, inclusiv:
- App Services, Container Apps, Functions
- Baze de date (SQL, PostgreSQL, Cosmos DB)
- Stocare, Key Vault, Application Insights
- Resurse de rețea, securitate și monitorizare

### Î: Pot implementa în mai multe regiuni?
**R**: Da, configurează mai multe regiuni în șabloanele Bicep și setează parametrul de locație corespunzător pentru fiecare mediu.

### Î: Cum gestionez migrarea schemelor bazei de date?
**R**: Folosește hook-uri de implementare în `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Î: Pot implementa doar infrastructura fără aplicații?
**R**: Da, folosește `azd provision` pentru a implementa doar componentele de infrastructură definite în șabloane.

### Î: Cum implementez pe resurse Azure existente?
**R**: Acest lucru este complex și nu este suportat direct. Poți:
1. Importa resursele existente în șabloanele tale Bicep
2. Folosi referințe la resursele existente în șabloane
3. Modifica șabloanele pentru a crea sau referi condiționat resursele

### Î: Pot folosi Terraform în loc de Bicep?
**R**: În prezent, azd suportă în principal șabloane Bicep/ARM. Suportul pentru Terraform nu este disponibil oficial, deși pot exista soluții comunitare.

---

## Configurare și Medii

### Î: Cum gestionez medii diferite (dev, staging, prod)?
**R**: Creează medii separate cu `azd env new <environment-name>` și configurează setări diferite pentru fiecare:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Î: Unde sunt stocate configurațiile mediilor?
**R**: În folderul `.azure` din directorul proiectului tău. Fiecare mediu are propriul folder cu fișiere de configurare.

### Î: Cum configurez setări specifice mediului?
**R**: Folosește `azd env set` pentru a configura variabilele de mediu:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Î: Pot partaja configurațiile mediilor cu membrii echipei?
**R**: Folderul `.azure` conține informații sensibile și nu ar trebui să fie inclus în controlul versiunilor. În schimb:
1. Documentează variabilele de mediu necesare
2. Folosește scripturi de implementare pentru a configura mediile
3. Utilizează Azure Key Vault pentru configurațiile sensibile

### Î: Cum suprascriu valorile implicite ale șabloanelor?
**R**: Setează variabilele de mediu care corespund parametrilor șablonului:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Depanare

### Î: De ce eșuează `azd up`?
**R**: Cauze comune:
1. **Probleme de autentificare**: Rulează `azd auth login`
2. **Permisiuni insuficiente**: Verifică atribuirea rolurilor în Azure
3. **Conflicte de denumire a resurselor**: Schimbă AZURE_ENV_NAME
4. **Probleme de cotă/capacitate**: Verifică disponibilitatea regională
5. **Erori în șablon**: Validează șabloanele Bicep

### Î: Cum depanez eșecurile de implementare?
**R**: 
1. Folosește `azd deploy --debug` pentru ieșire detaliată
2. Verifică istoricul implementărilor în portalul Azure
3. Revizuiește Jurnalul de Activitate în portalul Azure
4. Folosește `azd show` pentru a afișa starea curentă a mediului

### Î: De ce nu funcționează variabilele mele de mediu?
**R**: Verifică:
1. Numele variabilelor corespund exact parametrilor șablonului
2. Valorile sunt corect citate dacă conțin spații
3. Mediul este selectat: `azd env select <environment>`
4. Variabilele sunt setate în mediul corect

### Î: Cum curăț implementările eșuate?
**R**: 
```bash
azd down --force --purge
```
Aceasta elimină toate resursele și configurațiile mediului.

### Î: De ce aplicația mea nu este accesibilă după implementare?
**R**: Verifică:
1. Implementarea s-a finalizat cu succes
2. Aplicația rulează (verifică jurnalele în portalul Azure)
3. Grupurile de securitate ale rețelei permit traficul
4. DNS/domeniile personalizate sunt configurate corect

---

## Costuri și Facturare

### Î: Cât vor costa implementările azd?
**R**: Costurile depind de:
- Serviciile Azure implementate
- Nivelurile/planurile de servicii selectate
- Diferențele de prețuri regionale
- Modelele de utilizare

Folosește [Calculatorul de Prețuri Azure](https://azure.microsoft.com/pricing/calculator/) pentru estimări.

### Î: Cum controlez costurile în implementările azd?
**R**: 
1. Folosește niveluri inferioare pentru mediile de dezvoltare
2. Configurează bugete și alerte Azure
3. Folosește `azd down` pentru a elimina resursele când nu sunt necesare
4. Alege regiuni potrivite (costurile variază în funcție de locație)
5. Utilizează instrumentele de gestionare a costurilor Azure

### Î: Există opțiuni gratuite pentru șabloanele azd?
**R**: Multe servicii Azure oferă niveluri gratuite:
- App Service: Disponibil nivel gratuit
- Azure Functions: 1M execuții gratuite/lună
- Cosmos DB: Nivel gratuit cu 400 RU/s
- Application Insights: Primele 5GB/lună gratuite

Configurează șabloanele pentru a utiliza nivelurile gratuite acolo unde este posibil.

### Î: Cum estimez costurile înainte de implementare?
**R**: 
1. Revizuiește `main.bicep` al șablonului pentru a vedea ce resurse sunt create
2. Folosește Calculatorul de Prețuri Azure cu planuri specifice
3. Implementează mai întâi într-un mediu de dezvoltare pentru a monitoriza costurile reale
4. Utilizează Gestionarea Costurilor Azure pentru o analiză detaliată a costurilor

---

## Cele Mai Bune Practici

### Î: Care sunt cele mai bune practici pentru structura proiectelor azd?
**R**: 
1. Păstrează codul aplicației separat de infrastructură
2. Folosește nume semnificative pentru servicii în `azure.yaml`
3. Implementează gestionarea corectă a erorilor în scripturile de construire
4. Utilizează configurații specifice mediului
5. Include documentație cuprinzătoare

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

### Î: Ar trebui să includ folderul `.azure` în controlul versiunilor?
**R**: **Nu!** Folderul `.azure` conține informații sensibile. Adaugă-l în `.gitignore`:
```gitignore
.azure/
```

### Î: Cum gestionez secretele și configurațiile sensibile?
**R**: 
1. Folosește Azure Key Vault pentru secrete
2. Referențiază secretele Key Vault în configurația aplicației
3. Nu include niciodată secretele în controlul versiunilor
4. Utilizează identități gestionate pentru autentificarea între servicii

### Î: Care este abordarea recomandată pentru CI/CD cu azd?
**R**: 
1. Folosește medii separate pentru fiecare etapă (dev/staging/prod)
2. Implementează teste automate înainte de implementare
3. Utilizează principii de serviciu pentru autentificare
4. Stochează configurațiile sensibile în secrete/variabilele pipeline-ului
5. Implementează etape de aprobare pentru implementările în producție

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
1. Folosește comenzile azd în scripturile pipeline-urilor existente
2. Standardizează șabloanele azd în echipe
3. Integrează cu monitorizarea și alertarea existente
4. Utilizează ieșirea JSON a azd pentru integrarea în pipeline-uri

### Î: Pot folosi azd cu Azure DevOps?
**R**: Da, azd funcționează cu orice sistem CI/CD. Creează pipeline-uri Azure DevOps care utilizează comenzile azd.

### Î: Cum contribui la azd sau creez șabloane comunitare?
**R**: 
1. **Instrumentul azd**: Contribuie la [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Șabloane**: Creează șabloane urmând [ghidul pentru șabloane](https://github.com/Azure-Samples/awesome-azd)  
3. **Documentație**: Contribuie la documentație la [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### Î: Care este planul de dezvoltare pentru azd?  
**R**: Consultă [planul oficial](https://github.com/Azure/azure-dev/projects) pentru funcționalități și îmbunătățiri planificate.  

### Î: Cum migrez de la alte unelte de implementare la azd?  
**R**:  
1. Analizează arhitectura actuală de implementare  
2. Creează șabloane Bicep echivalente  
3. Configurează `azure.yaml` pentru a corespunde serviciilor actuale  
4. Testează temeinic în mediul de dezvoltare  
5. Migrează treptat mediile  

---

## Mai ai întrebări?  

### **Caută mai întâi**  
- Consultă [documentația oficială](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Caută în [problemele de pe GitHub](https://github.com/Azure/azure-dev/issues) pentru probleme similare  

### **Obține ajutor**  
- [Discuții pe GitHub](https://github.com/Azure/azure-dev/discussions) - Suport din partea comunității  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Întrebări tehnice  
- [Azure Discord](https://discord.gg/azure) - Chat comunitar în timp real  

### **Raportează probleme**  
- [Probleme pe GitHub](https://github.com/Azure/azure-dev/issues/new) - Raportarea erorilor și solicitări de funcționalități  
- Include jurnale relevante, mesaje de eroare și pașii pentru a reproduce problema  

### **Află mai multe**  
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centrul de Arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Cadrul Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Acest FAQ este actualizat periodic. Ultima actualizare: 9 septembrie 2025*  

---

**Navigare**  
- **Lecția anterioară**: [Glosar](glossary.md)  
- **Lecția următoare**: [Ghid de studiu](study-guide.md)  

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.