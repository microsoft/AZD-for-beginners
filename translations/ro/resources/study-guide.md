# Ghid de Studiu - Obiective de Învățare Cuprinzătoare

**Navigarea În Calea De Învațare**
- **📚 Acasă Curs**: [AZD Pentru Începători](../README.md)
- **📖 Începe Învățarea**: [Capitolul 1: Fundamente și Pornire Rapidă](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Urmărirea Progresului**: [Finalizarea Cursului](../README.md#-course-completion--certification)

## Introducere

Acest ghid de studiu cuprinzător oferă obiective de învățare structurate, concepte cheie, exerciții practice și materiale de evaluare pentru a vă ajuta să stăpâniți Azure Developer CLI (azd). Folosiți acest ghid pentru a vă urmări progresul și pentru a vă asigura că ați acoperit toate temele esențiale.

## Obiective de Învățare

Prin parcurgerea acestui ghid de studiu, veți:
- Stăpâni toate conceptele fundamentale și avansate ale Azure Developer CLI
- Dezvolta abilități practice în implementarea și gestionarea aplicațiilor Azure
- Câștiga încredere în depanarea și optimizarea implementărilor
- Înțelege practicile de implementare gata pentru producție și considerațiile de securitate

## Rezultate de Învățare

După finalizarea tuturor secțiunilor acestui ghid de studiu, veți putea:
- Proiecta, implementa și gestiona arhitecturi complete de aplicații folosind azd
- Implementa strategii cuprinzătoare de monitorizare, securitate și optimizare a costurilor
- Depana independent probleme complexe de implementare
- Crea șabloane personalizate și contribui la comunitatea azd

## Structura de Învățare în 8 Capitole

### Capitolul 1: Fundamente și Pornire Rapidă (Săptămâna 1)
**Durată**: 30-45 minute | **Complexitate**: ⭐

#### Obiective de Învățare
- Înțelege conceptele de bază și terminologia Azure Developer CLI
- Instalează și configurează cu succes AZD pe platforma ta de dezvoltare
- Implementează prima aplicație folosind un șablon existent
- Navighează eficient în interfața de linie de comandă AZD

#### Concepte Cheie de Stăpânit
- Structura proiectului AZD și componentele (azure.yaml, infra/, src/)
- Fluxurile de lucru bazate pe șabloane pentru implementare
- Noțiuni de bază ale configurării mediului
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
- Cum gestionezi medii multiple cu AZD?

---

### Capitolul 2: Dezvoltare AI-First (Săptămâna 2)
**Durată**: 1-2 ore | **Complexitate**: ⭐⭐

#### Obiective de Învățare
- Integrarea serviciilor Microsoft Foundry cu fluxurile AZD
- Implementarea și configurarea aplicațiilor AI-powered
- Înțelege modelele de implementare RAG (Retrieval-Augmented Generation)
- Gestionează implementările și scalarea modelelor AI

#### Concepte Cheie de Stăpânit
- Integrarea serviciului Microsoft Foundry Models și gestionarea API-urilor
- Configurarea căutărilor AI și indexarea vectorială
- Strategii de implementare a modelelor și planificarea capacității
- Monitorizarea aplicațiilor AI și optimizarea performanței

#### Exerciții Practice
1. **Implementare Chat AI**: Implementează șablonul azure-search-openai-demo
2. **Implementare RAG**: Configurează indexarea și recuperarea documentelor
3. **Configurare Model**: Setează mai multe modele AI cu scopuri diferite
4. **Monitorizare AI**: Implementarea Application Insights pentru încărcături AI

#### Întrebări de Evaluare
- Cum configurezi serviciile Microsoft Foundry Models într-un șablon AZD?
- Care sunt componentele cheie ale unei arhitecturi RAG?
- Cum gestionezi capacitatea și scalarea modelelor AI?
- Care sunt metricele de monitorizare importante pentru aplicațiile AI?

---

### Capitolul 3: Configurare și Autentificare (Săptămâna 3)
**Durată**: 45-60 minute | **Complexitate**: ⭐⭐

#### Obiective de Învățare
- Stăpânirea strategiilor de configurare și gestionare a mediilor
- Implementarea modelelor sigure de autentificare și identitate gestionată
- Organizarea resurselor cu convenții corecte de denumire
- Configurarea implementărilor multi-mediu (dev, staging, prod)

#### Concepte Cheie de Stăpânit
- Ierarhia mediilor și precedența configurării
- Autentificare prin identitate gestionată și principal de serviciu
- Integrarea Key Vault pentru gestionarea secretelor
- Gestionarea parametrilor specifici mediului

#### Exerciții Practice
1. **Configurare Multi-Mediu**: Configurează mediile dev, staging și prod
2. **Configurare Securitate**: Implementarea autentificării cu identitate gestionată
3. **Gestionarea Secretelor**: Integrarea Azure Key Vault pentru date sensibile
4. **Gestionarea Parametrilor**: Crearea configurațiilor specifice mediului

#### Întrebări de Evaluare
- Cum configurezi medii diferite cu AZD?
- Care sunt beneficiile utilizării identității gestionate față de principalii de serviciu?
- Cum gestionezi în siguranță secretele aplicației?
- Care este ierarhia configurării în AZD?

---

### Capitolul 4: Infrastructură ca Cod & Implementare (Săptămâna 4-5)
**Durată**: 1-1.5 ore | **Complexitate**: ⭐⭐⭐

#### Obiective de Învățare
- Creează și personalizează șabloane de infrastructură Bicep
- Implementarea modelelor avansate de implementare și fluxuri de lucru
- Înțelege strategiile de aprovizionare a resurselor
- Proiectează arhitecturi scalabile multi-serviciu

- Implementează aplicații containerizate folosind Azure Container Apps și AZD

#### Concepte Cheie de Stăpânit
- Structura șabloanelor Bicep și bune practici
- Dependențele resurselor și ordonarea implementărilor
- Fișiere parametru și modularitatea șabloanelor
- Hook-uri personalizate și automatizarea implementării
- Modele de implementare a aplicațiilor container (pornire rapidă, producție, microservicii)

#### Exerciții Practice
1. **Creare Șablon Personalizat**: Construiește un șablon pentru o aplicație multi-serviciu
2. **Stăpânirea Bicep**: Creează componente modulate, reutilizabile de infrastructură
3. **Automatizarea Implementării**: Implementare hook-uri pre/post implementare
4. **Proiectare Arhitectură**: Implementează arhitectură complexă de microservicii
5. **Implementare Container App**: Implementează exemplele [Simple Flask API](../../../examples/container-app/simple-flask-api) și [Microservices Architecture](../../../examples/container-app/microservices) folosind AZD

#### Întrebări de Evaluare
- Cum creezi șabloane Bicep personalizate pentru AZD?
- Care sunt bunele practici pentru organizarea codului de infrastructură?
- Cum gestionezi dependențele între resurse în șabloane?
- Ce modele de implementare suportă actualizări fără întrerupere?

---

### Capitolul 5: Soluții AI Multi-Agent (Săptămâna 6-7)
**Durată**: 2-3 ore | **Complexitate**: ⭐⭐⭐⭐

#### Obiective de Învățare
- Proiectează și implementează arhitecturi AI multi-agent
- Orchestrarea coordonării și comunicării agenților
- Implementează soluții AI pregătite pentru producție cu monitorizare
- Înțelege specializarea agenților și modelele de flux de lucru
- Integrează microservicii containerizate ca parte a soluțiilor multi-agent

#### Concepte Cheie de Stăpânit
- Modele de arhitecturi multi-agent și principii de proiectare
- Protocoale de comunicare între agenți și fluxul de date
- Strategii de echilibrare a încărcării și scalare pentru agenți AI
- Monitorizare de producție pentru sisteme multi-agent
- Comunicare serviciu-la-serviciu în medii containerizate

#### Exerciții Practice
1. **Implementare Soluție Retail**: Implementează scenariul complet multi-agent retail
2. **Personalizarea Agenților**: Modifică comportamentul agenților Customer și Inventory
3. **Scalarea Arhitecturii**: Implementare echilibrare a încărcării și auto-scalare
4. **Monitorizare Producție**: Configurează monitorizare și alertare cuprinzătoare
5. **Integrare Microservicii**: Extinde exemplul [Microservices Architecture](../../../examples/container-app/microservices) pentru suportul fluxurilor de lucru bazate pe agenți

#### Întrebări de Evaluare
- Cum proiectezi modele eficiente de comunicare multi-agent?
- Care sunt considerațiile cheie pentru scalarea încărcărilor agenților AI?
- Cum monitorizezi și depanezi sisteme AI multi-agent?
- Ce modele de producție asigură fiabilitatea agenților AI?

---

### Capitolul 6: Validare și Planificare Pre-Implementare (Săptămâna 8)
**Durată**: 1 oră | **Complexitate**: ⭐⭐

#### Obiective de Învățare
- Realizează planificarea capacității și validarea resurselor pe deplin
- Selectează SKU-urile Azure optime pentru eficiență cost
- Implementează verificări automate pre-flight și validări
- Planifică implementările cu strategii de optimizare a costurilor

#### Concepte Cheie de Stăpânit
- Cotele resurselor Azure și limitările de capacitate
- Criterii de selecție SKU și optimizarea costurilor
- Scripturi automate de validare și testare
- Planificarea implementării și evaluarea riscurilor

#### Exerciții Practice
1. **Analiză Capacitate**: Analizează cerințele de resurse ale aplicațiilor tale
2. **Optimizare SKU**: Compară și selectează niveluri de servicii eficiente din punct de vedere al costurilor
3. **Automatizare Validare**: Implementează scripturi de verificare pre-implementare
4. **Planificare Costuri**: Creează estimări și bugete pentru costurile de implementare

#### Întrebări de Evaluare
- Cum validezi capacitatea Azure înainte de implementare?
- Ce factori influențează deciziile de selecție SKU?
- Cum automatizezi validarea pre-implementare?
- Ce strategii ajută la optimizarea costurilor de implementare?

---

### Capitolul 7: Depanare și Debugging (Săptămâna 9)
**Durată**: 1-1.5 ore | **Complexitate**: ⭐⭐

#### Obiective de Învățare
- Dezvoltă abordări sistematice de depanare pentru implementările AZD
- Rezolvă probleme comune de implementare și configurare
- Debugging pentru probleme specifice AI și optimizare performanță
- Implementează monitorizare și alertare pentru detectarea proactivă a problemelor

#### Concepte Cheie de Stăpânit
- Tehnici de diagnostic și strategii de logare
- Modele comune de eșec și soluțiile aferente
- Monitorizarea performanței și optimizări
- Proceduri de răspuns și recuperare la incidente

#### Exerciții Practice
1. **Abilități de Diagnostic**: Exersează cu implementări intenționat defecte
2. **Analiza Logurilor**: Utilizează eficient Azure Monitor și Application Insights
3. **Optimizare Performanță**: Optimizează aplicații cu performanță lentă
4. **Proceduri de Recuperare**: Implementare backup și recuperare în caz de dezastru

#### Întrebări de Evaluare
- Care sunt cele mai frecvente eșecuri în implementările AZD?
- Cum depanezi problemele de autentificare și permisiuni?
- Ce strategii de monitorizare ajută la prevenirea problemelor în producție?
- Cum optimizezi performanța aplicațiilor în Azure?

---

### Capitolul 8: Modele de Producție și Enterprise (Săptămâna 10-11)
**Durată**: 2-3 ore | **Complexitate**: ⭐⭐⭐⭐

#### Obiective de Învățare
- Implementează strategii de implementare la nivel enterprise
- Proiectează modele de securitate și cadre de conformitate
- Stabilește monitorizare, guvernanță și gestionare a costurilor
- Creează pipeline-uri CI/CD scalabile cu integrare AZD
- Aplică bune practici pentru implementarea container apps în producție (securitate, monitorizare, cost, CI/CD)

#### Concepte Cheie de Stăpânit
- Cerințe de securitate și conformitate enterprise
- Cadre de guvernanță și implementarea politicilor
- Monitorizare avansată și management al costurilor
- Integrarea CI/CD și pipeline-uri automate de implementare
- Strategii de implementare blue-green și canary pentru încărcături containerizate

#### Exerciții Practice
1. **Securitate Enterprise**: Implementarea modelelor cuprinzătoare de securitate
2. **Cadru de Guvernanță**: Configurează Azure Policy și managementul resurselor
3. **Monitorizare Avansată**: Creează tablouri de bord și alerte automate
4. **Integrare CI/CD**: Construiește pipeline-uri automate de implementare
5. **Container Apps în Producție**: Aplică securitate, monitorizare și optimizare costuri pentru exemplul [Microservices Architecture](../../../examples/container-app/microservices)

#### Întrebări de Evaluare
- Cum implementezi securitatea enterprise în implementările AZD?
- Ce modele de guvernanță asigură conformitatea și controlul costurilor?
- Cum proiectezi monitorizare scalabilă pentru sisteme de producție?
- Ce modele CI/CD funcționează cel mai bine cu fluxurile AZD?

#### Obiective de Învățare
- Înțelege fundamentele Azure Developer CLI și conceptele de bază
- Instalează și configurează cu succes azd în mediul tău de dezvoltare
- Finalizează prima implementare folosind un șablon existent
- Navighează structura proiectului azd și înțelege componentele cheie

#### Concepte Cheie de Stăpânit
- Șabloane, medii și servicii
- Structura de configurare azure.yaml
- Comenzile de bază azd (init, up, down, deploy)
- Principii Infrastructure as Code
- Autentificare și autorizare Azure

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
# Lansați o aplicație web simplă:
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
1. Care sunt cele trei concepte principale ale arhitecturii azd?
2. Care este scopul fișierului azure.yaml?
3. Cum ajută mediile la gestionarea diferitelor ținte de implementare?
4. Ce metode de autentificare pot fi folosite cu azd?
5. Ce se întâmplă când rulezi pentru prima dată `azd up`?

---

## Urmărirea Progresului și Cadru de Evaluare
```bash
# Crează și configurează medii multiple:
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
2. Ce sunt hook-urile de implementare și când ar trebui folosite?
3. Cum configurezi diferite SKU-uri pentru medii diferite?
4. Care sunt implicațiile de securitate ale diferitelor metode de autentificare?
5. Cum gestionezi secretele și datele sensibile de configurare?

### Modulul 3: Implementare și Aprovizionare (Săptămâna 4)

#### Obiective de Învățare
- Stăpânește fluxurile de implementare și bunele practici
- Înțelege Infrastructure as Code cu șabloane Bicep
- Implementează arhitecturi complexe multi-serviciu
- Optimizează performanța și fiabilitatea implementărilor

#### Concepte Cheie de Stăpânit
- Structura și modulele șabloanelor Bicep
- Dependențele resurselor și ordonarea acestora
- Strategii de implementare (blue-green, rolling updates)
- Implementări multi-regiune
- Migrații de baze de date și gestionarea datelor

#### Exerciții Practice

**Exercițiul 3.1: Infrastructură Personalizată**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Exercițiul 3.2: Aplicație Multi-Serviciu**
```bash
# Implementați o arhitectură de microservicii:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercițiul 3.3: Integrare Bază de Date**
```bash
# Implementați tiparele de implementare a bazei de date:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Întrebări de Autoevaluare
1. Care sunt avantajele folosirii Bicep față de șabloanele ARM?
2. Cum gestionezi migrațiile bazei de date în implementările azd?
3. Ce strategii există pentru implementări fără întrerupere?
4. Cum gestionezi dependențele între servicii?
5. Care sunt considerațiile pentru implementări multi-regiune?

### Modulul 4: Validare Pre-Implementare (Săptămâna 5)

#### Obiective de Învățare
- Implementați verificări cuprinzătoare înainte de implementare
- Stăpâniți planificarea capacității și validarea resurselor
- Înțelegeți selecția SKU și optimizarea costurilor
- Construiți pipeline-uri automate de validare

#### Concepte Cheie de Stăpânit
- Cotele și limitele resurselor Azure
- Criteriile de selecție SKU și implicațiile costurilor
- Scripturi și unelte automate de validare
- Metodologii de planificare a capacității
- Testarea performanței și optimizarea

#### Exerciții Practice

**Exercițiul 4.1: Planificarea Capacității**  
```bash
# Implementați validarea capacității:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Exercițiul 4.2: Validare Pre-zbor**  
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
# Optimizează configurațiile serviciului:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  
#### Întrebări de Autoevaluare
1. Ce factori ar trebui să influențeze deciziile privind selecția SKU?
2. Cum validați disponibilitatea resurselor Azure înainte de implementare?
3. Care sunt componentele cheie ale unui sistem de verificare pre-zbor?
4. Cum estimați și controlați costurile de implementare?
5. Ce monitorizare este esențială pentru planificarea capacității?

### Modulul 5: Depanare și Debugging (Săptămâna 6)

#### Obiective de Învățare
- Stăpânirea metodologiilor sistematice de depanare
- Dezvoltarea expertizei în debugarea problemelor complexe de implementare
- Implementarea monitorizării și alertării cuprinzătoare
- Construirea procedurilor de răspuns la incidente și recuperare

#### Concepte Cheie de Stăpânit
- Modele comune de eșec în implementare
- Tehnici de analiză și corelare a logurilor
- Monitorizarea performanței și optimizarea
- Detectarea și răspunsul la incidente de securitate
- Recuperarea în caz de dezastru și continuitatea afacerii

#### Exerciții Practice

**Exercițiul 5.1: Scenarii de depanare**  
```bash
# Exersează rezolvarea problemelor comune:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Exercițiul 5.2: Implementarea Monitorizării**  
```bash
# Configurați monitorizarea completă:
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
  
#### Întrebări de Autoevaluare
1. Care este abordarea sistematică pentru depanarea implementărilor azd?
2. Cum corelați logurile între mai multe servicii și resurse?
3. Ce metrici de monitorizare sunt cei mai critici pentru detectarea timpurie a problemelor?
4. Cum implementați proceduri eficiente de recuperare în caz de dezastru?
5. Care sunt componentele cheie ale unui plan de răspuns la incidente?

### Modulul 6: Subiecte Avansate și Cele Mai Bune Practici (Săptămânile 7-8)

#### Obiective de Învățare
- Implementați modele de implementare pentru întreprinderi
- Stăpâniți integrarea și automatizarea CI/CD
- Dezvoltați șabloane personalizate și contribuiți la comunitate
- Înțelegeți cerințele avansate de securitate și conformitate

#### Concepte Cheie de Stăpânit
- Modele de integrare pentru pipeline-uri CI/CD
- Dezvoltarea și distribuirea de șabloane personalizate
- Guvernanța și conformitatea în întreprinderi
- Configurări avansate de rețea și securitate
- Optimizarea performanței și gestionarea costurilor

#### Exerciții Practice

**Exercițiul 6.1: Integrarea CI/CD**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```
  
**Exercițiul 6.2: Dezvoltarea Șabloanelor Personalizate**  
```bash
# Creează și publică șabloane personalizate:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Exercițiul 6.3: Implementare Enterprise**  
```bash
# Implementați funcționalități de nivel enterprise:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  
#### Întrebări de Autoevaluare
1. Cum integrați azd în fluxurile de lucru CI/CD existente?
2. Care sunt considerațiile cheie pentru dezvoltarea de șabloane personalizate?
3. Cum implementați guvernanța și conformitatea în implementările azd?
4. Care sunt cele mai bune practici pentru implementările la scară enterprise?
5. Cum contribuiți eficient la comunitatea azd?

## Proiecte Practice

### Proiect 1: Website Personal de Portofoliu  
**Complexitate**: Începător  
**Durată**: 1-2 săptămâni

Construiți și implementați un site personal de portofoliu folosind:  
- Găzduire site static pe Azure Storage  
- Configurare domeniu personalizat  
- Integrare CDN pentru performanță globală  
- Pipeline automat de implementare

**Livrabile**:  
- Site funcțional implementat pe Azure  
- Șablon azd personalizat pentru implementările portofoliului  
- Documentație a procesului de implementare  
- Analiză costuri și recomandări de optimizare

### Proiect 2: Aplicație de Gestionare a Tarelor  
**Complexitate**: Intermediar  
**Durată**: 2-3 săptămâni

Creați o aplicație full-stack de gestionare a task-urilor cu:  
- Frontend React implementat în App Service  
- Backend API Node.js cu autentificare  
- Bază de date PostgreSQL cu migrații  
- Monitorizare cu Application Insights

**Livrabile**:  
- Aplicație completă cu autentificare utilizator  
- Schema bazei de date și scripturi de migrare  
- Dashboard-uri de monitorizare și reguli de alertare  
- Configurare multi-mediu pentru implementare

### Proiect 3: Platformă de E-commerce pe Microservicii  
**Complexitate**: Avansat  
**Durată**: 4-6 săptămâni

Proiectați și implementați o platformă e-commerce bazată pe microservicii:  
- Mai multe servicii API (catalog, comenzi, plăți, utilizatori)  
- Integrare coadă de mesaje cu Service Bus  
- Cache Redis pentru optimizarea performanței  
- Logging și monitorizare cuprinzătoare

**Exemplu de Referință**: Consultați [Microservices Architecture](../../../examples/container-app/microservices) pentru un șablon și ghid de implementare gata de producție

**Livrabile**:  
- Arhitectură completă de microservicii  
- Modele de comunicare inter-servicii  
- Testare și optimizare a performanței  
- Implementare de securitate gata pentru producție

## Evaluare și Certificare

### Verificări de Cunoștințe

Finalizați aceste evaluări după fiecare modul:

**Evaluare Modului 1**: Concepte de bază și instalare  
- Întrebări cu alegere multiplă despre conceptele de bază  
- Sarcini practice de instalare și configurare  
- Exercițiu simplu de implementare

**Evaluare Modului 2**: Configurare și medii  
- Scenarii de gestionare a mediilor  
- Exerciții de depanare configurare  
- Implementarea securității

**Evaluare Modului 3**: Implementare și provisioning  
- Provocări legate de proiectarea infrastructurii  
- Scenarii de implementare multi-serviciu  
- Exerciții de optimizare a performanței

**Evaluare Modului 4**: Validare înainte de implementare  
- Studii de caz pentru planificarea capacității  
- Scenarii de optimizare a costurilor  
- Implementarea pipeline-urilor de validare

**Evaluare Modului 5**: Depanare și debugging  
- Exerciții de diagnosticare a problemelor  
- Sarcini de implementare monitorizare  
- Simulări de răspuns la incidente

**Evaluare Modului 6**: Subiecte avansate  
- Proiectarea pipeline-urilor CI/CD  
- Dezvoltarea șabloanelor personalizate  
- Scenarii de arhitectură enterprise

### Proiect Final Capstone

Proiectați și implementați o soluție completă care demonstrează stăpânirea tuturor conceptelor:

**Cerințe**:  
- Arhitectură aplicație multi-strat  
- Mai multe medii de implementare  
- Monitorizare și alertare cuprinzătoare  
- Implementare securitate și conformitate  
- Optimizare costuri și performanță  
- Documentație completă și runbooks

**Criterii de Evaluare**:  
- Calitatea implementării tehnice  
- Completitudinea documentației  
- Respectarea securității și a celor mai bune practici  
- Optimizarea performanței și costurilor  
- Eficiența în depanare și monitorizare

## Resurse de Studiu și Referințe

### Documentație Oficială  
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Resurse Comunitare  
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Medii Practice  
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)

### Unelte Suplimentare  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Recomandări pentru Programul de Studiu

### Studiu Full-Time (8 săptămâni)  
- **Săptămânile 1-2**: Modulele 1-2 (Introducere, Configurare)  
- **Săptămânile 3-4**: Modulele 3-4 (Implementare, Pre-implementare)  
- **Săptămânile 5-6**: Modulele 5-6 (Depanare, Subiecte Avansate)  
- **Săptămânile 7-8**: Proiecte Practice și Evaluare Finală

### Studiu Part-Time (16 săptămâni)  
- **Săptămânile 1-4**: Modulul 1 (Introducere)  
- **Săptămânile 5-7**: Modulul 2 (Configurare și Medii)  
- **Săptămânile 8-10**: Modulul 3 (Implementare și Provisionare)  
- **Săptămânile 11-12**: Modulul 4 (Validare Pre-implementare)  
- **Săptămânile 13-14**: Modulul 5 (Depanare și Debugging)  
- **Săptămânile 15-16**: Modulul 6 (Subiecte Avansate și Evaluare)

---

## Cadru pentru Monitorizarea Progresului și Evaluare

### Checklist pentru Terminarea Capitelor

Urmăriți-vă progresul prin fiecare capitol cu aceste rezultate măsurabile:

#### 📚 Capitolul 1: Fundamente & Primii Pași  
- [ ] **Instalare Completă**: AZD instalat și verificat pe platforma dvs.  
- [ ] **Prima Implementare**: Șablonul todo-nodejs-mongo implementat cu succes  
- [ ] **Configurare Mediu**: Variabile de mediu configurate pentru prima dată  
- [ ] **Navigare Resurse**: Resursele implementate explorate în Portalul Azure  
- [ ] **Stăpânirea Comenzilor**: Confort în utilizarea comenzilor AZD de bază

#### 🤖 Capitolul 2: Dezvoltare AI-First  
- [ ] **Implementare Șablon AI**: azure-search-openai-demo implementat cu succes  
- [ ] **Implementare RAG**: Indexarea și recuperarea documentelor configurate  
- [ ] **Configurare Modele**: Multiple modele AI configurate pentru scopuri diferite  
- [ ] **Monitorizare AI**: Application Insights implementat pentru încărcări AI  
- [ ] **Optimizare Performanță**: Performanța aplicației AI optimizată

#### ⚙️ Capitolul 3: Configurare & Autentificare  
- [ ] **Configurare Multi-Medii**: Medii dev, staging și prod configurate  
- [ ] **Implementare Securitate**: Autentificare prin identitate gestionată configurată  
- [ ] **Gestionarea Secretelor**: Azure Key Vault integrat pentru date sensibile  
- [ ] **Gestionarea Parametrilor**: Configurări specifice mediului create  
- [ ] **Stăpânirea Autentificării**: Modele securizate de acces implementate

#### 🏗️ Capitolul 4: Infrastructură ca Cod & Implementare  
- [ ] **Creare Șablon Personalizat**: Șablon aplicație multi-servicii construit  
- [ ] **Stăpânirea Bicep**: Componente modulare și reutilizabile create  
- [ ] **Automatizare Implementare**: Hook-uri pre/post implementare implementate  
- [ ] **Design Arhitectural**: Arhitectură complexă de microservicii implementată  
- [ ] **Optimizare Șabloane**: Șabloane optimizate pentru performanță și cost

#### 🎯 Capitolul 5: Soluții Multi-Agent AI  
- [ ] **Implementare Soluție Retail**: Scenariu complet multi-agent implementat  
- [ ] **Personalizare Agenți**: Comportamentele agenților Customer și Inventory modificate  
- [ ] **Scalare Arhitectură**: Echilibrare sarcină și autoscalare implementate  
- [ ] **Monitorizare Producție**: Monitorizare și alertare cuprinzătoare configurate  
- [ ] **Optimizare Performanță**: Performanța sistemului multi-agent optimizată

#### 🔍 Capitolul 6: Validare & Planificare Pre-Implementare  
- [ ] **Analiza Capacității**: Cerințele resurselor analizate pentru aplicații  
- [ ] **Optimizare SKU**: Niveluri de serviciu eficiente din punct de vedere al costurilor selectate  
- [ ] **Automatizare Validare**: Scripturi de verificare pre-implementare implementate  
- [ ] **Planificare Costuri**: Estimări și bugete pentru implementare create  
- [ ] **Evaluare Riscuri**: Riscurile implementării identificate și diminuate

#### 🚨 Capitolul 7: Depanare & Debugging  
- [ ] **Abilități Diagnostice**: Implementările intenționat defectuoase depistate cu succes  
- [ ] **Analiză Loguri**: Azure Monitor și Application Insights utilizate eficient  
- [ ] **Optimizare Performanță**: Aplicații lente optimizate  
- [ ] **Proceduri Recuperare**: Backup și recuperare în caz de dezastru implementate  
- [ ] **Configurare Monitorizare**: Monitorizare proactivă și alertare create

#### 🏢 Capitolul 8: Producție & Modele Enterprise  
- [ ] **Securitate Enterprise**: Modele complete de securitate implementate  
- [ ] **Cadru Guvernanță**: Azure Policy și gestionarea resurselor configurate  
- [ ] **Monitorizare Avansată**: Dashboard-uri și alertare automată create  
- [ ] **Integrare CI/CD**: Pipeline-uri automate de implementare construite  
- [ ] **Implementare Conformitate**: Cerințe de conformitate enterprise respectate

### Cronologie de Învățare și Repere

#### Săptămânile 1-2: Fundamente  
- **Reper**: Implementare prima aplicație AI folosind AZD  
- **Validare**: Aplicație funcțională accesibilă prin URL public  
- **Competențe**: Fluxuri de lucru AZD de bază și integrare servicii AI

#### Săptămânile 3-4: Stăpânirea Configurării  
- **Reper**: Implementare multi-mediu cu autentificare securizată  
- **Validare**: Aceeași aplicație implementată pe dev/staging/prod  
- **Competențe**: Managementul mediilor și implementarea securității

#### Săptămânile 5-6: Expertiză în Infrastructură  
- **Reper**: Șablon personalizat pentru aplicație complexă multi-servicii  
- **Validare**: Șablon reutilizabil implementat de alt membru al echipei  
- **Competențe**: Stăpânirea Bicep și automatizarea infrastructurii

#### Săptămânile 7-8: Implementare Avansată AI  
- **Reper**: Soluție AI multi-agent gata de producție  
- **Validare**: Sistemul gestionează încărcătura reală cu monitorizare  
- **Competențe**: Orchestrarea multi-agent și optimizarea performanței

#### Săptămânile 9-10: Pregătire Produție  
- **Reper**: Implementare la scară enterprise cu conformitate completă  
- **Validare**: Trecerea reviziei de securitate și auditului pentru costuri  
- **Competențe**: Guvernanță, monitorizare și integrare CI/CD

### Evaluare și Certificare

#### Metode de Validare a Cunoștințelor
1. **Implementări Practice**: Aplicații funcționale pentru fiecare capitol  
2. **Revizuiri de Cod**: Evaluarea calității șabloanelor și configurărilor  
3. **Rezolvare Probleme**: Scenarii de depanare și soluții  
4. **Predare colegială**: Explicarea conceptelor altor cursanți  
5. **Contribuții Comunitare**: Partajarea șabloanelor sau îmbunătățirilor

#### Rezultate în Dezvoltarea Profesională
- **Proiecte din portofoliu**: 8 implementări gata de producție  
- **Competențe tehnice**: Expertiză recunoscută în AZD și implementări AI  
- **Abilități de rezolvare a problemelor**: Depanare și optimizare independentă  
- **Recunoaștere în comunitate**: Participare activă în comunitatea dezvoltatorilor Azure  
- **Dezvoltare profesională**: Competențe aplicabile direct în roluri cloud și AI  

#### Metrice de succes  
- **Rata de succes a implementărilor**: >95% implementări reușite  
- **Timp de depanare**: <30 minute pentru probleme comune  
- **Optimizare a performanței**: Îmbunătățiri demonstrabile de cost și performanță  
- **Conformitate de securitate**: Toate implementările respectă standardele de securitate ale întreprinderii  
- **Transfer de cunoștințe**: Capacitatea de a mentoriza alți dezvoltatori  

### Învățare continuă și implicare în comunitate  

#### Rămâi la curent  
- **Actualizări Azure**: Urmărește notele de lansare Azure Developer CLI  
- **Evenimente comunitare**: Participă la evenimente pentru dezvoltatori Azure și AI  
- **Documentație**: Contribuie la documentația și exemplele comunității  
- **Feedback**: Oferă feedback cu privire la conținutul cursului și serviciile Azure  

#### Dezvoltare profesională  
- **Rețea profesională**: Conectează-te cu experți din domeniul Azure și AI  
- **Oportunități de vorbire**: Prezintă ceea ce ai învățat la conferințe sau întâlniri  
- **Contribuții open source**: Contribuie la șabloane și instrumente AZD  
- **Mentorat**: Ghidează alți dezvoltatori în parcursul lor de învățare AZD  

---

**Navigare capitole:**  
- **📚 Acasă cursului**: [AZD For Beginners](../README.md)  
- **📖 Începe să înveți**: [Capitolul 1: Fundament și pornire rapidă](../README.md#-chapter-1-foundation--quick-start)  
- **🎯 Monitorizare progres**: Urmărește-ți avansarea prin sistemul de învățare cuprinzător, format din 8 capitole  
- **🤝 Comunitate**: [Azure Discord](https://discord.gg/microsoft-azure) pentru suport și discuții  

**Monitorizarea progresului în studiu**: Folosește acest ghid structurat pentru a stăpâni Azure Developer CLI prin învățare practică progresivă cu rezultate măsurabile și beneficii pentru dezvoltarea profesională.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă o traducere profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru orice neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->