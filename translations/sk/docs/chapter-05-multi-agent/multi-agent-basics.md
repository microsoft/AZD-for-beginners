# Multi-Agent Základy - Nasadíte svoj prvý koordinovaný AI systém

**Chapter Navigation:**
- **📚 Course Home**: [AZD pre začiatočníkov](../../README.md)
- **📖 Current Chapter**: Kapitola 5 - Viacagentné AI riešenia
- **⬅️ Previous**: [Kapitola 4: Infrastruktúra](../chapter-04-infrastructure/README.md)
- **➡️ Next**: [Vzory koordinácie](../chapter-06-pre-deployment/coordination-patterns.md)

> Overené s `azd 1.25.6` v júni 2026.

## Úvod

V predchádzajúcich kapitolách ste nasadili jednu aplikáciu—a v kapitole 2 ste nasadili jedného AI agenta. Táto lekcia robí ďalší krok: nasadenie **viacagentného systému**, kde niekoľko špecializovaných agentov spolupracuje na vyriešení problému, ktorý by jeden agent nedokázal dobre zvládnuť sám.

Dobrá správa pre začiatočníkov: **nie sú potrebné nové príkazy.** Viacagentné riešenie je stále projekt azd. Budete `azd init`, `azd up`, testovať a `azd down`—presne ten pracovný postup, ktorý už poznáte. Mení sa *tvar* aplikácie vo vnútri.

## Ciele učenia

Na konci tejto lekcie budete:
- Rozumieť, čo znamená "viacagentný" a kedy stojí za to pridať zložitosť
- Rozpoznať bežné role vo viacagentnom systéme (orchestrátor + špecialisti)
- Nasadiť skutočnú, fungujúcu viacagentnú šablónu pomocou `azd up`
- Pochopiť Azure zdroje, ktoré stoja za viacagentnou aplikáciou
- Vedieť, ako overiť, prispôsobiť a bezpečne odstrániť riešenie

## Výsledky učenia

Po dokončení tejto lekcie budete schopní:
- Vysvetliť rozdiel medzi jedným agentom a viacagentným systémom
- Vybrať medzi jedným agentom s nástrojmi a skutočným viacagentným dizajnom
- Nasadiť a otestovať viacagentnú šablónu end-to-end pomocou azd
- Identifikovať, kde každý agent beží a ako spolu komunikujú
- Vyčistiť všetky zdroje, aby sa predišlo priebežným poplatkom

---

## Čo je viacagentný systém?

Jeden AI agent je jeden model s množstvom inštrukcií a (voliteľne) niekoľkými nástrojmi. To funguje dobre pre úzke úlohy. Ale keď úloha rastie—výskum, potom písanie, potom editovanie, potom overovanie faktov—natrieskanie všetkého do jedného promptu robí agenta pomalším, menej spoľahlivým a ťažším na ladenie.

Viacagentný systém rozdeľuje prácu na špecialistov, ktorí každý robia jednu vec dobre, a orchestrátor to koordinuje:

```mermaid
graph TD
    User([Požiadavka používateľa]) --> Orchestrator[Orchestrátor (agent)<br/>Plánuje a smeruje prácu]
    Orchestrator --> Researcher[Výskumník (agent)<br/>Zhromažďuje fakty]
    Orchestrator --> Writer[Autor (agent)<br/>Tvorí obsah]
    Orchestrator --> Editor[Redaktor (agent)<br/>Kontroluje a zdokonaľuje]
    Researcher --> Orchestrator
    Writer --> Orchestrator
    Editor --> Orchestrator
    Orchestrator --> Result([Konečná odpoveď])
```

### Dve role, ktoré vždy uvidíte

| Role | Job | Example |
|------|-----|---------|
| **Orchestrátor** | Rozhoduje *čo sa stane ďalej* a smeruje prácu medzi agentmi | "Najprv výskum, potom napíš, potom uprav" |
| **Špecialista** | Robí jednu zameranú úlohu a vráti výsledok | A "výskumník", ktorý iba zhromažďuje fakty |

### Naozaj potrebujete viac agentov?

Začnite jednoducho. Siahajte po viacagentnom riešení **iba** keď platí jedna z nasledujúcich vecí:

- ✅ Úloha má **odlišné fázy**, ktoré profitujú z rôznych inštrukcií (výskum vs. písanie vs. revízia)
- ✅ Chcete, aby špecialisti bežali **súbežne** a ušetrili čas
- ✅ Rôzne kroky potrebujú **rôzne nástroje alebo zdroje dát**
- ✅ Potrebujete, aby každý krok bol **nezávisle testovateľný a laditeľný**

