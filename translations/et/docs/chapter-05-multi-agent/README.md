# 5. peatükk: Mitme agendiga tehisintellekti lahendused

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 2-3 tundi | **⭐ Tase**: Täiustatud

---

## Ülevaade

Selles peatükis käsitletakse täiustatud mitme agendi arhitektuurimustreid, agentide orkestreerimist ja tootmiskõlblikke tehisintellekti lahendusi keerukate stsenaariumite jaoks.

> Kontrollitud versiooniga `azd 1.27.1` 2026. aasta juulis.

## Õpieesmärgid

Selle peatüki läbimisel õpite:
- Mõistma mitme agendiga arhitektuurimustreid
- Paigaldama koordineeritud tehisintellekti agentide süsteeme
- Rakendama agentidevahelist suhtlust
- Looma tootmiskõlblikke mitme agendiga lahendusi

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Mitme agendiga alused](multi-agent-basics.md) | Praktiline: töötava mitme agendiga rakenduse paigaldamine käsuga `azd up` | 45 min |
| 2 | [Koordatsioonimustrid](../chapter-06-pre-deployment/coordination-patterns.md) | Agentide orkestreerimise strateegiad (jätkub 6. peatükis) | 30 min |
| 3 | [ARM-i malli paigaldamine](../../examples/retail-multiagent-arm-template/README.md) | Ühe klõpsuga paigaldamise näide | 30 min |

> **Alustage 1. õppetunnist.** See on ainus täielikult praktiline ja paigaldatav õppetund selles peatükis. 2. õppetund on 6. peatükis (jagatud eelpaigaldusplaanimisega) ning [Jaemüügi mitme agendi lahendus](../../examples/retail-scenario.md) on arhitektuuriskeem – disaini referents, mitte ühe käsu mall.

---

## 🚀 Kiire algus

```bash
# Valik 1: Paigalda mallist
azd init --template agent-openai-python-prompty
azd up

# Valik 2: Paigalda agendi manifestist (nõuab azure.ai.agents laiendust)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Millist lähenemist valida?** Kasutage `azd init --template`, et alustada tööd proovinäitega. Kasutage `azd ai agent init`, kui teil on oma agendi manifest. Täpsemat teavet leiate jaotisest [AZD AI CLI viide](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

---

## 🤖 Mitme agendiga arhitektuur

```mermaid
graph TD
    Orchestrator[Orkestreerija agent<br/>Suunab päringuid, haldab töövoogu] --> Customer[Kliendi agent<br/>Kasutaja päringud, eelistused]
    Orchestrator --> Inventory[Laovaru agent<br/>Laoseisud, tellimused]
```

---

## 🎯 Toodud lahendus: Jaemüügi mitme agendi lahendus

[Jaemüügi mitme agendi lahendus](../../examples/retail-scenario.md) demonstreerib:

- **Kliendiagent**: Halda kasutajategevusi ja eelistusi
- **Laomuagent**: Varude ja tellimuste haldus
- **Orkestreerija**: Agentide koordineerimine
- **Jagatud mälu**: Agendideülese konteksti haldamine

### Kasutatavad teenused

| Teenus | Eesmärk |
|---------|---------|
| Microsoft Foundry Models | Keele mõistmine |
| Azure AI Search | Toodete kataloog |
| Cosmos DB | Agendi olek ja mälu |
| Container Apps | Agendi hostimine |
| Application Insights | Jälgimine |

---

## 🔗 Navigatsioon

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [4. peatükk: Taristu](../chapter-04-infrastructure/README.md) |
| **Järgmine** | [6. peatükk: Eelpaigaldus](../chapter-06-pre-deployment/README.md) |

---

## 📖 Seotud ressursid

- [Tehisintellekti agendid](../chapter-02-ai-development/agents.md)
- [Tootmisvalmid tehisintellekti lahendused](../chapter-08-production/production-ai-practices.md)
- [Tehisintellekti tõrkeotsing](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->