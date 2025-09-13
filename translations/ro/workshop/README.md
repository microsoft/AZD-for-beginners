<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T23:31:00+00:00",
  "source_file": "workshop/README.md",
  "language_code": "ro"
}
-->
# Atelier AZD pentru Dezvoltatori AI

**Anterior:** [Ghid de depanare AI](../docs/troubleshooting/ai-troubleshooting.md) | **Următor:** [Modulele laboratorului atelierului](../../../workshop)

Bine ați venit la atelierul practic pentru învățarea Azure Developer CLI (AZD) cu accent pe implementarea aplicațiilor AI. Acest atelier este conceput pentru a vă ghida de la elementele de bază ale AZD până la implementarea soluțiilor AI pregătite pentru producție.

## Prezentare generală a atelierului

**Durată:** 2-3 ore  
**Nivel:** Începător până la Intermediar  
**Cerințe preliminare:** Cunoștințe de bază despre Azure, instrumente de linie de comandă și concepte AI

### Ce veți învăța

- **Fundamente AZD**: Înțelegerea infrastructurii ca cod cu AZD  
- 🤖 **Integrarea serviciilor AI**: Implementarea Azure OpenAI, AI Search și alte servicii AI  
- **Implementarea containerelor**: Utilizarea Azure Container Apps pentru aplicații AI  
- **Cele mai bune practici de securitate**: Implementarea Managed Identity și configurări sigure  
- **Monitorizare și observabilitate**: Configurarea Application Insights pentru sarcini AI  
- **Modele de producție**: Strategii de implementare pregătite pentru întreprinderi  

## Structura atelierului

### Modul 1: Fundamente AZD (30 minute)
- Instalarea și configurarea AZD  
- Înțelegerea structurii proiectului AZD  
- Prima implementare AZD  
- **Laborator**: Implementarea unei aplicații web simple  

### Modul 2: Integrarea Azure OpenAI (45 minute)
- Configurarea resurselor Azure OpenAI  
- Strategii de implementare a modelelor  
- Configurarea accesului API și autentificării  
- **Laborator**: Implementarea unei aplicații de chat cu GPT-4  

### Modul 3: Aplicații RAG (45 minute)
- Integrarea Azure AI Search  
- Procesarea documentelor cu Azure Document Intelligence  
- Încorporări vectoriale și căutare semantică  
- **Laborator**: Construirea unui sistem de întrebări și răspunsuri pentru documente  

### Modul 4: Implementare în producție (30 minute)
- Configurarea Container Apps  
- Optimizarea performanței și scalarea  
- Monitorizare și jurnalizare  
- **Laborator**: Implementarea în producție cu observabilitate  

### Modul 5: Modele avansate (15 minute)
- Implementări multi-mediu  
- Integrarea CI/CD  
- Strategii de optimizare a costurilor  
- **Încheiere**: Lista de verificare pentru pregătirea producției  

## Cerințe preliminare

### Instrumente necesare

Vă rugăm să instalați aceste instrumente înainte de atelier:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Configurarea contului Azure