Ak je vaša úloha jednoduchá otázka-odpoveď alebo jednoduché volanie nástroja, **jeden agent s nástrojmi** (kapitola 2) je jednoduchší, lacnejší a ľahší na prevádzku.

> **Tip pre začiatočníkov:** "Viac agentov" nie je "lepšie." Každý agent pridáva latenciu, náklady a novú vec na monitorovanie. Pridávajte agentov len keď sa problém jasne rozdeľuje na časti.

---

## Dva spôsoby, ako vytvoriť viacagentné riešenie na Azure

| Approach | What it is | Best for |
|----------|-----------|----------|
| **Single agent + tools** | One Foundry agent that calls functions/tools | Simple workflows, getting started |
| **Multiple coordinated agents** | Several agents with an orchestrator | Distinct stages, parallel work, specialization |

Táto lekcia sa zameriava na druhý prístup pomocou **predpripravenej šablóny**, aby ste mohli vidieť skutočný viacagentný systém v prevádzke skôr, než si vytvoríte vlastný.

---

## Prakticky: Nasadiť fungujúcu viacagentnú aplikáciu

Nasadíme **Contoso Creative Writer**, oficiálny príklad od Azure, ktorý používa viac agentov (výskumník, pisateľ, editor) koordinovaných na vytvorenie článku. Je to skvelá prvá viacagentná aplikácia, pretože roly sú ľahko pochopiteľné.

### Krok 1: Inicializujte šablónu

```bash
# Vytvorte pracovný priečinok
mkdir creative-writer && cd creative-writer

# Inicializujte z oficiálnej šablóny pre viac agentov
azd init --template contoso-creative-writer
```

