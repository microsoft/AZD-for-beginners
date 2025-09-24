<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9cc966416ab431c38b2ab863884b196c",
  "translation_date": "2025-09-24T21:22:30+00:00",
  "source_file": "workshop/README.md",
  "language_code": "sv"
}
-->
# AZD för AI-utvecklare Workshop

Välkommen till den praktiska workshopen för att lära dig Azure Developer CLI (AZD) med fokus på att distribuera AI-applikationer. Denna workshop hjälper dig att få en tillämpad förståelse för AZD-mallar i tre steg:

1. **Utforska** - hitta den mall som passar dig.
1. **Distribuera** - distribuera och verifiera att den fungerar.
1. **Anpassa** - modifiera och iterera för att göra den till din egen!

Under workshopens gång kommer du också att introduceras till kärnverktyg och arbetsflöden för utvecklare, för att hjälpa dig att effektivisera din utvecklingsresa från början till slut.

<br/>

## Webbaserad guide

Workshopens lektioner är skrivna i Markdown. Du kan navigera direkt i GitHub - eller starta en webbaserad förhandsvisning som visas i skärmdumpen nedan.

![Workshop](../../../translated_images/workshop.75906f133e6f8ba07ab0302ce17f67ff90f357513f3d4c4bbafa5978b10f058b.sv.png)

För att använda detta alternativ - gör en fork av repot till din profil och starta GitHub Codespaces. När VS Code-terminalen är aktiv, skriv detta kommando:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Inom några sekunder kommer du att se en popup-dialog. Välj alternativet `Open in browser`. Den webbaserade guiden öppnas nu i en ny webbläsarflik. Några fördelar med denna förhandsvisning:

1. **Inbyggd sökning** - hitta nyckelord eller lektioner snabbt.
1. **Kopiera-ikon** - hovra över kodblock för att se detta alternativ.
1. **Temaomkopplare** - växla mellan mörkt och ljust tema.
1. **Få hjälp** - klicka på Discord-ikonen i sidfoten för att gå med!

<br/>

## Workshopöversikt

**Varaktighet:** 3-4 timmar  
**Nivå:** Nybörjare till medel  
**Förkunskaper:** Grundläggande kunskaper om Azure, AI-koncept, VS Code och kommandoradsverktyg.

Detta är en praktisk workshop där du lär dig genom att göra. När du har slutfört övningarna rekommenderar vi att du granskar AZD för nybörjare-kursen för att fortsätta din lärande resa inom säkerhet och produktivitetsbästa praxis.

| Tid | Modul  | Mål |
|:---|:---|:---|
| 15 min | [Introduktion](docs/instructions/0-Introduction.md) | Sätt scenen, förstå målen |
| 30 min | [Välj AI-mall](docs/instructions/1-Select-AI-Template.md) | Utforska alternativ och välj startmall | 
| 30 min | [Verifiera AI-mall](docs/instructions/2-Validate-AI-Template.md) | Distribuera standardlösning till Azure |
| 30 min | [Demontera AI-mall](docs/instructions/3-Deconstruct-AI-Template.md) | Utforska struktur och konfiguration |
| 30 min | [Konfigurera AI-mall](docs/instructions/4-Configure-AI-Template.md) | Aktivera och testa tillgängliga funktioner |
| 30 min | [Anpassa AI-mall](docs/instructions/5-Customize-AI-Template.md) | Anpassa mallen efter dina behov |
| 30 min | [Avveckla infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) | Rensa och frigör resurser |
| 15 min | [Sammanfattning & Nästa steg](docs/instructions/7-Wrap-up.md) | Lärresurser, workshoputmaning |

<br/>

## Vad du kommer att lära dig

Tänk på AZD-mallen som en lärande sandlåda för att utforska olika funktioner och verktyg för end-to-end-utveckling på Azure AI Foundry. Vid slutet av denna workshop bör du ha en intuitiv förståelse för olika verktyg och koncept i detta sammanhang.

