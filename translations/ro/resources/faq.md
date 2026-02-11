# Întrebări frecvente (FAQ)

**Obține ajutor pe capitole**
- **📚 Pagina principală a cursului**: [AZD Pentru Începători](../README.md)
- **🚆 Probleme de instalare**: [Capitolul 1: Instalare și Configurare](../docs/getting-started/installation.md)
- **🤖 Întrebări AI**: [Capitolul 2: Dezvoltare AI-First](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Depanare**: [Capitolul 7: Depanare și Debugging](../docs/troubleshooting/common-issues.md)

## Introducere

Acest FAQ cuprinzător oferă răspunsuri la cele mai frecvente întrebări despre Azure Developer CLI (azd) și implementările Azure. Găsiți soluții rapide la probleme comune, înțelegeți bune practici și obțineți clarificări despre conceptele și fluxurile de lucru azd.

## Obiective de învățare

Revizuind acest FAQ, veți:
- Găsi răspunsuri rapide la întrebări și probleme frecvente legate de Azure Developer CLI
- Înțelege conceptele cheie și terminologia printr-un format practic de întrebări și răspunsuri
- Accesa soluții de depanare pentru probleme frecvente și scenarii de eroare
- Învața bune practici prin întrebări frecvent adresate despre optimizare
- Descoperi funcționalități și capabilități avansate prin întrebări la nivel de expert
- Consulta ghiduri despre costuri, securitate și strategii de implementare eficient

## Rezultate de învățare

Cu o referire regulată la acest FAQ, veți putea:
- Rezolva probleme comune cu Azure Developer CLI independent folosind soluțiile oferite
- Lua decizii informate despre strategiile și configurațiile de implementare
- Înțelege relația între azd și alte unelte și servicii Azure
- Aplica bune practici bazate pe experiența comunității și recomandările experților
- Depana probleme de autentificare, implementare și configurare eficient
- Optimiza costurile și performanța folosind informațiile și recomandările din FAQ

## Cuprins

- [Început](../../../resources)
- [Autentificare și Acces](../../../resources)
- [Șabloane și Proiecte](../../../resources)
- [Implementare și Infrastructură](../../../resources)
- [Configurare și Medii](../../../resources)
- [Depanare](../../../resources)
- [Costuri și Facturare](../../../resources)
- [Bune Practici](../../../resources)
- [Subiecte Avansate](../../../resources)

---

## Început

### Î: Ce este Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) este un instrument orientat către dezvoltatori, pe linia de comandă, care accelerează timpul necesar pentru a-ți aduce aplicația din mediul local de dezvoltare în Azure. Oferă bune practici prin șabloane și ajută pe tot parcursul ciclului de viață al implementării.

### Î: Cu ce se diferențiază azd față de Azure CLI?
**R**: 
- **Azure CLI**: Instrument cu scop general pentru gestionarea resurselor Azure
- **azd**: Instrument concentrat pe dezvoltator pentru fluxuri de lucru de implementare a aplicațiilor
- azd utilizează Azure CLI intern, dar oferă abstracții la nivel înalt pentru scenarii comune de dezvoltare
- azd include șabloane, managementul mediilor și automatizarea implementării

### Î: Am nevoie de Azure CLI instalat pentru a folosi azd?
**R**: Da, azd necesită Azure CLI pentru autentificare și anumite operațiuni. Instalează mai întâi Azure CLI, apoi azd.

### Î: Ce limbaje de programare suportă azd?
**R**: azd este independent de limbaj. Funcționează cu:
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
1. Folosi `azd init` pentru a adăuga configurația azd în proiectele existente
2. Adapta proiectele existente pentru a corespunde structurii șablonului azd
3. Crea șabloane personalizate bazate pe arhitectura ta existentă

---

## Autentificare și Acces

### Î: Cum mă autentific în Azure folosind azd?
**R**: Folosește `azd auth login` care va deschide o fereastră de browser pentru autentificarea Azure. Pentru scenarii CI/CD, folosește service principals sau identități gestionate.

### Î: Pot folosi azd cu mai multe abonamente Azure?
**R**: Da. Folosește `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` pentru a specifica abonamentul folosit pentru fiecare mediu.

### Î: Ce permisiuni sunt necesare pentru a implementa cu azd?
**R**: De obicei ai nevoie de:
- Rolul **Contributor** pe grupul de resurse sau abonament
- **User Access Administrator** dacă implementezi resurse ce necesită atribuiri de roluri
- Permisiunile specifice variază în funcție de șablon și resursele folosite

### Î: Pot folosi azd în pipeline-uri CI/CD?
**R**: Absolut! azd este proiectat pentru integrare CI/CD. Folosește service principals pentru autentificare și setează variabile de mediu pentru configurare.

### Î: Cum gestionez autentificarea în GitHub Actions?
**R**: Folosește Azure Login action cu acreditările service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Șabloane și Proiecte

### Î: Unde găsesc șabloanele azd?
**R**: 
- Șabloane oficiale: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Șabloane comunitare: caută pe GitHub "azd-template"
- Folosește `azd template list` pentru a răsfoi șabloanele disponibile

### Î: Cum creez un șablon personalizat?
**R**: 
1. Pornește de la o structură de șablon existentă
2. Modifică `azure.yaml`, fișierele de infrastructură și codul aplicației
3. Testează temeinic cu `azd up`
4. Publică pe GitHub cu etichete potrivite

### Î: Pot folosi azd fără un șablon?
**R**: Da, folosește `azd init` într-un proiect existent pentru a crea fișierele de configurare necesare. Va trebui să configurezi manual `azure.yaml` și fișierele de infrastructură.

### Î: Care este diferența dintre șabloanele oficiale și cele comunitare?
**R**: 
- **Șabloane oficiale**: întreținute de Microsoft, actualizate regulat, documentație cuprinzătoare
- **Șabloane comunitare**: create de dezvoltatori, pot avea cazuri de utilizare specializate, calitate și întreținere variabile

### Î: Cum actualizez un șablon în proiectul meu?
**R**: Șabloanele nu se actualizează automat. Poți:
1. Compara și integra manual modificările din sursa șablonului
2. Porni din nou cu `azd init` folosind șablonul actualizat
3. Selecta îmbunătățiri specifice din șabloane actualizate

---

## Implementare și Infrastructură

### Î: Ce servicii Azure poate implementa azd?
**R**: azd poate implementa orice serviciu Azure prin șabloane Bicep/ARM, inclusiv:
- App Services, Container Apps, Functions
- Baze de date (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Resurse de rețea, securitate și monitorizare

### Î: Pot implementa în mai multe regiuni?
**R**: Da, configurează mai multe regiuni în șabloanele Bicep și setează parametrul de locație corespunzător fiecărui mediu.

### Î: Cum gestionez migrațiile schemelor bazei de date?
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

### Î: Cum implementez la resurse Azure existente?
**R**: Este complex și nu este suportat direct. Poți:
1. Importa resurse existente în șabloanele Bicep
2. Folosi referințe la resurse existente în șabloane
3. Modifica șabloanele pentru a crea condiționat sau a referi resurse

### Î: Pot folosi Terraform în loc de Bicep?
**R**: În prezent, azd suportă în principal șabloane Bicep/ARM. Suportul Terraform nu este disponibil oficial, deși pot exista soluții comunitare.

---

## Configurare și Medii

### Î: Cum gestionez medii diferite (dev, staging, prod)?
**R**: Creează medii separate cu `azd env new <nume-mediu>` și configurează setări diferite pentru fiecare:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Î: Unde sunt stocate configurațiile mediilor?
**R**: În folderul `.azure` din directorul proiectului. Fiecare mediu are propriul folder cu fișiere de configurare.

### Î: Cum setez configurații specifice mediului?
**R**: Folosește `azd env set` pentru a configura variabile de mediu:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Î: Pot partaja configurațiile mediilor între membrii echipei?
**R**: Folderul `.azure` conține informații sensibile și nu trebuie comis în controlul versiunilor. În schimb:
1. Documentează variabilele de mediu necesare
2. Folosește scripturi de implementare pentru configurarea mediilor
3. Folosește Azure Key Vault pentru configurația sensibilă

### Î: Cum suprascriu valorile implicite ale șabloanelor?
**R**: Setează variabile de mediu corelate parametrilor din șablon:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Depanare

### Î: De ce eșuează `azd up`?
**R**: Cauze comune:
1. **Probleme de autentificare**: Rulează `azd auth login`
2. **Permisiuni insuficiente**: Verifică atribuirea rolurilor Azure
3. **Conflicte de nume pentru resurse**: Schimbă AZURE_ENV_NAME
4. **Probleme de cotă/capacitate**: Verifică disponibilitatea regională
5. **Erori în șabloane**: Validează șabloanele Bicep

### Î: Cum depanez eșecurile de implementare?
**R**: 
1. Folosește `azd deploy --debug` pentru ieșire detaliată
2. Verifică istoricul implementărilor în portalul Azure
3. Revizuiește Activity Log în portalul Azure
4. Folosește `azd show` pentru a afișa starea curentă a mediului

### Î: De ce nu funcționează variabilele mele de mediu?
**R**: Verifică:
1. Numele variabilelor să corespundă exact parametrilor din șablon
2. Valorile sunt corect ghilimate dacă conțin spații
3. Mediul selectat corect: `azd env select <mediu>`
4. Variabilele sunt setate în mediul potrivit

### Î: Cum curăț implementările eșuate?
**R**: 
```bash
azd down --force --purge
```
Aceasta șterge toate resursele și configurația mediului.

### Î: De ce aplicația nu este accesibilă după implementare?
**R**: Verifică:
1. Implementarea s-a finalizat cu succes
2. Aplicația este pornită (verifică logurile în portalul Azure)
3. Grupurile de securitate de rețea permit traficul
4. DNS/domeniile personalizate sunt configurate corect

---

## Costuri și Facturare

### Î: Cât costă implementările azd?
**R**: Costurile depind de:
- Serviciile Azure implementate
- Nivelul/SKU-urile selectate
- Diferențele de preț pe regiuni
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
**R**: Multe servicii Azure oferă niveluri gratuite:
- App Service: disponibil nivel gratuit
- Azure Functions: 1 milion execuții gratuite/lună
- Cosmos DB: nivel gratuit cu 400 RU/s
- Application Insights: primii 5GB/lună gratuit

Configurează șabloanele să folosească aceste niveluri gratuite unde sunt disponibile.

### Î: Cum estimez costurile înainte de implementare?
**R**: 
1. Revizuiește `main.bicep` al șablonului pentru resursele create
2. Folosește Azure Pricing Calculator cu SKU-urile specifice
3. Implementează mai întâi într-un mediu de dezvoltare pentru a monitoriza costurile reale
4. Folosește Azure Cost Management pentru o analiză detaliată a costurilor

---

## Bune Practici

### Î: Care sunt bunele practici pentru structura proiectului azd?
**R**: 
1. Menține codul aplicației separat de infrastructură
2. Folosește nume semnificative pentru servicii în `azure.yaml`
3. Implementează management corect al erorilor în scripturile de build
4. Folosește configurare specifică mediului
5. Include documentație cuprinzătoare

### Î: Cum organizez mai multe servicii în azd?
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
**R**: **Nu!** Folderul `.azure` conține informații sensibile. Adaugă-l în `.gitignore`:
```gitignore
.azure/
```

### Î: Cum gestionez secretele și configurația sensibilă?
**R**: 
1. Folosește Azure Key Vault pentru secrete
2. Referințează secretele Key Vault în configurația aplicației
3. Nu comite niciodată secretele în controlul versiunilor
4. Folosește identități gestionate pentru autentificarea serviciu la serviciu

### Î: Care este abordarea recomandată pentru CI/CD cu azd?
**R**: 
1. Folosește medii separate pentru fiecare etapă (dev/staging/prod)
2. Implementează testare automată înainte de implementare
3. Folosește service principals pentru autentificare
4. Stochează configurația sensibilă în secrete/variabile de pipeline
5. Implementează aprobări pentru implementările în producție

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

### Î: Cum integrez azd în procese DevOps existente?
**R**: 
1. Folosește comenzile azd în scripturile pipeline existente
2. Standardizează pe șabloane azd în echipe
3. Integrează cu sistemele de monitorizare și alertare existente
4. Folosește ieșirea JSON a azd pentru integrarea cu pipeline-uri

### Î: Pot folosi azd cu Azure DevOps?
**R**: Da, azd funcționează cu orice sistem CI/CD. Creează pipeline-uri Azure DevOps care folosesc comenzile azd.

### Î: Cum contribui la azd sau creez șabloane comunitare?
**R**: 
1. **azd tool**: Contribuie la [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Creează șabloane urmând [ghidul pentru șabloane](https://github.com/Azure-Samples/awesome-azd)
3. **Documentație**: Contribuie la documentație în [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Î: Care este planul de dezvoltare pentru azd?
**R**: Verifică [planul oficial de dezvoltare](https://github.com/Azure/azure-dev/projects) pentru funcționalități și îmbunătățiri planificate.

### Î: Cum migrez de la alte unelte de implementare la azd?
**R**: 
1. Analizează arhitectura curentă de implementare
2. Creează șabloane Bicep echivalente
3. Configurează `azure.yaml` pentru a corespunde serviciilor existente
4. Testează temeinic în mediul de dezvoltare
5. Migrează treptat mediile

---

## Ai încă întrebări?

### **Caută mai întâi**
- Consultă [documentația oficială](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Caută în [problemele GitHub](https://github.com/Azure/azure-dev/issues) pentru probleme similare

### **Caută ajutor**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Suport comunitar
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Întrebări tehnice
- [Azure Discord](https://discord.gg/azure) - Chat comunitar în timp real

### **Raportează probleme**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Raportări de erori și cereri de funcționalități
- Include jurnale relevante, mesaje de eroare și pași pentru reproducere

### **Află mai multe**
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Acest FAQ este actualizat regulat. Ultima actualizare: 9 septembrie 2025*

---

**Navigare**
- **Lecția anterioară**: [Glosar](glossary.md)
- **Lecția următoare**: [Ghid de studiu](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să aveți în vedere că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa de origine trebuie considerat sursa autoritativă. Pentru informații critice, se recomandă traducerea profesionistă realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru orice neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->