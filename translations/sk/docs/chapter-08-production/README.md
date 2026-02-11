# Kapitola 8: Produkčné a podnikové vzory

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Dĺžka**: 2-3 hodiny | **⭐ Zložitosť**: Pokročilé

---

## Prehľad

Táto kapitola pokrýva nasadzovacie vzory pripravené pre podniky, spevnenie bezpečnosti, monitorovanie a optimalizáciu nákladov pre produkčné AI pracovné záťaže.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Nasadzovať odolné aplikácie v multi-regiónoch
- Implementovať podnikové bezpečnostné vzory
- Nakonfigurovať komplexné monitorovanie
- Optimalizovať náklady pri škálovaní
- Nastaviť CI/CD pipeline s AZD

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Produkčné AI postupy](production-ai-practices.md) | Podnikové nasadzovacie vzory | 90 min |

---

## 🚀 Produkčný kontrolný zoznam

- [ ] Nasadenie v multi-regiónoch pre odolnosť
- [ ] Managed identity pre autentifikáciu (žiadne kľúče)
- [ ] Application Insights pre monitorovanie
- [ ] Nastavené rozpočty nákladov a upozornenia
- [ ] Povolené skenovanie bezpečnosti
- [ ] Integrácia CI/CD pipeline
- [ ] Plán obnovy po havárii

---

## 🏗️ Architektonické vzory

### Vzor 1: AI s mikroslužbami

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Vzor 2: AI riadené udalosťami

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
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
# Nastaviť rozpočtové upozornenia
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
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou služby prekladu založenej na umelej inteligencii [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za rozhodujúci zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nezodpovedáme za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z využitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->