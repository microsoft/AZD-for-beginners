# Ghid de Studiu - Obiective de Învățare Cuprinzătoare

**Navigare în Parcursul de Învățare**
- **📚 Acasă Curs**: [AZD Pentru Începători](../README.md)
- **📖 Începe Învățarea**: [Capitolul 1: Fundamente & Start Rapid](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Urmărirea Progresului**: [Finalizarea Cursului](../README.md#-course-completion--certification)

## Introducere

Acest ghid de studiu cuprinzător oferă obiective de învățare structurate, concepte cheie, exerciții practice și materiale de evaluare pentru a te ajuta să stăpânești Azure Developer CLI (azd). Folosește acest ghid pentru a-ți urmări progresul și pentru a te asigura că ai acoperit toate subiectele esențiale.

## Obiective de Învățare

Prin completarea acestui ghid de studiu, vei:
- Stăpâni toate conceptele fundamentale și avansate ale Azure Developer CLI
- Dezvolta abilități practice în implementarea și gestionarea aplicațiilor Azure
- Câștiga încredere în depanarea și optimizarea implementărilor
- Înțelege practicile de implementare pregătite pentru producție și considerațiile de securitate

## Rezultate ale Învățării

După finalizarea tuturor secțiunilor acestui ghid de studiu, vei putea:
- Proiecta, implementa și gestiona arhitecturi complete de aplicații folosind azd
- Implementa strategii cuprinzătoare de monitorizare, securitate și optimizare a costurilor
- Depana independent probleme complexe de implementare
- Crea șabloane personalizate și contribui la comunitatea azd

## Structura de Învățare în 8 Capitole

### Capitolul 1: Fundamente & Start Rapid (Săptămâna 1)
**Durată**: 30-45 minute | **Complexitate**: ⭐

#### Obiective de Învățare
- Înțelege conceptele de bază și terminologia Azure Developer CLI
- Instalează și configurează cu succes AZD pe platforma ta de dezvoltare
- Implementează prima ta aplicație folosind un șablon existent
- Navighează eficient interfața de linie de comandă AZD

#### Concepte Cheie de Stăpânit
- Structura și componentele proiectului AZD (azure.yaml, infra/, src/)
- Fluxuri de lucru bazate pe șabloane de implementare
- Bazele configurării mediului
- Gestionarea grupurilor de resurse și a abonamentelor

#### Exerciții Practice
1. **Verificarea Instalării**: Instalează AZD și verifică cu `azd version`
2. **Prima Implementare**: Implementează cu succes șablonul todo-nodejs-mongo
3. **Configurarea Mediului**: Configurează primele variabile de mediu
4. **Explorarea Resurselor**: Navighează resursele implementate în Azure Portal

#### Întrebări de Evaluare
- Care sunt componentele de bază ale unui proiect AZD?
- Cum inițializezi un proiect nou dintr-un șablon?
- Care este diferența dintre `azd up` și `azd deploy`?
- Cum gestionezi mai multe medii cu AZD?

---

### Capitolul 2: Dezvoltare AI-First (Săptămâna 2)
**Durată**: 1-2 ore | **Complexitate**: ⭐⭐

#### Obiective de Învățare
- Integrează serviciile Microsoft Foundry cu fluxurile de lucru AZD
- Implementează și configurează aplicații bazate pe AI
- Înțelege modelele de implementare RAG (Retrieval-Augmented Generation)
- Gestionează implementările și scalarea modelelor AI

#### Concepte Cheie de Stăpânit
- Integrarea serviciului Azure OpenAI și gestionarea API-urilor
- Configurarea căutării AI și indexarea vectorială
- Strategii de implementare a modelelor și planificarea capacității
- Monitorizarea aplicațiilor AI și optimizarea performanței

#### Exerciții Practice
1. **Implementarea Chat AI**: Implementează șablonul azure-search-openai-demo
2. **Implementarea RAG**: Configurează indexarea și recuperarea documentelor
3. **Configurarea Modelului**: Configurează mai multe modele AI cu scopuri diferite
4. **Monitorizarea AI**: Implementează Application Insights pentru sarcinile AI

#### Întrebări de Evaluare
- Cum configurezi serviciile Azure OpenAI într-un șablon AZD?
- Care sunt componentele cheie ale unei arhitecturi RAG?
- Cum gestionezi capacitatea și scalarea modelelor AI?
- Ce metrici de monitorizare sunt importante pentru aplicațiile AI?

---

### Capitolul 3: Configurare & Autentificare (Săptămâna 3)
**Durată**: 45-60 minute | **Complexitate**: ⭐⭐

#### Obiective de Învățare
- Stăpânește strategiile de configurare și gestionare a mediului
- Implementează modele de autentificare securizate și identitate gestionată
- Organizează resursele cu convenții de denumire adecvate
- Configurează implementări multi-mediu (dev, staging, prod)

#### Concepte Cheie de Stăpânit
- Ierarhia mediului și precedența configurației
- Autentificarea prin identitate gestionată și principal de serviciu
- Integrarea Key Vault pentru gestionarea secretelor
- Gestionarea parametrilor specifici mediului

#### Exerciții Practice
1. **Configurare Multi-Mediu**: Configurează medii dev, staging și prod
2. **Configurare Securitate**: Implementează autentificarea prin identitate gestionată
3. **Gestionarea Secretelor**: Integrează Azure Key Vault pentru date sensibile
4. **Gestionarea Parametrilor**: Creează configurații specifice mediului

#### Întrebări de Evaluare
- Cum configurezi medii diferite cu AZD?
- Care sunt beneficiile utilizării identității gestionate în locul principalilor de serviciu?
- Cum gestionezi în siguranță secretele aplicației?
- Care este ierarhia configurației în AZD?

---

### Capitolul 4: Infrastructură ca Cod & Implementare (Săptămâna 4-5)
**Durată**: 1-1.5 ore | **Complexitate**: ⭐⭐⭐

#### Obiective de Învățare
- Creează și personalizează șabloane de infrastructură Bicep
- Implementează modele și fluxuri de lucru avansate de implementare
- Înțelege strategiile de aprovizionare a resurselor
- Proiectează arhitecturi scalabile multi-serviciu

- Implementează aplicații containerizate folosind Azure Container Apps și AZD

#### Concepte Cheie de Stăpânit
- Structura șablonului Bicep și cele mai bune practici
- Dependențele resurselor și ordonarea implementării
- Fișiere de parametri și modularitatea șablonului
- Hook-uri personalizate și automatizarea implementării
- Modele de implementare a aplicațiilor containerizate (start rapid, producție, microservicii)

#### Exerciții Practice
1. **Crearea Șablonului Personalizat**: Construiește un șablon de aplicație multi-serviciu
2. **Stăpânirea Bicep**: Creează componente de infrastructură modulare, reutilizabile
3. **Automatizarea Implementării**: Implementează hook-uri pre/post implementare
4. **Proiectarea Arhitecturii**: Implementează o arhitectură complexă de microservicii
5. **Implementarea Aplicațiilor Containerizate**: Implementează exemplele [Simple Flask API](../../../examples/container-app/simple-flask-api) și [Microservices Architecture](../../../examples/container-app/microservices) folosind AZD

#### Întrebări de Evaluare
- Cum creezi șabloane Bicep personalizate pentru AZD?
- Care sunt cele mai bune practici pentru organizarea codului de infrastructură?
- Cum gestionezi dependențele resurselor în șabloane?
- Ce modele de implementare susțin actualizările fără întreruperi?

---

### Capitolul 5: Soluții AI Multi-Agent (Săptămâna 6-7)
**Durată**: 2-3 ore | **Complexitate**: ⭐⭐⭐⭐

#### Obiective de Învățare
- Proiectează și implementează arhitecturi AI multi-agent
- Orchestrază coordonarea și comunicarea agenților
- Implementează soluții AI pregătite pentru producție cu monitorizare
- Înțelege specializarea agenților și modelele de flux de lucru
- Integrează microservicii containerizate ca parte a soluțiilor multi-agent

#### Concepte Cheie de Stăpânit
- Modele de arhitectură multi-agent și principii de proiectare
- Protocoale de comunicare între agenți și fluxul de date
- Strategii de echilibrare a încărcării și scalare pentru agenții AI
- Monitorizarea producției pentru sistemele multi-agent
- Comunicare între servicii în medii containerizate

#### Exerciții Practice
1. **Implementarea Soluției Retail**: Implementează scenariul complet multi-agent pentru retail
2. **Personalizarea Agenților**: Modifică comportamentele agenților Customer și Inventory
3. **Scalarea Arhitecturii**: Implementează echilibrarea încărcării și auto-scalarea
4. **Monitorizarea Producției**: Configurează monitorizare și alertare cuprinzătoare
5. **Integrarea Microserviciilor**: Extinde exemplul [Microservices Architecture](../../../examples/container-app/microservices) pentru a susține fluxurile de lucru bazate pe agenți

#### Întrebări de Evaluare
- Cum proiectezi modele eficiente de comunicare între agenți?
- Care sunt considerațiile cheie pentru scalarea sarcinilor agenților AI?
- Cum monitorizezi și depanezi sistemele AI multi-agent?
- Ce modele de producție asigură fiabilitatea agenților AI?

---

### Capitolul 6: Validare & Planificare Pre-Implementare (Săptămâna 8)
**Durată**: 1 oră | **Complexitate**: ⭐⭐

#### Obiective de Învățare
- Realizează planificarea capacității și validarea resurselor
- Selectează cele mai bune SKU-uri Azure pentru eficiență costurilor
- Implementează verificări automate pre-flight și validare
- Planifică implementările cu strategii de optimizare a costurilor

#### Concepte Cheie de Stăpânit
- Cote de resurse Azure și limitări de capacitate
- Criterii de selecție SKU și optimizare a costurilor
- Scripturi automate de validare și testare
- Planificarea implementării și evaluarea riscurilor

#### Exerciții Practice
1. **Analiza Capacității**: Analizează cerințele de resurse pentru aplicațiile tale
2. **Optimizarea SKU**: Compară și selectează niveluri de servicii eficiente din punct de vedere al costurilor
3. **Automatizarea Validării**: Implementează scripturi de verificare pre-implementare
4. **Planificarea Costurilor**: Creează estimări de costuri și bugete pentru implementare

#### Întrebări de Evaluare
- Cum validezi capacitatea Azure înainte de implementare?
- Ce factori influențează deciziile de selecție SKU?
- Cum automatizezi validarea pre-implementare?
- Ce strategii ajută la optimizarea costurilor de implementare?

---

### Capitolul 7: Depanare & Debugging (Săptămâna 9)
**Durată**: 1-1.5 ore | **Complexitate**: ⭐⭐

#### Obiective de Învățare
- Dezvoltă abordări sistematice de debugging pentru implementările AZD
- Rezolvă probleme comune de implementare și configurare
- Depanează probleme specifice AI și probleme de performanță
- Implementează monitorizare și alertare pentru detectarea proactivă a problemelor

#### Concepte Cheie de Stăpânit
- Tehnici de diagnosticare și strategii de logare
- Modele comune de eșec și soluțiile lor
- Monitorizarea performanței și optimizarea
- Proceduri de răspuns la incidente și recuperare

#### Exerciții Practice
1. **Abilități de Diagnosticare**: Exersează cu implementări intenționat defecte
2. **Analiza Logurilor**: Folosește Azure Monitor și Application Insights eficient
3. **Optimizarea Performanței**: Optimizează aplicațiile cu performanță redusă
4. **Proceduri de Recuperare**: Implementează backup și recuperare în caz de dezastru

#### Întrebări de Evaluare
- Care sunt cele mai comune eșecuri de implementare AZD?
- Cum depanezi problemele de autentificare și permisiuni?
- Ce strategii de monitorizare ajută la prevenirea problemelor în producție?
- Cum optimizezi performanța aplicațiilor în Azure?

---

### Capitolul 8: Modele de Producție & Enterprise (Săptămâna 10-11)
**Durată**: 2-3 ore | **Complexitate**: ⭐⭐⭐⭐

#### Obiective de Învățare
- Implementează strategii de implementare la nivel enterprise
- Proiectează modele de securitate și cadre de conformitate
- Stabilește monitorizare, guvernanță și gestionarea costurilor
- Creează pipeline-uri CI/CD scalabile cu integrarea AZD
- Aplică cele mai bune practici pentru implementările de aplicații containerizate în producție (securitate, monitorizare, costuri, CI/CD)

#### Concepte Cheie de Stăpânit
- Cerințe de securitate și conformitate la nivel enterprise
- Cadre de guvernanță și implementarea politicilor
- Monitorizare avansată și gestionarea costurilor
- Integrarea CI/CD și pipeline-uri de implementare automate
- Strategii de implementare blue-green și canary pentru sarcini containerizate

#### Exerciții Practice
1. **Securitate Enterprise**: Implementează modele de securitate cuprinzătoare
2. **Cadru de Guvernanță**: Configurează Azure Policy și gestionarea resurselor
3. **Monitorizare Avansată**: Creează dashboard-uri și alertare automată
4. **Integrare CI/CD**: Construiește pipeline-uri de implementare automate
5. **Aplicații Containerizate în Producție**: Aplică securitate, monitorizare și optimizare a costurilor la exemplul [Microservices Architecture](../../../examples/container-app/microservices)

#### Întrebări de Evaluare
- Cum implementezi securitatea enterprise în implementările AZD?
- Ce modele de guvernanță asigură conformitatea și controlul costurilor?
- Cum proiectezi monitorizarea scalabilă pentru sistemele de producție?
- Ce modele CI/CD funcționează cel mai bine cu fluxurile de lucru AZD?

#### Obiective de Învățare
- Înțelege fundamentele și conceptele de bază ale Azure Developer CLI
- Instalează și configurează cu succes azd în mediul tău de dezvoltare
- Finalizează prima ta implementare folosind un șablon existent
- Navighează structura proiectului azd și înțelege componentele cheie

#### Concepte Cheie de Stăpânit
- Șabloane, medii și servicii
- Structura de configurare azure.yaml
- Comenzi de bază azd (init, up, down, deploy)
- Principiile Infrastructurii ca Cod
- Autentificarea și autorizarea Azure

#### Exerciții Practice

**Exercițiul 1.1: Instalare și Configurare**
```bash
# Finalizați aceste sarcini:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercițiul 1.2: Prima Implementare**
```bash
# Implementați o aplicație web simplă:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Exercițiul 1.3: Analiza Structurii Proiectului**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Întrebări de Autoevaluare
1. Care sunt cele trei concepte de bază ale arhitecturii azd?
2. Care este scopul fișierului azure.yaml?
3. Cum ajută mediile la gestionarea diferitelor ținte de implementare?
4. Ce metode de autentificare pot fi utilizate cu azd?
5. Ce se întâmplă când rulezi `azd up` pentru prima dată?

---

## Urmărirea Progresului și Cadrul de Evaluare
```bash
# Creați și configurați mai multe medii:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Exercițiul 2.2: Configurare Avansată**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Exercițiul 2.3: Configurare Securitate**
```bash
# Implementați cele mai bune practici de securitate:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Întrebări de Autoevaluare
1. Cum gestionează azd precedența variabilelor de mediu?
2. Ce sunt hook-urile de implementare și când ar trebui să le folosești?
3. Cum configurezi diferite SKU-uri pentru medii diferite?
4. Care sunt implicațiile de securitate ale diferitelor metode de autentificare?
5. Cum gestionezi secretele și datele sensibile de configurare?

### Modulul 3: Implementare și Aprovizionare (Săptăm
5. Care sunt considerațiile pentru implementările în mai multe regiuni?

### Modulul 4: Validarea înainte de implementare (Săptămâna 5)

#### Obiective de învățare
- Implementarea verificărilor complete înainte de implementare
- Stăpânirea planificării capacității și validarea resurselor
- Înțelegerea selecției SKU și optimizarea costurilor
- Construirea de fluxuri de validare automatizate

#### Concepte cheie de stăpânit
- Cotele și limitele resurselor Azure
- Criterii de selecție SKU și implicațiile costurilor
- Scripturi și instrumente de validare automatizată
- Metodologii de planificare a capacității
- Testarea performanței și optimizarea

#### Exerciții practice

**Exercițiul 4.1: Planificarea capacității**  
```bash
# Implementa validarea capacității:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Exercițiul 4.2: Validare preliminară**  
```powershell
# Construiește un flux de validare cuprinzător:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**Exercițiul 4.3: Optimizarea SKU**  
```bash
# Optimizarea configurațiilor serviciului:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  

#### Întrebări de autoevaluare
1. Ce factori ar trebui să influențeze deciziile de selecție SKU?
2. Cum validați disponibilitatea resurselor Azure înainte de implementare?
3. Care sunt componentele cheie ale unui sistem de verificare preliminară?
4. Cum estimați și controlați costurile de implementare?
5. Ce monitorizare este esențială pentru planificarea capacității?

### Modulul 5: Depanare și diagnosticare (Săptămâna 6)

#### Obiective de învățare
- Stăpânirea metodologiilor sistematice de depanare
- Dezvoltarea expertizei în diagnosticarea problemelor complexe de implementare
- Implementarea monitorizării și alertării complete
- Construirea procedurilor de răspuns și recuperare în caz de incidente

#### Concepte cheie de stăpânit
- Modele comune de eșec în implementare
- Tehnici de analiză și corelare a jurnalelor
- Monitorizarea performanței și optimizarea
- Detectarea incidentelor de securitate și răspunsul
- Recuperarea în caz de dezastru și continuitatea afacerii

#### Exerciții practice

**Exercițiul 5.1: Scenarii de depanare**  
```bash
# Exersează rezolvarea problemelor comune:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Exercițiul 5.2: Implementarea monitorizării**  
```bash
# Configurați monitorizarea cuprinzătoare:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Exercițiul 5.3: Răspuns la incidente**  
```bash
# Construiește proceduri de răspuns la incidente:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### Întrebări de autoevaluare
1. Care este abordarea sistematică pentru depanarea implementărilor azd?
2. Cum corelați jurnalele între mai multe servicii și resurse?
3. Ce metrici de monitorizare sunt cele mai critice pentru detectarea timpurie a problemelor?
4. Cum implementați proceduri eficiente de recuperare în caz de dezastru?
5. Care sunt componentele cheie ale unui plan de răspuns la incidente?

### Modulul 6: Subiecte avansate și bune practici (Săptămânile 7-8)

#### Obiective de învățare
- Implementarea modelelor de implementare la nivel de întreprindere
- Stăpânirea integrării și automatizării CI/CD
- Dezvoltarea de șabloane personalizate și contribuția la comunitate
- Înțelegerea cerințelor avansate de securitate și conformitate

#### Concepte cheie de stăpânit
- Modele de integrare a fluxurilor CI/CD
- Dezvoltarea și distribuirea șabloanelor personalizate
- Guvernanța și conformitatea la nivel de întreprindere
- Configurații avansate de rețea și securitate
- Optimizarea performanței și gestionarea costurilor

#### Exerciții practice

**Exercițiul 6.1: Integrarea CI/CD**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```
  
**Exercițiul 6.2: Dezvoltarea șabloanelor personalizate**  
```bash
# Creați și publicați șabloane personalizate:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Exercițiul 6.3: Implementare la nivel de întreprindere**  
```bash
# Implementați funcții de nivel enterprise:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### Întrebări de autoevaluare
1. Cum integrați azd în fluxurile CI/CD existente?
2. Care sunt considerațiile cheie pentru dezvoltarea șabloanelor personalizate?
3. Cum implementați guvernanța și conformitatea în implementările azd?
4. Care sunt cele mai bune practici pentru implementările la scară de întreprindere?
5. Cum contribuiți eficient la comunitatea azd?

## Proiecte practice

### Proiectul 1: Website de portofoliu personal  
**Complexitate**: Începător  
**Durată**: 1-2 săptămâni  

Construiți și implementați un website de portofoliu personal utilizând:
- Găzduire website static pe Azure Storage
- Configurare domeniu personalizat
- Integrare CDN pentru performanță globală
- Flux de implementare automatizat

**Rezultate livrabile**:
- Website funcțional implementat pe Azure
- Șablon azd personalizat pentru implementări de portofoliu
- Documentație a procesului de implementare
- Recomandări pentru analiza și optimizarea costurilor

### Proiectul 2: Aplicație de gestionare a sarcinilor  
**Complexitate**: Intermediar  
**Durată**: 2-3 săptămâni  

Creați o aplicație completă de gestionare a sarcinilor cu:
- Frontend React implementat pe App Service
- Backend API Node.js cu autentificare
- Bază de date PostgreSQL cu migrații
- Monitorizare cu Application Insights

**Rezultate livrabile**:
- Aplicație completă cu autentificare utilizator
- Schemă de bază de date și scripturi de migrare
- Dashboard-uri de monitorizare și reguli de alertare
- Configurație de implementare pentru mai multe medii

### Proiectul 3: Platformă de e-commerce bazată pe microservicii  
**Complexitate**: Avansat  
**Durată**: 4-6 săptămâni  

Proiectați și implementați o platformă de e-commerce bazată pe microservicii:
- Mai multe servicii API (catalog, comenzi, plăți, utilizatori)
- Integrare cu coadă de mesaje folosind Service Bus
- Cache Redis pentru optimizarea performanței
- Jurnalizare și monitorizare cuprinzătoare

**Exemplu de referință**: Consultați [Arhitectura Microservicii](../../../examples/container-app/microservices) pentru un șablon gata de producție și ghid de implementare  

**Rezultate livrabile**:
- Arhitectură completă bazată pe microservicii
- Modele de comunicare între servicii
- Testare și optimizare a performanței
- Implementare de securitate gata de producție

## Evaluare și certificare

### Verificări ale cunoștințelor

Finalizați aceste evaluări după fiecare modul:

**Evaluare Modul 1**: Concepte de bază și instalare  
- Întrebări cu răspunsuri multiple despre concepte de bază  
- Sarcini practice de instalare și configurare  
- Exercițiu simplu de implementare  

**Evaluare Modul 2**: Configurare și medii  
- Scenarii de gestionare a mediilor  
- Exerciții de depanare a configurației  
- Implementarea configurației de securitate  

**Evaluare Modul 3**: Implementare și aprovizionare  
- Provocări de proiectare a infrastructurii  
- Scenarii de implementare multi-servicii  
- Exerciții de optimizare a performanței  

**Evaluare Modul 4**: Validare înainte de implementare  
- Studii de caz pentru planificarea capacității  
- Scenarii de optimizare a costurilor  
- Implementarea fluxurilor de validare  

**Evaluare Modul 5**: Depanare și diagnosticare  
- Exerciții de diagnosticare a problemelor  
- Sarcini de implementare a monitorizării  
- Simulări de răspuns la incidente  

**Evaluare Modul 6**: Subiecte avansate  
- Proiectarea fluxurilor CI/CD  
- Dezvoltarea șabloanelor personalizate  
- Scenarii de arhitectură la nivel de întreprindere  

### Proiect final

Proiectați și implementați o soluție completă care demonstrează stăpânirea tuturor conceptelor:

**Cerințe**:
- Arhitectură de aplicație pe mai multe niveluri  
- Mai multe medii de implementare  
- Monitorizare și alertare complete  
- Implementare de securitate și conformitate  
- Optimizare a costurilor și performanței  
- Documentație completă și ghiduri de utilizare  

**Criterii de evaluare**:
- Calitatea implementării tehnice  
- Completitudinea documentației  
- Respectarea securității și a bunelor practici  
- Optimizarea performanței și a costurilor  
- Eficiența în depanare și monitorizare  

## Resurse de studiu și referințe

### Documentație oficială
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Documentația Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centrul de Arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Resurse comunitare
- [Galeria de șabloane AZD](https://azure.github.io/awesome-azd/)  
- [Organizația GitHub Azure-Samples](https://github.com/Azure-Samples)  
- [Repository-ul GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)  

### Medii de practică
- [Cont gratuit Azure](https://azure.microsoft.com/free/)  
- [Nivel gratuit Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Instrumente suplimentare
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Pachet de extensii Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Recomandări pentru programul de studiu

### Studiu cu normă întreagă (8 săptămâni)
- **Săptămânile 1-2**: Modulele 1-2 (Introducere, Configurare)  
- **Săptămânile 3-4**: Modulele 3-4 (Implementare, Validare înainte de implementare)  
- **Săptămânile 5-6**: Modulele 5-6 (Depanare, Subiecte avansate)  
- **Săptămânile 7-8**: Proiecte practice și evaluare finală  

### Studiu cu jumătate de normă (16 săptămâni)
- **Săptămânile 1-4**: Modulul 1 (Introducere)  
- **Săptămânile 5-7**: Modulul 2 (Configurare și medii)  
- **Săptămânile 8-10**: Modulul 3 (Implementare și aprovizionare)  
- **Săptămânile 11-12**: Modulul 4 (Validare înainte de implementare)  
- **Săptămânile 13-14**: Modulul 5 (Depanare și diagnosticare)  
- **Săptămânile 15-16**: Modulul 6 (Subiecte avansate și evaluare)  

---

## Urmărirea progresului și cadrul de evaluare

### Lista de verificare pentru finalizarea capitolelor

Urmăriți progresul prin fiecare capitol cu aceste rezultate măsurabile:

#### 📚 Capitolul 1: Bază și început rapid
- [ ] **Instalare completă**: AZD instalat și verificat pe platforma dvs.  
- [ ] **Prima implementare**: Șablonul todo-nodejs-mongo implementat cu succes  
- [ ] **Configurare mediu**: Configurarea primelor variabile de mediu  
- [ ] **Navigare resurse**: Explorarea resurselor implementate în Azure Portal  
- [ ] **Stăpânirea comenzilor**: Familiarizare cu comenzile de bază AZD  

#### 🤖 Capitolul 2: Dezvoltare AI-First  
- [ ] **Implementare șablon AI**: Șablonul azure-search-openai-demo implementat cu succes  
- [ ] **Implementare RAG**: Configurarea indexării și regăsirii documentelor  
- [ ] **Configurare model**: Configurarea mai multor modele AI cu scopuri diferite  
- [ ] **Monitorizare AI**: Implementarea Application Insights pentru sarcinile AI  
- [ ] **Optimizare performanță**: Optimizarea performanței aplicației AI  

#### ⚙️ Capitolul 3: Configurare și autentificare  
- [ ] **Configurare multi-mediu**: Configurarea mediilor dev, staging și prod  
- [ ] **Implementare securitate**: Configurarea autentificării cu identitate gestionată  
- [ ] **Gestionare secrete**: Integrarea Azure Key Vault pentru date sensibile  
- [ ] **Gestionare parametri**: Crearea configurațiilor specifice mediului  
- [ ] **Stăpânirea autentificării**: Implementarea modelelor de acces securizat  

#### 🏗️ Capitolul 4: Infrastructură ca cod și implementare  
- [ ] **Creare șablon personalizat**: Construirea unui șablon de aplicație multi-servicii  
- [ ] **Stăpânirea Bicep**: Crearea de componente de infrastructură modulare și reutilizabile  
- [ ] **Automatizare implementare**: Implementarea cârligelor de pre/post implementare  
- [ ] **Proiectare arhitectură**: Implementarea unei arhitecturi complexe de microservicii  
- [ ] **Optimizare șablon**: Optimizarea șabloanelor pentru performanță și cost  

#### 🎯 Capitolul 5: Soluții AI multi-agent  
- [ ] **Implementare soluție retail**: Implementarea unui scenariu complet de retail multi-agent  
- [ ] **Personalizare agenți**: Modificarea comportamentului agenților Customer și Inventory  
- [ ] **Scalare arhitectură**: Implementarea echilibrării încărcării și scalării automate  
- [ ] **Monitorizare producție**: Configurarea monitorizării și alertării complete  
- [ ] **Optimizare performanță**: Optimizarea performanței sistemului multi-agent  

#### 🔍 Capitolul 6: Validare înainte de implementare și planificare  
- [ ] **Analiză capacitate**: Analiza cerințelor de resurse pentru aplicații  
- [ ] **Optimizare SKU**: Selectarea nivelurilor de servicii eficiente din punct de vedere al costurilor  
- [ ] **Automatizare validare**: Implementarea scripturilor de verificare înainte de implementare  
- [ ] **Planificare costuri**: Crearea estimărilor și bugetelor pentru costurile de implementare  
- [ ] **Evaluare riscuri**: Identificarea și atenuarea riscurilor de implementare  

#### 🚨 Capitolul 7: Depanare și diagnosticare  
- [ ] **Abilități de diagnosticare**: Depanarea cu succes a implementărilor intenționat defecte  
- [ ] **Analiză jurnale**: Utilizarea eficientă a Azure Monitor și Application Insights  
- [ ] **Optimizare performanță**: Optimizarea aplicațiilor cu performanță scăzută  
- [ ] **Proceduri de recuperare**: Implementarea backup-ului și recuperării în caz de dezastru  
- [ ] **Configurare monitorizare**: Crearea unei monitorizări proactive și a alertării  

#### 🏢 Capitolul 8: Producție și modele la nivel de întreprindere  
- [ ] **Securitate la nivel de întreprindere**: Implementarea modelelor complete de securitate  
- [ ] **Cadru de guvernanță**: Configurarea Azure Policy și gestionarea resurselor  
- [ ] **Monitorizare avansată**: Crearea de dashboard-uri și alertare automată  
- [ ] **Integrare CI/CD**: Construirea fluxurilor automate de implementare  
- [ ] **Implementare conformitate**: Respectarea cerințelor de conformitate la nivel de întreprindere  

### Cronologie de învățare și repere

#### Săptămâna 1-2: Construirea fundației  
- **Reper**: Implementarea primei aplicații AI utilizând AZD  
- **Validare**: Aplicație funcțională accesibilă printr-un URL public  
- **Abilități**: Fluxuri de lucru de bază AZD și integrarea serviciilor AI  

#### Săptămâna 3-4: Stăpânirea configurării  
- **Reper**: Implementare multi-mediu cu autentificare securizată  
- **Validare**: Aceeași aplicație implementată în dev/staging/prod  
- **Abilități**: Gestionarea mediilor și implementarea securității  

#### Săptămâna 5-6: Expertiză în infrastructură  
- **Reper**: Șablon personalizat pentru aplicații complexe multi-servicii  
- **
5. **Contribuția Comunității**: Împărtășește șabloane sau îmbunătățiri

#### Rezultate ale Dezvoltării Profesionale
- **Proiecte pentru Portofoliu**: 8 implementări gata de producție
- **Competențe Tehnice**: Expertiză în AZD și implementări AI la standarde industriale
- **Abilități de Rezolvare a Problemelor**: Rezolvare independentă a problemelor și optimizare
- **Recunoaștere în Comunitate**: Participare activă în comunitatea dezvoltatorilor Azure
- **Avansare în Carieră**: Competențe direct aplicabile în roluri de cloud și AI

#### Metrici de Succes
- **Rata de Succes a Implementărilor**: >95% implementări reușite
- **Timp de Rezolvare a Problemelor**: <30 de minute pentru probleme comune
- **Optimizarea Performanței**: Îmbunătățiri demonstrabile în costuri și performanță
- **Conformitate cu Securitatea**: Toate implementările respectă standardele de securitate ale întreprinderii
- **Transfer de Cunoștințe**: Capacitatea de a îndruma alți dezvoltatori

### Învățare Continuă și Implicare în Comunitate

#### Rămâi la Curent
- **Actualizări Azure**: Urmărește notele de lansare ale Azure Developer CLI
- **Evenimente Comunitare**: Participă la evenimente pentru dezvoltatori Azure și AI
- **Documentație**: Contribuie la documentația comunității și exemple
- **Cerc Feedback**: Oferă feedback despre conținutul cursului și serviciile Azure

#### Dezvoltare în Carieră
- **Rețea Profesională**: Conectează-te cu experți în Azure și AI
- **Oportunități de Vorbire**: Prezintă-ți învățăturile la conferințe sau întâlniri
- **Contribuții Open Source**: Contribuie la șabloane și instrumente AZD
- **Mentorat**: Ghidează alți dezvoltatori în călătoria lor de învățare AZD

---

**Navigare în Capitol:**
- **📚 Pagina Principală a Cursului**: [AZD Pentru Începători](../README.md)
- **📖 Începe Să Înveți**: [Capitolul 1: Fundamente & Start Rapid](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Urmărirea Progresului**: Monitorizează-ți avansarea prin sistemul de învățare cuprinzător în 8 capitole
- **🤝 Comunitate**: [Azure Discord](https://discord.gg/microsoft-azure) pentru suport și discuții

**Urmărirea Progresului Studiului**: Folosește acest ghid structurat pentru a stăpâni Azure Developer CLI printr-o învățare progresivă, practică, cu rezultate măsurabile și beneficii pentru dezvoltarea profesională.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru neînțelegerile sau interpretările greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->