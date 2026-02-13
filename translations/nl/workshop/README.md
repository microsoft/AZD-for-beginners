<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD-workshop voor AI-ontwikkelaars
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Een praktijkgerichte workshop voor het bouwen van AI-toepassingen met Azure Developer CLI.</strong><br>
      Voltooi 7 modules om AZD-sjablonen en AI-implementatieworkflows te beheersen.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Laatst bijgewerkt: februari 2026
      </span>
    </div>
  </div>
</div>

# AZD-workshop voor AI-ontwikkelaars

Welkom bij de praktische workshop voor het leren van Azure Developer CLI (AZD) met een focus op het uitrollen van AI-toepassingen. Deze workshop helpt je een toegepaste begrip van AZD-sjablonen te krijgen in 3 stappen:

1. **Ontdekking** - vind het sjabloon dat bij je past.
1. **Implementatie** - implementeer en controleer dat het werkt
1. **Aanpassing** - pas het aan en blijf itereren om het eigen te maken!

Tijdens deze workshop word je ook geïntroduceerd in kernontwikkelaarstools en workflows, om je end-to-end ontwikkeltraject te stroomlijnen.

<br/>

## Browsergebaseerde gids

De workshoplessen zijn in Markdown. Je kunt ze rechtstreeks in GitHub doorlopen - of een browsergebaseerde preview starten zoals weergegeven in de screenshot hieronder.

![Workshop](../../../translated_images/nl/workshop.75906f133e6f8ba0.webp)

Om deze optie te gebruiken - fork de repository naar je profiel en start GitHub Codespaces. Zodra de VS Code-terminal actief is, typ je dit commando:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Binnen een paar seconden zie je een pop-upvenster. Selecteer de optie `Openen in browser`. De webgebaseerde gids wordt nu geopend in een nieuw browsertabblad. Enkele voordelen van deze preview:

1. **Ingebouwde zoekfunctie** - vind snel trefwoorden of lessen.
1. **Kopieericoon** - beweeg de muis over codeblokken om deze optie te zien
1. **Thema-schakelaar** - wissel tussen donkere en lichte thema's
1. **Krijg hulp** - klik op het Discord-pictogram in de voettekst om mee te doen!

<br/>

## Overzicht van de workshop

**Duur:** 3-4 uur  
**Niveau:** Beginner tot Gevorderd  
**Vereisten:** Bekendheid met Azure, AI-concepten, VS Code & commandoregeltools.

Dit is een praktijkgerichte workshop waarin je leert door te doen. Zodra je de oefeningen hebt voltooid, raden we aan de AZD For Beginners-curriculum te bekijken om je leertraject voort te zetten richting beveiliging en productiviteitsbest practices.

| Tijd| Module  | Doel |
|:---|:---|:---|
| 15 min | [Introductie](docs/instructions/0-Introduction.md) | De context schetsen en de doelstellingen begrijpen |
| 30 min | [Selecteer AI-sjabloon](docs/instructions/1-Select-AI-Template.md) | Verken opties en kies een starter | 
| 30 min | [Valideer AI-sjabloon](docs/instructions/2-Validate-AI-Template.md) | Implementeer de standaardoplossing in Azure |
| 30 min | [Deconstrueer AI-sjabloon](docs/instructions/3-Deconstruct-AI-Template.md) | Verken structuur en configuratie |
| 30 min | [Configureer AI-sjabloon](docs/instructions/4-Configure-AI-Template.md) | Activeer en probeer beschikbare functies |
| 30 min | [Personaliseer AI-sjabloon](docs/instructions/5-Customize-AI-Template.md) | Pas het sjabloon aan op jouw behoeften |
| 30 min | [Opruimen infrastructuur](docs/instructions/6-Teardown-Infrastructure.md) | Opruimen en vrijgeven van resources |
| 15 min | [Afronding & vervolgstappen](docs/instructions/7-Wrap-up.md) | Leermiddelen, workshopuitdaging |

<br/>

## Wat je zult leren

Beschouw het AZD-sjabloon als een leersandbox om verschillende mogelijkheden en tools voor end-to-end ontwikkeling op Microsoft Foundry te verkennen. Aan het einde van deze workshop zou je een intuïtief gevoel moeten hebben voor verschillende tools en concepten in deze context.

