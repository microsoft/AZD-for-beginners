# Glosar - Terminologie Azure și AZD

**Referință pentru toate capitolele**
- **📚 Acasă Curs**: [AZD Pentru Începători](../README.md)
- **📖 Învață Bazele**: [Capitolul 1: Bazele AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Termeni AI**: [Capitolul 2: Dezvoltare cu Prioritate AI](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducere

Acest glosar cuprinzător oferă definiții pentru termeni, concepte și acronime utilizate în Azure Developer CLI și dezvoltarea în cloud Azure. Referință esențială pentru înțelegerea documentației tehnice, depanarea problemelor și comunicarea eficientă despre proiectele azd și serviciile Azure.

## Obiective de Învățare

Folosind acest glosar, vei:
- Înțelege terminologia și conceptele esențiale Azure Developer CLI
- Stăpâni vocabularul și termenii tehnici pentru dezvoltarea în cloud Azure
- Referi eficient terminologia Infrastructurii ca Cod și a desfășurării
- Înțelege numele serviciilor Azure, acronimele și scopurile lor
- Accesa definiții pentru terminologia depanării și diagnosticării
- Învață concepte avansate de arhitectură și dezvoltare Azure

## Rezultate așteptate

Cu referință regulată la acest glosar, vei putea:
- Comunica eficient folosind terminologia corectă Azure Developer CLI
- Înțelege clar documentația tehnică și mesajele de eroare
- Naviga cu încredere prin serviciile și conceptele Azure
- Depana probleme folosind vocabular tehnic adecvat
- Contribui la discuții de echipă cu limbaj tehnic corect
- Extinde sistematic cunoștințele despre dezvoltarea în cloud Azure

## A

**ARM Template**  
Template Azure Resource Manager. Format Infrastructure as Code bazat pe JSON utilizat pentru a defini și desfășura resurse Azure declarativ.

**App Service**  
Oferta platformă ca serviciu (PaaS) Azure pentru găzduirea aplicațiilor web, API-urilor REST și backend-urilor mobile fără gestionarea infrastructurii.

**Application Insights**  
Serviciul Azure de monitorizare a performanței aplicațiilor (APM) care oferă informații detaliate despre performanța, disponibilitatea și utilizarea aplicațiilor.

**Azure CLI**  
Interfață în linie de comandă pentru gestionarea resurselor Azure. Completează AZD, dar are un login separat; autentificarea principală AZD folosește `azd auth login`.

**Azure Developer CLI (azd)**  
Instrument în linie de comandă pentru dezvoltatori care accelerează procesul de construire și desfășurare a aplicațiilor în Azure folosind template-uri și Infrastructure as Code.

**azure.yaml**  
Fișierul principal de configurare pentru un proiect azd care definește servicii, infrastructură și hook-uri de desfășurare.

**Azure Resource Manager (ARM)**  
Serviciul Azure de desfășurare și gestionare care oferă un strat de management pentru crearea, actualizarea și ștergerea resurselor.

## B

**Bicep**  
Limbaj specific domeniului (DSL) dezvoltat de Microsoft pentru desfășurarea resurselor Azure. Oferă o sintaxă mai simplă decât template-urile ARM, compilând spre ARM.

**Build**  
Procesul de compilare a codului sursă, instalare a dependențelor și pregătire a aplicațiilor pentru desfășurare.

**Blue-Green Deployment**  
Strategie de desfășurare care folosește două medii de producție identice (albastru și verde) pentru a minimiza timpul de nefuncționare și riscul.

## C

**Container Apps**  
Serviciul serverless de containere Azure care permite rularea aplicațiilor containerizate fără gestionarea infrastructurii complexe.

**CI/CD**  
Integrare Continuă/Desfășurare Continuă. Practici automatizate pentru integrarea modificărilor de cod și desfășurarea aplicațiilor.

**Cosmos DB**  
Serviciul global distribuit Azure multi-model de baze de date care oferă SLA-uri cuprinzătoare pentru throughput, latență, disponibilitate și consistență.

**Configuration**  
Setări și parametri care controlează comportamentul aplicației și opțiunile de desfășurare.

## D

**Deployment**  
Procesul de instalare și configurare a aplicațiilor și a dependențelor lor pe infrastructura țintă.

**Docker**  
Platformă pentru dezvoltarea, distribuirea și rularea aplicațiilor utilizând tehnologia containerizării.

**Dockerfile**  
Fișier text ce conține instrucțiuni pentru construirea unei imagini Docker pentru un container.

## E

**Environment**  
Ținta de desfășurare care reprezintă o instanță specifică a aplicației tale (ex: dezvoltare, testare, producție).

**Environment Variables**  
Valori de configurare stocate ca perechi cheie-valoare pe care aplicațiile le pot accesa în timpul rulării.

**Endpoint**  
URL sau adresă de rețea unde o aplicație sau un serviciu poate fi accesat.

## F

**Function App**  
Serviciul Azure serverless de calcul care permite rularea de cod declanșat de evenimente fără gestionarea infrastructurii.

## G

**GitHub Actions**  
Platforma CI/CD integrată cu depozitele GitHub pentru automatizarea fluxurilor de lucru.

**Git**  
Sistem distribuit de control al versiunilor folosit pentru urmărirea modificărilor în codul sursă.

## H

**Hooks**  
Scripturi sau comenzi personalizate care rulează în puncte specifice ale ciclului de viață al desfășurării (preprovisionare, postprovisionare, predesfășurare, postdesfășurare).

**Host**  
Tipul serviciului Azure unde o aplicație va fi desfășurată (ex: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Practica de definire și gestionare a infrastructurii prin cod în loc de procese manuale.

**Init**  
Procesul de inițializare a unui proiect nou azd, de obicei dintr-un șablon.

## J

**JSON**  
JavaScript Object Notation. Format de schimb de date utilizat frecvent pentru fișiere de configurare și răspunsuri API.

**JWT**  
JSON Web Token. Standard pentru transmiterea securizată a informațiilor între părți ca obiect JSON.

## K

**Key Vault**  
Serviciul Azure pentru stocarea și gestionarea sigură a secretelor, cheilor și certificatelor.

**Kusto Query Language (KQL)**  
Limbaj de interogare folosit pentru analiza datelor în Azure Monitor, Application Insights și alte servicii Azure.

## L

**Load Balancer**  
Serviciu care distribuie traficul de rețea primit pe mai multe servere sau instanțe.

**Log Analytics**  
Serviciu Azure pentru colectarea, analizarea și acționarea asupra datelor de telemetrie din medii cloud și on-premises.

## M

**Managed Identity**  
Funcție Azure care oferă serviciilor Azure o identitate gestionată automat pentru autentificarea către alte servicii Azure.

**Microservices**  
Abordare arhitecturală în care aplicațiile sunt construite ca o colecție de servicii mici, independente.

**Monitor**  
Soluția unificată de monitorizare Azure care oferă observabilitate completă la nivel de aplicații și infrastructură.

## N

**Node.js**  
Runtime JavaScript construit pe motorul Chrome V8 pentru construirea aplicațiilor server-side.

**npm**  
Manager de pachete pentru Node.js care gestionează dependențele și pachetele.

## O

**Output**  
Valori returnate de la desfășurarea infrastructurii ce pot fi utilizate de aplicații sau alte resurse.

## P

**Package**  
Procesul de pregătire a codului aplicației și a dependențelor pentru desfășurare.

**Parameters**  
Valori de intrare transmise șabloanelor de infrastructură pentru personalizarea desfășurărilor.

**PostgreSQL**  
Sistem open-source de baze de date relaționale, suportat ca serviciu gestionat în Azure.

**Provisioning**  
Procesul de creare și configurare a resurselor Azure definite în șabloanele de infrastructură.

## Q

**Quota**  
Limite privind cantitatea de resurse ce pot fi create într-un abonament sau regiune Azure.

## R

**Resource Group**  
Container logic pentru resurse Azure care împart același ciclu de viață, permisiuni și politici.

**Resource Token**  
Șir unic generat de azd pentru a asigura unicitatea numelor resurselor între desfășurări.

**REST API**  
Stil arhitectural pentru proiectarea aplicațiilor în rețea folosind metode HTTP.

**Rollback**  
Proces de revenire la o versiune anterioară a aplicației sau configurației infrastructurii.

## S

**Service**  
Componentă a aplicației tale definită în azure.yaml (ex: frontend web, backend API, bază de date).

**SKU**  
Stock Keeping Unit. Reprezintă diferite niveluri de serviciu sau performanță pentru resurse Azure.

**SQL Database**  
Serviciul relațional gestionat Azure bazat pe Microsoft SQL Server.

**Static Web Apps**  
Serviciu Azure pentru construire și desfășurare de aplicații web full-stack din depozite de cod sursă.

**Storage Account**  
Serviciu Azure care oferă stocare în cloud pentru obiecte de date precum blob-uri, fișiere, cozi și tabele.

**Subscription**  
Container de cont Azure care conține grupuri de resurse și resurse, cu facturare și gestionare a accesului asociate.

## T

**Template**  
Structură de proiect preconstruită ce conține codul aplicației, definiții de infrastructură și configurații pentru scenarii comune.

**Terraform**  
Unealtă open-source Infrastructure as Code care suportă mai mulți furnizori cloud, inclusiv Azure.

**Traffic Manager**  
Load balancer DNS Azure pentru distribuirea traficului între regiuni Azure globale.

## U

**URI**  
Uniform Resource Identifier. Șir care identifică un anumit resource.

**URL**  
Uniform Resource Locator. Tip de URI care specifică locația unei resurse și cum poate fi accesată.

## V

**Virtual Network (VNet)**  
Element de bază pentru rețele private în Azure, oferind izolare și segmentare.

**VS Code**  
Visual Studio Code. Editor de cod popular cu integrare excelentă Azure și azd.

## W

**Webhook**  
Callback HTTP declanșat de evenimente specifice, frecvent folosit în pipeline-uri CI/CD.

**What-if**  
Funcție Azure care arată ce modificări ar fi făcute de o desfășurare fără a o executa efectiv.

## Y

**YAML**  
YAML Ain't Markup Language. Standard de serializare a datelor ușor de citit pentru oameni, folosit pentru fișiere de configurare precum azure.yaml.

## Z

**Zone**  
Locații fizic separate într-o regiune Azure care oferă redundanță și disponibilitate ridicată.

---

## Acronime Comune

| Acronim | Formă Completă | Descriere |
|---------|-----------|-------------|
| AAD | Azure Active Directory (acum Microsoft Entra ID) | Serviciu de gestionare identitate și acces |
| ACR | Azure Container Registry | Serviciu de registru de imagini container |
| AKS | Azure Kubernetes Service | Serviciu Kubernetes gestionat |
| API | Application Programming Interface | Set de protocoale pentru construirea software-ului |
| ARM | Azure Resource Manager | Serviciu Azure de desfășurare și management |
| CDN | Content Delivery Network | Rețea distribuită de servere |
| CI/CD | Continuous Integration/Continuous Deployment | Practici automatizate de dezvoltare |
| CLI | Command Line Interface | Interfață text bazată pe comandă |
| DNS | Domain Name System | Sistem de traducere a numelor de domenii în adrese IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versiune securizată a HTTP |
| IaC | Infrastructure as Code | Gestionarea infrastructurii prin cod |
| JSON | JavaScript Object Notation | Format de schimb de date |
| JWT | JSON Web Token | Format token pentru transmiterea securizată a informațiilor |
| KQL | Kusto Query Language | Limbaj de interogare pentru serviciile Azure de date |
| RBAC | Role-Based Access Control | Metodă de control al accesului pe roluri |
| REST | Representational State Transfer | Stil arhitectural pentru servicii web |
| SDK | Software Development Kit | Colecție de unelte de dezvoltare |
| SLA | Service Level Agreement | Angajament privind disponibilitatea/performance-ul serviciului |
| SQL | Structured Query Language | Limbaj pentru gestionarea bazelor de date relaționale |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocoale criptografice |
| URI | Uniform Resource Identifier | Șir care identifică o resursă |
| URL | Uniform Resource Locator | Tip de URI care specifică locația resursei |
| VM | Virtual Machine | Emulare a unui sistem de calcul |
| VNet | Virtual Network | Rețea privată în Azure |
| YAML | YAML Ain't Markup Language | Standard de serializare a datelor |

---

## Mapări pentru Numele Serviciilor Azure

| Nume Comun | Numele Oficial Al Serviciului Azure | Tip Host azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Resursă infrastructură, nu o aplicație `host` |
| NoSQL DB | Azure Cosmos DB | Resursă infrastructură, nu o aplicație `host` |
| Storage | Azure Storage Account | Resursă infrastructură, nu o aplicație integrată `host` |
| Cache | Azure Managed Redis | Resursă infrastructură, nu o aplicație `host` |
| Search | Azure AI Search | Resursă infrastructură, nu o aplicație `host` |
| Messaging | Azure Service Bus | Resursă infrastructură, nu o aplicație `host` |

`services.<name>.host` selectează o țintă de desfășurare a aplicației; nu este o prescurtare pentru niciun tip de resursă Azure. Bazele de date, cache-urile, serviciile de căutare și cozile sunt de obicei provisionate prin furnizorul de infrastructură și conectate la aplicație prin output-uri/configurație.

---

## Termeni Specifici Contextului

### Termeni de Dezvoltare
- **Hot Reload**: Actualizarea automată a aplicațiilor în timpul dezvoltării fără repornire
- **Build Pipeline**: Proces automatizat pentru construirea și testarea codului
- **Deployment Slot**: Mediu de testare în cadrul unui App Service
- **Environment Parity**: Menținerea similitudinii între mediile de dezvoltare, testare și producție

### Termeni de Securitate
- **Managed Identity**: Funcție Azure care oferă gestionarea automată a credentialelor
- **Key Vault**: Stocare sigură pentru secrete, chei și certificate
- **RBAC**: Control al accesului bazat pe roluri pentru resursele Azure
- **Network Security Group**: Firewall virtual pentru controlul traficului de rețea

### Termeni de Monitorizare
- **Telemetry**: Colectare automată de măsurători și date
- **Application Performance Monitoring (APM)**: Monitorizarea performanței software-ului
- **Log Analytics**: Serviciu pentru colectarea și analizarea datelor de log
- **Alert Rules**: Notificări automate bazate pe metrici sau condiții

### Termeni de Desfășurare
- **Blue-Green Deployment**: Strategie de desfășurare fără timp de nefuncționare
- **Canary Deployment**: Rulare graduală la un subset de utilizatori
- **Rolling Update**: Înlocuire secvențială a instanțelor aplicației
- **Rollback**: Revenirea la o versiune anterioară a aplicației

---

**Sfat de Utilizare**: Folosește `Ctrl+F` pentru a căuta rapid termeni specifici în acest glosar. Termenii sunt inter-referențiați acolo unde este cazul.

---

**Navigație**
- **Lecția Anterioară**: [Fișă Rapidă](cheat-sheet.md)
- **Lecția Următoare**: [Întrebări Frecvente](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->