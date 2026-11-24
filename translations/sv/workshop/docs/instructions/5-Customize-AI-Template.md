# 5. Anpassa en mall

!!! tip "I SLUTET AV DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Etablera en grundlinje

Använd det initialiserade [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) arkivet från tidigare moduler. Dokumentera mallrevision, AZD-version, valt miljö, modellutplacering och exempel på frågor innan du ändrar något.

Exemplet implementerar en agentstödd chattapplikation. Det blir **inte** ett två-agenters detaljhandelssystem bara genom att ställa in miljövariabler eller spara ytterligare instruktionsfiler. Extra agenter, verktygshanterare, routing, auktorisering och dataåtkomst kräver applikationskod.

Inspektera den för närvarande utplacerade agentens instruktioner och verktyg i Foundry. Testa en faktabaserad fråga, en återvinningsfråga och en fråga som exempeldatan inte kan besvara. Verifiera källhänvisningar mot de faktiska källdokumenten istället för att anta att ett flytande svar är korrekt.

## 5.2 Anpassa kunskapsåtervinning

Mallen stöder filbaserad återvinning och valfri Azure AI Search-integration. Följ [den aktuella AI Search-guiden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) för indexering och verktygskonfiguration.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Att aktivera tjänsten är bara en del av återvinningen. Innan du laddar upp din egen data:

1. Bekräfta att du har tillstånd att använda dokumenten och ta bort känslig information.
2. Välj en inbäddningsmodell som stöds i din region och ställ in dess kompatibla version, utplaceringstyp och vektordimensioner.
3. Skapa/populera indexet med hjälp av exempels dokumenterade process.
4. Konfigurera agentens återvinningsverktyg att använda det indexet.
5. Testa återvinning, källhänvisningar, auktorisering och beteende när inget relevant dokument finns.

Byt inte från `text-embedding-3-small` till en annan inbäddningsmodell utan att kontrollera dimensionerna och bygga om/indexera om vektorer vid behov. Ett namn som `retail-products` är inte en implementerad katalog eller en åtkomstkontrollpolicy.

## 5.3 Spårning och övervakning

