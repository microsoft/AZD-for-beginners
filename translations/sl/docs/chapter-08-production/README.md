# Poglavje 8: Produkcijski in Podjetniški Vzorci

**📚 Tečaj**: [AZD Za Začetnike](../../README.md) | **⏱️ Trajanje**: 2-3 ure | **⭐ Kompleksnost**: Napredno

---

## Pregled

To poglavje obravnava vzorce za pripravo na proizvodnjo, varnostno utrjevanje, spremljanje in optimizacijo stroškov za proizvodne AI delovne obremenitve.

> Preverjeno z `azd 1.27.1` julija 2026.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Implementirali več-regijske odporne aplikacije
- Uvedli varnostne vzorce za podjetja
- Konfigurirali celovito spremljanje
- Optimizirali stroške v velikem obsegu
- Nastavili CI/CD cevi z AZD

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Produkčne AI prakse](production-ai-practices.md) | Podjetniški vzorci uvajanja | 90 min |

---

## 🚀 Kontrolni seznam za proizvodnjo

- [ ] Več-regijska uvedba za odpornost
- [ ] Upravljana identiteta za avtentikacijo (brez ključev)
- [ ] Application Insights za spremljanje
- [ ] Nastavljeni proračuni stroškov in opozorila
- [ ] Omogočeno varnostno pregledovanje
- [ ] Integracija CI/CD cevi
- [ ] Načrt za obnovitev po nesreči

---

## 🏗️ Arhitekturni vzorci

### Vzorec 1: Microservices AI

```mermaid
graph LR
    Gateway[Prehod API] --> AI[AI storitev] --> Models[Microsoft Foundry modeli]
    Gateway --> Auth[Avtentikacijska storitev]
    AI --> Data[Shramba podatkov]
```

### Vzorec 2: Dogodkovno voden AI

```mermaid
graph LR
    EventGrid[Dogodkovno omrežje] --> Functions[Funkcije] --> Pipeline[AI cevovod]
```

---

## 🔐 Najboljše prakse za varnost

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

| Strategija | Prihranek |
|----------|---------|
| Razširitev na nič (Container Apps) | 60-80% |
| Uporaba porabniških nivojev za razvoj | 50-70% |
| Urno razširjanje | 30-50% |
| Rezervirana kapaciteta | 20-40% |

```bash
# Nastavi opozorila o proračunu
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Nastavitev spremljanja

```bash
# Pretakajte dnevnike
azd monitor --logs

# Preverite Application Insights
azd monitor --overview

# Ogled metrik
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 7: Odpravljanje težav](../chapter-07-troubleshooting/README.md) |
| **Dokončanje tečaja** | [Domača stran tečaja](../../README.md) |

---

## 📖 Sorodni viri

- [Vodnik za AI agente](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Več-agentne rešitve](../chapter-05-multi-agent/README.md)
- [Primer mikrostoritev](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->