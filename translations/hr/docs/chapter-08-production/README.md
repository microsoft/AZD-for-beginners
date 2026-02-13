# Poglavlje 8: Obrasci za produkciju i za poduzeća

**📚 Tečaj**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 2-3 sata | **⭐ Složenost**: Napredno

---

## Pregled

Ovo poglavlje pokriva obrasce implementacije spremne za poduzeća, pojačavanje sigurnosti, nadzor i optimizaciju troškova za produkcijska AI opterećenja.

## Ciljevi učenja

Ispunjavanjem ovog poglavlja ćete:
- Implementirati aplikacije otporne u više regija
- Provesti sigurnosne obrasce za poduzeća
- Konfigurirati sveobuhvatan nadzor
- Optimizirati troškove u velikom opsegu
- Postaviti CI/CD pipeline s AZD

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Prakse AI u produkciji](production-ai-practices.md) | Enterprise obrasci implementacije | 90 min |

---

## 🚀 Kontrolna lista za produkciju

- [ ] Implementacija u više regija za otpornost
- [ ] Upravljani identitet za autentikaciju (bez ključeva)
- [ ] Application Insights za praćenje
- [ ] Konfigurirani proračuni troškova i upozorenja
- [ ] Omogućeno skeniranje sigurnosti
- [ ] Integracija CI/CD cjevovoda
- [ ] Plan za oporavak od katastrofa

---

## 🏗️ Arhitektonski obrasci

### Obrazac 1: AI u mikroservisima

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

### Obrazac 2: AI vođen događajima

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Najbolje sigurnosne prakse

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

## 💰 Optimizacija troškova

| Strategija | Uštede |
|----------|---------|
| Skaliranje na nulu (Container Apps) | 60-80% |
| Koristi potrošne razine za razvoj | 50-70% |
| Planirano skaliranje | 30-50% |
| Rezervirani kapacitet | 20-40% |

```bash
# Postavite obavijesti o proračunu
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Postavljanje nadzora

```bash
# Prikaži zapise u stvarnom vremenu
azd monitor --logs

# Provjeri Application Insights
azd monitor

# Prikaži metrike
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 7: Otklanjanje pogrešaka](../chapter-07-troubleshooting/README.md) |
| **Tečaj završen** | [Početna stranica tečaja](../../README.md) |

---

## 📖 Povezani resursi

- [Vodič za AI agente](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Rješenja s više agenata](../chapter-05-multi-agent/README.md)
- [Primjer mikroservisa](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje odgovornosti**:
Ovaj dokument preveden je pomoću AI usluge za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučujemo profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz upotrebe ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->