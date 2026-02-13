# Peatükk 8: Tootmise & Ettevõtte mustrid

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 2-3 hours | **⭐ Raskusaste**: Edasijõudnud

---

## Ülevaade

See peatükk käsitleb ettevõttele valmis juurutamise mustreid, turvalisuse karmistamist, monitooringut ja kulude optimeerimist tootmis-AI töökoormuste jaoks.

## Õpieesmärgid

Selle peatüki lõpetamisel:
- Juurutada mitmeregioonilisi vastupidavaid rakendusi
- Rakendada ettevõtte turbemustreid
- Seadistada põhjalik monitooring
- Optimeerida kulusid suures mahus
- Seada üles CI/CD töövood AZD-iga

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Tootmis-AI tavad](production-ai-practices.md) | Ettevõtte juurutamise mustrid | 90 min |

---

## 🚀 Tootmise kontrollnimekiri

- [ ] Mitmeregiooniline juurutus vastupidavuse tagamiseks
- [ ] Haldatud identiteet autentimiseks (ilma võtmeteta)
- [ ] Application Insights monitooringuks
- [ ] Kulubudgetid ja hoiatused seadistatud
- [ ] Turbe skaneerimine lubatud
- [ ] CI/CD töövoo integreerimine
- [ ] Katastrofi taastamise plaan

---

## 🏗️ Arhitektuuri mustrid

### Muster 1: Mikroteenuste AI

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

### Muster 2: Sündmustel põhinev AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Turvalisuse parimad tavad

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

## 💰 Kuluoptimeerimine

| Strateegia | Sääst |
|----------|---------|
| Skaleerimine nullini (Container Apps) | 60-80% |
| Kasuta tarbimispõhiseid tasemeid arenduses | 50-70% |
| Ajastatud skaleerimine | 30-50% |
| Broneeritud maht | 20-40% |

```bash
# Sea eelarvehoiatused
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Monitooringu seadistamine

```bash
# Voogesita logisid
azd monitor --logs

# Kontrolli Application Insightsi
azd monitor

# Kuva mõõdikud
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [Peatükk 7: Tõrkeotsing](../chapter-07-troubleshooting/README.md) |
| **Kursus lõpetatud** | [Kursuse avaleht](../../README.md) |

---

## 📖 Seotud ressursid

- [AI agentide juhend](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Mitmeagendi lahendused](../chapter-05-multi-agent/README.md)
- [Mikroteenuste näide](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi me püüame tagada täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokumenti selle algkeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta ühegi arusaamatuse või valesti tõlgendamise eest, mis tuleneb selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->