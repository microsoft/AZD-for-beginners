# Sura 8: Mifumo ya Uzalishaji na Biashara

**📚 Kozi**: [AZD For Beginners](../../README.md) | **⏱️ Muda**: 2-3 saa | **⭐ Ugumu**: Kiwango cha Juu

---

## Muhtasari

Sura hii inashughulikia mifumo ya utoaji inayofaa kwa taasisi, uimarisho wa usalama, ufuatiliaji, na uboreshaji wa gharama kwa mzigo wa kazi wa AI katika uzalishaji.

## Malengo ya Kujifunza

Baada ya kumaliza sura hii, utakuwa umeweza:
- Zindua programu zenye ustahimilivu katika mikoa mingi
- Tekeleza mifumo ya usalama ya taasisi
- Sanidi ufuatiliaji kamili
- Boresha gharama kwa kiwango kikubwa
- Sanidi mitiririko ya CI/CD kwa AZD

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Production AI Practices](production-ai-practices.md) | Mifumo ya uenezaji kwa taasisi | 90 dakika |

---

## 🚀 Orodha ya Ukaguzi ya Uzalishaji

- [ ] Utoaji katika mikoa mingi kwa ustahimilivu
- [ ] Utambulisho uliosimamiwa kwa uthibitisho (hakuna funguo)
- [ ] Application Insights kwa ufuatiliaji
- [ ] Bajeti za gharama na arifa zimesanidiwa
- [ ] Uchunguzi wa usalama umewezeshwa
- [ ] Uunganishaji wa mitiririko ya CI/CD
- [ ] Mpango wa urejesho baada ya maafa

---

## 🏗️ Mifumo ya Usanifu

### Mfano 1: AI ya Microservices

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

### Mfano 2: AI Inayotokana na Matukio

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Mbinu Bora za Usalama

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

## 💰 Uboreshaji wa Gharama

| Mkakati | Akiba |
|----------|---------|
| Kupunguza hadi sifuri (Container Apps) | 60-80% |
| Tumia ngazi za matumizi kwa maendeleo | 50-70% |
| Kupanua kwa ratiba | 30-50% |
| Uwezo uliohifadhiwa | 20-40% |

```bash
# Weka arifu za bajeti
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Usanidi wa Ufuatiliaji

```bash
# Tiririsha logi
azd monitor --logs

# Angalia Application Insights
azd monitor

# Tazama vipimo
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 7: Utatuzi wa Matatizo](../chapter-07-troubleshooting/README.md) |
| **Kozi Imekamilika** | [Nyumbani ya Kozi](../../README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Mwongozo wa Maajenti wa AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Suluhisho za Maajenti Nyingi](../chapter-05-multi-agent/README.md)
- [Mfano wa Microservices](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la kutokuwajibika:
Nyaraka hii imetatwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu iliyofanywa na mtafsiri binadamu inapendekezwa. Hatubebewi jukumu kwa kutoelewana au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->