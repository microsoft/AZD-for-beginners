<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-10T07:28:51+00:00",
  "source_file": "resources/faq.md",
  "language_code": "ro"
}
-->
# Întrebări Frecvente (FAQ)

## Introducere

Acest FAQ cuprinzător oferă răspunsuri la cele mai comune întrebări despre Azure Developer CLI (azd) și implementările în Azure. Găsiți soluții rapide la probleme frecvente, înțelegeți cele mai bune practici și clarificați conceptele și fluxurile de lucru azd.

## Obiective de Învățare

Revizuind acest FAQ, veți:
- Găsi răspunsuri rapide la întrebări și probleme comune legate de Azure Developer CLI
- Înțelege conceptele și terminologia cheie printr-un format practic de întrebări și răspunsuri
- Accesa soluții de depanare pentru probleme frecvente și scenarii de eroare
- Învăța cele mai bune practici prin întrebări frecvente despre optimizare
- Descoperi funcționalități avansate și capabilități prin întrebări de nivel expert
- Consulta eficient ghiduri despre costuri, securitate și strategii de implementare

## Rezultate de Învățare

Cu referințe regulate la acest FAQ, veți putea:
- Rezolva independent problemele comune ale Azure Developer CLI folosind soluțiile oferite
- Lua decizii informate despre strategiile și configurațiile de implementare
- Înțelege relația dintre azd și alte instrumente și servicii Azure
- Aplica cele mai bune practici bazate pe experiența comunității și recomandările experților
- Depana eficient problemele de autentificare, implementare și configurare
- Optimiza costurile și performanța folosind informațiile și recomandările din FAQ

## Cuprins

- [Început](../../../resources)
- [Autentificare & Acces](../../../resources)
- [Șabloane & Proiecte](../../../resources)
- [Implementare & Infrastructură](../../../resources)
- [Configurare & Medii](../../../resources)
- [Depanare](../../../resources)
- [Costuri & Facturare](../../../resources)
- [Cele Mai Bune Practici](../../../resources)
- [Subiecte Avansate](../../../resources)

---

## Început

### Î: Ce este Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) este un instrument de linie de comandă orientat către dezvoltatori, care accelerează timpul necesar pentru a duce aplicația dvs. din mediul local de dezvoltare în Azure. Oferă cele mai bune practici prin șabloane și ajută la întregul ciclu de viață al implementării.

### Î: Cum diferă azd de Azure CLI?
**R**: 
- **Azure CLI**: Instrument general pentru gestionarea resurselor Azure
- **azd**: Instrument axat pe fluxurile de lucru pentru implementarea aplicațiilor
- azd utilizează Azure CLI intern, dar oferă abstracții de nivel superior pentru scenarii comune de dezvoltare
- azd include șabloane, gestionarea mediilor și automatizarea implementării

### Î: Am nevoie de Azure CLI instalat pentru a utiliza azd?
**R**: Da, azd necesită Azure CLI pentru autentificare și unele operațiuni. Instalați mai întâi Azure CLI, apoi instalați azd.

### Î: Ce limbaje de programare sunt acceptate de azd?
**R**: azd este agnostic față de limbaj. Funcționează cu:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Site-uri statice
- Aplicații containerizate

### Î: Pot utiliza azd cu proiecte existente?
**R**: Da! Puteți fie:
1. Utiliza `azd init` pentru a adăuga configurația azd la proiectele existente
2. Adapta proiectele existente pentru a se potrivi structurii șablonului azd
3. Crea șabloane personalizate bazate pe arhitectura dvs. existentă

---

## Autentificare & Acces

### Î: Cum mă autentific cu Azure folosind azd?
**R**: Utilizați `azd auth login`, care va deschide o fereastră de browser pentru autentificarea în Azure. Pentru scenarii CI/CD, utilizați principalii de serviciu sau identități gestionate.

### Î: Pot utiliza azd cu mai multe abonamente Azure?
**R**: Da. Utilizați `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` pentru a specifica ce abonament să fie utilizat pentru fiecare mediu.