| Koncept  | Mål |
|:---|:---|
| **Azure Developer CLI** | Förstå verktygskommandon och arbetsflöden |
| **AZD-mallar**| Förstå projektstruktur och konfiguration |
| **Azure AI Agent**| Provisionera och distribuera Azure AI Foundry-projekt  |
| **Azure AI Search**| Aktivera kontextuell ingenjörskonst med agenter |
| **Observability**| Utforska spårning, övervakning och utvärderingar |
| **Red Teaming**| Utforska tester och motåtgärder mot hot |

<br/>

## Workshopstruktur

Workshopen är strukturerad för att ta dig på en resa från att upptäcka mallar, till distribution, demontering och anpassning - med den officiella [Kom igång med AI-agenter](https://github.com/Azure-Samples/get-started-with-ai-agents) startmallen som grund.

### [Modul 1: Välj AI-mall](docs/instructions/1-Select-AI-Template.md) (30 min)

- Vad är AI-mallar?
- Var kan jag hitta AI-mallar?
- Hur kan jag komma igång med att bygga AI-agenter?
- **Lab**: Snabbstart med GitHub Codespaces

### [Modul 2: Verifiera AI-mall](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Vad är AI-mallens arkitektur?
- Vad är AZD-utvecklingsarbetsflödet?
- Hur kan jag få hjälp med AZD-utveckling?
- **Lab**: Distribuera & verifiera AI-agenter-mall

### [Modul 3: Demontera AI-mall](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Utforska din miljö i `.azure/` 
- Utforska din resursuppsättning i `infra/` 
- Utforska din AZD-konfiguration i `azure.yaml`
- **Lab**: Modifiera miljövariabler & distribuera om

### [Modul 4: Konfigurera AI-mall](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Utforska: Retrieval Augmented Generation
- Utforska: Agentutvärdering & Red Teaming
- Utforska: Spårning & övervakning
- **Lab**: Utforska AI-agent + Observability 

### [Modul 5: Anpassa AI-mall](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definiera: PRD med scenariokrav
- Konfigurera: Miljövariabler för AZD
- Implementera: Livscykelkrokar för extra uppgifter
- **Lab**: Anpassa mall för mitt scenario

### [Modul 6: Avveckla infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Sammanfattning: Vad är AZD-mallar?
- Sammanfattning: Varför använda Azure Developer CLI?
- Nästa steg: Testa en annan mall!
- **Lab**: Avveckla infrastruktur & rensa upp

<br/>

## Workshoputmaning

Vill du utmana dig själv att göra mer? Här är några projektförslag - eller dela dina idéer med oss!!

| Projekt | Beskrivning |
|:---|:---|
|1. **Demontera en komplex AI-mall** | Använd arbetsflödet och verktygen vi har beskrivit och se om du kan distribuera, verifiera och anpassa en annan AI-lösningsmall. _Vad lärde du dig?_|
|2. **Anpassa med ditt scenario**  | Försök att skriva en PRD (Produktkravdokument) för ett annat scenario. Använd sedan GitHub Copilot i din mallrepo i Agent Model - och be den generera ett anpassningsarbetsflöde åt dig. _Vad lärde du dig? Hur kan du förbättra dessa förslag?_|
| | |

## Har du feedback?

1. Skapa ett ärende i detta repo - tagga det med `Workshop` för enkelhetens skull.
1. Gå med i Azure AI Foundry Discord - anslut med dina kollegor!


| | | 
|:---|:---|
| **📚 Kurshem**| [AZD för nybörjare](../README.md)|
| **📖 Dokumentation** | [Kom igång med AI-mallar](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI-mallar** | [Azure AI Foundry-mallar](https://ai.azure.com/templates) |
|**🚀 Nästa steg** | [Ta utmaningen](../../../workshop) |
| | |

<br/>

---

**Föregående:** [AI Felsökningsguide](../docs/troubleshooting/ai-troubleshooting.md) | **Nästa:** Börja med [Lab 1: AZD Grunder](../../../workshop/lab-1-azd-basics)

**Redo att börja bygga AI-applikationer med AZD?**

[Börja Lab 1: AZD Grunder →](./lab-1-azd-basics/README.md)

---

