<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-10T07:11:48+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "ro"
}
-->
# Ghid de Studiu - AZD pentru Începători

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

## Structura Cursului

### Modulul 1: Începuturi (Săptămânile 1-2)

#### Obiective de Învățare
- Înțelege fundamentele și conceptele de bază ale Azure Developer CLI
- Instalează și configurează cu succes azd în mediul tău de dezvoltare
- Realizează prima implementare folosind un șablon existent
- Navighează structura proiectului azd și înțelege componentele cheie

#### Concepte Cheie de Stăpânit
- Șabloane, medii și servicii
- Structura de configurare azure.yaml
- Comenzi de bază azd (init, up, down, deploy)
- Principiile Infrastructure as Code
- Autentificarea și autorizarea în Azure

#### Exerciții Practice

**Exercițiul 1.1: Instalare și Configurare**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercițiul 1.2: Prima Implementare**  
```bash
# Deploy a simple web application:
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

### Modulul 2: Configurare și Medii (Săptămâna 3)

#### Obiective de Învățare
- Stăpânește gestionarea și configurarea mediilor
- Înțelege configurațiile avansate azure.yaml
- Implementează setări și variabile specifice mediului
- Configurează autentificarea pentru diferite scenarii

#### Concepte Cheie de Stăpânit
- Ierarhia mediilor și precedența variabilelor
- Configurarea serviciilor și parametrilor
- Hook-uri și evenimente de ciclu de viață
- Metode de autentificare (utilizator, service principal, managed identity)
- Gestionarea fișierelor de configurare

#### Exerciții Practice

**Exercițiul 2.1: Configurare Multi-Mediu**  
```bash
# Create and configure multiple environments:
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

**Exercițiul 2.3: Configurare de Securitate**  
```bash
# Implement security best practices:
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

### Modulul 3: Implementare și Provizionare (Săptămâna 4)

#### Obiective de Învățare
- Stăpânește fluxurile de lucru și cele mai bune practici de implementare
- Înțelege Infrastructure as Code cu șabloane Bicep
- Implementează arhitecturi complexe multi-servicii
- Optimizează performanța și fiabilitatea implementării

#### Concepte Cheie de Stăpânit
- Structura și modulele șabloanelor Bicep
- Dependențele și ordonarea resurselor
- Strategii de implementare (blue-green, actualizări progresive)
- Implementări multi-regiune
- Migrarea bazelor de date și gestionarea datelor

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

**Exercițiul 3.2: Aplicație Multi-Servicii**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercițiul 3.3: Integrare Bază de Date**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Întrebări de Autoevaluare
1. Care sunt avantajele utilizării Bicep în loc de șabloane ARM?
2. Cum gestionezi migrarea bazelor de date în implementările azd?
3. Ce strategii există pentru implementări fără întreruperi?
4. Cum gestionezi dependențele între servicii?
5. Care sunt considerațiile pentru implementările multi-regiune?

### Modulul 4: Validare Pre-Implementare (Săptămâna 5)

#### Obiective de Învățare
- Implementează verificări cuprinzătoare înainte de implementare
- Stăpânește planificarea capacității și validarea resurselor
- Înțelege selecția SKU-urilor și optimizarea costurilor
- Construiește pipeline-uri automate de validare

#### Concepte Cheie de Stăpânit
- Cote și limite ale resurselor Azure
- Criterii de selecție a SKU-urilor și implicații de cost
- Scripturi și instrumente automate de validare
- Metodologii de planificare a capacității
- Testarea și optimizarea performanței

#### Exerciții Practice

**Exercițiul 4.1: Planificarea Capacității**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercițiul 4.2: Validare Pre-Implementare**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercițiul 4.3: Optimizarea SKU-urilor**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Întrebări de Autoevaluare
1. Ce factori ar trebui să influențeze deciziile de selecție a SKU-urilor?
2. Cum validezi disponibilitatea resurselor Azure înainte de implementare?
3. Care sunt componentele cheie ale unui sistem de verificare pre-implementare?
4. Cum estimezi și controlezi costurile implementării?
5. Ce monitorizare este esențială pentru planificarea capacității?

### Modulul 5: Depanare și Debugging (Săptămâna 6)

#### Obiective de Învățare
- Stăpânește metodologii sistematice de depanare
- Dezvoltă expertiză în debugging-ul problemelor complexe de implementare
- Implementează monitorizare și alerte cuprinzătoare
- Construiește proceduri de răspuns și recuperare în caz de incidente

#### Concepte Cheie de Stăpânit
- Modele comune de eșec al implementării
- Tehnici de analiză și corelare a jurnalelor
- Monitorizare și optimizare a performanței
- Detectarea și răspunsul la incidente de securitate
- Recuperare în caz de dezastru și continuitate a afacerii

#### Exerciții Practice

**Exercițiul 5.1: Scenarii de Depanare**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercițiul 5.2: Implementarea Monitorizării**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercițiul 5.3: Răspuns la Incidente**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Întrebări de Autoevaluare
1. Care este abordarea sistematică pentru depanarea implementărilor azd?
2. Cum corelezi jurnalele între mai multe servicii și resurse?
3. Ce metrici de monitorizare sunt cele mai critice pentru detectarea timpurie a problemelor?
4. Cum implementezi proceduri eficiente de recuperare în caz de dezastru?
5. Care sunt componentele cheie ale unui plan de răspuns la incidente?

### Modulul 6: Subiecte Avansate și Cele Mai Bune Practici (Săptămânile 7-8)

#### Obiective de Învățare
- Implementează modele de implementare la nivel enterprise
- Stăpânește integrarea și automatizarea CI/CD
- Dezvoltă șabloane personalizate și contribuie la comunitate
- Înțelege cerințele avansate de securitate și conformitate

#### Concepte Cheie de Stăpânit
- Modele de integrare a pipeline-urilor CI/CD
- Dezvoltarea și distribuirea șabloanelor personalizate
- Guvernanță și conformitate la nivel enterprise
- Configurații avansate de rețea și securitate
- Optimizarea performanței și gestionarea costurilor

#### Exerciții Practice

**Exercițiul 6.1: Integrare CI/CD**  
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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercițiul 6.3: Implementare la Nivel Enterprise**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Întrebări de Autoevaluare
1. Cum integrezi azd în fluxurile de lucru CI/CD existente?
2. Care sunt considerațiile cheie pentru dezvoltarea șabloanelor personalizate?
3. Cum implementezi guvernanța și conformitatea în implementările azd?
4. Care sunt cele mai bune practici pentru implementările la scară enterprise?
5. Cum contribui eficient la comunitatea azd?
3. **Contribuie la Open Source**: Împărtășește șabloanele și soluțiile tale cu comunitatea  
4. **Învață pe alții**: Explicarea conceptelor altora îți consolidează propria înțelegere  
5. **Fii curios**: Explorează continuu servicii noi Azure și modele de integrare  

---

**Navigare**  
- **Lecția anterioară**: [FAQ](faq.md)  
- **Lecția următoare**: [Changelog](../changelog.md)  

**Urmărirea progresului de studiu**: Folosește acest ghid pentru a-ți urmări parcursul de învățare și pentru a asigura acoperirea completă a tuturor conceptelor și practicilor Azure Developer CLI.  

---

**Declinarea responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.