### Î: Ce permisiuni sunt necesare pentru a implementa cu azd?
**R**: De obicei, aveți nevoie de:
- Rolul **Contributor** pe grupul de resurse sau abonament
- **User Access Administrator** dacă implementați resurse care necesită atribuiri de roluri
- Permisiunile specifice variază în funcție de șablon și resursele implementate

### Î: Pot utiliza azd în pipeline-uri CI/CD?
**R**: Absolut! azd este proiectat pentru integrarea CI/CD. Utilizați principalii de serviciu pentru autentificare și setați variabilele de mediu pentru configurare.

### Î: Cum gestionez autentificarea în GitHub Actions?
**R**: Utilizați acțiunea Azure Login cu acreditivele principalului de serviciu:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Șabloane & Proiecte

### Î: Unde pot găsi șabloane azd?
**R**: 
- Șabloane oficiale: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Șabloane comunitare: Căutați pe GitHub "azd-template"
- Utilizați `azd template list` pentru a naviga prin șabloanele disponibile

### Î: Cum creez un șablon personalizat?
**R**: 
1. Începeți cu structura unui șablon existent
2. Modificați `azure.yaml`, fișierele de infrastructură și codul aplicației
3. Testați temeinic cu `azd up`
4. Publicați pe GitHub cu etichete corespunzătoare

### Î: Pot utiliza azd fără un șablon?
**R**: Da, utilizați `azd init` într-un proiect existent pentru a crea fișierele de configurare necesare. Va trebui să configurați manual `azure.yaml` și fișierele de infrastructură.

### Î: Care este diferența dintre șabloanele oficiale și cele comunitare?
**R**: 
- **Șabloane oficiale**: Menținute de Microsoft, actualizate regulat, documentație cuprinzătoare
- **Șabloane comunitare**: Create de dezvoltatori, pot avea cazuri de utilizare specializate, calitate și întreținere variabile

### Î: Cum actualizez un șablon în proiectul meu?
**R**: Șabloanele nu sunt actualizate automat. Puteți:
1. Compara și îmbina manual modificările din șablonul sursă
2. Începe de la zero cu `azd init` utilizând șablonul actualizat
3. Selecta îmbunătățiri specifice din șabloanele actualizate

---

## Implementare & Infrastructură

