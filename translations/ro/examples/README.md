<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-10T07:01:01+00:00",
  "source_file": "examples/README.md",
  "language_code": "ro"
}
-->
# Exemple - Șabloane și Configurații Practice AZD

## Introducere

Acest director conține exemple practice, șabloane și scenarii reale pentru a te ajuta să înveți Azure Developer CLI prin practică. Fiecare exemplu oferă cod complet funcțional, șabloane de infrastructură și instrucțiuni detaliate pentru diferite arhitecturi de aplicații și modele de implementare.

## Obiective de Învățare

Lucrând prin aceste exemple, vei:
- Exersa fluxurile de lucru Azure Developer CLI cu scenarii realiste de aplicații
- Înțelege diferite arhitecturi de aplicații și implementările lor în azd
- Stăpâni modelele Infrastructure as Code pentru diverse servicii Azure
- Aplica strategii de gestionare a configurațiilor și implementări specifice mediului
- Implementa modele de monitorizare, securitate și scalare în contexte practice
- Dobândi experiență în depanarea și rezolvarea problemelor reale de implementare

## Rezultate de Învățare

După finalizarea acestor exemple, vei putea:
- Implementa cu încredere diverse tipuri de aplicații folosind Azure Developer CLI
- Adapta șabloanele furnizate la cerințele proprii ale aplicației tale
- Proiecta și implementa modele personalizate de infrastructură folosind Bicep
- Configura aplicații complexe multi-servicii cu dependențe corecte
- Aplica cele mai bune practici de securitate, monitorizare și performanță în scenarii reale
- Depana și optimiza implementările bazate pe experiență practică

## Structura Directorului

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Exemple de Start Rapid

### Pentru Începători
1. **[Aplicație Web Simplă](../../../examples/simple-web-app)** - Implementarea unei aplicații web de bază Node.js
2. **[Website Static](../../../examples/static-website)** - Găzduirea unui website static pe Azure Storage
3. **[Aplicație Container](../../../examples/container-app)** - Implementarea unei aplicații containerizate

### Pentru Utilizatori Intermediari
4. **[Aplicație cu Bază de Date](../../../examples/database-app)** - Aplicație web cu baza de date PostgreSQL
5. **[Funcție Serverless](../../../examples/serverless-function)** - Funcții Azure cu declanșatori HTTP
6. **[Microservicii](../../../examples/microservices)** - Aplicație multi-servicii cu API gateway

## 📋 Instrucțiuni de Utilizare

### Rularea Exemplelor Local

1. **Clonează sau Copiază Exemplul**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inițializează Mediul AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configurează Mediul**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implementează**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adaptarea Exemplelor