1. **Abonament Azure**: [Înscrieți-vă gratuit](https://azure.microsoft.com/free/)  
2. **Acces Azure OpenAI**: [Solicitați acces](https://aka.ms/oai/access)  
3. **Permisiuni necesare**:  
   - Rol de Contributor pe abonament sau grup de resurse  
   - Administrator Acces Utilizator (pentru atribuiri RBAC)  

### Verificarea cerințelor preliminare

Rulați acest script pentru a verifica configurația:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Materiale atelier

### Exerciții de laborator

Fiecare modul include laboratoare practice cu cod de început și instrucțiuni pas cu pas:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Prima implementare AZD  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Aplicație de chat cu Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - Aplicație RAG cu AI Search  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Modele de implementare în producție  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Scenarii avansate de implementare  

### Materiale de referință

- **[Ghid de integrare AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Modele de integrare cuprinzătoare  
- **[Ghid de implementare a modelelor AI](../docs/ai-foundry/ai-model-deployment.md)** - Cele mai bune practici de implementare a modelelor  
- **[Practici AI pentru producție](../docs/ai-foundry/production-ai-practices.md)** - Modele de implementare pentru întreprinderi  
- **[Ghid de depanare AI](../docs/troubleshooting/ai-troubleshooting.md)** - Probleme comune și soluții  

### Șabloane de exemplu

Șabloane de pornire rapidă pentru scenarii AI comune:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Începerea activității

### Opțiunea 1: GitHub Codespaces (Recomandat)

Cea mai rapidă modalitate de a începe atelierul:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Opțiunea 2: Dezvoltare locală

1. **Clonați depozitul atelierului:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Autentificați-vă în Azure:**  
```bash
az login
azd auth login
```

3. **Începeți cu Laboratorul 1:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Opțiunea 3: Atelier condus de instructor

Dacă participați la o sesiune condusă de instructor:

- 🎥 **Înregistrare atelier**: [Disponibilă la cerere](https://aka.ms/azd-ai-workshop)  
- 💬 **Comunitatea Discord**: [Alăturați-vă pentru suport live](https://aka.ms/foundry/discord)  
- **Feedback atelier**: [Împărtășiți experiența dvs.](https://aka.ms/azd-workshop-feedback)  

## Cronologia atelierului

### Învățare în ritm propriu (3 ore)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Sesiune condusă de instructor (2.5 ore)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Criterii de succes

Până la finalul acestui atelier, veți putea:

✅ **Implementa aplicații AI** folosind șabloane AZD  
✅ **Configura servicii Azure OpenAI** cu securitate adecvată  
✅ **Construi aplicații RAG** cu integrarea Azure AI Search  
✅ **Implementa modele de producție** pentru sarcini AI la nivel de întreprindere  
✅ **Monitoriza și depana** implementările aplicațiilor AI  
✅ **Aplica strategii de optimizare a costurilor** pentru sarcini AI  

## Comunitate și suport

### În timpul atelierului

- 🙋 **Întrebări**: Utilizați chat-ul atelierului sau ridicați mâna  
- 🐛 **Probleme**: Consultați [ghidul de depanare](../docs/troubleshooting/ai-troubleshooting.md)  
- **Sfaturi**: Împărtășiți descoperirile cu ceilalți participanți  

### După atelier

- 💬 **Discord**: [Comunitatea Azure AI Foundry](https://aka.ms/foundry/discord)  
- **Probleme GitHub**: [Raportați problemele șablonului](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Feedback**: [Formular de evaluare atelier](https://aka.ms/azd-workshop-feedback)  

## Pași următori

### Continuați învățarea

1. **Scenarii avansate**: Explorați [implementările multi-regiune](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **Integrarea CI/CD**: Configurați [fluxuri de lucru GitHub Actions](../docs/deployment/github-actions.md)  
3. **Șabloane personalizate**: Creați propriile [șabloane AZD](../docs/getting-started/custom-templates.md)  

### Aplicați în proiectele dvs.

1. **Evaluare**: Utilizați [lista de verificare pentru pregătirea producției](./production-readiness-checklist.md)  
2. **Șabloane**: Începeți cu [șabloanele specifice AI](../../../workshop/templates)  
3. **Suport**: Alăturați-vă [Discord-ul Azure AI Foundry](https://aka.ms/foundry/discord)  

### Împărtășiți succesul dvs.

- ⭐ **Dați o stea depozitului** dacă acest atelier v-a fost de ajutor  
- 🐦 **Distribuiți pe rețelele sociale** cu #AzureDeveloperCLI #AzureAI  
- 📝 **Scrieți un articol pe blog** despre călătoria dvs. de implementare AI  

---

## Feedback atelier

Feedback-ul dvs. ne ajută să îmbunătățim experiența atelierului:

| Aspect | Evaluare (1-5) | Comentarii |
|--------|----------------|------------|
| Calitatea conținutului | ⭐⭐⭐⭐⭐ | |
| Laboratoare practice | ⭐⭐⭐⭐⭐ | |
| Documentație | ⭐⭐⭐⭐⭐ | |
| Nivel de dificultate | ⭐⭐⭐⭐⭐ | |
| Experiență generală | ⭐⭐⭐⭐⭐ | |

**Trimiteți feedback**: [Formular de evaluare atelier](https://aka.ms/azd-workshop-feedback)

---

**Anterior:** [Ghid de depanare AI](../docs/troubleshooting/ai-troubleshooting.md) | **Următor:** Începeți cu [Laboratorul 1: Fundamente AZD](../../../workshop/lab-1-azd-basics)

**Pregătit să începeți construirea aplicațiilor AI cu AZD?**

[Începeți Laboratorul 1: Fundamente AZD →](./lab-1-azd-basics/README.md)

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.