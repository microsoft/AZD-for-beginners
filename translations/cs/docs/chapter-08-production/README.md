# Kapitola 8: Produkční a podnikové vzory

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 2-3 hodin | **⭐ Složitost**: Pokročilá

---

## Přehled

Tato kapitola pokrývá podnikově připravené vzory nasazení, zpřísnění bezpečnosti, monitorování a optimalizaci nákladů pro produkční AI pracovní zátěže.

## Cíle učení

Po dokončení této kapitoly budete:
- Nasazovat odolné aplikace v několika regionech
- Implementovat podnikové bezpečnostní vzory
- Konfigurovat komplexní monitorování
- Optimalizovat náklady ve velkém měřítku
- Nastavit CI/CD pipeline s AZD

---

## 📚 Lekce

| # | Lekce | Popis | Doba |
|---|--------|-------------|------|
| 1 | [Produkční postupy AI](production-ai-practices.md) | Podnikové vzory nasazení | 90 min |

---

## 🚀 Kontrolní seznam pro produkci

- [ ] Nasazení do více regionů pro odolnost
- [ ] Spravovaná identita pro autentizaci (bez klíčů)
- [ ] Application Insights pro monitorování
- [ ] Nastavené rozpočty a upozornění na náklady
- [ ] Zapnuté bezpečnostní skenování
- [ ] Integrace CI/CD pipeline
- [ ] Plán obnovy po havárii

---

## 🏗️ Architektonické vzory

### Vzor 1: AI založená na mikroslužbách

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

### Vzor 2: Event-Driven AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Doporučené bezpečnostní postupy

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

| Strategie | Úspora |
|----------|---------|
| Škálování na nulu (Container Apps) | 60-80% |
| Používat spotřební úrovně pro vývoj | 50-70% |
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
azd monitor

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

- [Průvodce AI agenty](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Řešení s více agenty](../chapter-05-multi-agent/README.md)
- [Příklad mikroslužeb](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoliv usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za závazný zdroj. Pro zásadní informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->