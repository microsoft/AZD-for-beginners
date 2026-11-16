# Príklady — zdroj v angličtine a ukážky Azure

Toto sú vzdelávacie ukážky, nie aplikácie certifikované na produkčné použitie. Pred
spustením príkazov si prečítajte požiadavky, obmedzenia, náklady a pokyny na vyčistenie
pre každý príklad. Dostupnosť Azure a kvóty musíte skontrolovať vo vašom predplatnom.

- [Domovská stránka kurzu](../README.md)
- [Inštalácia](../docs/chapter-01-foundation/installation.md)
- [Riešenie problémov](../docs/chapter-07-troubleshooting/common-issues.md)

## Čo vlastne existuje lokálne

Existujú **štyri ukážkové aplikácie** a **jedna kostra infraštruktúry**:

| Príklad | Lokálna implementácia | Fokus učenia | Úroveň |
|---|---|---|---|
| [Jednoduché Flask API](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Nasadenie kontajnera, sondy, logy | Začiatočník |
| [Dva mikroslužby](../../../examples/container-app/microservices) | Node.js brána a read-only Python produktová služba, Dockerfiles, Bicep, `azure.yaml` | Interná HTTPS komunikácia, nezávislé škálovanie | Stredne pokročilý |
| [Databázová aplikácia](../../../examples/database-app) | Flask read API, Azure SQL, App Service, Bicep, `azure.yaml` | SQL konektivita, inicializácia, logy | Stredne pokročilý |
| [Azure OpenAI chat](../../../examples/azure-openai-chat) | Lokálny Python CLI, Azure OpenAI a Key Vault Bicep, infraštruktúra len `azure.yaml` | Provisioning modelu, história chatu, odhad tokenov | Stredne pokročilý |
| [Maloobchodná infraštruktúra](../../../examples/retail-multiagent-arm-template) | ARM šablóna, parametre, Bash inštalačný skript; **len hello-world kontajnery** | Infraštruktúra pre budúcu multi-agentnú aplikáciu | Pokročilý |

Scenár [retail](retail-scenario.md) je **architektonický plán**, nie
kompletná implementácia viacerých agentov. Nie je zahrnutý žiadny kód retail agenta, chat frontend,
API router, vyhľadávací dátový pipeline, hodnotiace CLI, automatické failover,
ani produkčné zabezpečenie. Tieto musia byť navrhnuté, vybudované a otestované samostatne.

Prehľad [mikroslužieb](microservices/README.md) odkazuje na spustiteľný
príklad s dvoma službami; nie je to ďalší adresár nasadenia.

## Odporúčaný učebný postup

1. Nasadiť Flask API a overiť `/health` a CRUD operácie.
2. Nasadiť databázovú aplikáciu a overiť jej päť prednastavených produktov.
3. Nasadiť príklad s dvoma službami a overiť požiadavky brány na produkt.
4. Zriadiť chatové zdroje a spustiť interaktívne CLI **lokálne**.
5. Študovať retail blueprint po dokončení funkčných príkladov.

Počasie približne 30–60 minút na každý príklad vrátane predpokladov a
overovania. Implementácia retailu je samostatný vývojový projekt, nie
30-minútový workshop. Čítanie jeho architektúry trvá približne 2–3 hodiny;
implementácia a pripravenosť do produkcie môže trvať výrazne dlhšie než ilustračných
80–120 vývojových hodín v návode.

## Rýchly začiatok

Z koreňového adresára repozitára, pre prvý príklad kontajnera:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Očakávané: HTTP 200 a JSON obsahujúci `"status": "healthy"`.
Na lokálnu zostavu kontajnera potrebujete bežiaci Docker.

Pre chat postupujte podľa [čítania README chat](azure-openai-chat/README.md): použite
`azd provision`, nahrajte API kľúč z Key Vault do aktuálnej shell session, nainštalujte
`src/requirements.txt` a spustite `python src/chat.py`. Nie je tu žiadna hosťovaná chat služba.

Pre retail používajte [ARM príručku](retail-multiagent-arm-template/README.md).
Nemá `azure.yaml` a **nenasádza sa ani neodstraňuje** pomocou `azd up`/`azd down`.

## Náklady a obmedzenia

- Všetky nasadenia vytvárajú fakturovateľné Azure zdroje. Scale-to-zero sa vzťahuje len na
  výpočtový výkon aplikácií; neodstraňuje náklady na registry, databázu, ukladanie, vyhľadávanie ani logy.
- Presné ceny závisia od regiónu, meny, dopravy, modelu/SKU a uchovávania.
  Použite [Azure kalkulačku cien](https://azure.microsoft.com/pricing/calculator/)
  pred nasadením a nakonfigurujte rozpočet v Azure Cost Management.
- Dáta Flask CRUD sú v pamäti, na jednu pracovnú jednotku a najviac jednu repliku
  predvolene. Po reštarte alebo scale-to-zero zmiznú. Nie je to trvalé úložisko.
- Produktová mikroslužba poskytuje iba GET endpointy. Nie je tu žiadna objednávková služba,
  používateľská služba, databáza, Service Bus, implementácia v C# alebo Go.
- Application Insights zdroje neinstrumentujú automaticky každú aplikáciu.
  Prečítajte si každý príklad pre reálne vysielané telemetrie.
- Ukážky neimplementujú autentifikáciu aplikácií. Pred produkciou pridajte identitu, autorizáciu,
  trvalé úložisko, sieťové kontroly, testy a prevádzkové postupy.

## Externé Azure ukážky — klonujte samostatne

Tieto odkazy sú referencie na samostatné repozitáre, **nie lokálne príklady**.
Ich správci majú vlastné pokyny na nastavenie, implementáciu, závislosti a náklady.

| Ukážka | Zameranie |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Node.js aplikácia s databázou |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# a Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Statický frontend s C# Functions a SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Python serverless aplikácia |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Kontajnerizovaný backend obchodu |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI chat aplikácia |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agentová aplikácia |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG s vyhľadávaním a citáciami |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Príklad konverzačnej AI |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Java mikroslužby |

Objavte viac projektov v [galérii šablón AZD](https://azure.github.io/awesome-azd/).
Neuznávajte, že externý projekt podporuje `azd` bez overenia jeho aktuálneho README.

## Štruktúra repozitára

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

Tento index nesľubuje žiadne zdieľané `configurations/`, `scripts/` alebo testovacie adresáre.
Skutočné súbory a voliteľné rozšírenie sú uvedené v každom návode.

## Upratovanie

Pre štyri AZD ukážky spustite toto **z vybraného adresára ukážky**:

```bash
azd down
```

Skontrolujte výzvu na odstránenie. Pre retail odstránte len špecifickú skupinu zdrojov,
ktorú ste vytvorili podľa pokynov v ARM príručke. Po upratovaní skontrolujte Azure Cost Management;
údaje o fakturácii môžu prísť oneskorene.

## Prispievanie

V každom príklade aplikácie zahrňte zdrojový kód, infraštruktúru, konfiguračné nastavenie nasadenia,
jasné kroky nastavenia a overenia, obmedzenia a pokyny na upratovanie.
Materiál iba o architektúre a neúplné úryvky označte výslovne.
Nehlasujte pripravenosť do produkcie bez nasadenia, funkčných a prevádzkových testov.

[Často kladené otázky](../resources/faq.md) · [Študijný sprievodca](../resources/study-guide.md) ·
[Nahlásiť problém](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->