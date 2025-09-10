<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-10T06:12:52+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "ro"
}
-->
# AZD Bazele - Înțelegerea Azure Developer CLI

## Introducere

Această lecție te introduce în Azure Developer CLI (azd), un instrument puternic de linie de comandă care accelerează tranziția de la dezvoltarea locală la implementarea în Azure. Vei învăța conceptele fundamentale, caracteristicile de bază și vei înțelege cum azd simplifică implementarea aplicațiilor cloud-native.

## Obiective de învățare

Până la sfârșitul acestei lecții, vei:
- Înțelege ce este Azure Developer CLI și scopul său principal
- Învața conceptele de bază despre șabloane, medii și servicii
- Explora caracteristicile cheie, inclusiv dezvoltarea bazată pe șabloane și Infrastructure as Code
- Înțelege structura și fluxul de lucru al unui proiect azd
- Fi pregătit să instalezi și să configurezi azd pentru mediul tău de dezvoltare

## Rezultate ale învățării

După finalizarea acestei lecții, vei putea:
- Explica rolul azd în fluxurile de lucru moderne de dezvoltare cloud
- Identifica componentele structurii unui proiect azd
- Descrie cum funcționează împreună șabloanele, mediile și serviciile
- Înțelege beneficiile Infrastructure as Code cu azd
- Recunoaște diferite comenzi azd și scopurile lor

## Ce este Azure Developer CLI (azd)?

Azure Developer CLI (azd) este un instrument de linie de comandă conceput pentru a accelera tranziția de la dezvoltarea locală la implementarea în Azure. Simplifică procesul de construire, implementare și gestionare a aplicațiilor cloud-native pe Azure.

## Concepte de bază

### Șabloane
Șabloanele sunt fundamentul azd. Ele conțin:
- **Codul aplicației** - Codul sursă și dependențele tale
- **Definiții de infrastructură** - Resurse Azure definite în Bicep sau Terraform
- **Fișiere de configurare** - Setări și variabile de mediu
- **Scripturi de implementare** - Fluxuri de lucru automate pentru implementare

### Medii
Mediile reprezintă diferite ținte de implementare:
- **Dezvoltare** - Pentru testare și dezvoltare
- **Staging** - Mediu pre-producție
- **Producție** - Mediu de producție activ

Fiecare mediu își menține propriile:
- Grupuri de resurse Azure
- Setări de configurare
- Stare de implementare

### Servicii
Serviciile sunt blocurile de construcție ale aplicației tale:
- **Frontend** - Aplicații web, SPAs
- **Backend** - API-uri, microservicii
- **Bază de date** - Soluții de stocare a datelor
- **Stocare** - Stocare de fișiere și blob-uri

## Caracteristici cheie

### 1. Dezvoltare bazată pe șabloane
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Limbaj specific domeniului Azure
- **Terraform** - Instrument multi-cloud pentru infrastructură
- **ARM Templates** - Șabloane Azure Resource Manager

### 3. Fluxuri de lucru integrate
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Gestionarea mediilor
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Structura proiectului

O structură tipică de proiect azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Fișiere de configurare

### azure.yaml
Fișierul principal de configurare al proiectului:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Configurare specifică mediului:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Fluxuri de lucru comune

### Începerea unui proiect nou
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Ciclu de dezvoltare
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### Gestionarea mai multor medii
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Comenzi de navigare

### Descoperire
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Gestionarea proiectului
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitorizare
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Cele mai bune practici

### 1. Folosește denumiri semnificative
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Utilizează șabloane
- Începe cu șabloane existente
- Personalizează-le pentru nevoile tale
- Creează șabloane reutilizabile pentru organizația ta

### 3. Izolarea mediilor
- Folosește medii separate pentru dev/staging/prod
- Nu implementa direct în producție de pe mașina locală
- Utilizează pipeline-uri CI/CD pentru implementările în producție

### 4. Gestionarea configurației
- Folosește variabile de mediu pentru date sensibile
- Păstrează configurația în controlul versiunilor
- Documentează setările specifice mediului

## Progresul învățării

### Începător (Săptămâna 1-2)
1. Instalează azd și autentifică-te
2. Implementează un șablon simplu
3. Înțelege structura proiectului
4. Învață comenzile de bază (up, down, deploy)

### Intermediar (Săptămâna 3-4)
1. Personalizează șabloanele
2. Gestionează mai multe medii
3. Înțelege codul de infrastructură
4. Configurează pipeline-uri CI/CD

### Avansat (Săptămâna 5+)
1. Creează șabloane personalizate
2. Modele avansate de infrastructură
3. Implementări multi-regiune
4. Configurații de nivel enterprise

## Pași următori

- [Instalare și configurare](installation.md) - Instalează și configurează azd
- [Primul tău proiect](first-project.md) - Tutorial practic
- [Ghid de configurare](configuration.md) - Opțiuni avansate de configurare

## Resurse suplimentare

- [Prezentare generală Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galerie de șabloane](https://azure.github.io/awesome-azd/)
- [Exemple comunitare](https://github.com/Azure-Samples)

---

**Navigare**
- **Lecția anterioară**: [README](../../README.md)
- **Lecția următoare**: [Instalare și configurare](installation.md)

---

**Declinarea responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși depunem eforturi pentru a asigura acuratețea, vă rugăm să aveți în vedere că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.