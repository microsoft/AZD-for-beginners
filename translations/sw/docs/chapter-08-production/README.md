# Sura 8: Mbinu za Uzalishaji na Kampuni

**📚 Kozi**: [AZD For Beginners](../../README.md) | **⏱️ Muda**: 2-3 saa | **⭐ Ugumu**: Juu

---

## Muhtasari

Sura hii inashughulikia mifumo ya uenezaji inayofaa kampuni, ngome za usalama, ufuatiliaji, na uboreshaji wa gharama kwa mzigo wa kazi wa AI uliotumika.

> Imethibitishwa dhidi ya `azd 1.25.6` katika Juni 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa unaweza:
- Kutoa programu zenye ustahimilivu katika mikoa mingi
- Kutekeleza mifumo ya usalama ya kampuni
- Kusanidi ufuatiliaji kamilifu
- Kuboresha gharama kwa wigo mkubwa
- Kusanidi mistari ya CI/CD na AZD

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Mbinu za AI kwa Uzalishaji](production-ai-practices.md) | Mifumo ya uenezaji ya kampuni | 90 dak |

---

## 🚀 Orodha ya Ukaguzi wa Uzalishaji

- [ ] Ueneaji wa mikoa mingi kwa ustahimilivu
- [ ] Utambulisho uliosimamiwa kwa uthibitishaji (hakuna funguo)
- [ ] Application Insights kwa ufuatiliaji
- [ ] Bajeti za gharama na arifa zimetayarishwa
- [ ] Uchunguzi wa usalama umewezeshwa
- [ ] Uunganisho wa mistari ya CI/CD
- [ ] Mpango wa urejeshaji baada ya janga

---

## 🏗️ Mifumo ya Usanifu

### Mfano 1: AI ya Microservices

```mermaid
graph LR
    Gateway[Mlango wa API] --> AI[Huduma ya AI] --> Models[Mifano ya Microsoft Foundry]
    Gateway --> Auth[Huduma ya Uthibitishaji]
    AI --> Data[Hifadhi ya Data]
```

### Mfano 2: AI Inayoendeshwa na Tukio

```mermaid
graph LR
    EventGrid[Gridi ya Matukio] --> Functions[Kazi] --> Pipeline[Mtiririko wa Akili Bandia]
```

---

## 🔐 Mazoea Bora za Usalama

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

| Mikakati | Akiba |
|----------|---------|
| Skeli hadi sifuri (Container Apps) | 60-80% |
| Tumia ngazi za matumizi kwa maendeleo | 50-70% |
| Skeli iliyopangwa | 30-50% |
| Uwezo uliohifadhiwa | 20-40% |

```bash
# Weka arifa za bajeti
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
azd monitor --overview

# Tazama vipimo
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyotangulia** | [Sura 7: Utatuzi wa Matatizo](../chapter-07-troubleshooting/README.md) |
| **Kozi Imekamilika** | [Nyumbani kwa Kozi](../../README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Mwongozo wa Maajenti wa AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Suluhisho za Maajenti Wengi](../chapter-05-multi-agent/README.md)
- [Mfano wa Microservices](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->