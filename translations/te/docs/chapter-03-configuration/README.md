# అధ్యాయం 3: కాన్ఫిగరేషన్ & ధృవీకరణ

**📚 కోర్సు**: [AZD For Beginners](../../README.md) | **⏱️ వ్యవధి**: 90-150 నిమిషాలు ఇన్‌టిగ్రేషన్ ప్రాక్టీస్ సహా | **⭐ సంక్లిష్టత**: మధ్యస్థాయి

---

## అవలోకనం

ఈ అధ్యాయం Azure Developer CLI పెట్టుబడుల కోసం పరిసర సంకేతీకరణ, ధృవీకరణ నమూనాలు, మరియు భద్రత ఉత్తమ ఆచారాలను కవర్ చేస్తుంది.

> కమాండ్ మరియు కాన్ఫిగరేషన్ సమీక్ష లక్ష్యం: `azd 1.37.2` (నవంబర్ 2026). సమీక్ష సమయంలో ప్రత్యక్ష Azure ప్రొవిజనింగ్ జరగలేదు.

## అభ్యాస లక్ష్యాలు

ఈ అధ్యాయం పూర్తి చేసిన తర్వాత, మీరు:
- AZD కాన్ఫిగరేషన్ శిఖరం ను నైపుణ్యం చేయగలుగుతారు
- బహుళ పరిసరాలను నిర్వహించండి (డెవ్, స్టేజింగ్, ప్రొడ్)
- నిర్వహిత వ్యక్తిత్వాలతో భద్రతా ధృవీకరణను అమలు చేయండి
- పరిసర నిర్దిష్ట సెట్టింగులను కాన్ఫిగర్ చేయండి

---

## 📚 పాఠాలు

| # | పాఠం | వివరణ | సమయం |
|---|--------|-------------|------|
| 1 | [కాన్ఫిగరేషన్ గైడ్](configuration.md) | పరిసర సెటప్ మరియు నిర్వహణ | 30 నిమిషాలు |
| 2 | [ధృవీకరణ & భద్రత](authsecurity.md) | నిర్వహిత వ్యక్తిత్వ మరియు RBAC నమూనాలు | 30 నిమిషాలు |

---

## 🚀 త్వరిత ప్రారంభం

కోర్సు రిపోజిటరీ కాకుండా, **ఇప్పటికే ప్రారంభించబడిన azd యాప్లికేషన్** మూలం నుండి నడపండి. ఈ పేర్లు ఇప్పటికే ఉన్నట్లయితే, ఉపయోగించని పరిసర పేర్లను వాడండి.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` ఉదాహరణాత్మకం: ఇది మీテンプレート స్పష్టంగా ఉపయోగిస్తేనే మౌలిక సదుపాయంపై ప్రభావం చూపుతుంది. సాధారణ `azd env set` విలువలు స్థానికంగా మైనపాఠంలో సేవ్ అవుతాయి; అవి భద్రతా గోప్య సంచయంగా లేవు.

---

## 🔧 కాన్ఫిగరేషన్ శిఖరం

మూడు వేర్వేరు కాన్ఫిగరేషన్ ఉపరితలాలను వేరు ఉంచండి: గ్లోబల్ ప్రాధాన్యతలు (`azd config`), ప్రాజెక్ట్ నిర్మాణం (`azure.yaml`), మరియు ప్రతి పరిసర విలువలు (`azd env`). ఫ్లాగులు వారు మద్దతు ఇచ్చే సెట్టింగ్లను మాత్రమే మీదుగా ప్రాధాన్యత ఇస్తాయి; ఏదైనా పరిసర చరాలు `azure.yaml` లేదా Bicep మీద универсల్ ఓవర్‌లే లేదు.

---

## 🔐 భద్రత ఉత్తమ ఆచారాలు

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 నావిగేషన్

| దిక్సూచి | అధ్యాయం |
|-----------|---------|
| **ముందటి** | [అధ్యాయం 2: AI అభివృద్ధి](../chapter-02-ai-development/README.md) |
| **తర్వాత** | [అధ్యాయం 4: మౌలికసహాయ నిర్మాణం](../chapter-04-infrastructure/README.md) |

---

## 📖 సంబంధించిన వనరులు

- [ముందస్తు-పెట్టుబడి తనిఖీలు](../chapter-06-pre-deployment/README.md)
- [సమస్య పరిష్కారం](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->