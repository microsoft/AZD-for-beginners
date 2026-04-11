# Chapter 8: Produkčné a podnikové vzory

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 2-3 hodiny | **⭐ Náročnosť**: Pokročilý

---

## Prehľad

Táto kapitola pokrýva podnikové vzory nasadenia, zabezpečenie, monitorovanie a optimalizáciu nákladov pre produkčné AI pracovné záťaže.

> Overené verzia `azd 1.23.12` v marci 2026.

## Ciele učenia

Po dokončení tejto kapitoly budete vedieť:
- Nasadiť aplikácie odolné v multi-regiónoch
- Implementovať podnikové bezpečnostné vzory
- Konfigurovať komplexné monitorovanie
- Optimalizovať náklady vo veľkom meradle
- Nastaviť CI/CD pipeliny s AZD

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------|-----|
| 1 | [Produkčné AI praktiky](production-ai-practices.md) | Podnikové vzory nasadenia | 90 min |

---

## 🚀 Produkčný kontrolný zoznam

- [ ] Nasadenie v multi-regiónoch pre odolnosť
- [ ] Riadená identita pre autentifikáciu (bez kľúčov)
- [ ] Application Insights pre monitorovanie
- [ ] Nastavené rozpočty a upozornenia na náklady
- [ ] Povolené bezpečnostné skenovanie
- [ ] Integrácia CI/CD pipeline
- [ ] Plán obnovy po havárii

---

## 🏗️ Architektonické vzory

### Vzor 1: Microservices AI

```mermaid
graph LR
    Gateway[API Brána] --> AI[AI Služba] --> Models[Modely Microsoft Foundry]
    Gateway --> Auth[Autentifikačná Služba]
    AI --> Data[Ukladisko Dát]
```
### Vzor 2: Event-Driven AI

```mermaid
graph LR
    EventGrid[Event Grid] --> Functions[Funkcie] --> Pipeline[AI Potrubie]
```
---

## 🔐 Najlepšie bezpečnostné postupy

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Optimalizácia nákladov

| Stratégia | Úspory |
|----------|--------|
| Škálovanie na nulu (Container Apps) | 60-80% |
| Použitie spotrebných vrstiev pre vývoj | 50-70% |
| Plánované škálovanie | 30-50% |
| Rezervovaná kapacita | 20-40% |

```bash
# Nastaviť upozornenia na rozpočet
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Nastavenie monitorovania

```bash
# Prehliadať logy
azd monitor --logs

# Skontrolovať Application Insights
azd monitor --overview

# Zobraziť metriky
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigácia

| Smer | Kapitola |
|------|----------|
| **Predchádzajúca** | [Kapitola 7: Riešenie problémov](../chapter-07-troubleshooting/README.md) |
| **Kurz dokončený** | [Domovská stránka kurzu](../../README.md) |

---

## 📖 Súvisiace zdroje

- [Sprievodca AI agentmi](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Viacagentové riešenia](../chapter-05-multi-agent/README.md)
- [Príklad microservices](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, majte prosím na pamäti, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->