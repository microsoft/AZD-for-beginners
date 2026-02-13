# Poglavje 8: Produkcija in podjetniški vzorci

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 2-3 ure | **⭐ Stopnja zahtevnosti**: Napredno

---

## Pregled

To poglavje obravnava vzorce uvajanja primernih za podjetja, utrjevanje varnosti, spremljanje in optimizacijo stroškov za produkcijske AI obremenitve.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Uvajali aplikacije, odporne na napake v več regijah
- Uresničili varnostne vzorce za podjetja
- Konfigurirali celovito spremljanje
- Optimizirali stroške v velikem merilu
- Nastavili CI/CD cevovode z AZD

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Prakse produkcijskega AI](production-ai-practices.md) | Vzorci uvajanja za podjetja | 90 min |

---

## 🚀 Preverjalni seznam za produkcijo

- [ ] Večregijska namestitev za odpornost
- [ ] Upravljana identiteta za avtentikacijo (brez ključev)
- [ ] Application Insights za spremljanje
- [ ] Nastavljeni proračuni stroškov in opozorila
- [ ] Omogočeno varnostno skeniranje
- [ ] Integracija CI/CD cevovodov
- [ ] Načrt za obnovitev po nesreči

---

## 🏗️ Arhitekturni vzorci

### Vzorec 1: Mikrostoritve AI

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

### Vzorec 2: Dogodkovno voden AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Najboljše varnostne prakse

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

## 💰 Optimizacija stroškov

| Strategija | Prihranki |
|----------|---------|
| Skaliranje na nič (Container Apps) | 60-80% |
| Uporaba porabniških stopenj za razvoj | 50-70% |
| Načrtovano skaliranje | 30-50% |
| Rezervirana zmogljivost | 20-40% |

```bash
# Nastavite opozorila za proračun
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Nastavitev spremljanja

```bash
# Pretakanje dnevnikov
azd monitor --logs

# Preveri Application Insights
azd monitor

# Prikaži metrike
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 7: Odpravljanje težav](../chapter-07-troubleshooting/README.md) |
| **Zaključek tečaja** | [Domov tečaja](../../README.md) |

---

## 📖 Povezani viri

- [Vodnik po AI agentih](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Rešitve z več agenti](../chapter-05-multi-agent/README.md)
- [Primer mikrostoritev](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo AI prevajalske storitve Co-op Translator (https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku obravnavajte kot avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->