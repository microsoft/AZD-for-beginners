# 8 skyrius: Produkciniai ir įmonių modeliai

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 2-3 valandos | **⭐ Sunkumas**: Pažengęs

---

## Apžvalga

Šis skyrius apima įmonėms paruoštus diegimo modelius, saugumo stiprinimą, stebėjimą ir išlaidų optimizavimą produkciniams AI darbo krūviams.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Diegsite kelių regionų atsparias programas
- Įgyvendinsite įmonės saugumo modelius
- Sukonfigūruosite išsamų stebėjimą
- Optimizuosite išlaidas mastu
- Nustatysite CI/CD pipelines su AZD

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-----------|--------|
| 1 | [Produkcinės AI praktikos](production-ai-practices.md) | Įmonių diegimo modeliai | 90 min |

---

## 🚀 Produkcinis kontrolinis sąrašas

- [ ] Diegimas keliuose regionuose dėl atsparumo
- [ ] Valdomas identitetas autentifikacijai (be raktų)
- [ ] Application Insights stebėjimui
- [ ] Nustatyti išlaidų biudžetai ir įspėjimai
- [ ] Įjungtas saugumo skenavimas
- [ ] CI/CD vamzdyno integracija
- [ ] Avarinio atstatymo planas

---

## 🏗️ Architektūros modeliai

### Modelis 1: Mikrotarnybų AI

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

### Modelis 2: Įvykių valdoma AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Geriausios saugumo praktikos

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

## 💰 Išlaidų optimizavimas

| Strategija | Sutaupymai |
|----------|---------|
| Skalavimas iki nulio (Container Apps) | 60-80% |
| Naudoti vartojimo lygius kūrimo aplinkai | 50-70% |
| Planinis skalavimas | 30-50% |
| Rezervuota talpa | 20-40% |

```bash
# Nustatyti biudžeto perspėjimus
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Stebėjimo nustatymas

```bash
# Transliuoti žurnalus
azd monitor --logs

# Patikrinti Application Insights
azd monitor

# Peržiūrėti metrikas
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [7 skyrius: Gedimų šalinimas](../chapter-07-troubleshooting/README.md) |
| **Kurso pradžia** | [Kurso pradžia](../../README.md) |

---

## 📖 Susiję ištekliai

- [AI agentų vadovas](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Daugiagentiniai sprendimai](../chapter-05-multi-agent/README.md)
- [Mikrotarnybų pavyzdys](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas pirminiu šaltiniu. Kritinei informacijai rekomenduojama naudotis profesionalaus vertėjo paslaugomis. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->