Följ [exemplets observabilitetsguide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Säkerställ att den nödvändiga Application Insights-resursen och anslutningen redan finns; vid ändring av infrastruktursinställningar, använd `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Skicka en testförfrågan, inspektera sedan Container App:s applikationsloggar och agentens spårningsvy i Foundry. Kontrollera latenstid, verktygsanrop, fel och korrelation mellan förfrågan och spårningen. Anta inte att telemetri är ansluten enbart för att utplaceringen lyckades.

Lämna `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` inaktiverat om du inte uttryckligen har granskat samtycke, borttagning, lagring och åtkomstkontroller. Spår kan innehålla känsliga verktygsargument eller dokumentinnehåll även när vanliga applikationsloggar ser ofarliga ut.

## 5.4 Agentutvärdering

Exempelns utvärderingsstartpunkt är nu [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), inte en `evals/` katalog. Från exempelrotsmappen, använd en Python-miljö som uppfyller dess dokumenterade krav:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Innan körning, slutför [utvärderingsförutsättningarna](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Tester läser konfiguration från den valda `.azure/<environment>/.env`; bekräfta att avsedd miljö är vald. Viktiga indata inkluderar:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, i det format som krävs av aktuellt exempel (den granskade versionen använder `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, använd som domarmodellutplacering

Inspektera testerna för att förstå evaluatorval, trösklar, nödvändiga roller och modellkostnader. Ett genomfört körning är inte automatiskt ett godkänt kvalitetstest; granska poäng, misslyckade/felaktiga fall och de länkade Foundry-resultaten.

### Separat AZD-utvärderingsförlängning

Python-testet ovan är en **exempelspecifik arbetsflöde**. Den valfria `azure.ai.evaluations` förlängningen är ett annat arbetsflöde, med egen `evals/azure.eval.yaml` konfiguration. Den installeras separat och är inte inkluderad i den allmänt tillgängliga `microsoft.foundry` 1.0-paketet:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

För en komplett förlängningsuppsättning, se [utvärderingsarbetsflöden och migrering](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Sedan agents extension beta.22, använd inte de borttagna `azd ai agent eval` kommandona. Installation av utvärderingsförlängningen konverterar inte exempelns Python-tester eller skapar automatiskt en utvärderingskonfiguration.

För en separat **GA hosted-agent övning**, använd en tom mapp utanför denna workshops exempel och följ [Foundry lokal-till-moln promenad](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Den använder AZD 1.37.0+, `microsoft.foundry` paketet, Python 3.13+ och aktuell uv. Du kommer att inspektera `azure.yaml`, testa lokalt med Agent Inspector, distribuera källan för en fjärr Foundry-byggnad, och generera/granska dataset och bedömningsmall innan du konfigurerar `azd ai eval init --name quality`. Ersätt inte exempelns tester eller anta att installation av paketet ändrar dess värdmodell.

## 5.5 AI red teaming och kontinuerlig utvärdering

Det aktuella exemplet tillhandahåller [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Slutför dess förutsättningar och granska avsett mål och kostnader innan körning:

```bash
pytest tests/test_red_teaming.py -s
```

Använd en auktoriserad testutplacering och syntetisk data. Granska de genererade attackerna och resultaten; denna skanning fastställer inte att en applikation är säker eller följsam.

Guiderna för [observabilitet](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) beskriver också kontinuerlig utvärdering som konfigureras vid containerstart. Den utvärderar riktiga användarinteraktioner, inte genererad testtrafik, och utvärderarstöd varierar per region. Inga interaktioner innebär inga utvärderingsposter. Verifiera den installerade provversionen och utvärderarkonfigurationen istället för att anta att varje distribution har samma standardinställningar.

Autentisering är separerad från utvärdering. Följ den dokumenterade identitets-/åtkomstinställningen i exemplet. Det finns ingen dokumenterad ”basic auth fallback” att förlita sig på för skydd av en offentlig endpoint.

## 5.6 Designövning: detaljhandelsanpassning

!!! warning "Designövning, inte en färdig distribution"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Skriv en kort plan som tar upp:

| Område | Beslut och bevis att samla in |
|------|----------------------------------|
| Agentansvar | Börja med en agent, eller motivera separata Shopper- och Loyalty-agenter samt ruttningslogik |
| Data | Definiera en syntetisk katalog-/belöningsdataset och ägarskap av uppdateringar |
| Verktyg | Implementera först skrivskyddade handläggare; specificera auktorisering och validering för eventuella skrivningar |
| Modeller | Välj tillgängliga modell-/versions-/SKU-kombinationer och verifiera kvot; undvik att beställa oanvända modeller |
| Hämtning | Definiera indexering, inbäddningsdimensioner, referenser och åtkomstkontroller på dokumentnivå |
| Utvärdering | Lägg till förväntade svar, icke stödda frågor, verktygsanvändning och säkerhetsfall med explicita trösklar |
| Drift | Definiera telemetri, latens-/felbudgetar, kostnadsgränser och ansvar för städning |

Att spara `custom-agents/shopper-agent-instructions.md` gör inte att provet laddar det. Hitta applikationskoden som skapar/uppdaterar agenten, koppla dina granskade instruktioner där, och verifiera den resulterande agentversionen innan du testar. Instruktioner kan inte ge åtkomst till data eller verktyg som du inte har implementerat.

Tillämpa en ändring i taget, distribuera om de berörda komponenterna och kör dina grundfrågor och utvärderingar igen. Behåll en fungerande version för jämförelse. För arkitekturinnspiration, se [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), som inte heller är en komplett retail-applikation.

!!! quote "I SLUTET AV DENNA LABB BÖR DU HA"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Fortsätt till [Teardown Infrastructure](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->