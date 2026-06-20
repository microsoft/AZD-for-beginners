# Κεφάλαιο 2: Ανάπτυξη με προτεραιότητα στην Τεχνητή Νοημοσύνη

**📚 Course**: [AZD για Αρχάριους](../../README.md) | **⏱️ Duration**: 1-2 ώρες | **⭐ Complexity**: Ενδιάμεσο

---

## Επισκόπηση

Αυτό το κεφάλαιο επικεντρώνεται στην ανάπτυξη εφαρμογών με δυνατότητες AI χρησιμοποιώντας το Azure Developer CLI και τις υπηρεσίες Microsoft Foundry. Από απλές εφαρμογές συνομιλίας AI έως έξυπνους πράκτορες με εργαλεία.

> **Σημείωση επικύρωσης (2026-06-15):** Η ροή εντολών και οι οδηγίες για το extension σε αυτό το κεφάλαιο ελέγχθηκαν σε σχέση με `azd` `1.25.6` και την τρέχουσα προεπισκόπηση του extension για AI agents `azure.ai.agents` `0.1.40-preview`. Εάν χρησιμοποιείτε παλαιότερη έκδοση του AZD, αναβαθμίστε πρώτα και μετά συνεχίστε με τις ασκήσεις.

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του κεφαλαίου, θα:
- Αναπτύξετε εφαρμογές AI χρησιμοποιώντας προκατασκευασμένα προτύπα AZD
- Κατανοήσετε την ενσωμάτωση του Microsoft Foundry με το AZD
- Διαμορφώσετε και προσαρμόσετε πράκτορες AI με εργαλεία
- Αναπτύξετε εφαρμογές RAG (Retrieval-Augmented Generation)

---

## 📚 Μαθήματα

| # | Μάθημα | Περιγραφή | Χρόνος |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Συνδέστε το AZD με τις υπηρεσίες Foundry | 30 λεπτά |
| 2 | [AI Agents Guide](agents.md) | Αναπτύξτε έξυπνους πράκτορες με εργαλεία | 45 λεπτά |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Αναπτύξτε και διαμορφώστε μοντέλα AI | 30 λεπτά |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Πρακτική άσκηση: Κάντε τη λύση AI σας έτοιμη για AZD | 60 λεπτά |

---

## 🚀 Γρήγορη Εκκίνηση

```bash
# Επιλογή 1: Εφαρμογή συνομιλίας RAG
azd init --template azure-search-openai-demo
azd up

# Επιλογή 2: Πράκτορες τεχνητής νοημοσύνης
azd init --template get-started-with-ai-agents
azd up

# Επιλογή 3: Γρήγορη εφαρμογή συνομιλίας
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Επιλεγμένα Πρότυπα AI

| Πρότυπο | Περιγραφή | Υπηρεσίες |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Συνομιλία RAG με παραπομπές | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Πράκτορας AI με εργαλεία | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Βασική συνομιλία AI | OpenAI + Container Apps |

---

## 💰 Συνειδητοποίηση Κόστους

| Περιβάλλον | Εκτιμώμενο Μηνιαίο Κόστος |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Συμβουλή:** Εκτελέστε `azd down` μετά τις δοκιμές για να αποφύγετε χρεώσεις.

---

## 🔗 Πλοήγηση

| Κατεύθυνση | Κεφάλαιο |
|-----------|---------|
| **Προηγούμενο** | [Κεφάλαιο 1: Θεμέλια](../chapter-01-foundation/README.md) |
| **Επόμενο** | [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/README.md) |
| **Μετάβαση σε** | [Κεφάλαιο 8: Πρότυπα Παραγωγής](../chapter-08-production/README.md) |

---

## 📖 Σχετικοί Πόροι

- [Αντιμετώπιση προβλημάτων AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Πρακτικές Παραγωγής AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->