Fiecare exemplu include:
- **README.md** - Instrucțiuni detaliate de configurare și personalizare
- **azure.yaml** - Configurație AZD cu comentarii
- **infra/** - Șabloane Bicep cu explicații ale parametrilor
- **src/** - Cod de aplicație exemplu
- **scripts/** - Scripturi ajutătoare pentru sarcini comune

## 🎯 Obiective de Învățare

### Categorii de Exemple

#### **Implementări de Bază**
- Aplicații cu un singur serviciu
- Modele simple de infrastructură
- Gestionarea de bază a configurațiilor
- Configurații economice pentru dezvoltare

#### **Scenarii Avansate**
- Arhitecturi multi-servicii
- Configurații complexe de rețea
- Modele de integrare a bazelor de date
- Implementări de securitate și conformitate

#### **Modele Pregătite pentru Producție**
- Configurații de înaltă disponibilitate
- Monitorizare și observabilitate
- Integrare CI/CD
- Configurații pentru recuperare în caz de dezastru

## 📖 Descrierea Exemplelor

### Aplicație Web Simplă
**Tehnologii**: Node.js, App Service, Application Insights  
**Complexitate**: Începător  
**Concepte**: Implementare de bază, variabile de mediu, verificări de sănătate

### Website Static
**Tehnologii**: HTML/CSS/JS, Storage Account, CDN  
**Complexitate**: Începător  
**Concepte**: Găzduire statică, integrare CDN, domenii personalizate

### Aplicație Container
**Tehnologii**: Docker, Container Apps, Container Registry  
**Complexitate**: Intermediar  
**Concepte**: Containerizare, scalare, configurare ingress

### Aplicație cu Bază de Date
**Tehnologii**: Python Flask, PostgreSQL, App Service  
**Complexitate**: Intermediar  
**Concepte**: Conexiuni la baza de date, gestionarea secretelor, migrații

### Funcție Serverless
**Tehnologii**: Azure Functions, Cosmos DB, API Management  
**Complexitate**: Intermediar  
**Concepte**: Arhitectură bazată pe evenimente, legături, gestionarea API-urilor

### Microservicii
**Tehnologii**: Servicii multiple, Service Bus, API Gateway  
**Complexitate**: Avansat  
**Concepte**: Comunicare între servicii, cozi de mesaje, echilibrare a încărcării

## 🛠 Exemple de Configurații

Directorul `configurations/` conține componente reutilizabile:

### Configurații de Mediu
- Setări pentru mediu de dezvoltare
- Configurații pentru mediu de testare
- Configurații pregătite pentru producție
- Configurații pentru implementări multi-regiune

### Module Bicep
- Componente de infrastructură reutilizabile
- Modele comune de resurse
- Șabloane securizate
- Configurații optimizate pentru costuri

### Scripturi Ajutătoare
- Automatizarea configurării mediului
- Scripturi pentru migrarea bazelor de date
- Instrumente de validare a implementării
- Utilitare pentru monitorizarea costurilor

## 🔧 Ghid de Personalizare

### Adaptarea Exemplelor la Cazul Tău

1. **Revizuiește Cerințele**
   - Verifică cerințele serviciilor Azure
   - Confirmă limitele abonamentului
   - Înțelege implicațiile costurilor

2. **Modifică Configurația**
   - Actualizează definițiile serviciilor din `azure.yaml`
   - Personalizează șabloanele Bicep
   - Ajustează variabilele de mediu

3. **Testează Temeinic**
   - Implementează mai întâi în mediul de dezvoltare
   - Validează funcționalitatea
   - Testează scalarea și performanța

4. **Revizuire de Securitate**
   - Verifică controalele de acces
   - Implementează gestionarea secretelor
   - Activează monitorizarea și alertele

## 📊 Matrice de Comparație

| Exemplu | Servicii | Bază de Date | Autentificare | Monitorizare | Complexitate |
|---------|----------|--------------|---------------|--------------|--------------|
| Aplicație Web Simplă | 1 | ❌ | Basic | Basic | ⭐ |
| Website Static | 1 | ❌ | ❌ | Basic | ⭐ |
| Aplicație Container | 1 | ❌ | Basic | Full | ⭐⭐ |
| Aplicație cu Bază de Date | 2 | ✅ | Full | Full | ⭐⭐⭐ |
| Funcție Serverless | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| Microservicii | 5+ | ✅ | Full | Full | ⭐⭐⭐⭐ |

## 🎓 Parcurs de Învățare

### Progres Recomandat

1. **Începe cu Aplicația Web Simplă**
   - Învață conceptele de bază AZD
   - Înțelege fluxul de implementare
   - Exersează gestionarea mediului

2. **Încearcă Website-ul Static**
   - Explorează opțiuni diferite de găzduire
   - Învață despre integrarea CDN
   - Înțelege configurarea DNS

3. **Treci la Aplicația Container**
   - Învață bazele containerizării
   - Înțelege conceptele de scalare
   - Exersează cu Docker

4. **Adaugă Integrarea Bazei de Date**
   - Învață despre aprovizionarea bazelor de date
   - Înțelege șirurile de conexiune
   - Exersează gestionarea secretelor

5. **Explorează Serverless**
   - Înțelege arhitectura bazată pe evenimente
   - Învață despre declanșatori și legături
   - Exersează cu API-uri

6. **Construiește Microservicii**
   - Învață comunicarea între servicii
   - Înțelege sistemele distribuite
   - Exersează implementări complexe

## 🔍 Găsirea Exemplului Potrivit

### După Stack-ul Tehnologic
- **Node.js**: Aplicație Web Simplă, Microservicii
- **Python**: Aplicație cu Bază de Date, Funcție Serverless
- **Site-uri Statice**: Website Static
- **Containere**: Aplicație Container, Microservicii
- **Baze de Date**: Aplicație cu Bază de Date, Funcție Serverless

### După Modelul Arhitectural
- **Monolitic**: Aplicație Web Simplă, Aplicație cu Bază de Date
- **Static**: Website Static
- **Microservicii**: Exemplul Microservicii
- **Serverless**: Funcție Serverless
- **Hibrid**: Aplicație Container

### După Nivelul de Complexitate
- **Începător**: Aplicație Web Simplă, Website Static
- **Intermediar**: Aplicație Container, Aplicație cu Bază de Date, Funcție Serverless  
- **Avansat**: Microservicii

## 📚 Resurse Suplimentare

### Link-uri Documentație
- [Specificație Șabloane AZD](https://aka.ms/azd/templates)
- [Documentație Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centrul de Arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Exemple Comunitare
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Galeria Șabloanelor AZD](https://azure.github.io/awesome-azd/)

### Cele Mai Bune Practici
- [Framework-ul Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Framework-ul de Adoptare Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuirea Exemplelor

Ai un exemplu util de împărtășit? Acceptăm contribuții!

### Ghid de Trimitere
1. Urmează structura de director stabilită
2. Include README.md cuprinzător
3. Adaugă comentarii la fișierele de configurație
4. Testează temeinic înainte de trimitere
5. Include estimări de costuri și cerințe

### Structura Șablonului Exemplu
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Sfat Util**: Începe cu cel mai simplu exemplu care se potrivește stack-ului tău tehnologic, apoi avansează treptat către scenarii mai complexe. Fiecare exemplu construiește pe conceptele din cele anterioare!

**Pași Următori**: 
- Alege un exemplu care se potrivește nivelului tău de competență
- Urmează instrucțiunile de configurare din README-ul exemplului
- Experimentează cu personalizări
- Împărtășește învățăturile tale cu comunitatea

---

**Navigare**
- **Lecția Anterioară**: [Ghid de Studiu](../resources/study-guide.md)
- **Înapoi la**: [README Principal](../README.md)

---

**Declinarea responsabilității**:  
Acest document a fost tradus utilizând serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși depunem eforturi pentru a asigura acuratețea, vă rugăm să aveți în vedere că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea realizată de un profesionist uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.