| Concept  | Doel |
|:---|:---|
| **Azure Developer CLI** | Begrijp commando's en workflows van de tool|
| **AZD Templates**| Begrijp projectstructuur en configuratie|
| **Azure AI Agent**| Provisioning en implementatie van een Microsoft Foundry-project  |
| **Azure AI Search**| Context-engineering met agenten mogelijk maken |
| **Observability**| Verken tracing, monitoring en evaluaties |
| **Red Teaming**| Verken adversarial testen en mitigaties |

<br/>

## Structuur van de workshop

De workshop is zo opgezet dat je een traject doorloopt van sjabloonontdekking, naar implementatie, deconstructie en personalisatie - met het officiële [Aan de slag met AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) starter-sjabloon als basis.

### [Module 1: Selecteer AI-sjabloon](docs/instructions/1-Select-AI-Template.md) (30 mins)

- Wat zijn AI-sjablonen?
- Waar kan ik AI-sjablonen vinden?
- Hoe kan ik beginnen met het bouwen van AI-agenten?
- **Lab**: Snelstart met GitHub Codespaces

### [Module 2: Valideer AI-sjabloon](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- Wat is de architectuur van het AI-sjabloon?
- Wat is de AZD-ontwikkelworkflow?
- Hoe kan ik hulp krijgen bij AZD-ontwikkeling?
- **Lab**: Implementeer & valideer het AI Agents-sjabloon

### [Module 3: Deconstrueer AI-sjabloon](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Verken je omgeving in `.azure/` 
- Verken je resource-setup in `infra/` 
- Verken je AZD-configuratie in `azure.yaml`s
- **Lab**: Wijzig omgevingsvariabelen & implementeer opnieuw

### [Module 4: Configureer AI-sjabloon](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Verken: Retrieval Augmented Generation
- Verken: Agent-evaluatie & Red Teaming
- Verken: Tracing & Monitoring
- **Lab**: Verken AI-agent + observeerbaarheid 

### [Module 5: Personaliseer AI-sjabloon](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Definieer: PRD met scenariovereisten
- Configureer: omgevingsvariabelen voor AZD
- Implementeer: levenscyclus-hooks voor extra taken
- **Lab**: Personaliseer sjabloon voor mijn scenario

### [Module 6: Opruimen infrastructuur](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Samenvatting: Wat zijn AZD-sjablonen?
- Samenvatting: Waarom Azure Developer CLI gebruiken?
- Volgende stappen: Probeer een ander sjabloon!
- **Lab**: Deprovision infrastructuur & opschonen

<br/>

## Workshop-uitdaging

Wil je jezelf meer uitdagen? Hier zijn enkele projectvoorstellen - of deel je ideeën met ons!!

| Project | Beschrijving |
|:---|:---|
|1. **Deconstrueer een complex AI-sjabloon** | Gebruik de workflow en tools die we hebben beschreven en kijk of je een ander AI-oplossingssjabloon kunt implementeren, valideren en aanpassen. _Wat heb je geleerd?_|
|2. **Personaliseer met jouw scenario**  | Probeer een PRD (Product Requirements Document) te schrijven voor een ander scenario. Gebruik vervolgens GitHub Copilot in je sjabloonrepo in Agent Model - en vraag het om een personalisatieworkflow voor je te genereren. _Wat heb je geleerd? Hoe zou je deze suggesties kunnen verbeteren?_|
| | |

## Feedback?

1. Plaats een issue in deze repo - tag het met `Workshop` voor het gemak.
1. Word lid van de Microsoft Foundry Discord - verbind met je collega’s!


| | | 
|:---|:---|
| **📚 Course Home**| [AZD voor Beginners](../README.md)|
| **📖 Documentation** | [Aan de slag met AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Microsoft Foundry-sjablonen](https://ai.azure.com/templates) |
|**🚀 Next Steps** | [Begin workshop](../../../workshop) |
| | |

<br/>

---

**Navigatie:** [Hoofdcursus](../README.md) | [Introductie](docs/instructions/0-Introduction.md) | [Module 1: Selecteer sjabloon](docs/instructions/1-Select-AI-Template.md)

**Klaar om AI-toepassingen te gaan bouwen met AZD?**

[Begin Workshop: Introductie →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dit document is vertaald met behulp van de AI-vertalingsservice Co-op Translator (https://github.com/Azure/co-op-translator). Hoewel wij naar nauwkeurigheid streven, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onjuistheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->