# అధ్యాయము 4: ఇన్ఫ్రాస్ట్రక్చర్ అస కోడ్ & డిప్లాయ్‌మెంట్

**📚 కోర్సు**: [AZD For Beginners](../../README.md) | **⏱️ వ్యవధి**: 2-3 గంటలు చదవడం; డిప్లాయ్‌మెంట్ వ్యాయామాలకు అదనపు సమయం ఇవ్వండి | **⭐ క్లిష్టత**: మధ్యస్థరం

---

## అవలోకనం

ఈ అధ్యాయము Bicep టెంప్లేట్లతో కూడిన ఇన్ఫ్రాస్ట్రక్చర్ అస కోడ్ (IaC) నమూనాలు, వనరు ప్రావిజనింగ్ మరియు Azure Developer CLI ఉపయోగించి డిప్లాయ్‌మెంట్ వ్యూహాలను కవర్ చేస్తుంది.

> కమాండ్ మరియు కాన్ఫిగరేషన్ సమీక్ష లక్ష్యం: `azd 1.37.2` (నవంబర్ 2026). సమీక్ష సమయంలో లైవ్ Azure ప్రావిజనింగ్ నిర్వహించబడలేదు.

## నేర్చుకునే లక్ష్యాలు

ఈ అధ్యాయాన్ని పూర్తి చేసేటప్పుడు, మీరు:
- Bicep టెంప్లేట్ నిర్మాణం మరియు సింటాక్స్‌ను అర్థం చేసుకుంటారు
- `azd provision` తో Azure వనరులను ప్రావిజన్ చేస్తారు
- `azd deploy` తో అనువర్తనాలను డిప్లాయ్ చేస్తారు
- బ్లూ-గ్రీన్ మరియు రోలింగ్ డిప్లాయ్‌మెంట్ వ్యూహాలను ఆమలుచేస్తారు

---

## 📚 పాఠాలు

| # | పాఠం | వివరణ | సమయం |
|---|--------|-------------|------|
| 1 | [వనరుల ప్రావిజనింగ్](provisioning.md) | AZD తో Azure వనరు నిర్వహణ | 45 నిముషాలు |
| 2 | [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md) | అనువర్తన డిప్లాయ్‌మెంట్ వ్యూహాలు | 45 నిముషాలు |
| 3 | [మీ స్వంత టెంప్లేట్ రచన](custom-templates.md) | పునర్వినియోగపరచదగిన azd టెంప్లేట్లు తయారు చేయడం మరియు ప్రచురించడం | 30 నిముషాలు |

---

## 🚀 త్వరిత ప్రారంభం

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 AZD ప్రాజెక్ట్ నిర్మాణం

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 కీలక కమాండ్లు

| కమాండ్ | వివరణ |
|---------|-------------|
| `azd init` | ప్రాజెక్ట్ ప్రారంభించు |
| `azd provision` | Azure వనరులను సృష్టించు |
| `azd deploy` | అనువర్తన కోడ్ ను డిప్లాయ్ చేయి |
| `azd up` | ప్రావిజన్ + డిప్లాయ్ చేయి |
| `azd down` | అన్ని వనరులను తొలగించు |

---

## 🔗 నావిగేషన్

| దిశ | అధ్యాయము |
|-----------|---------|
| **మునుపటి** | [అధ్యాయము 3: కాన్ఫిగరేషన్](../chapter-03-configuration/README.md) |
| **తరువాత** | [అధ్యాయము 5: బహుళ-ఏజెంట్ పరిష్కారాలు](../chapter-05-multi-agent/README.md) |

---

## 📖 సంబంధిత వనరులు

- [డిప్లాయ్‌మెంట్ మునుపటి తనిఖీలు](../chapter-06-pre-deployment/README.md)
- [కంటెయినర్ అనువర్తన ఉదాహరణలు](../../examples/container-app/README.md)
- [డేటాబేస్ అనువర్తన ఉదాహరణ](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->