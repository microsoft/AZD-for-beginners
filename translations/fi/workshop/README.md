<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T22:00:16+00:00",
  "source_file": "workshop/README.md",
  "language_code": "fi"
}
-->
# AZD AI-kehittäjien työpaja

**Edellinen:** [AI Vianetsintäopas](../docs/troubleshooting/ai-troubleshooting.md) | **Seuraava:** [Työpajan lab-moduulit](../../../workshop)

Tervetuloa käytännönläheiseen työpajaan, jossa opit käyttämään Azure Developer CLI:tä (AZD) keskittyen AI-sovellusten käyttöönottoon. Tämä työpaja vie sinut AZD:n perusteista tuotantovalmiiden AI-ratkaisujen käyttöönottoon.

## Työpajan yleiskatsaus

**Kesto:** 2-3 tuntia  
**Taso:** Aloittelija - Keskitaso  
**Esitiedot:** Perustiedot Azuresta, komentorivityökaluista ja AI-konsepteista

### Mitä opit

- **AZD:n perusteet**: Infrastruktuuri koodina AZD:n avulla
- 🤖 **AI-palveluiden integrointi**: Azure OpenAI:n, AI-haun ja muiden AI-palveluiden käyttöönotto
- **Konttien käyttöönotto**: Azure Container Apps AI-sovelluksille
- **Tietoturvan parhaat käytännöt**: Hallitun identiteetin ja turvallisten asetusten toteuttaminen
- **Seuranta ja näkyvyys**: Application Insightsin käyttöönotto AI-työkuormille
- **Tuotantokäytännöt**: Yritystason käyttöönoton strategiat

## Työpajan rakenne

### Moduuli 1: AZD:n perusteet (30 minuuttia)
- AZD:n asennus ja konfigurointi
- AZD-projektirakenteen ymmärtäminen
- Ensimmäinen AZD-käyttöönotto
- **Lab**: Yksinkertaisen verkkosovelluksen käyttöönotto

### Moduuli 2: Azure OpenAI -integraatio (45 minuuttia)
- Azure OpenAI -resurssien asettaminen
- Mallien käyttöönoton strategiat
- API-käytön ja autentikoinnin konfigurointi
- **Lab**: Chat-sovelluksen käyttöönotto GPT-4:llä

### Moduuli 3: RAG-sovellukset (45 minuuttia)
- Azure AI Search -integraatio
- Dokumenttien käsittely Azure Document Intelligencen avulla
- Vektoripohjaiset upotukset ja semanttinen haku
- **Lab**: Dokumentti Q&A -järjestelmän rakentaminen

### Moduuli 4: Tuotantokäyttöönotto (30 minuuttia)
- Container Apps -konfigurointi
- Skaalaus ja suorituskyvyn optimointi
- Seuranta ja lokitus
- **Lab**: Tuotantokäyttöönotto näkyvyyden kanssa

### Moduuli 5: Edistyneet käytännöt (15 minuuttia)
- Moniympäristön käyttöönotot
- CI/CD-integraatio
- Kustannusten optimointistrategiat
- **Yhteenveto**: Tuotantovalmiuden tarkistuslista

## Esitiedot

### Vaaditut työkalut

Asenna nämä työkalut ennen työpajaa:

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

### Azure-tilin asetukset

