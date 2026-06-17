# Kapitola 8: Produkční a podnikové vzory

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 2-3 hodin | **⭐ Složitost**: Pokročilá

---

## Přehled

Tato kapitola pokrývá vzory nasazení připravené pro podniky, posílení bezpečnosti, monitorování a optimalizaci nákladů pro produkční AI pracovní zatížení.

> Ověřeno proti `azd 1.25.6` v červnu 2026.

## Cíle učení

Po dokončení této kapitoly budete:
- Nasadit aplikace odolné ve více regionech
- Zavést podnikové bezpečnostní vzory
- Nakonfigurovat komplexní monitorování
- Optimalizovat náklady ve velkém měřítku
- Nastavit CI/CD pipeline pomocí AZD

---

## 📚 Lekce

| # | Lekce | Popis | Doba |
|---|--------|-------------|------|
| 1 | [Produkční AI postupy](production-ai-practices.md) | Podnikové vzory nasazení | 90 min |

---

## 🚀 Kontrolní seznam pro produkci

- [ ] Nasazení ve více regionech pro odolnost
- [ ] Spravovaná identita pro autentizaci (žádné klíče)
- [ ] Application Insights pro monitorování
- [ ] Nastavené rozpočty nákladů a upozornění
- [ ] Povolené bezpečnostní skenování
- [ ] Integrace CI/CD pipeline
- [ ] Plán obnovy po havárii

---

## 🏗️ Architektonické vzory

### Vzor 1: AI založené na mikroslužbách

```mermaid
graph LR
    Gateway[API brána] --> AI[Služba AI] --> Models[Modely Microsoft Foundry]
    Gateway --> Auth[Autentizační služba]
    AI --> Data[Úložiště dat]
```

### Vzor 2: Událostně řízené AI

```mermaid
graph LR
    EventGrid[Síť událostí] --> Functions[Funkce] --> Pipeline[AI potrubí]
```

---

## 🔐 Nejlepší bezpečnostní postupy

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
| Škálování na nulu (Container Apps) | 60-80% |
| Využít spotřební tarify pro vývoj | 50-70% |
| Plánované škálování | 30-50% |
| Rezervovaná kapacita | 20-40% |

```bash
# Nastavit upozornění na rozpočet
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Nastavení monitorování

```bash
# Sledovat protokoly
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
| **Kurz dokončen** | [Domov kurzu](../../README.md) |

---

## 📖 Související zdroje

- [Příručka AI agentů](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Řešení s více agenty](../chapter-05-multi-agent/README.md)
- [Příklad mikroslužeb](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->