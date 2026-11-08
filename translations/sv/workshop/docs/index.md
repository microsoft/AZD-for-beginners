# AZD för AI-utvecklare Workshop

> Källvägledning granskad mot AZD 1.37.2 den 4 november 2026. Skärmavbilder är illustrativa; tjänstetillgänglighet, portalrubriker och mallinställningar kan ändras.

> [!IMPORTANT]  
> **Denna workshop är utrustad med en workshopguide som du kan förhandsgranska i din lokala webbläsare. För att komma igång, öppna repot i GitHub Codespaces, en utvecklingscontainer eller en lokal klon med MkDocs installerat—vänta sedan tills du ser en aktiv VS Code-terminal och skriv:**  
> Från kursrepots rotmapp, installera `requirements-dev.txt`, kör sedan `python -m mkdocs serve --config-file workshop/mkdocs.yml` i förgrunden.
> **Du bör se en popup-dialog för att öppna förhandsgranskningssidan i en webbläsare.**

Välkommen till den praktiska workshopen för att lära dig Azure Developer CLI (AZD) med fokus på AI-applikationsdistribution. Denna workshop hjälper dig att få en praktisk förståelse för AZD-mallar i 3 steg:

1. **Upptäckt** - hitta mallen som är rätt för dig.
1. **Distribution** - distribuera och validera att det fungerar
1. **Anpassning** - modifiera och iterera för att göra den till din!

Under workshopen kommer du även att introduceras till centrala utvecklarverktyg och arbetsflöden för att hjälpa dig att effektivisera din kompletta utvecklingsresa.

| | | 
|:---|:---|
| **📚 Kurshemsida**| [AZD för nybörjare](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Dokumentation** | [Kom igång med AI-mallar](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI-mallar** | [Microsoft Foundry-mallar](https://ai.azure.com/templates) |
|**🚀 Nästa steg** | [Ta utmaningen](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Workshopöversikt

**Varaktighet:** 3-4 timmar  
**Nivå:** Nybörjare till mellannivå  
**Förkunskaper:** Kännedom om Azure, AI-koncept, VS Code och kommandoradsverktyg.

Detta är en praktisk workshop där du lär dig genom att göra. När du har slutfört övningarna rekommenderar vi att du går igenom AZD för nybörjare-kursplanen för att fortsätta din läranderesa inom säkerhet och produktivitetsbästa praxis.

| Tid| Modul  | Mål |
|:---|:---|:---|
| 15 min | Introduktion | Sätt scenen, förstå målen |
| 30 min | Välj AI-mall | Utforska alternativ och välj startmall | 
| 30 min | Validera AI-mall | Distribuera standardlösning till Azure |
| 30 min | Avkoda AI-mall | Utforska struktur och konfiguration |
| 30 min | Konfigurera AI-mall | Aktivera och testa tillgängliga funktioner |
| 30 min | Anpassa AI-mall | Anpassa mallen efter dina behov |
| 30 min | Avveckla Infrastruktur | Rensa upp och frigör resurser |
| 15 min | Avslutning & Nästa steg | Lärresurser, workshoputmaning |
| | |

## Vad du kommer att lära dig

Tänk på AZD-mallen som en lärandesandbox för att utforska olika möjligheter och verktyg för heltäckande utveckling på Microsoft Foundry. I slutet av denna workshop bör du ha en intuitiv förståelse för olika verktyg och koncept i detta sammanhang.

| Koncept  | Mål |
|:---|:---|
| **Azure Developer CLI** | Förstå verktygskommandon och arbetsflöden|
| **AZD-mallar**| Förstå projektstruktur och konfiguration|
| **Azure AI Agent**| Tilldela & distribuera Microsoft Foundry-projekt  |
| **Azure AI Search**| Möjliggör kontextteknik med agenter |
| **Observerbarhet**| Utforska spårning, övervakning och utvärderingar |
| **Red Teaming**| Utforska motståndstestning och motåtgärder |
| | |

## Workshopmoduler

Redo att börja? Navigera genom workshopmodulerna:

- [Modul 1: Välj AI-mall](instructions/1-Select-AI-Template.md)
- [Modul 2: Validera AI-mall](instructions/2-Validate-AI-Template.md) 
- [Modul 3: Avkoda AI-mall](instructions/3-Deconstruct-AI-Template.md)
- [Modul 4: Konfigurera AI-mall](instructions/4-Configure-AI-Template.md)
- [Modul 5: Anpassa AI-mall](instructions/5-Customize-AI-Template.md)
- [Modul 6: Avveckla Infrastruktur](instructions/6-Teardown-Infrastructure.md)
- [Modul 7: Avslutning & Nästa steg](instructions/7-Wrap-up.md)

## Har du feedback?

Skicka in en issue på detta repo (tagga det `Workshop`) eller gå med oss på [Discord](https://aka.ms/foundry/discord) och posta i vår `#get-help` kanal

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->