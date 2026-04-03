<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD för AI-utvecklare Workshop
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>En praktisk workshop för att bygga AI-applikationer med Azure Developer CLI.</strong><br>
      Slutför 7 moduler för att bemästra AZD-mallar och arbetsflöden för AI-distribution.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Senast uppdaterad: mars 2026
      </span>
    </div>
  </div>
</div>

# AZD för AI-utvecklare Workshop

Välkommen till den praktiska workshopen för att lära dig Azure Developer CLI (AZD) med fokus på distribution av AI-applikationer. Den här workshopen hjälper dig att få en praktisk förståelse för AZD-mallar i 3 steg:

1. **Upptäckt** - hitta den mall som passar dig.
1. **Driftsättning** - distribuera och verifiera att det fungerar
1. **Anpassning** - ändra och iterera för att göra det till ditt!

Under kursens gång introduceras du också till kärnverktyg och arbetsflöden för utvecklare, för att hjälpa dig effektivisera din ända-till-ända utvecklingsresa.

<br/>

## Webbläsarbaserad guide

Workshopen finns i Markdown. Du kan navigera direkt i GitHub - eller starta en webbläsarförhandsgranskning som visas i skärmdumpen nedan.

![Workshop](../../../translated_images/sv/workshop.75906f133e6f8ba0.webp)

För att använda det här alternativet - fork:a repositoryt till din profil och starta GitHub Codespaces. När VS Code-terminalen är aktiv, skriv följande kommando:

This browser preview works in GitHub Codespaces, dev containers, or a local clone with Python and MkDocs installed.

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Om några sekunder ser du en popup-dialog. Välj alternativet `Öppna i webbläsare`. Den webbaserade guiden öppnas nu i en ny flik i webbläsaren. Några fördelar med denna förhandsgranskning:

1. **Inbyggd sökning** - hitta nyckelord eller lektioner snabbt.
1. **Kopiera-ikon** - hovra över kodblock för att se detta alternativ
1. **Temaväxling** - växla mellan mörkt och ljust tema
1. **Få hjälp** - klicka på Discord-ikonen i sidfoten för att gå med!

<br/>

## Översikt över workshopen

**Tid:** 3–4 timmar  
**Nivå:** Nybörjare till medel  
**Förkunskaper:** Bekantskap med Azure, AI-koncept, VS Code och kommandoradsverktyg.

Detta är en praktisk workshop där du lär dig genom att göra. När du har slutfört övningarna rekommenderar vi att du går igenom kursplanen AZD For Beginners för att fortsätta din inlärningsresa inom bästa praxis för säkerhet och produktivitet.

| Tid| Modul  | Mål |
|:---|:---|:---|
| 15 mins | [Introduktion](docs/instructions/0-Introduction.md) | Sätta scenen, förstå målen |
| 30 mins | [Välj AI-mall](docs/instructions/1-Select-AI-Template.md) | Utforska alternativ och välj en startmall | 
| 30 mins | [Validera AI-mall](docs/instructions/2-Validate-AI-Template.md) | Driftsätt standardlösningen till Azure |
| 30 mins | [Dekonstruera AI-mall](docs/instructions/3-Deconstruct-AI-Template.md) | Utforska struktur och konfiguration |
| 30 mins | [Konfigurera AI-mall](docs/instructions/4-Configure-AI-Template.md) | Aktivera och prova tillgängliga funktioner |
| 30 mins | [Anpassa AI-mall](docs/instructions/5-Customize-AI-Template.md) | Anpassa mallen efter dina behov |
| 30 mins | [Avveckla infrastrukturen](docs/instructions/6-Teardown-Infrastructure.md) | Rensa upp och frigör resurser |
| 15 mins | [Avslut & nästa steg](docs/instructions/7-Wrap-up.md) | Lärresurser, workshoputmaning |

<br/>

## Vad du kommer att lära dig

Tänk på AZD-mallen som en lärsandlåda för att utforska olika kapabiliteter och verktyg för ända-till-ända-utveckling på Microsoft Foundry. I slutet av denna workshop bör du ha en intuitiv känsla för olika verktyg och koncept i detta sammanhang.

