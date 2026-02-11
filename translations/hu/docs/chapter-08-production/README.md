# 8. fejezet: Éles üzem és vállalati minták

**📚 Course**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 2-3 óra | **⭐ Nehézségi szint**: Haladó

---

## Áttekintés

Ez a fejezet vállalati szintű telepítési mintákat, biztonsági megerősítést, megfigyelést és költségoptimalizálást tárgyal éles AI munkaterhelésekhez.

## Tanulási célok

A fejezet elvégzése után képes leszel:
- Több régióra kiterjedő, rugalmas alkalmazások telepítése
- Vállalati szintű biztonsági minták megvalósítása
- Átfogó megfigyelés konfigurálása
- Költségek optimalizálása nagy léptékben
- CI/CD csővezetékek beállítása AZD-vel

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Éles AI gyakorlatok](production-ai-practices.md) | Vállalati telepítési minták | 90 min |

---

## 🚀 Éles üzem ellenőrzőlista

- [ ] Több régiós telepítés a rugalmasság érdekében
- [ ] Hitelesítéshez felügyelt identitás (nincsenek kulcsok)
- [ ] Application Insights a megfigyeléshez
- [ ] Költségvetések és riasztások konfigurálva
- [ ] Biztonsági vizsgálatok engedélyezve
- [ ] CI/CD csővezeték integráció
- [ ] Katasztrófa utáni helyreállítási terv

---

## 🏗️ Architektúra minták

### Pattern 1: Mikroszolgáltatások AI

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

### Pattern 2: Eseményvezérelt AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Biztonsági bevált gyakorlatok

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

## 💰 Költségoptimalizálás

| Stratégia | Megtakarítás |
|----------|---------|
| Skálázás nullára (Container Apps) | 60-80% |
| Fejlesztéshez fogyasztási rétegek használata | 50-70% |
| Ütemezett skálázás | 30-50% |
| Fenntartott kapacitás | 20-40% |

```bash
# Költségvetési riasztások beállítása
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Monitorozás beállítása

```bash
# Naplók folyamatos megjelenítése
azd monitor --logs

# Application Insights ellenőrzése
azd monitor

# Metrikák megtekintése
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [7. fejezet: Hibaelhárítás](../chapter-07-troubleshooting/README.md) |
| **Tanfolyam befejezése** | [Tanfolyam kezdőlapja](../../README.md) |

---

## 📖 Kapcsolódó források

- [AI ügynökök útmutatója](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Többügynökös megoldások](../chapter-05-multi-agent/README.md)
- [Mikroszolgáltatások példa](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
Ez a dokumentum a mesterséges intelligencia alapú fordító szolgáltatás, a Co-op Translator (https://github.com/Azure/co-op-translator) segítségével készült. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatizált fordítások hibákat vagy pontatlanságokat tartalmazhatnak. A dokumentum eredeti, anyanyelvi változatát tekintendő a hiteles forrásnak. Kritikus fontosságú információk esetén szakmai, emberi fordítást javaslunk. Nem vállalunk felelősséget az ezen fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->