1. **Azure-tilaus**: [Rekisteröidy ilmaiseksi](https://azure.microsoft.com/free/)  
2. **Azure OpenAI -pääsy**: [Pyydä pääsyä](https://aka.ms/oai/access)  
3. **Vaaditut käyttöoikeudet**:  
   - Contributor-rooli tilauksessa tai resurssiryhmässä  
   - User Access Administrator (RBAC-määrityksiä varten)  

### Esitietojen tarkistus

Suorita tämä skripti varmistaaksesi asetuksesi:

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

## Työpajan materiaalit

### Lab-harjoitukset

Jokainen moduuli sisältää käytännön lab-harjoituksia aloituskoodilla ja vaiheittaisilla ohjeilla:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Ensimmäinen AZD-käyttöönotto  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Chat-sovellus Azure OpenAI:lla  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG-sovellus AI-haun kanssa  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Tuotantokäyttöönoton käytännöt  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Edistyneet käyttöönoton skenaariot  

### Viitemateriaalit

- **[AI Foundry -integraatio-opas](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Kattavat integraatiomallit  
- **[AI-mallien käyttöönotto-opas](../docs/ai-foundry/ai-model-deployment.md)** - Mallien käyttöönoton parhaat käytännöt  
- **[Tuotantokäytännöt AI:lle](../docs/ai-foundry/production-ai-practices.md)** - Yritystason käyttöönoton mallit  
- **[AI Vianetsintäopas](../docs/troubleshooting/ai-troubleshooting.md)** - Yleisimmät ongelmat ja ratkaisut  

### Esimerkkipohjat

Pikakäynnistyspohjat yleisiin AI-skenaarioihin:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Aloittaminen

### Vaihtoehto 1: GitHub Codespaces (suositeltu)

Nopein tapa aloittaa työpaja:

[![Avaa GitHub Codespacesissa](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Vaihtoehto 2: Paikallinen kehitys

1. **Kloonaa työpajan repository:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Kirjaudu Azureen:**  
```bash
az login
azd auth login
```

3. **Aloita Lab 1:stä:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Vaihtoehto 3: Ohjaajan vetämä työpaja

Jos osallistut ohjaajan vetämään istuntoon:

- 🎥 **Työpajan tallenne**: [Saatavilla pyynnöstä](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord-yhteisö**: [Liity saadaksesi tukea](https://aka.ms/foundry/discord)  
- **Työpajan palaute**: [Jaa kokemuksesi](https://aka.ms/azd-workshop-feedback)  

## Työpajan aikataulu

### Itseopiskelu (3 tuntia)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Ohjaajan vetämä istunto (2,5 tuntia)

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

## Onnistumisen kriteerit

Työpajan lopussa osaat:

✅ **Ottaa käyttöön AI-sovelluksia** AZD-pohjien avulla  
✅ **Konfiguroida Azure OpenAI** -palvelut turvallisesti  
✅ **Rakentaa RAG-sovelluksia** Azure AI Search -integraatiolla  
✅ **Toteuttaa tuotantokäytännöt** yritystason AI-työkuormille  
✅ **Seurata ja vianetsintää** AI-sovellusten käyttöönottoa  
✅ **Soveltaa kustannusten optimointistrategioita** AI-työkuormille  

## Yhteisö ja tuki

### Työpajan aikana

- 🙋 **Kysymykset**: Käytä työpajan chatia tai nosta käsi  
- 🐛 **Ongelmat**: Katso [vianetsintäopas](../docs/troubleshooting/ai-troubleshooting.md)  
- **Vinkit**: Jaa löytöjä muiden osallistujien kanssa  

### Työpajan jälkeen

- 💬 **Discord**: [Azure AI Foundry -yhteisö](https://aka.ms/foundry/discord)  
- **GitHub-ongelmat**: [Ilmoita pohjaongelmista](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Palaute**: [Työpajan arviointilomake](https://aka.ms/azd-workshop-feedback)  

## Seuraavat askeleet

### Jatka oppimista

1. **Edistyneet skenaariot**: Tutki [monialueen käyttöönottoja](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **CI/CD-integraatio**: Ota käyttöön [GitHub Actions -työnkulut](../docs/deployment/github-actions.md)  
3. **Mukautetut pohjat**: Luo omia [AZD-pohjia](../docs/getting-started/custom-templates.md)  

### Sovella projekteissasi

1. **Arviointi**: Käytä [valmiuslistaa](./production-readiness-checklist.md)  
2. **Pohjat**: Aloita [AI-spesifisillä pohjilla](../../../workshop/templates)  
3. **Tuki**: Liity [Azure AI Foundry Discordiin](https://aka.ms/foundry/discord)  

### Jaa onnistumisesi

- ⭐ **Tähdellä repository** jos työpaja auttoi sinua  
- 🐦 **Jaa sosiaalisessa mediassa** tunnisteilla #AzureDeveloperCLI #AzureAI  
- 📝 **Kirjoita blogikirjoitus** AI-käyttöönoton matkasta  

---

## Työpajan palaute

Palautteesi auttaa meitä parantamaan työpajakokemusta:

| Osa-alue | Arvosana (1-5) | Kommentit |
|----------|----------------|-----------|
| Sisällön laatu | ⭐⭐⭐⭐⭐ | |
| Käytännön labit | ⭐⭐⭐⭐⭐ | |
| Dokumentaatio | ⭐⭐⭐⭐⭐ | |
| Vaikeustaso | ⭐⭐⭐⭐⭐ | |
| Kokonaiskokemus | ⭐⭐⭐⭐⭐ | |

**Lähetä palaute**: [Työpajan arviointilomake](https://aka.ms/azd-workshop-feedback)

---

**Edellinen:** [AI Vianetsintäopas](../docs/troubleshooting/ai-troubleshooting.md) | **Seuraava:** Aloita [Lab 1: AZD:n perusteet](../../../workshop/lab-1-azd-basics)

**Valmis aloittamaan AI-sovellusten rakentamisen AZD:llä?**

[Aloita Lab 1: AZD:n perusteet →](./lab-1-azd-basics/README.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.