| Koncept  | Mål |
|:---|:---|
| **Azure Developer CLI** | Förstå verktygets kommandon och arbetsflöden|
| **AZD-mallar**| Förstå projektstruktur och konfiguration|
| **Azure AI Agent**| Provisionera och distribuera Microsoft Foundry-projekt |
| **Azure AI Search**| Möjliggöra kontextteknik med agenter |
| **Observerbarhet**| Utforska spårning, övervakning och utvärderingar |
| **Red Teaming**| Utforska adversariella tester och motåtgärder |

<br/>

## Workshopstruktur

Workshopen är strukturerad för att ta dig på en resa från mallupptäckt, till driftsättning, dekonstruering och anpassning - med den officiella [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) startmallen som grund.

### [Modul 1: Välj AI-mall](docs/instructions/1-Select-AI-Template.md) (30 min)

- Vad är AI-mallar?
- Var hittar jag AI-mallar?
- Hur kommer jag igång med att bygga AI-agenter?
- **Lab**: Snabbstart i Codespaces eller en dev-container

### [Modul 2: Validera AI-mall](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Vad är AI-mallens arkitektur?
- Vad är AZD-utvecklingsarbetsflödet?
- Hur kan jag få hjälp med AZD-utveckling?
- **Lab**: Driftsätt & validera AI Agents-mallen

### [Modul 3: Dekonstruera AI-mall](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Utforska din miljö i `.azure/` 
- Utforska din resursuppsättning i `infra/` 
- Utforska din AZD-konfiguration i `azure.yaml`s
- **Lab**: Ändra miljövariabler & driftsätt igen

### [Modul 4: Konfigurera AI-mall](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Utforska: Retrieval Augmented Generation
- Utforska: Agentutvärdering & Red Teaming
- Utforska: Spårning & övervakning
- **Lab**: Utforska AI-agent + observerbarhet 

### [Modul 5: Anpassa AI-mall](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definiera: PRD med scenariospecifikationer
- Konfigurera: Miljövariabler för AZD
- Implementera: Lifecycle Hooks för tillagda uppgifter
- **Lab**: Anpassa mallen för mitt scenario

### [Modul 6: Avveckla infrastrukturen](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Sammanfattning: Vad är AZD-mallar?
- Sammanfattning: Varför använda Azure Developer CLI?
- Nästa steg: Prova en annan mall!
- **Lab**: Avprovisionera infrastruktur & städa upp

<br/>

## Workshoputmaning

Vill du utmana dig själv mer? Här är några projektförslag — eller dela dina idéer med oss!!

| Projekt | Beskrivning |
|:---|:---|
|1. **Dekonstruera en komplex AI-mall** | Använd arbetsflödet och verktygen vi beskrev och se om du kan distribuera, validera, och anpassa en annan AI-lösningsmall. _Vad lärde du dig?_|
|2. **Anpassa efter ditt scenario**  | Försök skriva en PRD (Product Requirements Document) för ett annat scenario. Använd sedan GitHub Copilot i ditt mallrepo i Agent Model - och be det generera ett anpassningsarbetsflöde för dig. _Vad lärde du dig? Hur kan du förbättra dessa förslag?_|
| | |

## Har du feedback?

1. Skapa en issue i det här repot - tagga den `Workshop` för enkelhetens skull.
1. Gå med i Microsoft Foundry Discord - koppla upp dig med dina kollegor!


| | | 
|:---|:---|
| **📚 Kurshem**| [AZD för nybörjare](../README.md)|
| **📖 Dokumentation** | [Kom igång med AI-mallar](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI-mallar** | [Microsoft Foundry-mallar](https://ai.azure.com/templates) |
|**🚀 Nästa steg** | [Starta workshop](#översikt-över-workshopen) |
| | |

<br/>

---

**Navigering:** [Huvudkurs](../README.md) | [Introduktion](docs/instructions/0-Introduction.md) | [Modul 1: Välj mall](docs/instructions/1-Select-AI-Template.md)

**Redo att börja bygga AI-applikationer med AZD?**

[Starta workshop: Introduktion →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Friskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Medan vi strävar efter noggrannhet, var medveten om att automatiska översättningar kan innehålla fel eller felaktigheter. Originaldokumentet i dess ursprungliga språk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi är inte ansvariga för eventuella missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->