> Prezrite si ďalšie viacagentné šablóny kedykoľvek v [Awesome AZD AI gallery](https://azure.github.io/awesome-azd/?tags=ai). Iné priateľské možnosti pre začiatočníkov zahŕňajú `get-started-with-ai-agents` a `azure-ai-travel-agents`.

### Krok 2: Autentifikujte sa

```bash
# Požadované pre azd pracovné postupy
azd auth login
```

### Krok 3: Vytvorte prostredie

```bash
azd env new dev
```

### Krok 4: Náhľad, potom nasadiť

```bash
# Pozrite si, čo bude vytvorené, skôr než niečo miniete (odporúčané)
azd provision --preview

# Zabezpečiť infraštruktúru a nasadiť všetky agenty v jednom kroku
azd up
```

`azd up` vás požiada o výber predplatného a regiónu, potom zriadi Azure zdroje a nasadí aplikáciu. Nasadenia AI môžu trvať dlhšie než jednoduchá webová aplikácia—ak nasadzujete väčšie modely, môžete predĺžiť časový limit nasadenia:

```bash
azd deploy --timeout 1800
```

> **Upozornenie na náklady a kapacitu:** Viacagentné aplikácie nasadzujú AI modely, ktoré spotrebúvajú kvótu a vytvárajú náklady. Ak `azd up` zlyhá kvôli kvóte modelu, pozrite si [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) pre opravy regiónu a kvóty, a kapitolu 6 [Plánovanie kapacity](../chapter-06-pre-deployment/capacity-planning.md).

---

## Pochopenie toho, čo ste nasadili

Typická viacagentná aplikácia ako táto zriadi sadu Azure zdrojov, ktoré mapujú priamo na zodpovednosti v diagrame vyššie:

| Resource | Why it's there |
|----------|----------------|
| **Microsoft Foundry / Modely** | Hostuje jazykové modely, ktoré používa každý agent |
| **Azure AI Search** | Poskytuje výskumnému agentovi podložené dáta na vyhľadávanie |
| **Container Apps** (or App Service) | Hostuje orchestrátor a kód agentov |
| **Cosmos DB** (in some samples) | Ukladá zdieľaný stav/pamäť, ktorá sa medzi agentmi odovzdáva |
| **Application Insights** | Sleduje požiadavky *naprieč* agentmi, aby ste mohli ladiť tok |

### Ako agenti komunikujú medzi sebou

Vo väčšine azd viacagentných príkladov **beží orchestrátor vo vašom aplikačnom kóde** (napríklad s použitím rámca ako Semantic Kernel alebo Microsoft Agent Framework). Orchestrátor volá každého špecialistu postupne, posiela výsledky ďalej a zoskupuje konečnú odpoveď. Agenti zdieľajú kontext prostredníctvom:

- **Volaní funkcií/nástrojov** — orchestrátor vyzve špecialistu a získa výsledok späť
- **Zdieľanej pamäte** — databáza (často Cosmos DB) uchováva stav, ktorý môžu obaja agenti čítať
- **Správ/udalostí** — pre voľnejšie prepojenie agenti komunikujú cez frontu alebo Service Bus

> **Prečo je to dôležité pre ladenie:** pretože každý krok je samostatný, Application Insights vám ukáže *ktorý* agent bol pomalý alebo zlyhal. To je hlavný dôvod rozdeliť prácu medzi agentov.

---

## Overenie nasadenia

Potvrďte, že systém skutočne funguje, predtým než budete pokračovať:

```bash
# Zobraziť nasadené koncové body
azd show

# Otvoriť monitorovací panel aplikácie
azd monitor

# Sledovať logy, ak niečo vyzerá byť v neporiadku
azd monitor --logs
```

Potom otvorte URL aplikácie z `azd show` a vyskúšajte požiadavku, ktorá aktivuje všetky agenty (pre Creative Writer, požiadajte ho, aby napísal krátky článok na tému). V **transaction search** v Application Insights by ste mali vidieť, ako sa požiadavka rozvetvuje cez kroky výskumníka, pisateľa a editora.

**Kritériá úspechu:**
- ✅ `azd show` vypíše dostupný endpoint
- ✅ Požiadavka vytvorí výsledok, ktorý zjavne prešiel viacerými fázami
- ✅ Application Insights zobrazuje trasovanie pre viac než jeden krok agenta

---

## Prispôsobenie: Pridať alebo upraviť agenta

Pretože každý agent je iba inštrukcie plus nástroje, prispôsobenie je zvládnuteľné:

1. **Nájdite definície agentov** v šablóne (často sada súborov `prompts/`, `agents/` alebo `*.prompty`).
2. **Ladíte inštrukcie agenta** — napríklad povedzte editorovi, aby vynútil konkrétny tón alebo počet slov.
3. **Znovu nasadiť iba kód** (infrastruktúra sa nemení):

   ```bash
   azd deploy
   ```

Ak chcete viac a vytvoriť agentov z *vlastného* manifestu, použite rozšírenie agent a jeho celý životný cyklus:

```bash
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
azd ai agent invoke      # test, s meraním času odozvy
```

Pozrite si [Kapitolu 2: Agenti](../chapter-02-ai-development/agents.md) a [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pre kompletný životný cyklus agenta (`invoke`, `eval generate`, `optimize`, `delete`).

---

## Vyčistenie

Viacagentné aplikácie prevádzkujú viac fakturovateľných služieb. Odstráňte všetko, keď skončíte:

```bash
azd down --force --purge
```

Flag `--purge` tiež odstráni soft-deleteované AI zdroje (ako účty Foundry/Azure AI Services), aby neblokovali budúce opätovné nasadenie alebo nezaberal spôsobovali ďalšie náklady.

---

## Poznámka o produkčných viacagentných systémoch

[Retail Multi-Agent Solution](../../examples/retail-scenario.md) v tomto repozitári je **architektonický plán**, nie jedným príkazom spustiteľná šablóna—dokumentuje, ako by sa produkčný retail systém *sprostredkovane* postavil (a jasne uvádza, že úplné postavenie je značný záväzok). Použite ho ako návrhový referenčný materiál *potom*, čo nasadíte fungujúci príklad tu. Pre produkčné záležitosti (odolnosť, náklady, monitorovanie, governance) pokračujte na [Kapitolu 8: Produkčné AI praktiky](../chapter-08-production/production-ai-practices.md).

---

## Zhrnutie

- Viacagentný systém rozdeľuje prácu medzi špecialistov koordinovaných orchestrátorom.
- Používajte ho len keď má úloha odlišné fázy, potrebuje paralelizmus alebo rôzne nástroje pre jednotlivé kroky—inak uprednostnite jedného agenta.
- Pracovný tok azd sa nemení: `azd init` → `azd up` → test → `azd down`.
- Skutočná šablóna ako `contoso-creative-writer` vám umožní dnes vidieť a prispôsobiť fungujúcu viacagentnú aplikáciu.
- Tracing v Application Insights naprieč agentmi je jednou z najväčších praktických výhod viacagentného dizajnu.

---

## 🔗 Navigácia

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Kapitola 4: Infrastruktúra](../chapter-04-infrastructure/README.md) |
| **Next** | [Vzory koordinácie](../chapter-06-pre-deployment/coordination-patterns.md) |

## 📖 Súvisiace zdroje

- [Sprievodca AI agentmi](../chapter-02-ai-development/agents.md)
- [Vzory koordinácie](../chapter-06-pre-deployment/coordination-patterns.md)
- [Produkčné AI praktiky](../chapter-08-production/production-ai-practices.md)
- [Riešenie problémov s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->