### Î: Ce servicii Azure poate implementa azd?
**R**: azd poate implementa orice serviciu Azure prin șabloane Bicep/ARM, inclusiv:
- App Services, Container Apps, Functions
- Baze de date (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Resurse de rețea, securitate și monitorizare

### Î: Pot implementa în mai multe regiuni?
**R**: Da, configurați mai multe regiuni în șabloanele Bicep și setați corespunzător parametrul de locație pentru fiecare mediu.

### Î: Cum gestionez migrațiile de schemă ale bazei de date?
**R**: Utilizați hook-uri de implementare în `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Î: Pot implementa doar infrastructura fără aplicații?
**R**: Da, utilizați `azd provision` pentru a implementa doar componentele de infrastructură definite în șabloane.

### Î: Cum implementez în resurse Azure existente?
**R**: Acest lucru este complex și nu este direct acceptat. Puteți:
1. Importa resursele existente în șabloanele dvs. Bicep
2. Utiliza referințe la resursele existente în șabloane
3. Modifica șabloanele pentru a crea sau referi condiționat resurse

### Î: Pot utiliza Terraform în loc de Bicep?
**R**: În prezent, azd acceptă în principal șabloane Bicep/ARM. Suportul pentru Terraform nu este disponibil oficial, deși pot exista soluții comunitare.

---

## Configurare & Medii

### Î: Cum gestionez medii diferite (dev, staging, prod)?
**R**: Creați medii separate cu `azd env new <environment-name>` și configurați setări diferite pentru fiecare:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Î: Unde sunt stocate configurațiile mediului?
**R**: În folderul `.azure` din directorul proiectului dvs. Fiecare mediu are propriul folder cu fișiere de configurare.

### Î: Cum configurez setări specifice mediului?
**R**: Utilizați `azd env set` pentru a configura variabilele de mediu:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Î: Pot partaja configurațiile mediului între membrii echipei?
**R**: Folderul `.azure` conține informații sensibile și nu ar trebui să fie inclus în controlul versiunilor. În schimb:
1. Documentați variabilele de mediu necesare
2. Utilizați scripturi de implementare pentru a configura mediile
3. Utilizați Azure Key Vault pentru configurațiile sensibile

### Î: Cum suprascriu valorile implicite ale șablonului?
**R**: Setați variabilele de mediu care corespund parametrilor șablonului:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Depanare

### Î: De ce eșuează `azd up`?
**R**: Cauze comune:
1. **Probleme de autentificare**: Rulați `azd auth login`
2. **Permisiuni insuficiente**: Verificați atribuțiile de rol Azure
3. **Conflicte de denumire a resurselor**: Schimbați AZURE_ENV_NAME
4. **Probleme de cotă/capacitate**: Verificați disponibilitatea regională
5. **Erori în șablon**: Validați șabloanele Bicep

### Î: Cum depanez eșecurile de implementare?
**R**: 
1. Utilizați `azd deploy --debug` pentru ieșire detaliată
2. Verificați istoricul implementărilor în portalul Azure
3. Revizuiți Jurnalul de Activitate în portalul Azure
4. Utilizați `azd show` pentru a afișa starea curentă a mediului

### Î: De ce nu funcționează variabilele mele de mediu?
**R**: Verificați:
1. Numele variabilelor corespund exact parametrilor șablonului
2. Valorile sunt corect citate dacă conțin spații
3. Mediul este selectat: `azd env select <environment>`
4. Variabilele sunt setate în mediul corect

### Î: Cum curăț implementările eșuate?
**R**: 
```bash
azd down --force --purge
```
Aceasta elimină toate resursele și configurația mediului.

### Î: De ce aplicația mea nu este accesibilă după implementare?
**R**: Verificați:
1. Implementarea s-a finalizat cu succes
2. Aplicația rulează (verificați jurnalele în portalul Azure)
3. Grupurile de securitate ale rețelei permit traficul
4. DNS/domeniile personalizate sunt configurate corect

---

## Costuri & Facturare

### Î: Cât vor costa implementările azd?
**R**: Costurile depind de:
- Serviciile Azure implementate
- Nivelurile/planurile de servicii selectate
- Diferențele de preț regionale
- Modelele de utilizare

Utilizați [Calculatorul de Prețuri Azure](https://azure.microsoft.com/pricing/calculator/) pentru estimări.

### Î: Cum controlez costurile în implementările azd?
**R**: 
1. Utilizați niveluri inferioare pentru mediile de dezvoltare
2. Configurați bugete și alerte Azure
3. Utilizați `azd down` pentru a elimina resursele când nu sunt necesare
4. Alegeți regiuni potrivite (costurile variază în funcție de locație)
5. Utilizați instrumentele de gestionare a costurilor Azure

### Î: Există opțiuni gratuite pentru șabloanele azd?
**R**: Multe servicii Azure oferă niveluri gratuite:
- App Service: Disponibil nivel gratuit
- Azure Functions: 1M execuții gratuite/lună
- Cosmos DB: Nivel gratuit cu 400 RU/s
- Application Insights: Primele 5GB/lună gratuite

Configurați șabloanele pentru a utiliza nivelurile gratuite acolo unde sunt disponibile.

### Î: Cum estimez costurile înainte de implementare?
**R**: 
1. Revizuiți `main.bicep` al șablonului pentru a vedea ce resurse sunt create
2. Utilizați Calculatorul de Prețuri Azure cu planuri specifice
3. Implementați mai întâi într-un mediu de dezvoltare pentru a monitoriza costurile reale
4. Utilizați Gestionarea Costurilor Azure pentru o analiză detaliată a costurilor

---

## Cele Mai Bune Practici

### Î: Care sunt cele mai bune practici pentru structura proiectelor azd?
**R**: 
1. Păstrați codul aplicației separat de infrastructură
2. Utilizați nume semnificative pentru servicii în `azure.yaml`
3. Implementați gestionarea corectă a erorilor în scripturile de construire
4. Utilizați configurații specifice mediului
5. Includeți documentație cuprinzătoare

### Î: Cum ar trebui să organizez mai multe servicii în azd?
**R**: Utilizați structura recomandată:
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
**R**: **Nu!** Folderul `.azure` conține informații sensibile. Adăugați-l în `.gitignore`:
```gitignore
.azure/
```

### Î: Cum gestionez secretele și configurațiile sensibile?
**R**: 
1. Utilizați Azure Key Vault pentru secrete
2. Referiți secretele Key Vault în configurația aplicației
3. Nu includeți niciodată secretele în controlul versiunilor
4. Utilizați identități gestionate pentru autentificarea serviciu-la-serviciu

### Î: Care este abordarea recomandată pentru CI/CD cu azd?
**R**: 
1. Utilizați medii separate pentru fiecare etapă (dev/staging/prod)
2. Implementați testarea automată înainte de implementare
3. Utilizați principalii de serviciu pentru autentificare
4. Stocați configurațiile sensibile în secrete/variabilele pipeline-ului
5. Implementați porți de aprobare pentru implementările în producție

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
1. Utilizați comenzile azd în scripturile pipeline-urilor existente
2. Standardizați șabloanele azd în echipe
3. Integrați cu monitorizarea și alertarea existente
4. Utilizați ieșirea JSON a azd pentru integrarea în pipeline-uri

### Î: Pot utiliza azd cu Azure DevOps?
**R**: Da, azd funcționează cu orice sistem CI/CD. Creați pipeline-uri Azure DevOps care utilizează comenzile azd.

### Î: Cum contribui la azd sau creez șabloane comunitare?
**R**: 
1. **Instrumentul azd**: Contribuiți la [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Șabloane**: Creați șabloane urmând [ghidurile pentru șabloane](https://github.com/Azure-Samples/awesome-azd)
3. **Documentație**: Contribuiți la documentație la [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Î: Care este foaia de parcurs pentru azd?
**R**: Consultați [foaia de parcurs oficială](https://github.com/Azure/azure-dev/projects) pentru funcționalități și îmbunătățiri planificate.

### Î: Cum migrez de la alte instrumente de implementare la azd?
**R**:
1. Analizează arhitectura actuală de implementare  
2. Creează șabloane Bicep echivalente  
3. Configurează `azure.yaml` pentru a corespunde serviciilor actuale  
4. Testează temeinic în mediul de dezvoltare  
5. Migrează treptat mediile  

---

## Mai ai întrebări?

### **Caută mai întâi**  
- Verifică [documentația oficială](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Caută în [problemele de pe GitHub](https://github.com/Azure/azure-dev/issues) pentru probleme similare  

### **Obține ajutor**  
- [Discuții pe GitHub](https://github.com/Azure/azure-dev/discussions) - Suport din partea comunității  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Întrebări tehnice  
- [Azure Discord](https://discord.gg/azure) - Chat comunitar în timp real  

### **Raportează probleme**  
- [Probleme pe GitHub](https://github.com/Azure/azure-dev/issues/new) - Raportări de erori și cereri de funcționalități  
- Include jurnale relevante, mesaje de eroare și pașii pentru a reproduce problema  

### **Află mai multe**  
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centrul de Arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Cadrul Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Această secțiune de întrebări frecvente este actualizată periodic. Ultima actualizare: 9 septembrie 2025*  

---

**Navigare**  
- **Lecția anterioară**: [Glosar](glossary.md)  
- **Lecția următoare**: [Ghid de studiu](study-guide.md)  

---

**Declinarea responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși depunem eforturi pentru a asigura acuratețea, vă rugăm să aveți în vedere că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.