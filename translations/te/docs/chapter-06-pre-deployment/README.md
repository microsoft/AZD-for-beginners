# Chapter 6: Pre-Deployment Planning & Validation

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1 గంట | **⭐ Complexity**: మధ్యస్థ

---

## Overview

ఈ అధ్యాయం మీ అప్లికేషన్ డిప్లాయ్ చేయడానికి ముందు అవసరమైన ప్లానింగ్ మరియు ప్రమాణీకరణ దశలను కవర్ చేస్తుంది. సరైన సామర్థ్య ప్రణాళిక, SKU ఎంపిక మరియు ప్రి-ఫ్లైట్ తనిఖీలతో ఖరీదైన తప్పులకు దూరంగా ఉండటం నేర్చుకోండి.

> March 2026లో `azd 1.23.12` తో ధృవీకరించబడింది.

## Learning Objectives

ఈ అధ్యాయాన్ని పూర్తిచేసిన తర్వాత, మీరు:
- డిప్లాయ్‌మెంట్‌కు ముందు ప్రి-ఫ్లైట్ తనిఖీలు నడిపుతారు
- సామర్థ్యాన్ని ప్లాన్ చేసి వనరుల అవసరాన్ని అంచనా వేస్తారు
- ఖర్చు ఆప్టిమైజేషన్ కోసం తగిన SKUలు ఎంచుకుంటారు
- మానిటరింగ్ కోసం Application Insights ను కాన్ఫిగర్ చేస్తారు
- టీమ్ సమన్వయ నమూనాలను అర్ధం చేసుకుంటారు

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | డిప్లాయ్‌మెంట్‌కు ముందు కాన్ఫిగరేషన్‌ని ధృవీకరించండి | 15 నిమిషాలు |
| 2 | [Capacity Planning](capacity-planning.md) | వనరుల అవసరాలను అంచనావేశారు | 20 నిమిషాలు |
| 3 | [SKU Selection](sku-selection.md) | తగిన ప్రైసింగ్ టియర్లు ఎంచుకోండి | 15 నిమిషాలు |
| 4 | [Application Insights](application-insights.md) | మానిటరింగ్ కోసం కాన్ఫిగర్ చేయండి | 20 నిమిషాలు |
| 5 | [Coordination Patterns](coordination-patterns.md) | టీమ్ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలు | 15 నిమిషాలు |

---

## 🚀 Quick Start

```bash
# చందా పరిమితులను తనిఖీ చేయండి
az vm list-usage --location eastus --output table

# డిప్లాయ్‌మెంట్ ప్రివ్యూ (ఏ రీసోర్సులు సృష్టించబడవు)
azd provision --preview

# Bicep సింటాక్స్‌ను ధృవీకరించండి
az bicep build --file infra/main.bicep

# పర్యావరణ కాన్ఫిగరేషన్‌ను తనిఖీ చేయండి
azd env get-values
```

---

## ☑️ Pre-Deployment Checklist

### Before `azd provision`

- [ ] ప్రాంతానికి కోటా ధృవీకరించబడింది
- [ ] SKUలు సరైనట్లుగా ఎంపిక చేయబడ్డాయి
- [ ] ఖర్చు అంచనా సమీక్షించబడింది
- [ ] పేరుల నియమక్రమం సజావుగా ఉంది
- [ ] Security/RBAC కాన్ఫిగర్ చేయబడింది

### Before `azd deploy`

- [ ] Environment variables సెట్ చేయబడ్డాయి
- [ ] Secrets Key Vaultలో ఉన్నాయి
- [ ] Connection strings ధృవీకరించబడ్డాయి
- [ ] Health checks కాన్ఫిగర్ చేయబడ్డాయి

---

## 💰 SKU Selection Guide

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Next** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 Related Resources

- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- [Common Issues](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీలు, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా అపరిపక్వతలు ఉండే అవకాశం ఉందని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలోని రూపంలోనే అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి, వృత్తిపరమైన మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడంవల్ల సంభవించే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకై మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->