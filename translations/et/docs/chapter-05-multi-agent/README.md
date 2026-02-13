# Peatükk 5: Mitmeagendilised tehisintellekti lahendused

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 2-3 tundi | **⭐ Raskusaste**: Edasijõudnud

---

## Ülevaade

See peatükk käsitleb täiustatud mitmeagendilisi arhitektuurimustreid, agentide orkestreerimist ja tootmiskõlblikke AI-juurutusi keerukate stsenaariumide jaoks.

## Õpieesmärgid

Selle peatüki läbimisel suudate:
- Mõista mitmeagendilise arhitektuuri mustreid
- Paigaldada koordineeritud AI-agentide süsteeme
- Rakendada agentidevahelist suhtlust
- Ehitada tootmiskõlblikke mitmeagendilisi lahendusi

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Jaemüügi mitmeagendiline lahendus](../../examples/retail-scenario.md) | Täielik teostuse juhend | 90 min |
| 2 | [Koordineerimise mustrid](../chapter-06-pre-deployment/coordination-patterns.md) | Agentide orkestreerimise strateegiad | 30 min |
| 3 | [ARM-malli juurutamine](../../examples/retail-multiagent-arm-template/README.md) | Üheklõpsuline juurutus | 30 min |

---

## 🚀 Kiire algus

```bash
# Paigalda jaekaubanduse mitmeagendiline lahendus
cd examples/retail-multiagent-arm-template
./deploy.sh

# Või kasuta malli otse
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Mitmeagendiline arhitektuur

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Esiletõstetud lahendus: Jaemüügi mitmeagendiline lahendus

The [Jaemüügi mitmeagendiline lahendus](../../examples/retail-scenario.md) demonstreerib:

- **Kliendiagent**: Haldab kasutajatega suhtlemist ja eelistusi
- **Varudeagent**: Haldab laoseisu ja tellimuste töötlemist
- **Orkestreerija**: Koordineerib agentide vahel
- **Jagatud mälu**: Agentidevahelise konteksti haldus

### Kasutatud teenused

| Teenused | Eesmärk |
|---------|---------|
| Azure OpenAI | Keele mõistmine |
| Azure AI Search | Tootekataloog |
| Cosmos DB | Agentide olek ja mälu |
| Container Apps | Agentide hostimine |
| Application Insights | Jälgimine |

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [Peatükk 4: Infrastructure](../chapter-04-infrastructure/README.md) |
| **Järgmine** | [Peatükk 6: Enne juurutamist](../chapter-06-pre-deployment/README.md) |

---

## 📖 Seotud ressursid

- [AI-agentide juhend](../chapter-02-ai-development/agents.md)
- [Tootmisalased AI praktikad](../chapter-08-production/production-ai-practices.md)
- [AI tõrkeotsing](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastutusest loobumine:
Seda dokumenti on tõlgitud tehisintellekti tõlketeenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi me püüame tagada täpsust, pidage palun meeles, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle algkeeles tuleks pidada määravaks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta mingite arusaamatuste ega väärtõlgenduste eest, mis võivad tuleneda selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->