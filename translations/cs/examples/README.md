# Příklady — anglický zdroj a ukázky Azure

Toto jsou učební ukázky, ne aplikace certifikované pro produkci. Před spuštěním
příkazů si přečtěte požadavky, omezení, náklady a pokyny pro úklid každého příkladu.
Dostupnost a kvóty Azure musí být ověřeny ve vašem předplatném.

- [Domovská stránka kurzu](../README.md)
- [Instalace](../docs/chapter-01-foundation/installation.md)
- [Řešení problémů](../docs/chapter-07-troubleshooting/common-issues.md)

## Co vlastně existuje lokálně

Existují **čtyři příklady aplikací** a **jedna infrastruktura scaffold**:

| Příklad | Lokální implementace | Zaměření na učení | Úroveň |
|---|---|---|---|
| [Jednoduché Flask API](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Nasazení kontejneru, sondy, protokoly | Začátečník |
| [Mikroslužby se dvěma službami](../../../examples/container-app/microservices) | Node.js gateway a read-only Python produktová služba, Dockerfiles, Bicep, `azure.yaml` | Vnitřní HTTPS komunikace, nezávislé škálování | Středně pokročilý |
| [Databázová aplikace](../../../examples/database-app) | Flask read API, Azure SQL, App Service, Bicep, `azure.yaml` | SQL konektivita, inicializace, protokoly | Středně pokročilý |
| [Azure OpenAI chat](../../../examples/azure-openai-chat) | Lokální Python CLI, Azure OpenAI a Key Vault Bicep, infrastruktura pouze `azure.yaml` | Poskytování modelu, historie chatu, odhady tokenů | Středně pokročilý |
| [Retail infrastruktura](../../../examples/retail-multiagent-arm-template) | ARM šablona, parametry, Bash skript pro nasazení; **pouze kontejnery hello-world** | Infrastruktura pro budoucí multi-agentní aplikaci | Pokročilý |

Scénář [maloobchodu](retail-scenario.md) je **architektonický plán**, nikoli
kompletní implementace multi-agentního systému. Neobsahuje žádný kód maloobchodního agenta, chat frontend, router
API, datový pipeline vyhledávání, CLI pro hodnocení, automatický failover nebo produkční
zabezpečení. Tyto musí být navrženy, postaveny a otestovány samostatně.

Přehled [mikroslužeb](microservices/README.md) odkazuje na spustitelný
dvouslužbový příklad; není to další adresář nasazení.

## Doporučená cesta učení

1. Nasazení Flask API a ověření `/health` a CRUD operací.
2. Nasazení databázové aplikace a ověření jejích pěti přednastavených produktů.
3. Nasazení dvouslužbového příkladu a ověření požadavků z brány na produkty.
4. Zajištění prostředků pro chat a spuštění interaktivního CLI **lokálně**.
5. Studium maloobchodního plánu po dokončení funkčních příkladů.

Vyhraďte přibližně 30–60 minut na každý ukázkový příklad včetně předpokladů a
ověření. Maloobchodní implementace je samostatný vývojový projekt, nikoli
30minutový workshop. Čtení jeho architektury zabere asi 2–3 hodiny; implementace
a připravenost pro produkci může trvat podstatně déle než ilustrativních
80–120 hodin vývoje v příručce.

## Rychlý start

Ze základního adresáře repozitáře, pro první ukázku kontejneru:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Očekává se: HTTP 200 a JSON obsahující `"status": "healthy"`.
Pro lokální sestavení kontejneru musíte mít spuštěný Docker.

Pro chat postupujte podle [chat README](azure-openai-chat/README.md): použijte
`azd provision`, načtěte klíč API z Key Vault do aktuálního shellu, nainstalujte
`src/requirements.txt` a spusťte `python src/chat.py`. Neexistuje žádná hostovaná chat služba.

Pro maloobchod použijte [ARM příručku](retail-multiagent-arm-template/README.md).
Nemá `azure.yaml` a **není** nasazována ani odstraňována pomocí `azd up`/`azd down`.

## Náklady a omezení

- Všechna nasazení vytvářejí účtovatelné zdroje Azure. Scale-to-zero se vztahuje pouze na
  výpočet aplikace; neeliminuje náklady za registry, databáze, úložiště, vyhledávání nebo protokoly.
- Přesné ceny závisí na regionu, měně, provozu, modelu/SKU a uchování dat.
  Použijte [Azure kalkulačku cen](https://azure.microsoft.com/pricing/calculator/)
  před nasazením a nastavte rozpočet v Azure Cost Management.
- Flask CRUD data jsou v paměti, omezená na jednoho pracovníka a maximálně jednu repliku
  ve výchozím nastavení. Při restartu nebo scale-to-zero data zmizí. Nejedná se o trvalé úložiště.
- Mikroslužba produktu zpřístupňuje pouze GET endpointy. Neobsahuje službu objednávek, uživatelskou
  službu, databázi, Service Bus, implementaci v C# nebo Go.
- Prostředky Application Insights automaticky neinstrumentují každou aplikaci.
  Pro skutečně emitovanou telemetrii konzultujte každý příklad.
- Ukázky neimplementují ověřování aplikace. Přidejte identitu, autorizaci,
  trvalé úložiště, řízení sítě, testy a provozní postupy před nasazením do produkce.

## Externí Azure ukázky — klonujte zvlášť

Tyto odkazy odkazují na samostatné repozitáře, **ne lokální příklady**.
Jejich správci zodpovídají za instalační instrukce, implementaci, závislosti a náklady.

| Ukázka | Zaměření |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Node.js aplikace s databází |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# a Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Statický frontend s C# Functions a SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Serverless aplikace v Pythonu |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Kontejnerizované backend pro obchod |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI chat aplikace |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agentní aplikace |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG s vyhledáváním a citacemi |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Ukázka konverzační AI |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Java mikroservisy |

Objevte více projektů v [galerii šablon AZD](https://azure.github.io/awesome-azd/).
Nepředpokládejte, že externí projekt podporuje `azd` bez ověření v aktuálním README.

## Struktura repozitáře

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

Tento index neslibuje žádný sdílený adresář `configurations/`, `scripts/` ani testovací složku.
Skutečné soubory a možnosti rozšíření jsou uvedeny v každém průvodci.

## Vyčištění

Pro čtyři ukázky AZD spusťte toto **z vybraného adresáře ukázky**:

```bash
azd down
```

Zkontrolujte výzvu k odstranění. Pro retail smažte pouze speciální skupinu prostředků,
kterou jste vytvořili, dle pokynů v příručce ARM. Po vyčištění zkontrolujte Azure Cost Management;
data o fakturaci mohou přijít později.

## Přispívání

K každému vzoru aplikace přidejte zdrojový kód, infrastrukturu, konfiguraci nasazení, 
kroky nastavení a ověření, omezení a instrukce pro vyčištění. Označte materiály týkající se 
pouze architektury a neúplné ukázky explicitně.
Nehlaste připravenost do produkce bez nasazovacích, funkčních a provozních testů.

[FAQ](../resources/faq.md) · [Studijní příručka](../resources/study-guide.md) ·
[Nahlásit problém](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->