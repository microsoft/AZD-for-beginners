# Kapitola 8: Produkční & Podnikové Vzory

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 2-3 hodiny | **⭐ Složitost**: Pokročilé

---

## Přehled

Tato kapitola pokrývá podnikové vzory nasazení, zabezpečení, monitorování a optimalizaci nákladů pro produkční AI pracovní zátěže.

> Ověřeno na `azd 1.23.12` v březnu 2026.

## Cíle učení

Po dokončení této kapitoly budete umět:
- Nasadit více-regionální odolné aplikace
- Implementovat podnikové bezpečnostní vzory
- Konfigurovat komplexní monitorování
- Optimalizovat náklady ve velkém měřítku
- Nastavit CI/CD pipeline pomocí AZD

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Produkční AI Praktiky](production-ai-practices.md) | Podnikové vzory nasazení | 90 min |

---

## 🚀 Produkční kontrolní seznam

- [ ] Více-regionální nasazení pro odolnost
- [ ] Spravovaná identita pro autentizaci (bez klíčů)
- [ ] Application Insights pro monitorování
- [ ] Nastavené rozpočty a upozornění na náklady
- [ ] Povolené bezpečnostní kontroly
- [ ] Integrace CI/CD pipeline
- [ ] Plán obnovy po havárii

---

## 🏗️ Architektonické vzory

### Vzor 1: Microservices AI

```mermaid
graph LR
    Gateway[API brána] --> AI[Služba AI] --> Models[Modely Microsoft Foundry]
    Gateway --> Auth[Autentizační služba]
    AI --> Data[Datové úložiště]
```
### Vzor 2: Událostmi řízené AI

```mermaid
graph LR
    EventGrid[Event Grid] --> Functions[Funkce] --> Pipeline[AI Potrubí]
```
---

## 🔐 Nejlepší bezpečnostní praktiky

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

## 💰 Optimalizace nákladů

| Strategie | Úspory |
|----------|---------|
| Škálování na nulu (Container Apps) | 60-80 % |
| Použití nákladových úrovní pro vývoj | 50-70 % |
| Plánované škálování | 30-50 % |
| Rezervovaná kapacita | 20-40 % |

```bash
# Nastavit upozornění rozpočtu
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Nastavení monitorování

```bash
# Streamovat protokoly
azd monitor --logs

# Zkontrolovat Application Insights
azd monitor --overview

# Zobrazit metriky
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 7: Řešení problémů](../chapter-07-troubleshooting/README.md) |
| **Dokončení kurzu** | [Domovská stránka kurzu](../../README.md) |

---

## 📖 Související zdroje

- [Průvodce AI Agenty](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Řešení více agentů](../chapter-05-multi-agent/README.md)
- [Příklad Microservices](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo chybné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->