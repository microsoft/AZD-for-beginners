# Kapitola 8: Produkčné & podnikové vzory

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 2-3 hodiny | **⭐ Náročnosť**: Pokročilá

---

## Prehľad

Táto kapitola pokrýva produkčné nasadzovacie vzory pripravené pre podniky, spevňovanie bezpečnosti, monitoring a optimalizáciu nákladov pre produkčné AI pracovné záťaže.

## Ciele učenia

Po dokončení tejto kapitoly budete vedieť:
- Nasadiť odolné aplikácie naprieč viacerými regiónmi
- Implementovať podnikové bezpečnostné vzory
- Konfigurovať komplexné monitorovanie
- Optimalizovať náklady vo veľkom meradle
- Nastaviť CI/CD pipeline s AZD

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Produkčné AI postupy](production-ai-practices.md) | Podnikové vzory nasadenia | 90 min |

---

## 🚀 Kontrolný zoznam pre produkciu

- [ ] Nasadenie v niekoľkých regiónoch pre odolnosť
- [ ] Spravovaná identita na overovanie (bez kľúčov)
- [ ] Application Insights na monitorovanie
- [ ] Nastavené rozpočty a upozornenia
- [ ] Povolené bezpečnostné skenovanie
- [ ] Integrácia CI/CD pipeline
- [ ] Plán obnovy po havárii

---

## 🏗️ Architektonické vzory

### Vzor 1: AI s mikroslužbami

```mermaid
graph LR
    Gateway[API brána] --> AI[Služba AI] --> Models[Modely Microsoft Foundry]
    Gateway --> Auth[Autentifikačná služba]
    AI --> Data[Úložisko dát]
```
### Vzor 2: AI riadená udalosťami

```mermaid
graph LR
    EventGrid[Mriežka udalostí] --> Functions[Funkcie] --> Pipeline[AI pracovný tok]
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
|----------|---------|
| Škálovanie na nulu (Container Apps) | 60-80% |
| Použiť spotrebné úrovne pre vývoj | 50-70% |
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
# Sledovať protokoly
azd monitor --logs

# Skontrolovať Application Insights
azd monitor

# Zobraziť metriky
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 7: Riešenie problémov](../chapter-07-troubleshooting/README.md) |
| **Kurz dokončený** | [Domov kurzu](../../README.md) |

---

## 📖 Súvisiace zdroje

- [Sprievodca AI agentmi](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Riešenia s viacerými agentmi](../chapter-05-multi-agent/README.md)
- [Príklad mikroslužieb](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o vylúčení zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v originálnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie odporúčame profesionálny preklad vykonaný človekom. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z používania tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->