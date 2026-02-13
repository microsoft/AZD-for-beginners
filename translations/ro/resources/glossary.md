# Glosar - Terminologie Azure și AZD

**Referință pentru toate capitolele**
- **📚 Pagina cursului**: [AZD pentru începători](../README.md)
- **📖 Învățare bazică**: [Capitolul 1: Bazele AZD](../docs/getting-started/azd-basics.md)
- **🤖 Termeni AI**: [Capitolul 2: Dezvoltare AI-First](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introducere

Acest glosar cuprinzător oferă definiții pentru termeni, concepte și acronime utilizate în Azure Developer CLI și dezvoltarea cloud Azure. Referință esențială pentru înțelegerea documentației tehnice, depanarea problemelor și comunicarea eficientă despre proiectele azd și serviciile Azure.

## Obiective de învățare

Folosind acest glosar, vei:
- Înțelege terminologia și conceptele esențiale Azure Developer CLI
- Stăpâni vocabularul și termenii tehnici ai dezvoltării cloud Azure
- Consulta eficient terminologia pentru Infrastructure as Code și implementare
- Înțelege denumirile serviciilor Azure, acronimele și scopurile acestora
- Accesa definiții pentru terminologia de depanare și debug
- Învața concepte avansate de arhitectură și dezvoltare Azure

## Rezultate învățare

Cu consultarea regulată a acestui glosar, vei putea:
- Comunica eficient utilizând terminologia corectă Azure Developer CLI
- Înțelege mai clar documentația tehnică și mesajele de eroare
- Naviga cu încredere printre serviciile și conceptele Azure
- Depana probleme folosind vocabular tehnic adecvat
- Contribui la discuțiile în echipă cu un limbaj tehnic precis
- Extinde sistematic cunoștințele despre dezvoltarea cloud Azure

## A

**ARM Template**  
Șablon Azure Resource Manager. Format Infrastructure as Code bazat pe JSON folosit pentru definirea și implementarea resurselor Azure în mod declarativ.

**App Service**  
Oferta platformă ca serviciu (PaaS) Azure pentru găzduirea aplicațiilor web, API-urilor REST și backend-urilor mobile fără gestionarea infrastructurii.

**Application Insights**  
Serviciul Azure pentru monitorizarea performanței aplicațiilor (APM) care oferă perspective detaliate asupra performanței, disponibilității și utilizării aplicațiilor.

**Azure CLI**  
Interfață de linie de comandă pentru gestionarea resurselor Azure. Utilizată de azd pentru autentificare și unele operațiuni.

**Azure Developer CLI (azd)**  
Unealtă de linie de comandă concentrată pe dezvoltatori care accelerează procesul de construire și implementare a aplicațiilor pe Azure folosind șabloane și Infrastructure as Code.

**azure.yaml**  
Fișierul principal de configurație pentru un proiect azd care definește servicii, infrastructură și hook-uri de implementare.

**Azure Resource Manager (ARM)**  
Serviciul Azure pentru implementare și management care oferă un strat de gestionare pentru crearea, actualizarea și ștergerea resurselor.

## B

**Bicep**  
Limbaj specific domeniului (DSL) dezvoltat de Microsoft pentru implementarea resurselor Azure. Oferă o sintaxă mai simplă decât șabloanele ARM, compilând spre acestea.

**Build**  
Procesul de compilare a codului sursă, instalare a dependențelor și pregătire a aplicațiilor pentru implementare.

**Blue-Green Deployment**  
Strategie de implementare care utilizează două medii de producție identice (albastru și verde) pentru a minimiza timpul de nefuncționare și riscul.

## C

**Container Apps**  
Serviciu Azure serverless pentru containere care permite rularea aplicațiilor containerizate fără gestionarea infrastructurii complexe.

**CI/CD**  
Integrare continuă/Implementare continuă. Practici automate pentru integrarea schimbărilor de cod și implementarea aplicațiilor.

**Cosmos DB**  
Serviciu de baze de date multimodel, distribuit global, care oferă SLA-uri cuprinzătoare pentru debit, latență, disponibilitate și consistență.

**Configuration**  
Setări și parametri ce controlează comportamentul aplicațiilor și opțiunile de implementare.

## D

**Deployment**  
Procesul de instalare și configurare a aplicațiilor și dependențelor lor pe infrastructura țintă.

**Docker**  
Platformă pentru dezvoltarea, livrarea și rularea aplicațiilor folosind tehnologia containerizării.

**Dockerfile**  
Fișier text care conține instrucțiuni pentru construirea unei imagini Docker.

## E

**Environment**  
Țintă de implementare care reprezintă o instanță specifică a aplicației tale (ex. dezvoltare, testare, producție).

**Environment Variables**  
Valori de configurare stocate ca perechi cheie-valoare accesibile aplicațiilor la rulare.

**Endpoint**  
URL sau adresă de rețea unde o aplicație sau serviciu poate fi accesat.

## F

**Function App**  
Serviciu Azure serverless care permite rularea de cod declanșat de evenimente fără gestionarea infrastructurii.

## G

**GitHub Actions**  
Platformă CI/CD integrată cu depozitele GitHub pentru automatizarea fluxurilor de lucru.

**Git**  
Sistem distribuit de control al versiunilor folosit pentru urmărirea modificărilor în codul sursă.

## H

**Hooks**  
Scripturi sau comenzi personalizate care rulează în puncte specifice ale ciclului de viață al implementării (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipul serviciului Azure unde se va implementa o aplicație (ex. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Practica de definire și gestionare a infrastructurii prin cod în loc de procese manuale.

**Init**  
Procesul de inițializare a unui proiect azd nou, de obicei dintr-un șablon.

## J

**JSON**  
JavaScript Object Notation. Format pentru schimb de date folosit frecvent în fișiere de configurare și răspunsuri API.

**JWT**  
JSON Web Token. Standard pentru transmiterea sigură a informațiilor între părți sub formă de obiect JSON.

## K

**Key Vault**  
Serviciu Azure pentru stocarea sigură și gestionarea secretelor, cheilor și certificatelor.

**Kusto Query Language (KQL)**  
Limbaj de interogare folosit pentru analiza datelor în Azure Monitor, Application Insights și alte servicii Azure.

## L

**Load Balancer**  
Serviciu care distribuie traficul de rețea primit către mai multe servere sau instanțe.

**Log Analytics**  
Serviciu Azure pentru colectarea, analizarea și acționarea asupra datelor de telemetrie din medii cloud și on-premises.

## M

**Managed Identity**  
Funcționalitate Azure care oferă serviciilor Azure o identitate gestionată automat pentru autentificarea către alte servicii Azure.

**Microservices**  
Abordare arhitecturală în care aplicațiile sunt construite ca o colecție de servicii mici, independente.

**Monitor**  
Soluția unificată de monitorizare Azure care oferă observabilitate completă la nivel de aplicații și infrastructură.

## N

**Node.js**  
Mediu de execuție JavaScript construit pe motorul V8 al Chrome pentru dezvoltarea aplicațiilor server-side.

**npm**  
Manager de pachete pentru Node.js care gestionează dependențele și pachetele.

## O

**Output**  
Valori returnate din implementarea infrastructurii care pot fi folosite de aplicații sau alte resurse.

## P

**Package**  
Procesul de pregătire a codului aplicației și a dependențelor pentru implementare.

**Parameters**  
Valori de intrare transmise către șabloanele de infrastructură pentru a personaliza implementările.

**PostgreSQL**  
Sistem open-source de baze de date relaționale suportat ca serviciu gestionat în Azure.

**Provisioning**  
Procesul de creare și configurare a resurselor Azure definite în șabloanele de infrastructură.

## Q

**Quota**  
Limitele cantitative privind resursele ce pot fi create într-un abonament sau regiune Azure.

## R

**Resource Group**  
Container logic pentru resurse Azure care partajează același ciclu de viață, permisiuni și politici.

**Resource Token**  
Șir unic generat de azd pentru a asigura unicitatea numelor resurselor în implementări.

**REST API**  
Stil arhitectural pentru proiectarea aplicațiilor rețea folosind metode HTTP.

**Rollback**  
Procesul de revenire la o versiune anterioară a unei aplicații sau configurații infrastructurale.

## S

**Service**  
Componentă a aplicației definite în azure.yaml (ex. frontend web, backend API, bază de date).

**SKU**  
Stock Keeping Unit. Reprezintă diferite niveluri de serviciu sau performanță pentru resurse Azure.

**SQL Database**  
Serviciu de baze de date relaționale gestionat Azure bazat pe Microsoft SQL Server.

**Static Web Apps**  
Serviciu Azure pentru construirea și implementarea aplicațiilor web full-stack din depozite sursă.

**Storage Account**  
Serviciu Azure care oferă stocare cloud pentru obiecte de date incluzând bloburi, fișiere, cozi și tabele.

**Subscription**  
Container de cont Azure care conține grupuri de resurse și resurse, cu facturare și management acces asociat.

## T

**Template**  
Structură de proiect predefinită care conține cod aplicație, definiții de infrastructură și configurație pentru scenarii comune.

**Terraform**  
Unealtă open-source Infrastructure as Code care suportă mai mulți provideri cloud inclusiv Azure.

**Traffic Manager**  
Balancer de trafic DNS Azure pentru distribuirea traficului între regiuni Azure globale.

## U

**URI**  
Uniform Resource Identifier. Șir care identifică o resursă anume.

**URL**  
Uniform Resource Locator. Tip de URI care specifică unde este localizată o resursă și cum poate fi accesată.

## V

**Virtual Network (VNet)**  
Element fundamental pentru rețele private în Azure, oferind izolare și segmentare.

**VS Code**  
Visual Studio Code. Editor de cod popular cu integrare excelentă Azure și azd.

## W

**Webhook**  
Callback HTTP declanșat de evenimente specifice, folosit frecvent în pipeline-uri CI/CD.

**What-if**  
Funcționalitate Azure care arată ce schimbări ar fi făcute de o implementare fără a o executa efectiv.

## Y

**YAML**  
YAML Ain't Markup Language. Standard de serializare a datelor ușor de citit folosit pentru fișiere de configurare precum azure.yaml.

## Z

**Zone**  
Locații fizic separate în cadrul unei regiuni Azure care oferă redundanță și înaltă disponibilitate.

---

## Acronime comune

| Acronim | Formă completă | Descriere |
|---------|----------------|-----------|
| AAD | Azure Active Directory | Serviciu de identitate și gestionare a accesului |
| ACR | Azure Container Registry | Serviciu de registry pentru imagini container |
| AKS | Azure Kubernetes Service | Serviciu gestionat Kubernetes |
| API | Application Programming Interface | Set de protocoale pentru construire software |
| ARM | Azure Resource Manager | Serviciu Azure pentru implementare și management |
| CDN | Content Delivery Network | Rețea distribuită de servere |
| CI/CD | Continuous Integration/Continuous Deployment | Practici automate de dezvoltare |
| CLI | Command Line Interface | Interfață text bazată pe comenzi |
| DNS | Domain Name System | Sistem pentru traducerea numelor de domenii în adrese IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versiune securizată a HTTP |
| IaC | Infrastructure as Code | Gestionarea infrastructurii prin cod |
| JSON | JavaScript Object Notation | Format de schimb de date |
| JWT | JSON Web Token | Format token pentru transmitere securizată a informațiilor |
| KQL | Kusto Query Language | Limbaj de interogare pentru serviciile de date Azure |
| RBAC | Role-Based Access Control | Metodă de control al accesului în funcție de roluri |
| REST | Representational State Transfer | Stil arhitectural pentru servicii web |
| SDK | Software Development Kit | Colecție de unelte pentru dezvoltare |
| SLA | Service Level Agreement | Angajament privind disponibilitatea/perfomanța serviciului |
| SQL | Structured Query Language | Limbaj pentru gestionarea bazelor de date relaționale |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocoale criptografice |
| URI | Uniform Resource Identifier | Șir care identifică o resursă |
| URL | Uniform Resource Locator | Tip de URI care specifică locația unei resurse |
| VM | Virtual Machine | Emulare a unui sistem de calcul |
| VNet | Virtual Network | Rețea privată în Azure |
| YAML | YAML Ain't Markup Language | Standard de serializare a datelor |

---

## Asocieri denumiri servicii Azure

| Denumire comună | Denumire oficială serviciu Azure | Tip gazdă azd |
|-----------------|----------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Termeni specific contextului

### Termeni de dezvoltare
- **Hot Reload**: Actualizarea automată a aplicațiilor în timpul dezvoltării fără repornire
- **Build Pipeline**: Proces automatizat pentru construire și testare cod
- **Deployment Slot**: Mediu de testare în cadrul unui App Service
- **Environment Parity**: Menținerea similitudinii între mediile de dezvoltare, testare și producție

### Termeni de securitate
- **Managed Identity**: Funcționalitate Azure ce oferă gestionare automată de acreditări
- **Key Vault**: Stocare sigură pentru secrete, chei și certificate
- **RBAC**: Control al accesului bazat pe roluri pentru resurse Azure
- **Network Security Group**: Firewall virtual pentru controlul traficului de rețea

### Termeni de monitorizare
- **Telemetry**: Colectare automatizată a măsurătorilor și datelor
- **Application Performance Monitoring (APM)**: Monitorizarea performanței software
- **Log Analytics**: Serviciu pentru colectare și analiză date de log
- **Alert Rules**: Notificări automate bazate pe metrici sau condiții

### Termeni de implementare
- **Blue-Green Deployment**: Strategie de implementare fără timp de nefuncționare
- **Canary Deployment**: Lansare graduală către un subset de utilizatori
- **Rolling Update**: Înlocuire secvențială a instanțelor aplicației
- **Rollback**: Revenire la o versiune anterioară a aplicației

---

**Sfat de utilizare**: Folosește `Ctrl+F` pentru a căuta rapid termeni specifici în acest glosar. Termenii sunt întrețesuți unde este relevant.

---

**Navigare**
- **Lecția anterioară**: [Fișă de referință](cheat-sheet.md)
- **Lecția următoare**: [Întrebări frecvente](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus utilizând serviciul de traducere automată AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->